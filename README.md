# Build a Finance Tracker (Setup Folder only)

This is a Finance Tracker API built using Express, Sequelize, SQLite, and Kinde. This will help you set up the folder structure that was used to build this project. Follow the instructions carefully.

## Project Setup

To get started with this project, follow these instructions:

### 1. Clone the Repository

Clone this repo to your local machine (place wherever you normally put your projects):

`via HTTPS:`

```bash
git clone https://github.com/izzymadethat/finance-tracker-setup.git finance-tracker-setup
```

`via SSH:`

```bash
git clone git@github.com:izzymadethat/finance-tracker-setup.git finance-tracker-setup
```

### 2. `CD` into the folder you plan on building the Project from (Do NOT build in setup folder)

```bash
cd ../../<to your desired destination folder>
```

### 3. Make the script executable

This project folder only has the setup script to build out the entire folder structure. To make it executable, run:

```bash
chmod +x <PATH>/<TO>/finance-tracker-setup/setup.sh
```

### 4. Finally, execute the script and follow the prompt:

```bash
bash <PATH>/<TO>/finance-tracker-setup/setup.sh
```

## Building the Backend

### 5. The script will run, create the necessary folders, and initialize the backend

![Backend being built part 1](./images/backend-build-1.PNG)
![Backend being built part 1](./images/backend-build-2.PNG)

## Building the Frontend

### 6. The script will now run the commands to build your frontend directory using the latest version of [Nextjs](https://nextjs.org/docs). When prompted, use your left or right arrow keys to answer the configuration questions then press `enter/return`. Your results should look like this:

![Frontend being built part 1](./images/front-end-build-1.PNG)

## Using `git` for version control

So that you can keep track of your changes, I've automatically scripted in your git commands! So change you make can be added to your repository (Of course you'll setup adding it to Github)
![Frontend being built part 1](./images/git.PNG)

## STEPS COMPLETE! Press _'`Y`'_ then `enter/return` to start coding (opens in VSCode)

You can view the folders to check what has been installed. Your folder structure should look similar to this:

_note: the folder name `finance-tracker` will be created for you._

```bash
./ Folder where your projects are
finance-tracker
├── backend
│   ├── .env
│   ├── README.md
│   ├── database
│   ├── node_modules
│   ├── package-lock.json
│   ├── package.json
│   ├── prisma
│   │   └── schema.prisma
│   ├── routes
│   │   ├── auth.js
│   │   ├── categories.js
│   │   └── transactions.js
│   ├── server
│   │   └── app.js
│   └── utils
│       └── kinde.config.js
└── frontend
    ├── .env
    ├── README.md
    ├── jsconfig.json
    ├── next.config.mjs
    ├── package-lock.json
    ├── package.json
    ├── postcss.config.mjs
    ├── postcss.config.mjs
    ├── node_modules
    ├── public
    │   ├── next.svg
    │   └── vercel.svg
    ├── src
    │   └── app
    │       ├── favicon.ico
    │       ├── globals.css
    │       ├── layout.js
    │       └── page.js
    └── tailwind.config.js

11 directories, 22 files
```

### If so, then we're ready to get started with building our API!
