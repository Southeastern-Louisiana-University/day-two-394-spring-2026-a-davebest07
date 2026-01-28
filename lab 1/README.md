# CMPS-394-Day2

## Labs 

Lab 1: Python Hello World (15-20 min)

- Create a folder on your computer

- Make `main.py` that just prints anything you want (`print(“message”)`)

- Go to Docker Hub and pick a python base image to use

- Make a `Dockerfile` that runs your `main.py` file

- `docker image build -t python-hello-world .`

- `docker run --name python-hello-world python-hello-world`

- If you see "message" printed out, then submit your files to GitHub Classroom

 

Lab 2: Multi-Stage Builds with Go (~20-30 min)

- Create a folder on your computer

- Make `main.go` and put the following in it:

```

package main

import "fmt"

 

func main() {

    fmt.Println("Hello from a multi-stage build!")

}

```

- Go to Docker Hub and pick a Go base image to use

- Using the Go image, copy the main.go file and build it using `RUN go build -o hello main.go`

                - Note that Docker can be picky with paths, so I would recommend making an /app folder and doing everything in that

- Define another image using an Alpine base image from Docker Hub

- Copy the `hello` binary into the container

- Set the entrypoint for the container to execute the binary

- Build the image and run the container

- If you see "Hello from a multi-stage build!," then submit your files to GitHub Classroom

 

Lab 3: React Multi-Stage Build (~1 hour)

- Run the following command. This will let you create a starter react project without needing to install node. This will create a folder on your machine, so execute this command where you want the folder for Lab 3 to be

                - `docker run --rm -v "$(pwd):/app" -w /app node:22-alpine npm create vite@latest lab-3 -- --template react`

- In the lab-3 directory, make a Dockerfile

- For the build stage, use `node:22-alpine` as the base image

- Copy `package.json` into /app

- To install dependencies, use `RUN npm install`

- Copy the rest of the project files

- Build the files using `RUN npm run build`

                - This will create a /dist folder with the static files

- For the production stage, use `nginx:alpine` as the base image

- Copy the /dist folder into `/usr/share/nginx/html`

- Expose port 80 using `EXPOSE 80`

                - This will allow NGINX to receive HTTP requests

- Set the entrypoint using `CMD ["nginx", "-g", "daemon off;"]

- Build the image and run using the `-p 8080:80` and `-d` flags

                - `-d` runs in "detached" mode, meaning it won't log the container's output to your console

                - `-p 8080:80` lets you access the NGINX instance on port 8080

- You should see a web page when navigating to `http://localhost:8080` in your browser

- If you see the page, then submit your files to GitHub Classroom

 

## Assignment: Lab 2 From Scratch

- The goal of this assignment is to take Lab 2 and build the `hello` binary without using the golang base image

- You must start with a linux base image for the build step

                - Ubuntu, Alpine, Debian, etcetera

- Install the dependencies you need to build the Go file. I would recommend reading Go's installation steps.

- Once built, your run step should use an Alpine image

- The end result should be identical to Lab 2, but your Dockerfile will be more complicated

- Your final submission will need:

                - main.go

                - Dockerfile

                - comparison.txt -> Put the image size comparison between your build and run images. Note that the full dockerfile will only record the alpine run image, so to get the build image you will need to build an image without the alpine run steps included.

 
