#!/bin/bash

ARG AWS_SECRET_ACCESS_KEY
ARG AWS_ACCESS_KEY_ID
ARG AWS_DEFAULT_REGION
ARG REPOSITORY_NAME

echo "Setting alias for Zappa"
# shellcheck disable=SC2139
alias zappashell3="docker run -ti -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} -v \"$(pwd):/var/task\"  --rm lambci/lambda:build-python3.8 bash"
alias zappashell3 >> ~/.bash_profile

# shellcheck disable=SC2139
alias zappashell="docker run -ti -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} -v \"$(pwd):/var/task\" -v ~/.aws/:/root/.aws  --rm ${PORTFOLIO_REPOSITORY}"
alias zappashell >> ~/.bash_profile

echo "Creating virtual environment..."
python -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Installing the requirements..."
pip install -r requirements.txt

echo "Success...."
zappa status dev
