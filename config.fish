if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Custom aliases
alias rtfish="source ~/.config/fish/config.fish"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias gcam='git commit -n -a -m'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gcmsg="git commit -n -m"
alias glt="git fetch --all --prune --quiet && git describe --tags \$(git rev-list --tags --max-count=1)"
alias chromecors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"
alias flush-npm="rm -rf ./node_modules && rm package-lock.json && npm i"
alias c="code ."
alias gaa='git add --all -- :!src/setupProxy.js'
alias gp="git push"
alias gco="git checkout"
alias gpsup='git push --set-upstream origin'

# Deel
alias aws='aws-mfa-secure session'
alias aws_login='aws sso login --profile shared'
alias aws_token='export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain npm --domain-owner 974360507615 --profile shared --region eu-west-1 --query authorizationToken --output text`'
alias aws_giger='aws sso login --profile KubernetesGiger'
alias docker_ip="docker inspect \
  --format '{{ .NetworkSettings.IPAddress }}'"
alias ns="TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling npm start"


# Make tab completion
bind \t accept-autosuggestion

# Git function to easily write commits from terminal without double quotes
function gc
    set commit_type $argv[1]
    set commit_message (string join " " (string split " " $argv)[2..-1])
    set branch_name (git rev-parse --abbrev-ref HEAD)

    if test -n "$branch_name"
        set commit_prefix "$branch_name $commit_type: "
        set full_commit_message "$commit_prefix$commit_message"
        git commit -m "$full_commit_message"
    else
        echo "Not in a git repository"
    end
end

# Universal function to handle different package managers
function p
  if test -f bun.lockb
    bun $argv
  else if test -f pnpm-lock.yaml
    pnpm $argv
  else if test -f yarn.lock
    yarn $argv
  else if test -f package-lock.json
    npm $argv
  else
    pnpm $argv
  end
end

# Create a new branch from dev
function gnb
  gco dev
  git pull
  gco -b $argv[1]
end