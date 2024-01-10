#!/bin/bash

SESSIONNAME="u18"
WINDOW_NAMES=(
    #"core"
    "pqclean"
    "editor"
    "build"
#    "soc"
)
WINDOW_DIRS=(
    "${CORE_V_VERIF}/core-v-cores/cv32e40p/rtl"
#    "${CORE_V_VERIF}/Yet-Another-PQClean"
    "${CORE_V_VERIF}/Yet-Another-PQClean/crypto_sign/falcon-512/clean"
    "${CORE_V_VERIF}/Yet-Another-PQClean/simd_test"
#    "${CORE_V_SOC}"
)

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSIONNAME
    for i in "${!WINDOW_NAMES[@]}"; do
        index=$((i + 1))  # Increment the value of i by 1
        if [ $i -eq 0 ]; then
            tmux rename-window -t "${SESSIONNAME}:${index}" "${WINDOW_NAMES[$i]}"
            tmux send-keys -t "${SESSIONNAME}:${index}" "cd ${WINDOW_DIRS[$i]} && clear" C-m

            tmux split-window -v -p 50 -t "${SESSIONNAME}:${index}"
            tmux send-keys -t "${SESSIONNAME}:${index}.bottom" "cd ${CORE_V_VERIF}/cv32e40p/sim/core && clear" C-m
        else
            tmux new-window -t "${SESSIONNAME}" -n "${WINDOW_NAMES[$i]}"
            tmux send-keys -t "${SESSIONNAME}:${index}" "cd ${WINDOW_DIRS[$i]} && clear" C-m
        fi
    done
fi

tmux attach-session -t $SESSIONNAME
