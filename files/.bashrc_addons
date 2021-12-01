# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


git_branch_if_any() {
        branch=$(git branch 2>/dev/null | grep "^*" | colrm 1 2)
        color=${1:-$COLOR_ORANGE$BOLD}

        if [[ $branch ]]; then
                echo -e " - [$color$branch$RESET_ATTR]"
        fi
}
export PS1="\[\e]0;\W\a\][$COLOR_LIGHT_GREEN$BOLD\u$RESET_ATTR@$COLOR_LIGHT_CYAN$BOLD\h$RESET_ATTR] $COLOR_YELLOW$BOLD\W$RESET_ATTR\$(git_branch_if_any)$ "
source ~/.mysettings.sh
