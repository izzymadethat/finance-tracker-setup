#!/bin/bash

# Welcome
echo Building out the finance tracker structure...

# make entire folder and contents within folder
mkdir finance-tracker
cd finance-tracker

mkdir server routes utils

# add app.js
touch server/app.js

# add .env file
touch .env

# add .sequelizerc file
touch .sequelizerc

# add gitignore with node_modules inside
echo node_modules >>.gitignore

# add readme file
echo -e '# Finance Tracker\nThis is a Finance Tracker API built using EXPRESS, SEQUELIZE, SQLITE, and KINDE' >>README.md

# initialize npm and install packages
npm init -y

npm install sqlite3 express dotenv sequelize @kinde-oss/kinde-node-js-sdk
npm install -D nodemon sequelize-cli dotenv-cli

# add version control and make first commit
git init
git add .
git commit "initial commitial"

# Start coding
echo -e "Folder structure complete. You will only need to cd into the folder and start coding from here on.\n"

read -p "All done! start coding? [Y,n] " answer
if [[ $answer == "Y" || $answer == "y" ]]; then
    code .
else
    exit 0
fi
