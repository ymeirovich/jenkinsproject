aws cloudformation create-stack --template-body file://ecs-jenkins-demo.template --stack-name JenkinsStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=Jenkins --region us-east-1 --parameters ParameterKey=EcsStackName,ParameterValue=EcsClusterStack
{
    "StackId": "arn:aws:cloudformation:us-east-1:464392538707:stack/JenkinsStack/baa65970-f052-11ea-8033-0e28043c5c55"
}

aws cloudformation create-stack --template-body file://ecs-cluster.template --stack-name EcsClusterStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=ECS --region eu-west-1 --parameters ParameterKey=KeyName,ParameterValue=jenkinskeypair ParameterKey=EcsCluster,ParameterValue=getting-started ParameterKey=AsgMaxSize,ParameterValue=2

aws ec2 describe-instances --filters "Name=tag-value","Values=JenkinsStack" | jq .Reservations[].Instances[].PublicDnsName
aws ec2 describe-instances --filters "Name=tag-value","Values=JenkinsStack" | jq .Reservations[].Instances[].PublicDnsName
aws ec2 describe-instances --filters "Name=tag-value","Values=JenkinsStack" | jq .Reservations[].Instances[].PublicDnsName

aws cloudformation create-stack --template-body file://ecs-jenkins-demo.template --stack-name JenkinsStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=Jenkins --region eu-west-1 --parameters ParameterKey=EcsStackName,ParameterValue=EcsClusterStack

ssh -i ./jenkinskeypair.pem ec2-user@ec2-54-246-49-156.eu-west-1.compute.amazonaws.com

arn:aws:ecr:eu-west-1:480776498883:repository/hello-world
a481bf3a47c34c1c9fa3773bc0069ce3
http://ec2-54-246-49-156.eu-west-1.compute.amazonaws.com/

aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 480776498883.dkr.ecr.eu-west-1.amazonaws.com