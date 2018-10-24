## Add this to ~/.bash_profile!

create-love() {
    if [ -z "$1" ]
    then
        echo "No argument supplied"
    else
        command lua -e love-create.lua 
    fi
}