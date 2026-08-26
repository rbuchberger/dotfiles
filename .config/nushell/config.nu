# Configs are located in autoload

# mise must be activated here: autoload files don't propagate a module's env
# to the global scope.
use ($nu.default-config-dir | path join mise.nu)
