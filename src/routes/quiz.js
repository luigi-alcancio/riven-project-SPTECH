var express = require("express");
var router = express.Router();

// Importa o controller responsável por validar e responder às requisições.
var quiz_controller = require("../controllers/quiz_controller");

router.post("/cadastrar_tentativa", function (req, res) {
    // Encaminha o usuário e a pontuação enviados no corpo em JSON.
    quiz_controller.cadastrar_tentativa(req, res);
});

router.get("/consultar_recorde", function (req, res) {
    // Encaminha o usuário informado depois do ? na URL.
    quiz_controller.consultar_recorde(req, res);
});

// Permite que o app.js importe as duas rotas.
module.exports = router;
