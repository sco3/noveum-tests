export AWS_ACCESS_KEY_ID=$(echo -n $(cat ~/.aws/credentials | grep aws_access_key_id | awk -F= '{ print $2}'))
export AWS_SECRET_ACCESS_KEY=$(echo $(cat ~/.aws/credentials | grep aws_secret_access_key | awk -F= '{ print $2}'))
export AWS_REGION=us-east-1



docker rm -f noveum
docker run   \
    -p 3000:3000 \
    -e RUST_LOG=debug \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_REGION=$AWS_REGION \
    -p 4000:4000 \
    --name noveum \
    noveum/noveum-ai-gateway:latest

