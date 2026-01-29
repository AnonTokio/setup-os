# env.nu
#
# Installed by:
# version = "0.110.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

const NU_PLUGIN_DIRS = [
      ($nu.current-exe | path dirname)
      ...$NU_PLUGIN_DIRS
]

const NU_LIB_DIRS = [
      ($nu.data-dir | path join nu-scripts)
      ...$NU_LIB_DIRS
]

let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force
