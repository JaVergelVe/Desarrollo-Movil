import { getMenuModel, getMenuUnicoModel } from "../models/menu.model.js";


export const getMenu = async  (req, res )=> {
    let data = await  getMenuModel();

    res.status(201).json({
        msg : 'GET MENU DESDE EL CONTROLLADOR ',
        data : data

    });
}

export const getMenuUnico = async (req , res)=> {
    // para obtener valores por parametros :id 
    let { id } = req.params;
    let data = await getMenuUnicoModel(id)
    res.status(200).json({
        msg: 'Mensaje de getMenu Único',
        parametro: id,
        data : data
    })
}

export const postMenu  = (req , res)=> {
    res.status(200).json({
        msg: 'POST MENU DESDE EL CONTROLADOR'
    })
}

export default {
    getMenu ,
    getMenuUnico,
    postMenu
}