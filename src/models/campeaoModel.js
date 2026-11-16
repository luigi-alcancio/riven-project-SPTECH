var database = require("../database/config")

function listar_campeao() {
    var instrucao = `
        SELECT * FROM campeao;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrar_curtida(id_usuario, id_campeao) {
    // Usa os nomes das colunas definidos na tabela curtida_campeao.
    var instrucao = `
        INSERT INTO curtida_campeao (usuario_id, campeao_id) VALUES (${id_usuario}, ${id_campeao});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function consultar_curtida(id_usuario, id_campeao) {
    // Busca somente o relacionamento deste usuário com este campeão.
    var instrucao = `
        SELECT usuario_id, campeao_id FROM curtida_campeao
        WHERE usuario_id = ${id_usuario} AND campeao_id = ${id_campeao};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function remover_curtida(id_usuario, id_campeao) {
    // Os dois filtros preservam as curtidas de outros usuários e de outros campeões.
    var instrucao = `
        DELETE FROM curtida_campeao
        WHERE usuario_id = ${id_usuario} AND campeao_id = ${id_campeao};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrar_curtida,
    listar_campeao,
    consultar_curtida,
    remover_curtida
};
