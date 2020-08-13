aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin $AWS_ECR
./build.sh
docker tag bgfoundry:latest $AWS_ECR/bgfoundry:latest
docker push $AWS_ECR/bgfoundry:latest
