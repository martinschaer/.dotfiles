if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add lg lazygit
    abbr --add gco git checkout
    abbr --add gf git fetch
    abbr --add gl git pull
end

starship init fish | source

