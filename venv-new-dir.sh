#!/bin/bash
# venv-new-dir.sh
#
# Copies a Python project with a virtual environment into a new directory.
#
# Scott Renegado

OLD_DIR=$1
NEW_DIR=$2 # Place this script in a top-level directory that has your Python project
VENV=$3
CURR_DIR=$(pwd)

# Returns a current timestamp
timestamp(){
	date +%T
}

# Generate requirements.txt file, if needed
REQUIREMENTS_FILE=$(find $OLD_DIR -type f -name 'requirements.txt')

if [ "$REQUIREMENTS_FILE" = "$OLD_DIR/requirements.txt" ]; then
	echo $(timestamp) Found existing requirements.txt file in project.
else
	echo $(timestamp) No requirements.txt file found, generating new one.
	
	cd $OLD_DIR

	# Generate requirements.txt file from venv
	echo $(timestamp) Activate venv in Python project 
	source $VENV/bin/activate

	echo $(timestamp) Generate new requirements.txt file
 	pip freeze > requirements.txt 

	echo $(timestamp) Deactivate venv 
	deactivate

	cd $CURR_DIR
fi

# Set up a new project folder with copied contents and venv
echo $(timestamp) Create new project directory 
mkdir -p $NEW_DIR

echo $(timestamp) Delete old venv folder
rm -rf $OLD_DIR/.venv

echo $(timestamp) Copy project contents into new directory
cp -a $OLD_DIR/. $NEW_DIR

echo $(timestamp) Create new virtual environment
python3 -m venv $NEW_DIR/$VENV

# Install all required packages into new venv
cd $NEW_DIR

echo $(timestamp) Activate venv in new directory 
source $VENV/bin/activate

echo $(timestamp) Install packages 
pip3 install -r $NEW_DIR/requirements.txt

echo $(timestamp) Deactivate venv 
deactivate

echo Copied Python project from $OLD_DIR to $NEW_DIR
