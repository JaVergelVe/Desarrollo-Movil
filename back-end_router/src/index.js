import express from "express";
import RouterGeneral from "./routes/index.routes.js";

/* init express */ 
const app = express();

app.use(RouterGeneral);

/* colocar el servidor a escuchar peticiones */
app.listen(8000 , ()=>{
    console.log("Hola servidor");
}  );




