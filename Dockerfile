FROM hashicorp/terraform:0.13.2
ADD . /code
WORKDIR /code/infrastructure
CMD ["plan"]