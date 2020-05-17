
#################################
# Derived from rjorgenson theme #
#################################

# COLORS
BRACKET_COLOR=${red}
STRING_COLOR=${bold_red}

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${red}✓${normal}"
SCM_GIT_CHAR="${STRING_COLOR}±${normal}"
SCM_SVN_CHAR="${bold_red}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

# MySQL Prompt
export MYSQL_PS1="(\u@\h) [\d]> "

case $TERM in
        xterm*)
        TITLEBAR="\[\033]0;\w\007\]"
        ;;
        *)
        TITLEBAR=""
        ;;
esac

PS3=">> "

###################################################
# Display ruby version | personally I dislike it.
# just replace `node_ver at 'prompt'

# __my_rvm_ruby_version() {
#     local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
#   [ "$gemset" != "" ] && gemset="@$gemset"
#     local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
#     local full="$version$gemset"
#   [ "$full" != "" ] && echo "${BRACKET_COLOR}[${STRING_COLOR}$full${BRACKET_COLOR}]${normal}"
# }
####################################################

# Display node version instead of ruby
node_ver() {
   NODE_VER=$(node -v)
   echo "${BRACKET_COLOR}[${STRING_COLOR}$NODE_VER${BRACKET_COLOR}]${normal}"
}

is_vim_shell() {
        if [ ! -z "$VIMRUNTIME" ]
        then
                echo "${BRACKET_COLOR}[${STRING_COLOR}vim shell${BRACKET_COLOR}]${normal}"
        fi
}

function is_integer() { # helper function for todo-txt-count
    [ "$1" -eq "$1" ] > /dev/null 2>&1
        return $?
}

todo_txt_count() {
    if `hash todo.sh 2>&-`; then # is todo.sh installed
        count=`todo.sh ls | egrep "TODO: [0-9]+ of ([0-9]+) tasks shown" | awk '{ print $4 }'`
        if is_integer $count; then # did we get a sane answer back
            echo "${BRACKET_COLOR}[${STRING_COLOR}T:$count${BRACKET_COLOR}]$normal"
        fi
    fi
}

modern_scm_prompt() {
        CHAR=$(scm_char)
        if [ $CHAR = $SCM_NONE_CHAR ]
        then
                return
        else
                echo "${BRACKET_COLOR}[${CHAR}${BRACKET_COLOR}][${STRING_COLOR}$(scm_prompt_info)${BRACKET_COLOR}]$normal"
        fi
}

my_prompt_char() {
    if [[ $OSTYPE =~ "darwin" ]]; then
        echo "${BRACKET_COLOR}➞  ${normal}"
    else
        echo "${BRACKET_COLOR}➞ ${normal}"
    fi
}

# Main Terminal Output
prompt() {

    my_ps_host="${STRING_COLOR}\h${normal}";
    my_ps_user="${STRING_COLOR}\u${normal}";
    my_ps_root="${bold_red}\u${normal}";
    my_ps_path="${STRING_COLOR}\w${normal}";

    # nice prompt
    case "`id -u`" in
        0) PS1="${TITLEBAR}${BRACKET_COLOR}┌─[$my_ps_root${BRACKET_COLOR}][$my_ps_host${BRACKET_COLOR}]$(modern_scm_prompt)$(node_ver)${BRACKET_COLOR}[${STRING_COLOR}\w${BRACKET_COLOR}]$(is_vim_shell)
${BRACKET_COLOR}└─$(my_prompt_char)${normal}"
        ;;
        *) PS1="${TITLEBAR}${BRACKET_COLOR}┌─[$my_ps_user${BRACKET_COLOR}][$my_ps_host${BRACKET_COLOR}]$(modern_scm_prompt)$(node_ver)${BRACKET_COLOR}[${STRING_COLOR}\w${BRACKET_COLOR}]$(is_vim_shell)
${BRACKET_COLOR}└─$(todo_txt_count)$(my_prompt_char)"
        ;;
    esac
}

PS2="└─$(my_prompt_char)"



safe_append_prompt_command prompt
