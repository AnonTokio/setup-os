module completions {

  def "nu-complete uvx index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uvx keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uvx resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uvx prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uvx fork_strategy" [] {
    [ "fewest" "requires-python" ]
  }

  def "nu-complete uvx link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uvx python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "aarch64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "riscv64-unknown-linux" "x86_64-manylinux2014" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "x86_64-manylinux_2_32" "x86_64-manylinux_2_33" "x86_64-manylinux_2_34" "x86_64-manylinux_2_35" "x86_64-manylinux_2_36" "x86_64-manylinux_2_37" "x86_64-manylinux_2_38" "x86_64-manylinux_2_39" "x86_64-manylinux_2_40" "aarch64-manylinux2014" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" "aarch64-manylinux_2_32" "aarch64-manylinux_2_33" "aarch64-manylinux_2_34" "aarch64-manylinux_2_35" "aarch64-manylinux_2_36" "aarch64-manylinux_2_37" "aarch64-manylinux_2_38" "aarch64-manylinux_2_39" "aarch64-manylinux_2_40" "aarch64-linux-android" "x86_64-linux-android" "wasm32-pyodide2024" "arm64-apple-ios" "arm64-apple-ios-simulator" "x86_64-apple-ios-simulator" ]
  }

  def "nu-complete uvx torch_backend" [] {
    [ "auto" "cpu" "cu130" "cu129" "cu128" "cu126" "cu125" "cu124" "cu123" "cu122" "cu121" "cu120" "cu118" "cu117" "cu116" "cu115" "cu114" "cu113" "cu112" "cu111" "cu110" "cu102" "cu101" "cu100" "cu92" "cu91" "cu90" "cu80" "rocm6.4" "rocm6.3" "rocm6.2.4" "rocm6.2" "rocm6.1" "rocm6.0" "rocm5.7" "rocm5.6" "rocm5.5" "rocm5.4.2" "rocm5.4" "rocm5.3" "rocm5.2" "rocm5.1.1" "rocm4.2" "rocm4.1" "rocm4.0.1" "xpu" ]
  }

  def "nu-complete uvx generate_shell_completion" [] {
    [ "bash" "elvish" "fish" "nushell" "powershell" "zsh" ]
  }

  def "nu-complete uvx python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uvx python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uvx color" [] {
    [ "auto" "always" "never" ]
  }

  # Run a command provided by a Python package.
  export extern uvx [
    --from: string            # Use the given package to provide the command
    --with(-w): string        # Run with the given packages installed
    --with-editable: path     # Run with the given packages installed in editable mode
    --with-requirements: path # Run with the packages listed in the given files
    --constraints(-c): path   # Constrain versions using the given requirements files
    --build-constraints(-b): path # Constrain build dependencies using the given requirements files when building source distributions
    --overrides: path         # Override versions using the given requirements files
    --isolated                # Run the tool in an isolated virtual environment, ignoring any already-installed tools [env: UV_ISOLATED=]
    --env-file: path          # Load environment variables from a `.env` file
    --no-env-file             # Avoid reading environment variables from a `.env` file [env: UV_NO_ENV_FILE=]
    --index: string           # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string   # The URL of the default package index (by default: <https://pypi.org/simple>)
    --index-url(-i): string   # (Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # (Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uvx index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uvx keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uvx resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uvx prerelease" # The strategy to use when considering pre-release versions
    --pre
    --fork-strategy: string@"nu-complete uvx fork_strategy" # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --config-settings-package: string # Settings to pass to the PEP 517 build backend for a specific package, specified as `PACKAGE:KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --exclude-newer-package: string # Limit candidate packages for specific packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uvx link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources
    --no-sources-package: string # Don't use sources from the `tool.uv.sources` table for the specified packages
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --lfs                     # Whether to use Git LFS when adding a dependency from Git
    --python(-p): string      # The Python interpreter to use to build the run environment.
    --show-resolution         # Whether to show resolver and installer output from any environment modifications [env: UV_SHOW_RESOLUTION=]
    --python-platform: string@"nu-complete uvx python_platform" # The platform for which requirements should be installed
    --torch-backend: string@"nu-complete uvx torch_backend" # The backend to use when fetching packages in the PyTorch ecosystem (e.g., `cpu`, `cu126`, or `auto`)
    --generate-shell-completion: string@"nu-complete uvx generate_shell_completion"
    --version(-V)             # Display the uvx version
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: path         # Path to the cache directory
    --python-preference: string@"nu-complete uvx python_preference"
    --managed-python          # Require use of uv-managed Python versions [env: UV_MANAGED_PYTHON=]
    --no-managed-python       # Disable use of uv-managed Python versions [env: UV_NO_MANAGED_PYTHON=]
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uvx python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Use quiet output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uvx color" # Control the use of color in output
    --native-tls              # Whether to load TLS certificates from the platform's native store [env: UV_NATIVE_TLS=]
    --no-native-tls
    --offline                 # Disable network access [env: UV_OFFLINE=]
    --no-offline
    --allow-insecure-host: string # Allow insecure connections to a host
    --preview                 # Whether to enable all experimental preview features [env: UV_PREVIEW=]
    --no-preview
    --preview-features: string # Enable experimental preview features
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs [env: UV_NO_PROGRESS=]
    --no-installer-metadata   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories [env: UV_NO_INSTALLER_METADATA=]
    --directory: path         # Change to the given directory prior to running the command
    --project: path           # Discover a project in the given directory
    --config-file: path       # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
  ]

}

export use completions *
