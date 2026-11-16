var express = require("express");
var router = express.Router();

var campeaoController = require("../controllers/campeaoController");

router.post("/cadastrar_curtida", function (req, res) {
    // função a ser chamada quando acessar /campeao/cadastrar_curtida
    campeaoController.cadastrar_curtida(req, res);
});

router.get("/listar_campeao", function (req, res) {
    // função a ser chamada quando acessar /campeao/listar_campeao
    campeaoController.listar_campeao(req, res);
});

router.get("/consultar_curtida", function (req, res) {
    // Encaminha a consulta com os IDs enviados depois do ? na URL.
    campeaoController.consultar_curtida(req, res);
});

router.delete("/remover_curtida", function (req, res) {
    // Encaminha a exclusão com os IDs enviados no corpo em JSON.
    campeaoController.remover_curtida(req, res);
});

router.get("/listar_curtidas", function (req, res) {
    // Lista as curtidas do usuário informado depois do ? na URL.
    campeaoController.listar_curtidas(req, res);
});

module.exports = router;
