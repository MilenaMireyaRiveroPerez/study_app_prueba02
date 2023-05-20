const { sequelize } = require("../../connection");
const { UserModel } = require("../../model/user.model");
const UserService = require("../../service/user.service");
const jwt = require("jsonwebtoken");

const listar = async function (req, res) {
  console.log("listar usuarios controller");
  try {
    const users = await UserService.listar(req.query.filtro || "");
    if (users) {
      res.json({
        success: true,
        usuarios: users,
      });
    } else {
      res.json({
        success: true,
        usuarios: [],
      });
    }
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

const consultarPorCodigo = async function (req, res) {
  console.log("consultar 1 usuario por codigo controller");
  try {
    const userModelResult = await UserService.busquedaPorCodigo(
      req.params.filtro || ""
    );
    if (userModelResult) {
      res.json({
        success: true,
        usuario: userModelResult,
      });
    } else {
      res.json({
        success: true,
        usuario: [],
      });
    }
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

const actualizar = async function (req, res) {
  console.log("actualizar usuarios controller");
  let userReturn = null; //guarda el user que se va a incluir o editar
  try {
    userReturn = await UserService.actualizar(
      req.body.id,
      req.body.name,
      req.body.last_name,
      req.body.avatar,
      req.body.email,
      req.body.password,
      req.body.deleted
    );
    res.json({
      success: true,
      user: userReturn,
    });
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

const eliminar = async function (req, res) {
  console.log("eliminar usuarios controller");
  try {
    await UserService.eliminar(req.params.filtro || "");
    res.json({
      success: true,
    });
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

const login = async function (req, res) {
  console.log("login usuarios");
  try {
    const userDB = await sequelize.query(
      "SELECT * FROM users WHERE email ='" +
        req.body.email +
        "' AND password =  '" +
        req.body.password +
        "'"
    );
    console.log("users", userDB);
    let user = null;
    if (userDB.length > 0 && userDB[0].length > 0) {
      user = userDB[0][0]; 
      if (user.token) {
        res.json({
          success: false,
          error: "Usuario ya está autenticado",
        });
        return;
      } 
      let token = jwt.sign(
        {
          codigo: user.codigo,
          name: user.name,
          last_name: user.last_name,
          avatar: user.avatar,
          email: user.email,
        },
        "passwd"
      ); 
      const usersDBUpdate = await sequelize.query(
        "UPDATE users SET token = '" + token + "' WHERE id= " + user.id
      );
      res.json({
        success: true,
        token,
      });
    } else {
      res.json({
        success: false,
        error: "Usuario no encontrado",
      });
    }
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

const logout = async function (req, res) {
  try {
    const usersDB = await sequelize.query(
      "UPDATE users SET token = null WHERE id = " + res.locals.userId + ""
    );
    res.json({
      success: true,
    });
  } catch (error) {
    console.log(error);
    res.json({
      success: false,
      error: error.message,
    });
  }
};

module.exports = {
  listar,
  busquedaPorCodigo: consultarPorCodigo,
  actualizar,
  eliminar,
  login,
  logout,
};
