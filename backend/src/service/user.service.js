const { sequelize } = require("../connection");
const { UserModel } = require("../model/user.model");

const listar = async function (textoBuscar) {
  console.log("listar usuarios");
  try {
    const users = await sequelize.query(`SELECT * 
      FROM users 
      WHERE 1=1
        AND UPPER(name) LIKE UPPER('%${textoBuscar}%')
        AND deleted IS false
      ORDER BY id`);

    if (users && users[0]) {
      return users[0];
    } else {
      return [];
    }
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const consultarPorCodigo = async function (codigo) {
  console.log("consultar 1 usuario por codigo");
  try {
    const userModelResult = await UserModel.findByPk(codigo);
    if (userModelResult) {
      return userModelResult;
    } else {
      return [];
    }
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const actualizar = async function (
  id,
  name,
  last_name,
  avatar,
  email,
  password,
  deleted
) {
  console.log("actualizar usuarios");
 
  let userReturn = null; 
  const data = { id, name, last_name, avatar, email, password, deleted };

  try {
    let userExist = null;
    if (id) {
      userExist = await UserModel.findByPk(id);
    }
    if (userExist) {
      userReturn = await UserModel.update(data, { where: { id: id } });
      userReturn = data;
    } else {
      data.deleted = 0;
      userReturn = await UserModel.create(data);
    }
    return userReturn;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const eliminar = async function (codigo) {
  console.log("eliminar usuarios");
  try {
    await sequelize.query("UPDATE users SET deleted=true WHERE id= " + codigo);
  } catch (error) {
    console.log(error);
    throw error;
  }
};

module.exports = {
  listar,
  busquedaPorCodigo: consultarPorCodigo,
  actualizar,
  eliminar,
};
