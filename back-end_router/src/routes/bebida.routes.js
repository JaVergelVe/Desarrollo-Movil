import { Router } from "express";

const routerBebida = Router();

routerBebida.get("/bebida", (req, res)=>{
    res.json({
        msg : 'GET BEBIDA'
    })
})

export default routerBebida;