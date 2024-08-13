#!/bin/bash

# Welcome
echo -e "Building out the finance tracker structure...\n"

# make entire folder and contents within folder
mkdir finance-tracker
cd finance-tracker || return 1

mkdir frontend backend backend/server backend/routes backend/utils backend/database backend/utils/functions

cd backend || exit 1

# add app.js
touch server/app.js

# add routes
touch routes/auth.js routes/categories.js routes/transactions.js

# add kinde config
touch utils/kinde.config.js

# add prisma config
touch utils/prisma.config.js

# add functions file
touch utils/functions/index.js

# add routes index.js file and add dynamic file paths
./create-routes-index-file.sh

# add .env file
touch .env

# add gitignore with node_modules inside
echo -e "node_modules\n.env*" >>.gitignore

# add DB file to .env
echo -e "DATABASE_FILE='file:../database/development.db'\nPORT=5174" >>.env

# add readme file
echo -e '# Finance Tracker\nThis is a Finance Tracker API built using EXPRESS, PRISMA, SQLITE, and KINDE' >>README.md

printf "Initializing and installing npm and dependencies........\n\n"

# initialize npm and install packages
npm init -y

npm install sqlite3 express dotenv @kinde-oss/kinde-nodejs-sdk @prisma/client
npm install -D nodemon prisma sequelize-cli dotenv-cli cors

printf "Initializing prisma........\n\n"

# initialize prisma
npx prisma init --datasource-provider sqlite

# Create prisma seed.js file with the seeding script content
cat <<'EOF' >prisma/seed.js
const prisma = require("../utils/prisma.config");

const users = [
  { username: "testuser1", email: "testuser1@example.com" },
  { username: "testuser2", email: "testuser2@example.com" },
  { username: "testuser3", email: "testuser3@example.com" },
];

const transactions = [
  { type: "expense", name: "Groceries", amount: 54.65, description: "Bought groceries", categoryName: "Groceries" },
  { type: "income", name: "Salary", amount: 1500, description: "Monthly salary", categoryName: "Salary" },
  { type: "expense", name: "Rent", amount: 800, description: "Monthly rent", categoryName: "Rent" },
];

async function seed() {
  try {
    // Delete all existing data
    await prisma.transaction.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.user.deleteMany({});

    // Create users
    for (const userData of users) {
      const user = await prisma.user.create({ data: userData });

      // Create transactions for each user
      for (const transactionData of transactions) {
        let category = await prisma.category.findUnique({
          where: { name: transactionData.categoryName },
        });

        if (!category) {
          category = await prisma.category.create({
            data: { name: transactionData.categoryName },
          });
        }

        await prisma.transaction.create({
          data: {
            ...transactionData,
            userId: user.kindeId,
            categoryId: category.id,
            date: new Date(),
          },
        });
      }
    }
    console.log("Seeding completed successfully.");
  } catch (error) {
    console.error("Error during seeding:", error.message);
  } finally {
    await prisma.$disconnect();
  }
}

seed();
EOF

# building frontend
cd ../frontend || exit 1

printf "Building frontend........\n\n"

npx create-next-app@latest .

printf "Adding version control........\n\n"

# add version control and make first commit
cd ..
git init
git add .
git commit -m "initial commitial"

# Start coding
printf "\n\nFolder structure complete. You will only need to cd into the folder and start coding from here on.\n"

read -rp "All done! Start coding? [Y,n] " answer
if [[ $answer == "Y" || $answer == "y" ]]; then
    code .
else
    exit 0
fi
