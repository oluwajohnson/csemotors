const express = require("express");
const expressLayouts = require("express-ejs-layouts")
const app = express();
app.use(expressLayouts);

app.set("view engine", "ejs");
app.set("views", "./views");
app.set("layout", "./layouts/layout")

app.use(express.static("public"));

app.get("/", (req, res) => {
  res.render("index");
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
