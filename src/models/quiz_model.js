// Reaproveita a configuração de conexão com o MySQL do projeto.
var database = require("../database/config");

function cadastrar_tentativa(usuario_id, pontuacao) {
    
    var instrucao = `
        INSERT INTO tentativa_quiz (usuario_id, pontuacao)
        VALUES (${usuario_id}, ${pontuacao});
    `;
    return database.executar(instrucao);
}

function consultar_recorde(usuario_id) {

    var instrucao = `
        SELECT MAX(pontuacao) AS pontuacao
        FROM tentativa_quiz
        WHERE usuario_id = ${usuario_id};
    `;
    return database.executar(instrucao);
}

module.exports = {
    cadastrar_tentativa,
    consultar_recorde
};
