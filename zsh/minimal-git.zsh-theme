# minimal-git.zsh-theme
# Minimal prompt showing ~, hostname, and git branch if available

# Colors
RESET="%f%k"
GREEN="%F{green}"
RED="%F{red}"
CYAN="%F{cyan}"
YELLOW="%F{yellow}"

# Git branch and status indicator
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "%s(%s*)%s\n" "$RED" "$branch" "$RESET"
  else
    printf "%s(%s)%s\n" "$CYAN" "$branch" "$RESET"
  fi
}

precmd() {
  GIT_INFO="$(git_branch)"

  # Add newline only if inside a git repo
  if [[ -n "$GIT_INFO" ]]; then
    GIT_INFO+=$'\n'
  fi
}

# %~ → current directory
# %m → short hostname
PROMPT='${GIT_INFO}'"${GREEN}%~${YELLOW}@%m${RESET} "