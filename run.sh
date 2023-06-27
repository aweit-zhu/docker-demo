group_name='aweit'
app_name='docker-demo'
app_version='1.0-SNAPSHOT'
profile_active='prod'

echo '----copy jar----'
docker stop ${app_name}

echo '----stop container----'
docker rm ${app_name}

echo '----rm container----'
docker rmi ${group_name}/${app_name}:${app_version}

echo '----rm image----'
docker build -t ${group_name}/${app_name}:${app_version} .

echo '----push imag----'
docker login -u aweit -p xx051821xx051821
docker push ${group_name}/${app_name}:${app_version}

echo '----build image----'
docker run -p 8090:8090 --name ${app_name} \
-v /mydata/app/${app_name}/logs:/var/logs \
-d ${group_name}/${app_name}:${app_version}

echo '----start container----'