### Prerequisite

1. Docker installed

### Building the Docker image

This repository contains a Dockerfile which we can use to build our Docker image. Run the following command:

```docker build --tag mynginx .```

This builds a Docker image named `mynginx`.


### Running a Docker container

To start running an instance of the Docker image, type the following command in the terminal:

```docker run --name chester-nginx -d -p 8080:80 mynginx```

This run a Docker container based off the `mynginx` image. The name of the container is `chester-nginx`, and runs in `detached` mode. To see the webpage being served by this container, head over to your browser and enter the following into the URL: `localhost:8080`.


### Understanding the Dockerfile

```FROM nginx```

Every Dockerfile needs to start with a `FROM` command, which specifies the base image for the subsequent instruction.

```COPY html /usr/share/nginx/html```

This command copies the local directory `html` to directory `/usr/share/nginx/html` residing in the docker container.

