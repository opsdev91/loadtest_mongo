kubectl create namespace mongo-locust || true

kubectl -n mongo-locust delete pod locust-master
kubectl -n mongo-locust delete deployment locust-worker-deployment
kubectl -n mongo-locust delete svc master
kubectl -n mongo-locust delete secret mongo-secret
kubectl -n mongo-locust delete configmap load-file
kubectl -n mongo-locust delete configmap settings-file


kubectl -n mongo-locust create configmap load-file --from-file=load_test.py
kubectl -n mongo-locust create configmap settings-file --from-file=settings.py
kubectl -n mongo-locust create -f k8s/secret.yaml
kubectl -n mongo-locust create -f k8s/master.yaml
kubectl -n mongo-locust create -f k8s/master-service.yaml
kubectl -n mongo-locust create -f k8s/worker-deployment.yaml
