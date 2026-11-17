// Importa o model responsável pelos SELECTs da dashboard.
var rank_model = require("../models/rank_model");

function listar_jogadores_por_elo(req, res) {

    rank_model.listar_jogadores_por_elo().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar jogadores por elo:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar os jogadores por elo.");
    });
}

function consultar_media_quiz(req, res) {

    rank_model.consultar_media_quiz().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar a média do quiz:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar a média do quiz.");
    });
}

function consultar_tentativas_quiz(req, res) {

    rank_model.consultar_tentativas_quiz().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar as tentativas do quiz:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar as tentativas do quiz.");
    });
}

function listar_media_quiz_por_elo(req, res) {

    rank_model.listar_media_quiz_por_elo().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar a média do quiz por elo:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar a média do quiz por elo.");
    });
}

function listar_top_quiz(req, res) {

    rank_model.listar_top_quiz().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar o top 3 do quiz:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar o top 3 do quiz.");
    });
}

function listar_top_matchups(req, res) {

    rank_model.listar_top_matchups().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        console.log("Erro ao consultar as match-ups favoritadas:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar as match-ups favoritadas.");
    });
}

// Disponibiliza as funções para o arquivo de rotas.
module.exports = {
    listar_jogadores_por_elo,
    consultar_media_quiz,
    consultar_tentativas_quiz,
    listar_media_quiz_por_elo,
    listar_top_quiz,
    listar_top_matchups
};
