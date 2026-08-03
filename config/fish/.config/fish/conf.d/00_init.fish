
# Symlink /bin/sh to a POSIX Shell
if not test -L /bin/sh 
    ln -sfn /bin/bash /bin/sh
end

# Superior Key Binds
if status is-interactive
    fish_vi_key_bindings
end
