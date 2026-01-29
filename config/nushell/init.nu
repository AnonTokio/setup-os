
# 按指定优先级选择公钥的 ssh-copy-id 实现
# 优先级: 1. 用户提供 2. ~/.ssh/id_rsa.pub 3. ~/.ssh/id_ed25519.pub
export def ssh-copy-id [
    remote: string,            # 远程主机，格式: user@host
    --port (-p): int,         # SSH 端口
    --identity (-i): string,  # 私钥文件路径（可以是公钥或私钥路径）
    --dry-run (-n)           # 只显示命令，不执行
] {
    # 1. 确定公钥文件路径
    let pubkey_path = (
        if $identity != null {
            # 用户通过 -i 参数指定的路径
            if ($identity | str ends-with ".pub") {
                $identity
            } else {
                $"($identity).pub"
            }
        } else {
            # 优先级 2: 尝试 ~/.ssh/id_rsa.pub
            let id_rsa_pub = $nu.home-dir | path join ".ssh" "id_rsa.pub"
            
            if ($id_rsa_pub | path exists) {
                $id_rsa_pub
            } else {
                # 优先级 3: 尝试 ~/.ssh/id_ed25519.pub
                let id_ed25519_pub = $nu.home-dir | path join ".ssh" "id_ed25519.pub"
                
                if ($id_ed25519_pub | path exists) {
                    $id_ed25519_pub
                } else {
                    error make {msg: "未找到可用的公钥文件。请通过 -i 参数指定密钥文件，或确保 ~/.ssh/id_rsa.pub 或 ~/.ssh/id_ed25519.pub 存在"}
                }
            }
        }
    )
    
    # 验证公钥文件存在
    if not ($pubkey_path | path exists) {
        error make {msg: $"指定的公钥文件不存在: ($pubkey_path)"}
    }
    
    # 读取公钥内容
    let pubkey = open $pubkey_path | str trim
    
    # 2. 构建 SSH 命令
    mut ssh_args = ["ssh"]
    
    # 添加端口参数
    if $port != null {
        $ssh_args = ($ssh_args | append ["-p", ($port | into string)])
    }
    
    # 如果用户通过 -i 指定了私钥文件，添加 -i 参数
    if $identity != null and (not ($identity | str ends-with ".pub")) {
        $ssh_args = ($ssh_args | append ["-i", $identity])
    }
    
    $ssh_args = ($ssh_args | append [$remote])
    
    # 3. 构建远程执行的命令
    let remote_cmd = [
        $"mkdir -p ~/.ssh 2>/dev/null || true",
        $"chmod 700 ~/.ssh 2>/dev/null || true",
        $"echo '($pubkey)' | cat >> ~/.ssh/authorized_keys",
        $"chmod 600 ~/.ssh/authorized_keys 2>/dev/null || true"
    ] | str join " && "
    
    # 4. 执行或预览命令
    if $dry_run {
        print $"公钥文件: ($pubkey_path)"
        print $"SSH 命令: ($ssh_args | str join ' ') '($remote_cmd)'"
    } else {
        print $"正在添加公钥到 ($remote) \(端口: (if $port != null { $port } else { 22 })\)"
        print $"使用公钥: ($pubkey_path)"
        
        # 执行 SSH 命令
        let result = (run-external ...$ssh_args $remote_cmd | complete)
        
        if $result.exit_code == 0 {
            print $"(ansi green)✓ 公钥已成功添加到 ($remote)(ansi reset)"
            
            # 可选：测试连接
            let test_cmd = ($ssh_args | take (($ssh_args | length) - 1) | append [$remote, "echo 'SSH 密钥认证成功'"])
            let test_result = (run-external ...$test_cmd | complete)
            if $test_result.exit_code == 0 {
                print $"(ansi green)✓ SSH 密钥认证测试通过(ansi reset)"
            }
        } else {
            error make {msg: $"添加公钥失败: (if ($result.stderr | is-empty) { '未知错误' } else { $result.stderr })"}
        }
    }
}

export def is-in-path [target: string] {
    let target_normalized = ($target | path expand)
    $env.PATH | any {|p|
        let p_normalized = ($p | path expand)
        $p_normalized == $target_normalized
    }
}
