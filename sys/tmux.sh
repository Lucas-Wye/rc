#!/bin/bash

SESSIONNAME="work"
WINDOW_NAMES=(
    "editor"
    "build"
)
WINDOW_DIRS=(
    "${HOME}"
    "${HOME}"
)

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSIONNAME
    for i in "${!WINDOW_NAMES[@]}"; do
        index=$((i + 1))  # Increment the value of i by 1
        tmux new-window -t "${SESSIONNAME}" -n "${WINDOW_NAMES[$i]}"
        tmux send-keys -t "${SESSIONNAME}:${index}" "cd ${WINDOW_DIRS[$i]} && clear" C-m
    done
fi

tmux attach-session -t $SESSIONNAME
