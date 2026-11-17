var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.put("/atualizar_rank", function (req, res) {
    // Encaminha o ID e o novo rank recebidos da Home para o controller.
    usuarioController.atualizar_rank(req, res);
});

module.exports = router;
