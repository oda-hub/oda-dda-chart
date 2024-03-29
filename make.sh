function create-secrets(){
    kubectl -n staging-1-3 create secret generic dda-interface-token  --from-file=./private/token.txt
#    kubectl create secret generic odatests-tests-bot-password  --from-file=./private/testbot-password.txt
#    kubectl create secret generic odatests-secret-key  --from-file=./private/secret-key.txt
#    kubectl create secret generic minio-key  --from-file=./private/minio-key.txt
#    kubectl create secret generic jena-password  --from-file=./private/jena-password.txt
#    kubectl create secret generic logstash-entrypoint  --from-file=./private/logstash-entrypoint.txt
}

function install() {
    set -x
    helm --name ${NAMESPACE:?}-dda-interface --namespace ${NAMESPACE:?} install . --set image.tag="$(cat dda-interface/image-tag)"
}

function upgrade() {
    set -x
    helm upgrade ${NAMESPACE:?}-dda-interface . --set image.tag="$(cat dda-interface/image-tag)"
}

$@
