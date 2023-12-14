aws s3api create-bucket --bucket backend_chart --region ap-south-1
helm s3 init s3://backend_chart/backend-foldername
helm package . 
helm repo add backend_chart s3://backend_chart/backend-foldername
helm s3 push backend-0.1.0.tgz backend_chart
