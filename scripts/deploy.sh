version: 0.2

phases:

pre_build:
commands:
- echo Login to ECR

```
  - aws ecr get-login-password \
    --region ap-south-1 \
    | docker login \
    --username AWS \
    --password-stdin \
    299834554299.dkr.ecr.ap-south-1.amazonaws.com
```

build:
commands:
- docker build -t frontend-ecr .

```
  - docker tag frontend-ecr:latest \
    299834554299.dkr.ecr.ap-south-1.amazonaws.com/frontend-ecr:latest
```

post_build:
commands:
- docker push 
299834554299.dkr.ecr.ap-south-1.amazonaws.com/frontend-ecr:latest
