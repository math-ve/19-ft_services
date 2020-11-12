function build_images() {
    eval $(minikube docker-env)
    printf "Building images...\n"
    sleep 2
    docker build srcs/ftps -t img-ftps
    docker build srcs/grafana -t img-grafana
    docker build srcs/nginx -t img-nginx
    docker build srcs/phpmyadmin -t img-phpmyadmin
    docker build srcs/wordpress -t img-wordpress
    docker build srcs/mariadb -t img-mariadb
    docker build srcs/influxdb -t img-influxdb
    docker build srcs/telegraf -t img-telegraf
}

build_images