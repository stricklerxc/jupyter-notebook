# Jupyter Notebook Docker Image

Simple docker image for running a Jupyter notebook server.

## How to Use

### Pull from DockerHub

```bash
$ docker pull stricklerxc/jupyter-notebook:latest
latest: Pulling from stricklerxc/jupyter-notebook
bc51dd8edc1b: Pull complete
dc4aa7361f66: Pull complete
f7d31f0d4202: Pull complete
edfb78ef674e: Pull complete
9630f24835d2: Pull complete
4facac6fb436: Pull complete
24e11ba29dd8: Pull complete
Digest: sha256:1de09326af313688932ffbf7b59fbc8008207c3327822e9446b0e1c3cf713b7d
Status: Downloaded newer image for stricklerxc/jupyter-notebook:latest
docker.io/stricklerxc/jupyter-notebook:latest
```

### Build from Source

```bash
$ git clone https://github.com/stricklerxc/jupyter-notebook.git
$ cd jupyter-notebook
$ docker build -t jupyter-notebook:latest .
$ docker run --name jupyter --publish 8888:8888 --env JUPYTER_PASSWORD <password> jupyter-notebook:latest
```