#!/bin/bash

SESSION_NAME="my-project"
REPO_PATH="~/Repos/my-project"
USE_FISH=1

# Check if the tmux session already exists
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Create a new tmux session
    tmux new-session -d -s $SESSION_NAME

    # Rename the window
    tmux rename-window -t $SESSION_NAME:0 "db"

    if [ $USE_FISH -eq 1 ]; then
        tmux send-keys -t $SESSION_NAME:0 "fish" C-m
    fi

    # -- DB
    tmux send-keys -t $SESSION_NAME:0 "just dev db"

    # -- Create window
    tmux new-window -t $SESSION_NAME -n "dev"

    # Split the window vertically into 3 panes
    tmux split-window -v -t $SESSION_NAME
    tmux split-window -v -t $SESSION_NAME

    # Execute `cd ~/hello` in each pane
    for i in {0..2}; do
        if [ $USE_FISH -eq 1 ]; then
            tmux send-keys -t $SESSION_NAME:1.$i "fish" C-m
        fi
        tmux send-keys -t $SESSION_NAME:1.$i "cd $REPO_PATH" C-m
    done

    # -- web-server
    tmux send-keys -t $SESSION_NAME:1.0 "just dev web-server"

    # -- runner
    tmux send-keys -t $SESSION_NAME:1.1 "just dev runner debug"

    # -- base-service
    if [ $USE_FISH -eq 1 ]; then
        tmux send-keys -t $SESSION_NAME:1.2 "fish" C-m
    fi
    tmux send-keys -t $SESSION_NAME:1.2 "cd $REPO_PATH" C-m
    if [ $USE_FISH -eq 1 ]; then
        tmux send-keys -t $SESSION_NAME:1.2 ". .venv/bin/activate.fish" C-m
    else
        tmux send-keys -t $SESSION_NAME:1.2 "source .venv/bin/activate" C-m
    fi
    tmux send-keys -t $SESSION_NAME:1.2 "just ai example dev"

    # -- Create window
    tmux new-window -t $SESSION_NAME -n "ui"

    # --web-app
    if [ $USE_FISH -eq 1 ]; then
        tmux send-keys -t $SESSION_NAME:2 "fish" C-m
    fi
    tmux send-keys -t $SESSION_NAME:2 "just apps wa dev"

    # Select the first window
    tmux select-window -t $SESSION_NAME:0

    echo "Created new tmux session '$SESSION_NAME'"
else
    echo "Tmux session '$SESSION_NAME' already exists."
fi
