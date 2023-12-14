aws s3api create-bucket --bucket frontend_chart --region ap-south-1
helm s3 init s3://frontend_chart/frontend-foldername
helm package . 
helm repo add frontend_chart s3://frontend_chart/frontend-foldername
helm s3 push frontend-0.1.0.tgz frontend_chart
