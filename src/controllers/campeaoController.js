var campeaoModel = require("../models/campeaoModel");

function listar(req, res) {
    campeaoModel.listar().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function cadastrar(req, res) {
    var id_usuario = req.body.id_usuario;
    var id_campeao = req.body.id_campeao;

    if (id_usuario == undefined || id_campeao == undefined) {
        res.status(400).send("id_usuario ou id_campeao está undefined!");
    }

    campeaoModel.cadastrar(id_usuario, id_campeao).then(function(resposta){
        res.status(200).send("Campeão adicionado aos favoritos");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    listar,
    cadastrar
}