function fzfk
    set pid (ps aux | fzf | awk '{print $2}')

    if test -n "$pid"
        kill $argv $pid
    end
end