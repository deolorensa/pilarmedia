import { Sequelize } from "sequelize";
import db from "../config/database.js";
 
const { DataTypes } = Sequelize;
 
const Guest = db.define('guests',{
    name:{
        type: DataTypes.STRING
    },
    email:{
        type: DataTypes.STRING
    },
    card:{
        type: DataTypes.STRING
    },
    birth:{
        type: DataTypes.DATE
    }
},{
    freezeTableName: true
});

(async () => {
    await db.sync();
})();
 
export default Guest;