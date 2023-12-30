sudo -u root aws s3api create-bucket --bucket frontendchartrakshit
sudo -u root helm s3 init s3://frontendchartrakshit/frontend-foldername
sleep 5
sudo -u root helm package .
sudo -u root helm repo add frontendchartrakshit s3://frontendchartrakshit/frontend-foldername
sudo -u root helm s3 push frontend-0.1.0.tgz frontendchartrakshit
