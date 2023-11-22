# Assignment 10.2 Docker build and push to dockerhub

This lab could be started separately, but is intended to be done after the 10.1 Setup remote for github.  After that lab, you should have a larger capacity AWS instance that is both docker and github ready.

## Description:
You will create your own repo from this template, clone it to your AWS instance and follow the steps to build and push a docker image to dockerhub.  Then someone else should be able to use that docker image without having to install anything other than docker.
The image you will build uses scikit-learn to train a knn classifier on the iris data set.  When it runs it will produce a png image graphing the classified values.

## Requirements:
* An AWS Instance that is github and docker ready
* An account for dockerhub.  (Specifically you'll need your username and password)
* A repo to exist in dockerhub (You can create one easily via the dockerhub UI)
* A clone of your repo on the AWS instance (after using this as a template, you should have your own repo)

## Steps
* Use this repository as a template and create one in our organization.  Please keep the name the same **and append** `_<virginia uuid>`  So for instance, if I used this as a template I'd call it `docker_lab_template_dpy8wq`
* On your AWS larger instance, clone this repository
* You should install `make` since that will guide you through the sequence.
* Navigate to the root folder of the cloned repository.
* Inspect the python file and Dockerfile.  As you'll see the end result of running the docker image is to generate a file.
* `make build`.  Check that the image was created with `docker images`
* `make run`.  Check that you see console output indicated by the print statements for the labels (ines 22-29)
* `make interbash`. This should place you _inside_ the image, now use the ls command to verify an image was created, see the py script for the name.
* `===  NOTE: for the next commands you need to edit the makefile with your information ====`
* `make login`.  This should prompt you to sign into your dockerhub account via username and password
* `make push` to push your image to dockerhub, then go to dockerhub and verify it is there.  **NOTE** that before you run this command you will need to edit with some information.
* You should now be able to remove the image, go outside your repository and use docker to pull the image down and run it.
* I've also added a `clean_containers` job in case you need to remove running containers if you try to iterate and add something to the py or Dockerfile files.

Here is a link to the documentation page on dockerhub  https://docs.docker.com/docker-hub/repos/create/

## Grading: 10 points if I can use dockerhub to use your image and see the png generated
