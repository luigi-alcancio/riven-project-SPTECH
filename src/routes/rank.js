// Cria o agrupamento das rotas usando o Express já instalado no projeto.
var express = require("express");
var router = express.Router();

// Importa o controller que consulta os dados e responde às requisições.
var rank_controller = require("../controllers/rank_controller");

router.get("/listar_jogadores_por_elo", function (req, res) {
    rank_controller.listar_jogadores_por_elo(req, res);
});

router.get("/consultar_media_quiz", function (req, res) {
    rank_controller.consultar_media_quiz(req, res);
});

router.get("/consultar_tentativas_quiz", function (req, res) {
    rank_controller.consultar_tentativas_quiz(req, res);
});

router.get("/listar_media_quiz_por_elo", function (req, res) {
    rank_controller.listar_media_quiz_por_elo(req, res);
});

router.get("/listar_top_quiz", function (req, res) {
    rank_controller.listar_top_quiz(req, res);
});

router.get("/listar_top_matchups", function (req, res) {
    rank_controller.listar_top_matchups(req, res);
});

// Permite que o app.js importe este agrupamento de rotas GET.
module.exports = router;
