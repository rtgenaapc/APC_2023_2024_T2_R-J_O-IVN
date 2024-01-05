const express = require("express");
const User = require("../models/users");
const bcryptjs = require ('bcryptjs');
const authRouter = express.Router();


//Sign up
authRouter.post('/api/signup', async (req, res) => {
    try {
        const { User_Name, User_Email, User_Password } = req.body;


        const userExisting = await User.findOne({ User_Email });
        if (userExisting) {
            return res.status(400)
            .json({ msg: "Email is already existing."  });
        }

        const hashedPassword = await bcryptjs.hash(User_Password, 8);

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
            User_Password,
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
