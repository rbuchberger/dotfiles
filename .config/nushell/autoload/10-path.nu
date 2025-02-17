# exiftool gets installed here, no idea why
use std/util "path add"

if ('/usr/bin/vendor_perl' | path exists) {
  path add --append '/usr/bin/vendor_perl'
}

path add '~/scripts'
path add '~/.local/bin'
path add '~/.local/share/cargo/bin'
