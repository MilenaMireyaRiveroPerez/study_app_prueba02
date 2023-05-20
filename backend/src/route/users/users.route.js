const userController = require("../../controller/users/users.controller");
const authMiddleware = require("../../middleware/auth.controller");

module.exports = function (app) {

  app.get("/users/list",  authMiddleware.auth, userController.listarController);
  app.get("/users/buscarPorCodigo/:filtro", authMiddleware.auth, userController.busquedaPorCodigo);
  app.post("/users/update", authMiddleware.auth , userController.actualizar);
  app.delete("/users/delete/:filtro", authMiddleware.auth , userController.eliminar);
  app.post("/user/login",authMiddleware.auth , userController.login);
  app.post("/user/logout", authMiddleware.auth, userController.logout);
};
