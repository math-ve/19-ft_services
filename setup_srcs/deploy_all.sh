function deploy_all() {
    mkdir -p srcs/ftps/ftp &> /dev/null
	minikube mount srcs/ftps/ftp:/mnt/ftp &> /dev/null &
	sleep 5
    kubectl apply -f srcs/ftps
    kubectl apply -f srcs/grafana
    kubectl apply -f srcs/nginx
    kubectl apply -f srcs/phpmyadmin
    kubectl apply -f srcs/wordpress
    kubectl apply -f srcs/telegraf
    kubectl apply -f srcs/mariadb
    kubectl apply -f srcs/influxdb
}

deploy_all

