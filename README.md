# go-devtools

**For development only. Do not use in production.**

Simple Docker image for a nice go apps development experience. 

## Features
1. live-reload, using [air](https://github.com/cosmtrek/air) 
2. debugger, using [go-delve](https://github.com/go-delve/delve). Runs on port `40000`

## How to use
Use the following [docker-compose](https://docs.docker.com/compose/) config and modify `SRC_ENTRYPOINT` env and `volumes` to your needs.
```yaml
#
# docker-compose.yml
#
version: "3"
services:
  app:
    image: chrsep/go-devtools:latest
    # Security options required to enable delve debugger in docker. This project is partly inspired by jetbrains's blog:
    # https://blog.jetbrains.com/go/2018/04/30/debugging-containerized-go-applications/
    security_opt:
      - "apparmor=unconfined"
    cap_add:
      - "SYS_PTRACE"

    # Mount your project somewhere in the src's subdirectory. Air will restart your app when any go files
    # inside /src directory changes. For intellij's debugger to work, you need to mount to a directory with the same
    # name as your project's folder. Eg. project example should be mounted to directory such as /src/example.
    volumes:
    - .:/src/example

    # Tell the container where to find the entry point to your app.
    environment:
      SRC_ENTRYPOINT: /src/example/main.go
  
    # Open ports for debugging, plus any other ports you need.
    ports:
    # Delve's debug port for debugging
    - 40000:40000
    # App's port
    - 8080:8080
```
Example dummy project on the `example` directory.


## Goal
Make bootstrapping and running useful common go development tools as easy as adding a single file and running a single command.

## Contributing
I would love to include more tools that would improve developer ergonomics while developing go apps. Feel free to open an issue or pull requests to suggest things that can be improved.
