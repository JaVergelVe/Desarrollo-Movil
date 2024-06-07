import { Router } from "express";
// import { getMenu, postMenu } from "../controllers/menu.controller.js";
import menuController from "../controllers/menu.controller.js";
const routeMenu = Router();

routeMenu.get('/menu', menuController.getMenu )
routeMenu.get('/menu/:id', menuController.getMenuUnico )
routeMenu.post('/menu', menuController.postMenu)

export default routeMenu;