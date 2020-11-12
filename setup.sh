function metallb_config() {
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	if [ "$(kubectl get secrets --namespace metallb-system | grep memberlist)" = "" ]
	then
		kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	fi
    kubectl apply -f srcs/metallb-config.yaml > /dev/null
}

function exit_general() {
    if [ "$1" != 0 ]
    then
        exit
    fi
}

function check_arg() {
    if [ "$#" = 0 ]
    then
        printf "arguments missing\n"
    fi
}

function main() {
    printf "Checking dependencies...\n"
    sleep 2
    setup_srcs/dependencies.sh
    printf "Cleaning Minikube cache...\n"
    minikube delete 2> /dev/null
	sleep 2
    printf "Starting Minikube...\n"
    sleep 2
    minikube start --vm-driver=virtualbox
	exit_general $?
    eval $(minikube docker-env)
    minikube addons enable logviewer
	minikube addons enable metrics-server
    minikube addons enable metallb
    setup_srcs/passw_gen.sh
    metallb_config
    setup_srcs/build_images.sh
    setup_srcs/deploy_all.sh
}

main $1 $2 $3