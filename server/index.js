const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");

// creating express app
const PORT = 3000;
const app = express();

const DB =
  "mongodb+srv://darkshadow:AmazonClonePassword@cluster0.1wp7hqf.mongodb.net/?retryWrites=true&w=majority";

// Middleware
app.use(express.json());
app.use(authRouter);

// connection to database
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to the database is successful");
  })
  .catch((err) => {
    console.log(err);
  });
// Creating API

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is listening on port ${PORT}`);
});
