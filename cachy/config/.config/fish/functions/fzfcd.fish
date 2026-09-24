function fzfcd
    set dir (fzf --walker=dir,follow)

    if test -n "$dir"
        cd "$dir"
    end
end