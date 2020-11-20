# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/13 15:02:54 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/16 11:25:33 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

function metallb_config() {
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	if [ "$(kubectl get secrets --namespace metallb-system | grep memberlist)" = "" ]
	then
		kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	fi
    kubectl apply -f srcs/metallb-config.yaml > /dev/null
}

function build_images() {
    eval $(minikube docker-env)
    sleep 2
    echo "ftps..."
    docker build srcs/ftps -t img-ftps > /dev/null
    echo "grafana..."
    docker build srcs/grafana -t img-grafana > /dev/null
    echo "nginx..."
    docker build srcs/nginx -t img-nginx > /dev/null
    echo "phpmyadmin..."
    docker build srcs/phpmyadmin -t img-phpmyadmin > /dev/null
    echo "wordpress..."
    docker build srcs/wordpress -t img-wordpress > /dev/null
    echo "mysql..."
    docker build srcs/mysql -t img-mysql > /dev/null
    echo "influxdb..."
    docker build srcs/influxdb -t img-influxdb > /dev/null
    echo "telegraf..."
    docker build srcs/telegraf -t img-telegraf > /dev/null
    echo ""
    echo "                   =======================               "
    echo "                   ✅   IMAGES BUILDED   ✅               "
    echo "                   =======================               "
    echo ""
    sleep 2
}

function deploy_all() {
	sleep 5
    kubectl apply -f srcs/ftps
    kubectl apply -f srcs/grafana
    kubectl apply -f srcs/nginx
    kubectl apply -f srcs/phpmyadmin
    kubectl apply -f srcs/wordpress
    kubectl apply -f srcs/telegraf
    kubectl apply -f srcs/mysql
    kubectl apply -f srcs/influxdb
    echo ""
    echo "                   ==========================               "
    echo "                   ✅   SERVICES DEPLOYED   ✅               "
    echo "                   ==========================               "
    echo ""
    sleep 2
}

function exit_general() {
    if [ "$1" != 0 ]
    then
        exit
    fi
}

function main() {

    echo ""
    echo "==========================================================="
    echo "==========================================================="
    echo "                   FT_SERVICES_MVAN-EYN                    "
    echo "==========================================================="
    echo "==========================================================="
    echo ""
    echo ""
    echo ""
    echo ""
    sleep 2
    echo ""
    echo "==========================================================="
    echo "==========================================================="
    echo "                   DEPENDENCIES CHECK                      "
    echo "==========================================================="
    echo "==========================================================="
    echo ""
    sleep 2

    echo ""
    echo "==========================================================="
    echo "                CHECKING BREW INSTALLATION                 "
    echo "==========================================================="
    sleep 1

    brew -v > /dev/null
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
        echo "                   =======================                 "
        echo "                   ✅   BREW INSTALLED   ✅                 "
        echo "                   =======================                 "
        echo ""
    fi
    sleep 1
    exit_general $?

    echo ""
    echo "==========================================================="
    echo "                CHECKING DOCKER INSTALLATION               "
    echo "==========================================================="
    sleep 1

    docker -v > /dev/null
    if [ "$?" != 0 ]
    then
        printf "Docker is not installed and is requiered to run this program\n"
        printf "Please check the Docker documentation in order to get it on your machine.\n"
        exit 1
    else
        echo "                   =========================               "
        echo "                   ✅   DOCKER INSTALLED   ✅               "
        echo "                   =========================               "
        echo ""
    fi
    sleep 1
    exit_general $?

    echo ""
    echo "==========================================================="
    echo "                 CHECKING VBOX INSTALLATION                "
    echo "==========================================================="
    sleep 1
    vboxmanage -v > /dev/null
    if [ "$?" != 0 ]
    then
        printf "VirtualBox is not installed on your machine. Please install it before running this program.\n"
        exit 1
    else
        echo "                    =======================               "
        echo "                    ✅   VBOX INSTALLED   ✅               "
        echo "                    =======================               "
        echo ""
    fi
    sleep 1
    exit_general $?

    echo ""
    echo "==========================================================="
    echo "              CHECKING MINIKUBE INSTALLATION               "
    echo "==========================================================="
    sleep 1
    minikube version > /dev/null
    if [ "$?" != 0 ]
    then
        printf "Minikube is not installed on your machine. Please install it before running this program.\n"
        exit 1
    else
        echo "                  ===========================               "
        echo "                  ✅   MINIKUBE INSTALLED   ✅               "
        echo "                  ===========================               "
        echo ""
    fi
    sleep 1
    exit_general $?

    minikube delete > /dev/null
    echo ""
    echo "==========================================================="
    echo "==========================================================="
    echo "                     STARTING MINIKUBE                     "
    echo "==========================================================="
    echo "==========================================================="
    echo ""
    sleep 1
    minikube start --vm-driver=virtualbox
	exit_general $?
    eval $(minikube docker-env)
    minikube addons enable logviewer
	minikube addons enable metrics-server
    minikube addons enable metallb
    echo ""
    echo "                   =========================               "
    echo "                   ✅   MINIKUBE STARTED   ✅               "
    echo "                   =========================               "
    echo ""
    sleep 1

    echo ""
    echo "==========================================================="
    echo "==========================================================="
    echo "                  METALLB CONFIGURATION                    "
    echo "==========================================================="
    echo "==========================================================="
    echo ""
    sleep 1
    metallb_config
    echo ""
    echo "                  ===========================               "
    echo "                  ✅   METALLB CONFIGURED   ✅               "
    echo "                  ===========================               "
    echo ""

    echo ""
    echo "==========================================================="
    echo "                       BUILDING IMAGES                     "
    echo "==========================================================="
    echo ""
    sleep 1
    build_images

    echo ""
    echo "==========================================================="
    echo "                   DEPLOYING SERVICES                      "
    echo "==========================================================="
    echo ""
    sleep 2
    deploy_all

    minikube dashboard
    if [ $? != 0 ]
    then
        minikube dashboard
    fi
}

main