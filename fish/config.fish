if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add gf git fetch
    abbr --add gl git pull
end

starship init fish | source

source "$HOME/.cargo/env.fish"
