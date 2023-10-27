const express = require("express");
const User = require("../models/user");

const bcrpytjs = require("bcryptjs");

const authRouter = express.Router();
const jwt = require("jsonwebtoken");

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({ message: "User already exists ! " });
    }

    const hashedPassword = await bcrpytjs.hash(password, 8);
    let user = new User({
      name,
      email,
      password: hashedPassword,
    });

    user = await user.save();
    return res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Sign-In Routes

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const emailUser = await User.findOne({ email });
    if (!emailUser) {
      return res.status(400).json({ message: "User Email is Invalid !" });
    }
    const isPasswordMatch = await bcrpytjs.compare(
      password,
      emailUser.password
    );
    if (!isPasswordMatch) {
      return res.status(400).json({ message: "User Password is Invalid !" });
    }
    const token = jwt.sign({ id: emailUser._id }, "passwordKey");
    res.json({ token, ...emailUser._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
