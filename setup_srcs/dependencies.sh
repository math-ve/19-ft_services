# =================== #
# ====== BREW ======= #
# =================== #

function brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function check_brew() {
    brew -v
    if [ "$?" != 0 ]
    then
        printf "brew is not installed !\n"
        read -p "Do you want to install brew (Y/N) : " REPLY
        if [REPLY = "Y" || REPLY = "y" || REPLY = ""]
        then
            printf "Wait for the installation of brew...\n"
            brew_install
        else
            printf "Brew is requiered for this program\n"
            exit 1
        fi
    else
        printf "✅ brew is installed !\n"
    fi
}

# =================== #
# ===== DOCKER ====== #
# =================== #

function check_docker() {
    docker -v
    if [ "$?" != 0 ]
    then
        printf "Docker is not installed and is requiered to run this program\n"
        printf "Please check the Docker documentation in order to get it on your machine.\n"
        exit 1
    else
        printf "✅ Docker is installed !\n"
    fi
}

# =================== #
# === VIRTUALBOX ==== #
# =================== #

function check_virtualbox() {
    vboxmanage -v
    if [ "$?" != 0 ]
    then
        printf "VirtualBox is not installed on your machine. Please install it before running this program.\n"
        exit 1
    else
        printf "✅ VirtualBox is installed !\n"
    fi
}

# =================== #
# ===== MINIKUBE ==== #
# =================== #

function check_minikube() {
    minikube version
    if [ "$?" != 0 ]
    then
        printf "Minikube is not installed on your machine. Please install it before running this program.\n"
        exit 1
    else
        printf "✅ Minikube is installed !\n"
    fi
}

# =================== #
# ======= MAIN ====== #
# =================== #

function exit_general() {
    if [ "$1" != 0 ]
    then
        exit
    fi
}

function dependecies() {
    printf "Checking if brew is installed...\n"
    check_brew
    exit_general $?
    printf "Checking if Docker is installed...\n"
    check_docker
    exit_general $?
    printf "Checking if VirtualBox is installed...\n"
    check_virtualbox
    exit_general $?
    printf "Checking if Minikube is installed...\n"
    check_minikube
    exit_general $?
    return 0
}

dependecies