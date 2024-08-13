// For routes/index.js

const fs = require("fs");
const path = require("path");
const routers = {};

fs.readdirSync(__dirname)
  .filter((file) => file !== "index.js" && file.endsWith(".js"))
  .forEach((file) => {
    const routerName = path.basename(file, ".js") + "Router";
    routers[routerName] = require(path.join(__dirname, file));
  });

module.exports = routers;
