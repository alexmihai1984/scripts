function fzfe
    set file (fzf --preview 'bat --style=numbers --color=always {}' --preview-window=right:60%:wrap)

    if test -n "$file"
        code $argv $file
    end
end