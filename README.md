### Prerequisite

1. Docker installed

### Introduction

In this repo, we try to create a reverse proxy that serves two other live web server containers. In the `microservice1` and `microservice2`
directories, there are `Dockerfile` that you can use to run the simulated web servers. In the root folder, there is a `Dockerfile` that you will use to run the reverse-proxy container.

### Building the Docker images

First, build the two web servers' images using the following command in the terminal:

`cd microservice1 && docker build -t microservice1 . && cd ../microservice2 && docker build -t microservice2 . && cd .. && docker build -t nginx-reverse-proxy .`

Verify that all three images are built correctly:

`docker image ls`

From the results output from the above command, you should see two repository named `microservice1`, `microservice2` and `nginx-reverse-proxy`.

Next, you run the microservice images as containers:

`docker run --name microservice1 -d -p 3001:80 microservice1 && docker run --name microservice2 -d -p 3002:80 microservice2`

After which, we run the reverse proxy:

`docker run -d --name nginx-reverse-proxy -p 80:80 -p 443:443 --link=microservice1 --link=microservice2 nginx-reverse-proxy`

Verify that all three containers are running:

`docker ps`

From the results output from the above command, you should see

### Check the results

For the next few steps, you may use either your browser or the command line tool `curl`.

First, check the existence of both web servers that we simulate as microservices.

`localhost:3001`

`localhost:3002`

Next, head over to `localhost`, where the reverse-proxy resides. Over here, we can try

`localhost/app1`

`localhost/app2`

to verify that the reverse proxy works. (We are simulating the example that we can redirect to two different server.)

### Understanding the Dockerfile

`FROM nginx`

Every Dockerfile needs to start with a `FROM` command, which specifies the base image for the subsequent instruction.

`COPY html /usr/share/nginx/html`

This command copies the local directory `html` to directory `/usr/share/nginx/html` residing in the docker container.
