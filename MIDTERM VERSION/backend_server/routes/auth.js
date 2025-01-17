const express = require("express");
const User = require("../models/users");
const bcryptjs = require ('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');


//Sign up
authRouter.post('/api/signup', async (req, res) => {
    try {
        const { User_Name, User_Email, User_Password } = req.body;


        const userExisting = await User.findOne({ User_Email });
        if (userExisting) {
            return res.status(400) //400 = client error response  / bad reqeust
            .json({ msg: "Email is already existing."  });
        } 

        const hashedPassword = await bcryptjs.hash(User_Password, 8);
        // How about the incorrect password?

        const isMatch = await bcryptjs.compare(User_Password, hashedPassword);
        if (!isMatch) {
            return res.status(400).json({ msg: 'Incorrect password.' });
        }

        const token = jwtsign = jwt.sign({ id: userExisting._id }, "Password Key");
        res.json(token, ...user._doc);

   
        let user = new User({
            User_Email,
            User_Password: hashedPassword,
            User_Name,
        });

        user = await user.save();
        res.json(user);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});

authRouter.get('/api/signup', async (req, res) => {
    try {
        const { User_Name, User_Email, User_Password } = req.body;

        const userExisting = await User.findOne({ User_Email });
        if (userExisting) {
            return res.status(400).json({ msg: 'Email already existed.' });
        }

        let user = new User({
            User_Email,
            User_Password: user,
            User_Name,
        });

        user = await user.save();
        res.json(user);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});


module.exports = authRouter;
