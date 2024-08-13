const prisma = require("../utils/prisma.config");

const users = [
  {
    username: "testuser1",
    email: "testuser1@example.com",
  },
  {
    username: "testuser2",
    email: "testuser2@example.com",
  },
  {
    username: "testuser3",
    email: "testuser3@example.com",
  },
];

const transactions = [
  {
    type: "expense",
    name: "Groceries",
    amount: 54.65,
    description: "Bought groceries",
    categoryName: "Groceries",
  },
  {
    type: "income",
    name: "Salary",
    amount: 1500,
    description: "Monthly salary",
    categoryName: "Salary",
  },
  {
    type: "expense",
    name: "Rent",
    amount: 800,
    description: "Monthly rent",
    categoryName: "Rent",
  },
];

async function seed() {
  try {
    // Delete all existing data
    await prisma.transaction.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.user.deleteMany({});

    console.log("All data deleted. Starting reseeding...");

    // Create users
    for (const userData of users) {
      const user = await prisma.user.create({
        data: userData,
      });

      // Create transactions for each user
      for (const transactionData of transactions) {
        // Check if the category already exists
        let category = await prisma.category.findUnique({
          where: { name: transactionData.categoryName },
        });

        if (!category) {
          // Create category if it doesn't exist
          category = await prisma.category.create({
            data: { name: transactionData.categoryName },
          });
        }

        // Create transaction
        await prisma.transaction.create({
          data: {
            type: transactionData.type,
            name: transactionData.name,
            amount: transactionData.amount,
            description: transactionData.description,
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
