
import { sequelize } from "../services/pg_sequelize.js";

export const getMenuModel = async ()=> {
    const data = await sequelize.query(" SELECT * FROM MENU");
    return data[0]
}

export const getMenuUnicoModel = async (id) => {
    const data = await sequelize.query(" SELECT * FROM MENU WHERE ID_MENU = :id_m ",{
        replacements : {
            id_m : id
        }
    });
    return data[0]
}

