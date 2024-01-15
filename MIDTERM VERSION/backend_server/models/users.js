const mongoose = require ('mongoose');

const users_Schema = mongoose.Schema({
    User_Name: {
        required: true,
        type: String,
        trim: true,
    },
    User_Email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;

                //REGEX
                return value.match(re);
            },
            message: "Please eneter a valid email address",
        },
    },
    User_Password: {
        requred: true,
        type: String,
    },
    User_Address: {
        type: String,
        default: '',

    },
    User_Type: {
        type: String,
        default: "user",
    },

  });

  const User = mongoose.model('users', users_Schema);
  module.exports = User;