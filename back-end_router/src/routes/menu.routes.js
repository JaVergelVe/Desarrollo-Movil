import { Router } from "express";

const routeMenu = Router();

routeMenu.get('/menu', (req, res)=>{
    res.json({
        msg : 'GET MENU'
    });
})

routeMenu.post('/menu', (req, res)=>{

    res.json({
        msg : 'POST MENU'
    });
})

export default routeMenu;