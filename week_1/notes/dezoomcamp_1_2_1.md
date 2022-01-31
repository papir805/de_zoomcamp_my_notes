Docker commands:

* docker run -it ubuntu
  docker run -it (interactive) ubuntu (image name) bash (parameter - command we want to execute in the image)

* docker run -it python:3.9
  docker run -it (interactive) python(image):3.9(tag - specific version of image)

* docker run -it --entrypoint=bash python:3.9
  docker run -it --entrypoint=bash (what is executed when we run this container) python:3.9
  Note: we need to enter the Python image at bash so we can install something like pandas, using pip install, if we don't, then we are stuck inside Python

* docker built -t test:pandas .
  docker built -t test:pandas (imagename:tag) . (build image in current dir)



Dockerfile notes:

* FROM python:3.9  (base image)

  RUN pip install pandas (parameter to the command that will execute in teh shell)

  WORKDIR /app
  (set current work dir on image)
  COPY pipeline.py pipeline.py 
  (source file -> destination file, from local current work dir -> image current work dir)
  ENTRYPOINT [ "bash" ] (same entrypoint as above)

  ENTRYPOINT [ "python" "pipeline.py" ] (this will run "python pipeline.py" in command line on entry)