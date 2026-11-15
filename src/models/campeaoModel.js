var database = require("../database/config")

function listar() {
    var instrucao = `
        SELECT * FROM campeao;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrar(id_usuario, id_campeao) {
    var instrucao = `
        INSERT INTO curtida_campeao (id_usuario, id_campeao) VALUES (${id_usuario}, ${id_campeao});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrar,
    listar
};