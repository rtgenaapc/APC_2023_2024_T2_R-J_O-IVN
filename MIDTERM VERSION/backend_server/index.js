// Npm EXPRESS package import
const express = require("express");//Package node express
const mongoose = require("mongoose");
//IMPORTS from other files
const authRouter = require ("./routes/auth")//Like features

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://kimaltea:kimaltea@cluster0.wyjrcjl.mongodb.net/?retryWrites=true&w=majority"

//middleware
app.use(express.json())
app.use(authRouter);

// Connections
mongoose
.connect(DB)
.then(() => {
    console.log("Connection Successful");
})
.catch((e)=>{
    console.log(e);
});

//(GET, PUT, POST, DELETE, UPDATE = CRUD)
app.listen(PORT, () => {
    console.log(`connected at port ${PORT}`);
});
