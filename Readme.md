# 重装 windows 后配置步骤

## 从 u 盘安装软件

1. 安装驱动
2. 复制、配置 portable 软件
3. 开启 v2rayn

## windows 系统配置

1. 激活 windows: `irm https://get.activated.win | iex`
2. 激活 Office
3. 修改 win11 右键: `reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve`
4. 修改 desktop 等目录位置
5. 登录 onedrive，修改存储目录
6. 修改任务栏

## 安装、配置 scoop & nushell
1. 安装 [miniconda3](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/?C=M&O=D)
2. 安装、配置 scoop，安装 nushell: [01-install-scoop](./script/01-install-scoop.ps1)


# 2

安装 nushell

6. zotero 配置

7. 安装 miniconda
8. 安装 uv
9. 配置环境变量
10. 安装 scoop
11. vscode 配置
    1. uv tool install ruff ty
12. 配置 terminal
13. 配置 powershell
14. 配置 nushell
15. pnpm 安装
16. 配置文件管理器
    1. 显示隐藏文件夹
    2. 显示拓展名

# mysettings

1. pip 配置文件
