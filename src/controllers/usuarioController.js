var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha).then(
            function (resultadoAutenticar) {
                console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                if (resultadoAutenticar.length == 1) {
                    // Envia os dados do usuário, incluindo o rank, para o login.
                    res.json({
                        id: resultadoAutenticar[0].id,
                        email: resultadoAutenticar[0].email,
                        nome: resultadoAutenticar[0].nome,
                        lol_rank: resultadoAutenticar[0].lol_rank
                    });
                } else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } else {
                    res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                }
            })
            .catch(function (erro) {
                console.log(erro);
                res.status(500).json(erro.sqlMessage);
            });
    }
}



function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function atualizar_rank(req, res) {
    // Lê os dados enviados pela Home no corpo da requisição.
    var id_usuario = Number(req.body.id_usuario);
    var rank_usuario = req.body.rank_usuario;

    // Verifica se os campos necessários foram informados.
    if (!id_usuario || !rank_usuario) {
        res.status(400).send("Informe o usuário e o rank.");
        return;
    }

    // Aceita somente os ranks presentes no select e na tabela usuario.
    var ranks_permitidos = ["Unranked", "Ferro", "Bronze", "Prata", "Ouro", "Platina",
        "Esmeralda", "Diamante", "Mestre", "Grão-Mestre", "Challenger"];
    var rank_valido = false;
    for (var i = 0; i < ranks_permitidos.length; i++) {
        if (rank_usuario == ranks_permitidos[i]) {
            rank_valido = true;
        }
    }
    if (!rank_valido) {
        res.status(400).send("Escolha um rank válido.");
        return;
    }

    // Confirma o sucesso depois que o model executar a atualização no banco.
    usuarioModel.atualizar_rank(id_usuario, rank_usuario).then(function (resultado) {
        if (resultado.affectedRows == 0) {
            res.status(404).send("Usuário não encontrado.");
        } else {
            res.status(200).send("Rank atualizado com sucesso.");
        }
    }).catch(function () {
        res.status(500).send("Não foi possível atualizar o rank.");
    });
}

module.exports = {
    autenticar,
    cadastrar,
    atualizar_rank
}
