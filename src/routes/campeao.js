var express = require("express");
var router = express.Router();

var campeaoController = require("../controllers/campeaoController");

router.post("/cadastrar", function (req, res) {
    // função a ser chamada quando acessar /campeao/cadastrar
    campeaoController.cadastrar(req, res);
});

router.get("/listar", function (req, res) {
    // função a ser chamada quando acessar /campeao/listar
    campeaoController.listar(req, res);
});

module.exports = router;