build: 
	docker build -t dynamodb-local:latest .

run: 
	docker run -it --rm --name dynamodb -p 8178:8000 dynamodb-local:latest

