SSH_ENV="$HOME/.ssh/environment"

# Source SSH settings if agent is already running
if [ -f "$SSH_ENV" ] && [ -n "$SSH_AGENT_PID" ] && kill -0 $SSH_AGENT_PID 2>/dev/null; then
    . "$SSH_ENV" > /dev/null
else
    # Start a new agent
    rm -f "$SSH_ENV"
    ssh-agent -s > "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add -l > /dev/null || ssh-add
fi

export SSH_AUTH_SOCK SSH_AGENT_PID
