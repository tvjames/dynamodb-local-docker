# DynamoDB Local for docker
Dockerised instance of AWS DynamoDB local

Build a docker container of the latest version of the [`dynamodb_local` tool 
available][download] from AWS and exposes access to it. 

[download]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html

## Running

Running a non-daemonised instance of the image is as simple as calling `make run` which will 
run the `dynamodb-local` image with an instance name `dynamodb` and publish port `8178` for local access. 

```
$ make run

Initializing DynamoDB Local with the following configuration:
Port:   8000
InMemory:   false
DbPath: /var/dynamodb
SharedDb:   false
shouldDelayTransientStatuses:   false
CorsParams: *

```


## Access

Using the aws cli you can interact with the local instance by specifying the 
`--endpoint-url` & `--region` arguments. 

Example:
```bash
aws dynamodb list-tables --endpoint-url http://localhost:8178 --region dummy
```

## Persistence 

The container exposes the volume `/var/dynamodb` which can be mapped to 
a local path. 

Inspired by [deangiberson/aws-dynamodb-local][inspiration].

[inspiration]: https://hub.docker.com/r/deangiberson/aws-dynamodb-local/

## Building 

A make file is provided to make building the image locally easy. Calling `make build` will 
build the `dynamodb-local` image. 

```
$ make build
```

