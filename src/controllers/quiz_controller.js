// O model executa as instruções SQL usando a conexão já existente.
var quiz_model = require("../models/quiz_model");

function cadastrar_tentativa(req, res) {
    // Converte o ID e aceita somente números inteiros positivos para o usuário.
    var usuario_id = Number(req.body.usuario_id);
    var pontuacao = req.body.pontuacao;

    if (!Number.isInteger(usuario_id) || usuario_id <= 0) {
        res.status(400).send("Informe um usuário válido.");
        return;
    }

    // Zero é uma pontuação válida; valores ausentes, fracionados ou fora do limite não são.
    if (!Number.isInteger(pontuacao) || pontuacao < 0 || pontuacao > 15) {
        res.status(400).send("Informe uma pontuação inteira entre 0 e 15.");
        return;
    }

    // then confirma o INSERT; catch responde se o banco não conseguir salvar.
    quiz_model.cadastrar_tentativa(usuario_id, pontuacao).then(function (resultado) {
        res.status(201).json({ id: resultado.insertId, pontuacao: pontuacao });
    }).catch(function (erro) {
        console.log("Erro ao salvar a tentativa do quiz:", erro.sqlMessage);
        res.status(500).send("Não foi possível salvar sua tentativa.");
    });
}

function consultar_recorde(req, res) {
    // req.query lê o parâmetro usuario_id enviado na URL da Home.
    var usuario_id = Number(req.query.usuario_id);

    if (!Number.isInteger(usuario_id) || usuario_id <= 0) {
        res.status(400).send("Informe um usuário válido.");
        return;
    }

    // Devolve o recorde em JSON somente depois que a consulta termina.
    quiz_model.consultar_recorde(usuario_id).then(function (resultado) {
        res.status(200).json(resultado[0]);
    }).catch(function (erro) {
        console.log("Erro ao consultar o recorde do quiz:", erro.sqlMessage);
        res.status(500).send("Não foi possível consultar seu recorde.");
    });
}

// Exporta as funções para que o arquivo de rotas possa chamá-las.
module.exports = {
    cadastrar_tentativa,
    consultar_recorde
};
