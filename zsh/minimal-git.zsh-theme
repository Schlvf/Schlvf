# minimal-git.zsh-theme
# Minimal prompt showing only ~ and git branch if available

# Colors
RESET="%f%k"
GREEN="%F{green}"
RED="%F{red}"
CYAN="%F{cyan}"

# Git branch and status indicator
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    echo " ${RED}(${branch}*)${RESET}"
  else
    echo " ${CYAN}(${branch})${RESET}"
  fi
}

PROMPT="${GREEN}%~\$(git_branch)${RESET} "