
check_and_set () {

for var in "$@"
do
    if grep -q $var ~/.bashrc ~/.bash_profile; then
    echo "Alias $var already exists"
else
    echo "Adding alias $var"
    echo "alias $var=$(pwd)/$var.sh" | tee -a ~/.bashrc ~/.bash_profile
fi
done

}


check_and_set find_between archive new_git_repo
