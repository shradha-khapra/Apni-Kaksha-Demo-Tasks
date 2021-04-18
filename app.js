const express=require('express');
const app=express();
const PORT=process.env.PORT || 5000;

app.use(express.json())
app.use(require('./route/auth'));
app.use(require('./route/appoint'));

app.listen(PORT,()=>{
    console.log("Server Starting on Port No "+PORT);
})