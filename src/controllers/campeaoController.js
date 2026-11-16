var campeaoModel = require("../models/campeaoModel");

function listar_campeao(req, res) {
    campeaoModel.listar_campeao().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function cadastrar_curtida(req, res) {
    // Number converte os IDs recebidos no corpo da requisição para números.
    var id_usuario = Number(req.body.id_usuario);
    var id_campeao = Number(req.body.id_campeao);

    // Verifica apenas se os dois IDs foram informados.
    if (!id_usuario || !id_campeao) {
        res.status(400).send("Informe o usuário e o campeão.");
        return;
    }

    campeaoModel.cadastrar_curtida(id_usuario, id_campeao).then(function(resposta){
        res.status(200).send("Campeão adicionado aos favoritos");
    }).catch(function(erro){
        // A chave primária impede duplicações; se já existe, a match-up já está curtida.
        if (erro.code == "ER_DUP_ENTRY") {
            res.status(200).send("Campeão já está nos favoritos");
        } else {
            res.status(500).json(erro.sqlMessage);
        }
    })
}

function consultar_curtida(req, res) {
    // query lê os valores enviados depois do ? na URL da consulta.
    var id_usuario = Number(req.query.id_usuario);
    var id_campeao = Number(req.query.id_campeao);

    // Verifica apenas se os dois IDs foram informados.
    if (!id_usuario || !id_campeao) {
        res.status(400).send("Informe o usuário e o campeão.");
        return;
    }

    // Devolve a lista em JSON: vazia se não existe curtida, ou com o registro encontrado.
    campeaoModel.consultar_curtida(id_usuario, id_campeao).then(function(resultado){
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function remover_curtida(req, res) {
    // body lê os dois IDs enviados em JSON pela requisição DELETE.
    var id_usuario = Number(req.body.id_usuario);
    var id_campeao = Number(req.body.id_campeao);

    // Verifica apenas se os dois IDs foram informados.
    if (!id_usuario || !id_campeao) {
        res.status(400).send("Informe o usuário e o campeão.");
        return;
    }

    // Confirma a remoção após o banco executar o DELETE; se já não existe, continua removida.
    campeaoModel.remover_curtida(id_usuario, id_campeao).then(function(resposta){
        res.status(200).send("Campeão removido dos favoritos");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function listar_curtidas(req, res) {
    // Lê o ID enviado depois do ? na URL e transforma seu valor em número.
    var id_usuario = Number(req.query.id_usuario);

    // Verifica apenas se o ID do usuário foi informado  NOT e NaN são interpretados como FALSE.
    if (!id_usuario) {
        res.status(400).send("Informe o usuário.");
        return;
    }

    // Devolve os IDs dos campeões curtidos em JSON, seguindo o padrão de listar_campeao.
    campeaoModel.listar_curtidas(id_usuario).then(function(resultado){
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    listar_campeao,
    cadastrar_curtida,
    consultar_curtida,
    remover_curtida,
    listar_curtidas
}
