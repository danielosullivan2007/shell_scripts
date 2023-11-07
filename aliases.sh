
alias_scripts () {

for var in "$@"
do
    if grep -q $var ~/.bashrc ~/.bash_profile; then
        echo "Alias $var already exists"
    else
        if ! test -f $(pwd)/$var.sh; 
            then echo "File $var.sh does not exist."

        else echo "Adding alias $var"
             echo "alias $var=$(pwd)/$var.sh" | tee -a ~/.bashrc ~/.bash_profile
        fi
    fi
done
}

alias_static() {
name=$1
action=$2

replace="."
replacewith="\."
escaped_name="${name/${replace}/${replacewith}}"


if ! grep -q "alias $escaped_name" ~/.bashrc ~/.bash_profile; then
    echo "alias $name=$action" | tee -a ~/.bashrc ~/.bash_profile
    echo "alias $name=$action added" 
fi
}

alias_scripts find_between archive new_git_repo


## Colorize the ls output ##
alias_static "ls" 'ls --color=auto'
 
## Use a long listing format ##
alias_static "ll" 'ls -la'
 
## Show hidden files ##
alias_static "l." 'ls -d .* --color=auto'

# Shell Shortcuts
alias_static "cd1" "cd .."
alias_static "cd2" 'cd ../../../'
alias_static "cd3" 'cd ../../../../'
alias_static "cd4" 'cd ../../../../'



echo "Don't forget to run 'exec bash' to reset terminal"
