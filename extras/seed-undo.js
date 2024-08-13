const prisma = require("../utils/prisma.config");

async function undoSeed() {
  try {
    // Delete all existing data
    await prisma.transaction.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.user.deleteMany({});

    console.log("All seed data completed successfully.");
  } catch (error) {
    console.error("Error deleting seed data: ", error);
  } finally {
    await prisma.$disconnect();
  }
}
undoSeed();
