// Reaproveita a configuração de conexão com o MySQL do projeto.
var database = require("../database/config");

function listar_jogadores_por_elo() {

    var instrucao = `
        SELECT lol_rank elo, COUNT(*) quantidade_cadastrado
        FROM usuario
        GROUP BY lol_rank;
    `;
    return database.executar(instrucao);
}

function consultar_media_quiz() {

    var instrucao = `
        SELECT ROUND(AVG(pontuacao), 1) pontuacao_media
        FROM tentativa_quiz;
    `;
    return database.executar(instrucao);
}

function consultar_tentativas_quiz() {

    var instrucao = `
        SELECT COUNT(*) tentativas
        FROM tentativa_quiz;
    `;
    return database.executar(instrucao);
}

function listar_media_quiz_por_elo() {

    var instrucao = `
        SELECT u.lol_rank elo, ROUND(AVG(t.pontuacao), 1) pontuacao_media
        FROM tentativa_quiz t
        JOIN usuario u ON u.id = t.usuario_id
        GROUP BY u.lol_rank;
    `;
    return database.executar(instrucao);
}

function listar_top_quiz() {

    var instrucao = `
        SELECT u.nome, MAX(t.pontuacao) pontuacao
        FROM tentativa_quiz t
        JOIN usuario u ON u.id = t.usuario_id
        GROUP BY u.nome
        ORDER BY pontuacao DESC
        LIMIT 3;
    `;
    return database.executar(instrucao);
}

function listar_top_matchups() {

    var instrucao = `
        SELECT campeao.nome, COUNT(*) quantidade_curtida
        FROM curtida_campeao curtida
        JOIN campeao ON curtida.campeao_id = campeao.id
        GROUP BY campeao.nome
        ORDER BY quantidade_curtida DESC
        LIMIT 3;
    `;
    return database.executar(instrucao);
}


module.exports = {
    listar_jogadores_por_elo,
    consultar_media_quiz,
    consultar_tentativas_quiz,
    listar_media_quiz_por_elo,
    listar_top_quiz,
    listar_top_matchups
};
