# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = "hx"
$env.config.show_banner = false

use ./nu_scripts/custom-completions/cargo/cargo-completions.nu *
use ./nu_scripts/custom-completions/composer/composer-completions.nu *
use ./nu_scripts/custom-completions/curl/curl-completions.nu *
use ./nu_scripts/custom-completions/docker/docker-completions.nu *
use ./nu_scripts/custom-completions/dotnet/dotnet-completions.nu *
use ./nu_scripts/custom-completions/eza/eza-completions.nu *
use ./nu_scripts/custom-completions/flutter/flutter-completions.nu *
use ./nu_scripts/custom-completions/git/git-completions.nu *
use ./nu_scripts/custom-completions/just/just-completions.nu *
use ./nu_scripts/custom-completions/make/make-completions.nu *
use ./nu_scripts/custom-completions/mysql/mysql-completions.nu *
use ./nu_scripts/custom-completions/npm/npm-completions.nu *
use ./nu_scripts/custom-completions/pnpm/pnpm-completions.nu *
use ./nu_scripts/custom-completions/rg/rg-completions.nu *
use ./nu_scripts/custom-completions/scoop/scoop-completions.nu *
use ./nu_scripts/custom-completions/uv/uv-completions.nu *
use ./nu_scripts/custom-completions/vscode/vscode-completions.nu *
use ./nu_scripts/custom-completions/winget/winget-completions.nu *
use ./nu_scripts/custom-completions/yarn/yarn-v4-completions.nu *

# use .\nu_scripts\modules\docker\mod.nu *
use ./nu_scripts/modules/fnm/fnm.nu
# use ./nu_scripts/modules/network/ssh.nu

use ./init.nu *

use ($nu.default-config-dir | path join mise.nu)
