#!/usr/bin/bash
# Ubuntu 18.04.3 LTS (Release: 18.04, Codename: bionic)

tmux new -s new_session_name    # create a new session

tmux a -t session_name    # attach to session

tmux kill-session -t session_name    # delete a session

tmux ls    # display all session 

# detached: (ctrl + b) d
