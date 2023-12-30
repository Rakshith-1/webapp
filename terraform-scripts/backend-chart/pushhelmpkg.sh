sudo -u root aws s3api create-bucket --bucket backendchartrakshit
sudo -u root helm s3 init s3://backendchartrakshit/backend-foldername
sleep 5
sudo -u root helm package .
sudo -u root helm repo add backendchartrakshit s3://backendchartrakshit/backend-foldername
sudo -u root helm s3 push backend-0.1.0.tgz backendchartrakshit
