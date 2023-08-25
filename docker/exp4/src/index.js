const axios = require("axios")
const moment = require("moment")


const fetch_data =async ( name,dob)=>{

    const res =  await axios.post("https://reqres.in/api/users",
        {
        name: name,
        movies: [ "Spiderman"],
        DOB: new moment(dob)
    
    })

    console.log(res.data);
}

// console.log(process.argv[2])

fetch_data(process.argv[2],process.argv[3])