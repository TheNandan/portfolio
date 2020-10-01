#!/bin/bash

echo "Creating virtual environment..."
python -m venv ve

echo "Activating virtual environment..."
source ve/bin/activate

echo "Installing the requirements..."
pip install -r requirements.txt

echo "Checking the deployment status"
zappa status dev
