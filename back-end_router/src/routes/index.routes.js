import { Router } from "express";
import routeMenu from "./menu.routes.js";
import routerBebida from "./bebida.routes.js";
const RouterGeneral = Router();

RouterGeneral.use('/api',routeMenu);
RouterGeneral.use('/api',routerBebida);

export default RouterGeneral;