/* Tabelas necessárias para o funcionamento do projeto */

CREATE DATABASE IF NOT EXISTS rivenproject;
USE rivenproject;

CREATE USER IF NOT EXISTS 'user_riven_project'@'%' IDENTIFIED BY 'urubu100';
GRANT ALL PRIVILEGES ON rivenproject.* TO 'user_riven_project'@'%';
FLUSH PRIVILEGES;

CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  lol_rank VARCHAR(20) NOT NULL DEFAULT 'Unranked',
  CONSTRAINT chk_usuario_lol_rank CHECK (lol_rank IN (
    'Unranked', 'Ferro', 'Bronze', 'Prata', 'Ouro', 'Platina',
    'Esmeralda', 'Diamante', 'Mestre', 'Grão-Mestre', 'Challenger'
  ))
);

CREATE TABLE campeao (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL UNIQUE,
  descricao VARCHAR(45) NOT NULL,
  tipo VARCHAR(10) NOT NULL,
  dificuldade VARCHAR(10) NOT NULL,
  backGroundIMG VARCHAR(255) NOT NULL,
  loadingScreenIMG VARCHAR(255) NOT NULL,
  dica_geral_1 VARCHAR(255) NOT NULL,
  dica_geral_2 VARCHAR(255) NOT NULL,
  dica_geral_3 VARCHAR(255) NOT NULL,
  dica_nivel_1_5 VARCHAR(400) NOT NULL,
  dica_nivel_6_11 VARCHAR(400) NOT NULL,
  dica_nivel_12_max VARCHAR(400) NOT NULL,
  dica_ouro VARCHAR(100) NOT NULL,
  CONSTRAINT chk_campeao_dificuldade CHECK (dificuldade IN ('Fácil', 'Média', 'Difícil')),
  CONSTRAINT chk_campeao_tipo CHECK (tipo IN ('Lutador', 'Tanque', 'Mago'))
);

CREATE TABLE tentativa_quiz (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  pontuacao INT NOT NULL,
  data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_tentativa_pontuacao CHECK (pontuacao BETWEEN 0 AND 15),
  CONSTRAINT fk_tentativa_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
);

CREATE TABLE curtida_campeao (
  usuario_id INT NOT NULL,
  campeao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, campeao_id),
  CONSTRAINT fk_curtida_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario(id),
  CONSTRAINT fk_curtida_campeao FOREIGN KEY (campeao_id)
    REFERENCES campeao(id)
);

INSERT INTO campeao (nome, descricao, tipo, dificuldade, backGroundIMG, loadingScreenIMG, dica_geral_1, dica_geral_2, dica_geral_3, dica_nivel_1_5, dica_nivel_6_11, dica_nivel_12_max, dica_ouro) VALUES
('Aatrox', 'a Espada Darkin', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Aatrox_0.jpg', 'Use seu Q e E reativamente, para desviar e dar dano ao mesmo tempo', 'Quanto mais você encurtar, melhor! aatrox é fragil se chegar nele andando', 'Guarde seu E para desviar do 3Q dele, assim negando mais parte do dano', 'Vá para moita nivel 1, e stack seu Q no tempo que a wave chegar, use seu 3 Q para tirar o osso revestido e jogue com pressao na wave. Todas as trocas que você encurtar, você vence', 'A partir do nível 6, qualquer gap você consegue dar 100-0, enxergue oportunidade de encurtar ou com ignite, ou com flash, principalmente se ele estiver com osso revestido em CD, todo all win você vence.', 'A partir desse ponto, você é mais forte na side e nas fights se tiver um pouco de vantagem, ele precisa coinflipar, tente sempre dar match onde ele estiver. Caso ele jogue side, puxe e dive ou puxe e rota para o mid.', 'Deixe SEMPRE imperceptível se você irá usar o Q para entrar nele e dar dano ou sair.'),
('Akali', 'a Assassina Renegada', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Akali_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Akali_0.jpg', 'Ela depende de energia: troque nos níveis 1 e 2 e force ela a gastar tudo, depois ela fica sem pressão na rota.', 'Guarde o W (stun) para quando ela entrar em você com o E ou o R, o stun pega ela no meio do combo.', 'Não persiga ela quando ela usar o W (fumaça): você perde habilidade e vida e ela escapa.', 'No nível 1 você tem mais dano: entre com Q e auto e saia antes do combo dela. Se ela gastar tudo em você, use o E só para segurar o dano e empurre a wave.', 'Com o R dela pronto, não fique com a vida baixa perto dela. Se ela usar o R para entrar, use W e E e tente matar antes de ela voltar com o segundo R.', 'Nas fights, procure o carry de longe e guarde o E para quando ela pular em você. Se ela estiver farmada, evite duelo reto e jogue o mapa.', 'Compre resistência mágica cedo se ela ganhar a rota: o burst dela é quase todo mágico.'),
('Ambessa', 'Matriarca da Guerra', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ambessa_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ambessa_0.jpg', 'A Ambessa usa as habilidades para avançar, então jogue reativo: espere ela vir e responda com o W (stun) no momento do avanço.', 'Ela tem muito dano em sequência: troque curto, encurte o combo dela e saia antes de ela terminar.', 'Segure o E para o combo dela, não para fugir à toa: o escudo é o que faz você ganhar a troca.', 'Jogue com a wave perto de você e troque quando ela gastar o avanço. Se ela errar o primeiro golpe, entre com Q, W e auto, que é o seu melhor momento.', 'Com o R, você mata ela se ela estiver com pouca vida. Se ela tiver o R dela, não deixe ela te prender no meio da wave sem o E.', 'Evite duelos longos: ela escala bem com itens. Procure pegar ela sozinha e use o R com o segundo corte para finalizar.', 'Armadura e vida ajudam a aguentar o combo dela; priorize antes do dano extra.'),
('Camille', 'a Sombra de Aço', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Camille_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Camille_0.jpg', 'Fuja de paredes quando o E dela estiver pronto: ela se puxa até você e prende, e aí você perde o duelo.', 'Camille ganha escudo no ataque básico, então prefira trocar com habilidades e use o auto só no meio do combo.', 'Use o W (stun) logo depois que ela usar o E ou o Q: ela fica sem mobilidade e você ganha a troca.', 'Você ganha nos primeiros níveis: entre com Q e auto, use o W e saia antes do segundo Q dela, que causa dano verdadeiro.', 'Cuidado com o R dela: ela te prende numa área e você não consegue fugir. Se ela estiver com o R pronto, evite duelar com a vida baixa.', 'Ela é forte em pick isolado, então fique perto do time. Se ela gastar o R em outro, entre e mate o carry dela.', 'Compre vida e armadura, a Camille perde força contra quem não morre rápido.'),
('Cho''Gath', 'o Terror do Vazio', 'Tanque', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Chogath_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Chogath_0.jpg', 'O Cho Gath é fraco no começo: fique na frente dele e pressione desde o nível 1, antes de ele ter vida e farm.', 'Desvie do Q dele (demora para estourar) com o E ou saindo do círculo, e punir quando ele errar.', 'O W dele silencia: não entre na frente dele para ser silenciado quando for usar o combo.', 'Troque o tempo todo: ele tem pouca mobilidade e você vence todas as trocas curtas. Empurre a wave e leve ele para a torre.', 'Cuidado com o R dele: ele executa com dano verdadeiro. Não fique com a vida baixa perto dele e use o E para fugir do Q.', 'Se ele estiver grande, não entre sozinha. Mate o resto do time dele e deixe ele sem aliados para ele ficar sem proteção.', 'Perfuração de armadura e dano percentual ajudam muito contra ele quando fica com muita vida.'),
('Darius', 'a Mão de Noxus', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Darius_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Darius_0.jpg', 'Fique fora do alcance do E dele: se ele te puxar, o Q fica na borda e ele acumula sangramento rápido.', 'Use o W (stun) quando ele tentar o Q e saia, não fique parada na frente dele.', 'Não deixe ele chegar a 5 acúmulos de sangramento: depois disso o dano e a cura dele aumentam muito.', 'Troque rápido com Q e auto e saia antes de ele acumular. Se ele puxar você, use o E para sair do Q e não ficar presa nele.', 'O R dele executa com dano verdadeiro e reseta se matar alguém. Mantenha a vida alta e não entre na torre se ele estiver com R pronto.', 'Evite lutar na frente dele: fique atrás do time e procure o carry. Ele só vence se conseguir chegar em você.', 'Armadura é essencial contra ele; compre antes para reduzir o dano do sangramento e do Q.'),
('Dr. Mundo', 'o Louco de Zaun', 'Tanque', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/DrMundo_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/DrMundo_0.jpg', 'O Q dele é lento: desvie com o E ou saindo da linha. Se ele errar, entre e troque, porque ele fica sem pressão.', 'O W dele queima você e dá dano a ele: não fique parada ao lado dele quando ele estiver com W ativo.', 'Ele cura muito, então prefira trocas curtas e explosivas, sem alongar a luta.', 'Entre com Q, auto e W e saia: ele tem pouco dano no começo. Se ele acertar o Q, use o E para não perder muita vida.', 'Com o R dele ele cura e fica forte, então não duele quando ele estiver com R ativo. Espere acabar e entre.', 'Evite ficar na frente dele nas fights. Mate o resto do time e deixe ele para o final, quando ele já gastou o R.', 'Perfuração de armadura e corte de cura reduzem muito a sustentação dele.'),
('Fiora', 'a Duelista Magnífica', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Fiora_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Fiora_0.jpg', 'O W dela (aparar) bloqueia o seu stun e o Q3: espere ela usar o W antes de usar suas habilidades de controle.', 'Troque com cuidado: se ela acertar os pontos vitais, ela ganha velocidade e dano. Use o E para desviar do Q dela.', 'Ela vence duelos longos, então encurte: troque curto, use o R se ela estiver com pouca vida e saia.', 'Entre quando o W dela estiver em recarga e use Q e auto. Se ela usar o W, saia sem gastar habilidades e espere o cooldown.', 'Com o R, você pode matar ela se ela já estiver com pouca vida. Não use o W (stun) sem ter certeza de que o dela já foi usado.', 'Nas fights, deixe ela para o final: o duelo contra ela é difícil. Procure o carry dela e use o E para sair do alcance.', 'Compre armadura cedo para reduzir o dano dela, que é todo físico.'),
('Gangplank', 'o Flagelo dos Mares', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gangplank_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Gangplank_0.jpg', 'Fique fora da área dos barris: eles explodem e deixam você lenta. Se ele colocar um barril, não entre ali.', 'Ele usa o W para tirar controle e curar: guarde o stun para depois que ele usar o W.', 'Ele fica muito forte com o tempo, então pressione no começo e tente ganhar vantagem antes de ele ter os barris.', 'Troque o tempo todo: no nível 1 e 2 ele ainda não tem barris. Entre com Q e auto e saia antes de ele montar o combo.', 'Cuidado com o combo de barris e o Q. Se ele tiver barris prontos, não entre. Se ele errar, entre e use o R se ele estiver com pouca vida.', 'Evite lutar perto dos barris dele nas fights. Procure ele de lado, onde ele não consiga montar a explosão.', 'Compre itens que ajudam a escapar do poke e do burst; ele depende de acertar a sequência.'),
('Garen', 'o Poder de Demacia', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Garen_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Garen_0.jpg', 'O Q dele silencia e dá velocidade: ele usa para entrar. Use o W (stun) quando ele vier e saia antes do giro.', 'Fique fora do giro do E dele, que causa muito dano se você ficar parada.', 'Ele regenera fora de combate, então não deixe ele recuperar: mantenha a pressão para ele não ficar com vida cheia.', 'Troque quando o Q dele estiver em recarga, com Q e auto, e saia. Se ele usar o W, não gaste habilidades e espere acabar.', 'O R dele executa quem está com pouca vida. Mantenha a vida alta perto dele e use o R só se for matar.', 'Ele tem pouca mobilidade, então use o E para ficar fora do alcance e procure o carry. Evite ficar na frente dele nas fights.', 'Armadura e perfuração são importantes: ele tem muita vida e dano físico constante.'),
('Gnar', 'o Elo Perdido', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gnar_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Gnar_0.jpg', 'Mate ele enquanto está pequeno: o Mini Gnar tem pouca vida e pouco alcance, e você vence todas as trocas.', 'Fique atenta à barra de fúria: quando estiver cheia, ele vira Mega Gnar e fica muito mais forte. Saia de perto.', 'Desvie do Q dele com o E e punir logo depois: o dano dele só vem se ele acertar a sequência.', 'Seja bem agressiva: entre com Q e auto e use o W (stun). Ele tem pouco dano de perto, então force trocas sem parar.', 'Se ele virar Mega Gnar, saia da rota e espere acabar. O R dele empurra contra paredes e atordoa, então não lute perto de paredes.', 'Evite lutas diretas contra o Mega Gnar. Procure o resto do time e fique longe do R dele nas fights.', 'Compre vida e armadura para sobreviver ao Mega Gnar; o dano dele é grande, mas dura pouco.'),
('Gragas', 'o Badernista', 'Mago', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gragas_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Gragas_0.jpg', 'O Q dele é lento: desvie com o E ou saindo do círculo. Se ele errar, você entra e troca sem perigo.', 'O W dele reduz muito o dano: não troque quando ele estiver com W ativo, espere acabar.', 'O E dele derruba quando acerta: use o W (stun) antes, ou fique fora do alcance quando ele usar.', 'Troque rápido com Q e auto quando o W dele estiver em recarga, e saia antes de ele acertar o E.', 'O R dele empurra e deixa você exposta. Use o E para sair do alcance e não fique perto dele sem o escudo.', 'Procure o carry e deixe ele para o final: ele é tanque e não mata rápido. Evite o R dele nas fights.', 'Perfuração de armadura e vida percentual são ideais contra o tanque dele.'),
('Gwen', 'a Costureira Sagrada', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gwen_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Gwen_0.jpg', 'O W dela cria uma zona que bloqueia habilidades à distância: entre nela e lute de perto, que é o seu jogo.', 'Ela dá mais dano em quem tem mais vida: não deixe ela bater em você quando estiver cheia.', 'Troque curto e use o E para sair antes de ela acumular o Q: o dano dela vem do acúmulo.', 'Use Q e auto e saia antes de ela acertar o Q em você. Se ela usar o W, espere acabar e entre depois.', 'O R dela tem alcance e prende. Fique com o E para esse momento e use o R para finalizar quando ela estiver com pouca vida.', 'Procure o carry dela e evite ficar na frente. Ela perde força se não conseguir acertar o combo completo.', 'Resistência mágica ajuda muito, porque o dano dela é todo mágico.'),
('Heimerdinger', 'o Inventor Reverenciado', 'Mago', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Heimerdinger_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Heimerdinger_0.jpg', 'Destrua as torretas dele rápido: elas dão o dano dele, e ele fica sem pressão quando elas somem.', 'Ele tem pouca mobilidade: use o E para entrar e o W (stun) para prender, que ele não escapa.', 'Cuidado com o E dele (granada): ela atordoa, então não fique em linha quando ele tentar acertar.', 'Seja agressiva e mate as torretas com auto e Q. Se ele colocar uma torreta, entre e ataque ele, não a torreta.', 'Se ele usar o R e melhorar as torretas, não entre na área delas. Espere acabar e depois pressione de novo.', 'Nas fights, procure ele de lado: sem torretas e sem E, ele morre rápido. Evite lutar dentro da área das torretas.', 'Compre vida e itens para aguentar o poke; ele só vence se você ficar parada nas torretas.'),
('Illaoi', 'a Sacerdotisa do Kraken', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Illaoi_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Illaoi_0.jpg', 'Fique longe dos tentáculos dela: eles causam dano, curam ela e deixam você lenta. Troque longe deles.', 'Desvie do E dela, que tira o espírito do alvo: se ela acertar, o Q e o W dela ficam muito mais fortes.', 'Não entre na área do R dela: os tentáculos extras atrapalham. Espere acabar para entrar.', 'Seja agressiva no começo: ela tem pouca mobilidade. Entre com Q e auto e saia antes dos tentáculos ficarem perto.', 'Se ela acertar o E, saia dali: o duelo fica difícil. Use o E para escapar da área do R e não ficar presa.', 'Evite lutar perto dos tentáculos dela. Procure ela longe e use o R para finalizar quando ela estiver com pouca vida.', 'Armadura e vida ajudam a aguentar os tentáculos; priorize antes de dano extra.'),
('Irelia', 'a Dançarina das Lâminas', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Irelia_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Irelia_0.jpg', 'Ela depende de minions e alvos para chegar em você: afaste ela deles e force o Q a ficar sem reset.', 'O W dela reduz muito o dano: não gaste combo enquanto ele estiver ativo, espere acabar.', 'O E dela atordoa quando as duas lâminas acertam: não fique em linha entre elas e use o E para sair.', 'Troque quando ela não tiver minions por perto, com Q e auto. Se ela usar o Q para entrar, use o W (stun) e vença a troca.', 'O duelo é parelho: use o R quando ela estiver com pouca vida e guarde o E para o E dela.', 'Ela é forte nas lutas em equipe com o R e as paredes. Evite ficar entre as lâminas e procure o carry.', 'Compre armadura e vida para aguentar o combo dela; ela perde força sem acertar o E.'),
('Jax', 'o Mestre das Armas', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jax_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Jax_0.jpg', 'O E do Jax esquiva dos ataques básicos: não gaste auto durante o E dele, use habilidades.', 'Use o W (stun) depois que o E dele terminar, não antes, senão você gasta o stun à toa.', 'Ele escala muito bem, então pressione no começo e mate antes de ele ter itens.', 'Troque com Q e auto quando o E dele estiver em recarga e saia antes de ele atordoar. Todas as trocas curtas são suas.', 'Com o R dele ativo ele fica mais resistente: espere acabar. Se ele pular com o Q em você, use o E e o W para responder.', 'Evite duelo longo: ele vence no tardio. Fique com o time, procure o carry e fuja de lutas em que ele chegue com o E pronto.', 'Compre armadura cedo: o dano dele é físico e constante, e a armadura reduz bastante.'),
('Jayce', 'o Defensor do Amanhã', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jayce_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Jayce_0.jpg', 'O Jayce vence de longe com o canhão: encurte logo, use o E e entre com Q e W para ele não ficar trocando poke.', 'Cuidado com o martelo: o E dele empurra você e abre espaço para o combo. Fique atenta quando ele mudar de forma.', 'Desvie do Q do canhão com o E e punir logo depois, porque ele fica sem mana e sem pressão.', 'Não fique de longe levando poke: entre com Q e auto e use o W (stun). Se ele colocar o portal, saia da linha do Q.', 'Com o R dele em recarga, ele fica fraco. Entre quando ele gastar o Q e troque curto, sem esperar ele recuperar a mana.', 'Nas fights, evite ficar na linha do canhão e procure ele de lado. Ele morre rápido se você chegar nele.', 'Vida e armadura ajudam a aguentar o poke; priorize antes de dano extra.'),
('K''Sante', 'o Orgulho de Nazumah', 'Tanque', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/KSante_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/KSante_0.jpg', 'O K Sante é muito tanque no começo e ganha dano quando perde defesa: não force trocas longas contra ele.', 'Fique longe de paredes: o R dele joga você contra a parede e atordoa, e aí você perde a troca.', 'O Q dele puxa quando carrega no terceiro golpe: desvie com o E e punir depois.', 'Troque só quando o Q dele estiver em recarga e saia. Ele tem recargas longas no começo, então aproveite esses momentos.', 'Cuidado com o R dele perto de parede. Se ele estiver com o R, fique no meio da rota e use o E para escapar do empurrão.', 'Evite o K Sante tanque: procure o carry dele e deixe ele para o final. Se ele ficar com dano, ele te mata rápido.', 'Perfuração de armadura e dano percentual ajudam contra a vida alta dele.'),
('Kayle', 'a Justa', 'Lutador', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kayle_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Kayle_0.jpg', 'A Kayle é fraca no começo: pressione nos níveis 1 a 5 e mate ela antes de ela escalar e virar uma ameaça.', 'O R dela deixa o alvo imune por pouco tempo: espere acabar para entrar, não gaste combo no vazio.', 'Ela precisa de nível para ficar forte (6, 11 e 16): quanto mais cedo você acabar o jogo, melhor.', 'Seja bem agressiva: entre com Q e auto e use o W (stun). Ela não tem como trocar contigo no começo.', 'Continue pressionando e destrua torres antes do nível 11. Se ela usar o R, saia até acabar e entre depois.', 'Se o jogo passar do nível 16, evite duelo reto: ela tem muito alcance e dano. Procure ela sozinha e use o R para finalizar.', 'Perfuração e dano ajudam a matar ela antes de ela escalar com os itens.'),
('Kennen', 'o Coração da Tempestade', 'Mago', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kennen_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Kennen_0.jpg', 'O Kennen troca de longe com o Q: encurte e use o E para bloquear o dano do shuriken enquanto entra.', 'A passiva dele atordoa quando acumula marcas: não fique tomando poke de longe, entre e use o W (stun) primeiro.', 'Ele tem pouca vida: se você chegar nele, mate rápido antes de ele usar o E para fugir.', 'Entre quando o Q dele estiver em recarga e use Q e W. Troque curto e saia antes de ele acumular as marcas.', 'Cuidado com o R dele (dano em área): se ele usar em você, saia da área. Use o E para escapar e depois volte.', 'Nas fights, procure ele de lado e guarde o E para o R dele. Ele é muito perigoso se estiver livre.', 'Resistência mágica e vida ajudam a aguentar o poke dele; priorize antes do dano.'),
('Kled', 'o Cavaleiro Intratável', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kled_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Kled_0.jpg', 'Quando o Kled desmonta do Skaarl, ele fica bem mais fraco: aproveite para entrar e trocar nessa hora.', 'Desvie do Q dele (gancho) com o E: se ele acertar, ele te puxa e você perde a troca.', 'Ele fica forte com a coragem cheia, então não lute quando ele estiver montado e com a vida alta.', 'Espere ele gastar o Q e entre com Q e auto e W. Se ele estiver desmontado, pressione sem dó.', 'Cuidado com o R dele: ele acelera e entra de longe. Use o E para sair do caminho e puna quando ele chegar.', 'Evite lutar quando ele estiver montado e com o time. Procure o carry e deixe ele para o final.', 'Armadura e vida ajudam a aguentar o dano dele quando ele está montado.'),
('Malphite', 'o Fragmento do Monolito', 'Tanque', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Malphite_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Malphite_0.jpg', 'O Malphite ganha escudo e armadura: não troque quando o escudo dele estiver ativo, espere ele cair.', 'O Q dele reduz sua velocidade, então use o E para sair e não ficar presa na troca.', 'Guarde o E para o R dele: o knockup no meio da luta é o que decide o jogo.', 'Troque nos níveis 1 e 2, quando ele ainda não tem armadura, com Q e auto e W. Depois disso evite trocas longas.', 'Com o R dele pronto, não entre sozinha. Se ele usar o R, use o E para escapar do impacto e depois volte.', 'Nas fights, evite ficar perto dele e procure o carry. Se ele chegar em você com o R, você perde.', 'Perfuração de armadura é essencial contra ele; sem isso você quase não dá dano.'),
('Mordekaiser', 'o Revenã de Ferro', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Mordekaiser_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Mordekaiser_0.jpg', 'Fique fora do alcance do E do Mordekaiser: se ele puxar você, ele ganha a troca e o escudo do W.', 'Use o E para desviar do Q dele e use o W (stun) quando ele tentar o combo.', 'O R dele leva você para outro plano: evite ficar com a vida baixa perto dele quando ele tiver R.', 'Ele é mais fraco no começo: entre com Q e auto, use o W e saia antes do combo dele. Todas as trocas curtas são suas.', 'Cuidado com o R: se ele pegar você, é um duelo contra o seu próprio dano. Se ele usar o R em outra pessoa, entre para ajudar.', 'Fique longe dele nas fights e procure o carry. Ele precisa chegar em você para dar dano.', 'Resistência mágica ajuda muito: o dano dele é quase todo mágico.'),
('Nasus', 'o Curador das Areias', 'Tanque', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Nasus_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Nasus_0.jpg', 'O Nasus fica muito forte com o tempo: pressione no começo e mate antes de ele acumular o Q.', 'O W dele reduz sua velocidade de ataque e de movimento: use o stun antes ou fique longe quando ele tentar.', 'Atrapalhe o farm dele: sem os stacks do Q, ele fica fraco e inofensivo.', 'Seja bem agressiva: entre com Q e auto e use o W. Ele não tem como fugir de você no começo.', 'Cuidado com o R dele: ele fica enorme e resistente. Se ele estiver com o R, fique longe e espere acabar.', 'Se ele estiver com muitos stacks, evite duelo reto: fique com o time e mate os outros do time dele.', 'Perfuração de armadura e velocidade de ataque ajudam a matar antes de ele escalar.'),
('Olaf', 'o Berserker', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Olaf_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Olaf_0.jpg', 'Desvie dos machados do Q do Olaf com o E: se ele errar, ele fica sem pressão na rota.', 'O R dele tira os controles, então o seu W (stun) não funciona quando ele estiver com R ativo.', 'O E dele dá dano verdadeiro e ele fica forte com pouca vida: não deixe ele chegar perto.', 'Troque quando ele gastar o Q e entre com Q e auto e W. Se ele errar, empurre a wave e leve ele para a torre.', 'Com o R dele ativo, não entre no duelo: espere acabar. Se ele estiver sem o R, você ganha a troca.', 'Nas fights, procure o carry e deixe ele para o final. Ele cura bastante, então evite lutar muito tempo.', 'Armadura e vida ajudam contra o dano físico e o dano verdadeiro dele.'),
('Ornn', 'o Fogo sob a Montanha', 'Tanque', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ornn_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ornn_0.jpg', 'Fique longe de paredes quando o E do Ornn estiver pronto: se ele acertar na parede, você é atordoada.', 'O W dele causa dano em área e deixa você mais fraca: desvie e não fique parada na frente.', 'Ele tem pouco dano no começo: aproveite os níveis 1 a 5 para ganhar vantagem.', 'Entre com Q e auto e W, e saia. Se ele usar o E perto da parede, tome cuidado e use o seu E para sair.', 'Cuidado com o R dele: o carneiro atordoa se acertar duas vezes. Fique atenta e use o E para sair do caminho.', 'Nas fights, procure o carry e fique longe da frente. Ele é um tanque, então deixe ele para o final.', 'Perfuração de armadura e dano percentual ajudam muito contra a vida alta dele.'),
('Pantheon', 'a Lança Inquebrável', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Pantheon_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Pantheon_0.jpg', 'O Pantheon é forte no começo: respeite o dano dele nos primeiros níveis e não troque sem o seu E.', 'O W dele atordoa: use o E para sair do alcance e punir quando ele errar.', 'O E dele bloqueia o dano da frente: use habilidades pelas costas ou espere acabar.', 'Troque quando ele gastar o W e entre com Q e auto. Se ele estiver com o E ativo, espere acabar para entrar.', 'Com o R dele ele pula no mapa. Fique atenta ao mini-mapa e não fique com a vida baixa perto dele.', 'Evite lutas diretas com ele quando estiver forte. Procure o carry e use o E para escapar do W dele.', 'Armadura e vida ajudam a aguentar o burst dele no começo.'),
('Poppy', 'a Guardiã do Martelo', 'Tanque', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Poppy_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Poppy_0.jpg', 'O W da Poppy bloqueia os seus dashes: não use o E nem o Q para entrar quando o W dela estiver pronto.', 'Fique longe de paredes: o E dela te empurra e atordoa, e aí você perde a troca.', 'Espere ela gastar o W antes de entrar: nesse momento ela fica sem defesa e você ganha a troca.', 'Troque só quando o W dela estiver em recarga. Se ela usar o E longe de parede, é a hora de entrar.', 'Cuidado com o R dela: ela te empurra para longe do time. Fique atenta e evite ficar sozinha.', 'Evite ficar perto de paredes nas fights e procure o carry. Ela é difícil de matar, então foque nos outros.', 'Armadura e vida ajudam a aguentar o dano dela; compre antes de dano extra.'),
('Quinn', 'as Asas de Demacia', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Quinn_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Quinn_0.jpg', 'O Q da Quinn cega: use habilidades em vez de auto quando ela te cegar e não gaste combo à toa.', 'O E dela empurra você: fique atenta ao alcance e use o seu E para voltar e entrar de novo.', 'Ela é forte no começo de longe, então encurte logo e use o W (stun) para ela não fugir.', 'Entre quando o Q dela estiver em recarga, com Q e auto. Se ela usar o E, fique atenta e use o seu E para sair.', 'Cuidado com o R dela: ela fica rápida e some do mapa. Fique atenta ao mini-mapa e não persiga ela à toa.', 'Procure ela nas fights e mate rápido: ela tem pouca vida. Evite ficar perseguindo ela e perder o time.', 'Vida e armadura ajudam a aguentar o poke dela; priorize antes de dano extra.'),
('Renekton', 'o Carniceiro das Areias', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Renekton_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Renekton_0.jpg', 'O Renekton é muito forte no começo: respeite o dano dele quando ele estiver com a fúria cheia.', 'O W dele atordoa quando está fortalecido: use o seu E para sair do alcance e o W (stun) para responder.', 'Ele fica sem fúria depois de usar habilidades: aproveite essa hora para entrar e trocar.', 'Evite trocar quando ele estiver com a fúria cheia e entre só depois que ele gastar o E ou o W.', 'Com o R dele ele fica mais forte e dá dano em área. Espere acabar e entre depois, sem gastar o E à toa.', 'Nas fights, procure o carry e deixe ele para o final. Ele perde força no tardio, então não duele cedo demais.', 'Armadura e vida ajudam a aguentar o dano dele no começo.'),
('Rumble', 'a Ameaça Mecânica', 'Mago', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Rumble_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Rumble_0.jpg', 'O Rumble precisa gerenciar o calor: quando ele superaquece fica silenciado por uns segundos, é a hora de entrar.', 'Fique fora da zona do R dele: o dano em área é alto e te impede de entrar na luta.', 'Ele tem pouca vida: use o E para entrar, o W (stun) e mate rápido antes de ele usar o escudo.', 'Seja agressiva: entre com Q e auto e saia antes de ele acertar o E (arpão). Troque quando ele gastar o escudo do W.', 'Se ele estiver com o R pronto, não entre na área. Espere ele gastar e depois pressione com Q, W e auto.', 'Nas fights, evite ficar na zona do R e procure ele de lado. Ele morre rápido se você chegar nele.', 'Resistência mágica e vida ajudam a aguentar o dano em área dele.'),
('Sett', 'o Chefão', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Sett_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Sett_0.jpg', 'O Sett guarda dano na passiva e usa no W: não fique batendo nele à toa antes de ele usar, senão ele devolve em dano.', 'O E dele puxa e atordoa: fique fora do alcance ou use o seu E para sair antes do stun.', 'O R dele te pega e joga no chão: guarde o E para esse momento e não entre sozinha quando ele estiver com R.', 'Troque rápido com Q e auto e saia antes de ele acertar o W. Se ele usar o W, espere acabar para entrar de novo.', 'Com o R dele pronto, fique atenta ao mini-mapa e não ande sozinha. Se ele usar o R em outra pessoa, entre para ajudar.', 'Procure o carry e deixe ele para o final: ele tem muita vida. Evite ficar na frente dele nas fights.', 'Armadura e perfuração são importantes; ele tem vida alta e dano físico constante.'),
('Shen', 'o Olho do Crepúsculo', 'Tanque', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Shen_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Shen_0.jpg', 'O W do Shen bloqueia os ataques básicos: use habilidades enquanto ele estiver ativo e espere acabar para usar auto.', 'O E dele provoca e te obriga a atacar: não deixe ele acertar quando estiver sem o seu E.', 'Ele é tanque, então evite trocas longas e foque em trocas curtas e explosivas.', 'Troque rápido com Q e W e saia antes do E dele. Se ele usar o W, espere acabar e entre depois.', 'Cuidado com o R dele: ele ajuda o time inteiro em qualquer lugar do mapa. Fique atenta e não fique sozinha na lane.', 'Procure o carry e deixe ele para o final. Se ele provocar você no meio da luta, use o E para sair do alcance.', 'Perfuração de armadura e dano percentual ajudam muito contra a vida alta dele.'),
('Singed', 'o Químico Louco', 'Tanque', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Singed_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Singed_0.jpg', 'Não siga o Singed de perto: o rastro de veneno dele causa muito dano e ele quer exatamente que você persiga.', 'Ele usa o E para te jogar longe: fique fora do alcance quando ele estiver com o E pronto.', 'Ele tem pouco dano direto, então não precisa ter pressa: trocas curtas e boas bastam.', 'Troque só quando ele gastar o E e saia antes do veneno. Não entre na nuvem de gás, empurre a wave e espere.', 'Evite perseguir ele: se ele fugir, volte para a rota. Use o E só para sair do veneno ou do arremesso.', 'Evite ficar presa na nuvem de veneno dele nas fights. Procure o carry e deixe o Singed para o final.', 'Vida e resistência mágica ajudam a aguentar o veneno dele quando você precisa passar por ele.'),
('Sion', 'o Colosso Morto-Vivo', 'Tanque', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Sion_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Sion_0.jpg', 'O Q do Sion demora para carregar: desvie com o E ou saia da área quando ele começar a carregar.', 'Ele fica forte com a vida acumulada, então pressione no começo antes de ele ter itens.', 'Quando ele morre, a passiva dele faz ele voltar zumbi por alguns segundos: fique longe até acabar.', 'Seja agressiva: entre com Q e auto e use o W (stun). Ele tem pouca mobilidade e perde todas as trocas curtas.', 'Cuidado com o R dele: ele corre em linha reta e atordoa. Use o E para sair do caminho e fique atenta.', 'Evite ficar na frente dele nas fights. Procure o carry e deixe ele para o final.', 'Perfuração de armadura e dano percentual ajudam muito contra a vida alta dele.'),
('Tahm Kench', 'o Rei do Rio', 'Tanque', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/TahmKench_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/TahmKench_0.jpg', 'O Q do Tahm Kench reduz sua velocidade e acumula marcas: com três acertos ele te atordoa, então não deixe acertar.', 'Cuidado com o W dele: ele engole aliados e inimigos. Se ele tentar te engolir, use o E para sair.', 'Ele é muito tanque: troque curto e saia, não tente duelar quando a vida dele estiver cheia.', 'Troque quando o Q dele estiver em recarga, com Q e auto. Se ele acertar uma marca, saia e espere a recarga.', 'Evite ficar perto quando ele tiver o escudo ativo: espere cair para entrar. Cuidado com o R dele, que leva ele pelo mapa.', 'Procure o carry e deixe ele para o final. Ele depende dos aliados, então mate os outros primeiro.', 'Perfuração de armadura e dano percentual ajudam contra a vida e o escudo dele.'),
('Teemo', 'o Explorador Veloz', 'Mago', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Teemo_0.jpg', 'O Q do Teemo cega e faz seus ataques básicos falharem: use as habilidades em vez de auto enquanto estiver cega.', 'Cuidado com os cogumelos dele: ficam escondidos no mato e na lane. Não ande em lugares com visão ruim.', 'Ele tem pouca vida: se você chegar nele, mata rápido. Use o E para entrar e o W (stun) para prender.', 'Troque com Q e W e use o E para chegar nele. Não confie nos autos, e saia antes de ele acertar o Q de novo.', 'Evite andar onde ele possa ter colocado cogumelos e leve visão. Com o R, mate rápido se ele estiver com pouca vida.', 'Nas fights, procure ele no meio dos cogumelos com cuidado. Ele é fraco se você chegar nele sem ele fugir.', 'Compre botas contra cegueira e vida; pagar por isso evita perder a luta por causa do Q.'),
('Trundle', 'o Rei dos Trolls', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Trundle_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Trundle_0.jpg', 'O R do Trundle rouba seus atributos: não duele quando ele estiver com R pronto, ele fica forte e você fraca.', 'O E dele cria um pilar que bloqueia o seu caminho e te trava: não fique perto quando ele tentar acertar.', 'Ele vence trocas longas, então encurte: entre com Q e auto, use o W (stun) e saia.', 'Troque quando o Q dele estiver em recarga e saia antes de ele acertar o auto reforçado que reduz sua velocidade.', 'Se ele estiver com o R, evite duelo e espere acabar. Se ele errar o pilar, entre e use o R para finalizar.', 'Evite duelos longos: ele escala bem. Fique com o time, procure o carry e fuja do R dele.', 'Perfuração de armadura e vida percentual ajudam a matar ele antes de ele drenar você.'),
('Tryndamere', 'o Rei Bárbaro', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Tryndamere_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Tryndamere_0.jpg', 'O R do Tryndamere deixa ele imortal por poucos segundos: não gaste combo até acabar, só fuja do alcance dele.', 'Ele ganha fúria quando bate: não fique no meio de uma troca longa, que ele cresce e fica difícil de segurar.', 'O W dele reduz o seu dano e te deixa lenta se estiver de costas: não fuja de costas quando ele usar.', 'Troque com Q e auto quando a fúria dele estiver baixa e saia antes de ele usar o E para chegar. Você vence as trocas curtas.', 'Espere o R dele acabar: se ele usar o R cedo, é a sua chance de entrar e matar. Cuidado com o crítico dele.', 'Evite duelar se ele estiver forte. Procure o carry do time dele e deixe ele sem aliados para ele ficar sem ajuda.', 'Armadura e vida ajudam contra o dano crítico dele; compre antes de dano extra.'),
('Urgot', 'o Encouraçado', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Urgot_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Urgot_0.jpg', 'O E do Urgot joga você para trás e deixa lenta: fique fora do alcance dele quando ele estiver com E pronto.', 'O W dele atira sozinho e causa muito dano: não fique parada perto dele quando estiver ativo.', 'O R dele executa quem está com pouca vida e causa medo: mantenha a vida alta perto dele.', 'Troque quando ele gastar o E e entre com Q e auto. Se ele usar o W, espere acabar e depois volte.', 'Com o R dele pronto, não entre com pouca vida. Se ele usar o R, ele fica fraco depois, é a hora de entrar.', 'Procure o carry e deixe ele para o final. Ele é tanque e perigoso se ficar perto, então evite duelo direto.', 'Armadura e vida ajudam; perfuração ajuda a matar ele antes de ele executar você.'),
('Varus', 'a Flecha da Retribuição', 'Mago', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Varus_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Varus_0.jpg', 'O Varus tem pouca mobilidade: use o E para entrar, o W (stun) para prender e ele fica sem como te escapar.', 'O Q dele demora para carregar: desvie com o E e punir logo depois, que ele fica sem pressão.', 'Ele tem pouca vida: se você chegar nele, mata rápido antes de ele reagir.', 'Seja bem agressiva: entre com Q e auto e use o W. Ele não consegue trocar de perto e perde todas as trocas curtas.', 'Cuidado com o R dele: ele prende e espalha para aliados. Fique atenta e use o E para sair da corrente.', 'Nas fights, procure ele de lado e evite ficar em linha com o Q. Mate ele rápido antes de ele usar o R.', 'Vida e resistência mágica ajudam a aguentar o poke e o dano dele.'),
('Vayne', 'a Caçadora da Noite', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Vayne_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Vayne_0.jpg', 'A Vayne é forte de longe: encurte logo, use o E para entrar e o W (stun) para ela não fugir com o Q.', 'O E dela empurra você contra paredes e atordoa: fique longe de paredes quando ela estiver com E pronto.', 'Ela fica muito forte com itens: pressione no começo e mate antes de ela ter dano suficiente.', 'Entre quando o Q dela estiver em recarga e use Q e auto e W. Se ela usar o E, saia e espere acabar.', 'Cuidado com o R dela: ela fica invisível e forte por um tempo. Espere acabar e entre depois.', 'Nas fights, procure ela e mate rápido com o R e o stun. Ela perde muito se for pega sozinha.', 'Vida e armadura ajudam a chegar nela; priorize antes de dano extra.'),
('Vladimir', 'o Ceifador Carmesim', 'Mago', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Vladimir_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Vladimir_0.jpg', 'O Vladimir cura com o Q: evite trocas longas e prefira trocas curtas e explosivas.', 'O W dele deixa ele imune por pouco tempo: não gaste combo até acabar, só espere e entre depois.', 'Ele fica muito forte no tardio, então pressione no começo e mate ele antes de ele escalar.', 'Entre quando o Q dele estiver em recarga, com Q e auto e W. Ele não tem como te escapar no começo.', 'Cuidado com o R dele: dano em área que aumenta o dano que ele causa em você. Espere o W acabar e entre depois.', 'Evite duelo longo contra ele no tardio. Procure o carry e deixe ele para o final, quando ele já usou o R.', 'Resistência mágica e corte de cura ajudam contra o dano e a cura dele.'),
('Volibear', 'o Trovão Implacável', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Volibear_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Volibear_0.jpg', 'O Q do Volibear atordoa quando ele chega perto: use o W (stun) antes ou o E para desviar quando ele vier.', 'O W dele marca e cura quando acerta duas vezes: não deixe ele acertar a segunda mordida.', 'Ele fica forte com o R, que causa dano em área e dá vida extra: não entre no meio dele.', 'Troque quando o Q dele estiver em recarga e saia antes do W. Se ele tiver o Q, não entre sem o seu E.', 'Com o R dele ativo, espere acabar e entre depois. Use o E para escapar do pulo do R e do atordoamento.', 'Evite lutas longas contra ele e procure o carry. Ele é tanque, então deixe ele para o final.', 'Armadura e vida ajudam a aguentar o dano dele; perfuração ajuda a matar a vida alta.'),
('Warwick', 'a Ira Desimpedida de Zaun', 'Lutador', 'Difícil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Warwick_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Warwick_0.jpg', 'O Warwick cura muito: evite trocas longas e prefira trocas curtas e explosivas.', 'O R dele prende e causa dano: use o E para sair antes ou o W para interromper quando ele chegar.', 'Ele fica muito forte quando você está com pouca vida: não fique com a vida baixa perto dele.', 'Troque rápido com Q e auto e saia antes de ele acertar o Q. Se ele errar, entre e use o W.', 'Cuidado com o R dele: ele salta e prende. Fique atenta e use o E para escapar, ou o W quando ele chegar.', 'Evite lutas longas contra ele e procure o carry. Ele é difícil de matar, então deixe ele para o final.', 'Corte de cura e perfuração de armadura reduzem a sustentação dele.'),
('Yasuo', 'o Imperdoável', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yasuo_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Yasuo_0.jpg', 'O muro de vento do Yasuo bloqueia projéteis, como o R2 (onda): o resto do seu kit corpo a corpo não é afetado.', 'Desvie do Q3 (tornado) com o E: se ele acertar, você perde a troca. Use o W (stun) quando ele chegar perto.', 'Ele usa os minions para chegar em você: afaste ele deles e force o Q a ficar sem alvo.', 'Troque quando o Q3 dele estiver em recarga, com Q e auto e W. Se ele usar o escudo, espere acabar e entre depois.', 'Com o R dele, cuidado com o knockup. Use o E para sair e o R para finalizar quando ele estiver com pouca vida.', 'Nas fights, procure ele sem o escudo. Ele depende de aliados, então mate o time dele primeiro.', 'Armadura e vida ajudam a aguentar o dano dele; ele é forte com crítico.'),
('Yone', 'o Inesquecível', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yone_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Yone_0.jpg', 'O E do Yone volta ele ao ponto de partida e solta o dano que você causou: não bata nele durante o E.', 'O Q3 dele joga você para cima: desvie com o E ou fique fora do alcance quando ele chegar no terceiro Q.', 'Ele tem dano físico e mágico, então escolha bem os itens conforme a luta.', 'Troque quando o Q3 dele estiver em recarga, com Q e auto e W, e saia antes de ele usar o E.', 'Cuidado com o R dele: puxa e dá dano. Espere ele gastar o R e depois entre, com o E guardado.', 'Procure ele depois que gastar o E e o R. Evite lutar quando ele estiver com tudo pronto.', 'Armadura e resistência mágica ajudam, porque ele mistura os dois tipos de dano.'),
('Yorick', 'o Pastor de Almas', 'Lutador', 'Fácil', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yorick_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Yorick_0.jpg', 'O Yorick depende das almas e dos ghouls: destrua o ghoul dele rápido, que é a fonte do dano dele.', 'O W dele cria um círculo que prende: fique fora do círculo ou use o E para sair antes de ele fechar.', 'Ele fica forte no tardio, então pressione no começo e mate antes de ele ter itens.', 'Seja bem agressiva: entre com Q e auto e use o W (stun). Ele perde todas as trocas curtas no começo.', 'Cuidado com o R dele: ele chama um fantasma que ajuda. Mate o fantasma ou fique longe até acabar.', 'Nas fights, procure ele e mate rápido, antes de os ghouls chegarem. Não fique presa no círculo.', 'Perfuração e vida ajudam a derrubar ele antes de ele escalar com as almas.'),
('Zaahen', 'O Indissociável', 'Lutador', 'Média', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zaahen_0.jpg', 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Zaahen_0.jpg', 'O Zaahen ganha dano extra a cada acúmulo de Determinação: não deixe ele acumular, encurte as trocas.', 'Com a Determinação cheia ele consegue ressuscitar: espere acabar e não gaste combo à toa.', 'Evite lutas longas, porque ele fica mais forte quanto mais tempo bate em você.', 'Troque curto com Q e auto e W e saia antes de ele acumular. Todas as trocas rápidas são suas.', 'Se ele estiver forte, evite duelo reto. Use o E para escapar do combo dele e entre só quando ele gastar as habilidades.', 'Procure o carry e deixe ele para o final. Se ele ressuscitar, saia do caminho até acabar o efeito.', 'Armadura e vida ajudam a aguentar o dano dele; priorize antes do dano extra.');

INSERT INTO usuario (nome, email, senha, lol_rank) VALUES
('NovatoDoTop', 'novatodotop@email.com', 'Urubu100', 'Unranked'),
('PrimeiraRanked', 'primeiraranked@email.com', 'Urubu100', 'Unranked'),
('SemElo', 'semelo@email.com', 'Urubu100', 'Unranked'),
('FerroBrabo', 'ferrobrabo@email.com', 'Urubu100', 'Ferro'),
('TiltadoNoFerro', 'tiltadonoferro@email.com', 'Urubu100', 'Ferro'),
('DuelistaIniciante', 'duelistainiciante@email.com', 'Urubu100', 'Ferro'),
('CaindoDeNovo', 'caindodenovo@email.com', 'Urubu100', 'Ferro'),
('BronzeComOrgulho', 'bronzecomorgulho@email.com', 'Urubu100', 'Bronze'),
('RivenIniciante', 'riveniniciante@email.com', 'Urubu100', 'Bronze'),
('SonhoDoPrata', 'sonhodoprata@email.com', 'Urubu100', 'Bronze'),
('ZeDoTop', 'zedotop@email.com', 'Urubu100', 'Bronze'),
('PuloDoGato', 'pulodogato@email.com', 'Urubu100', 'Bronze'),
('PrataPlayer', 'prataplayer@email.com', 'Urubu100', 'Prata'),
('LaneraDoTop', 'laneradotop@email.com', 'Urubu100', 'Prata'),
('CortaVento', 'cortavento@email.com', 'Urubu100', 'Prata'),
('EspadaPrateada', 'espadaprateada@email.com', 'Urubu100', 'Prata'),
('MiraNoOuro', 'miranoouro@email.com', 'Urubu100', 'Prata'),
('Rivenzinha', 'rivenzinha@email.com', 'Urubu100', 'Prata'),
('OuroNaVeia', 'ouronaveia@email.com', 'Urubu100', 'Ouro'),
('MestreDoE', 'mestredoe@email.com', 'Urubu100', 'Ouro'),
('Quebrador', 'quebrador@email.com', 'Urubu100', 'Ouro'),
('TopDiffBR', 'topdiffbr@email.com', 'Urubu100', 'Ouro'),
('LaminaDourada', 'laminadourada@email.com', 'Urubu100', 'Ouro'),
('SoloLaner', 'sololaner@email.com', 'Urubu100', 'Ouro'),
('PlatinaTop', 'platinatop@email.com', 'Urubu100', 'Platina'),
('CancelaAnimacao', 'cancelaanimacao@email.com', 'Urubu100', 'Platina'),
('FastCombo', 'fastcombo@email.com', 'Urubu100', 'Platina'),
('TopLaneKing', 'toplaneking@email.com', 'Urubu100', 'Platina'),
('DuelistaPlat', 'duelistaplat@email.com', 'Urubu100', 'Platina'),
('EsmeraldaBR', 'esmeraldabr@email.com', 'Urubu100', 'Esmeralda'),
('ShieldCancel', 'shieldcancel@email.com', 'Urubu100', 'Esmeralda'),
('RivenMainBR', 'rivenmainbr@email.com', 'Urubu100', 'Esmeralda'),
('ExilePlayer', 'exileplayer@email.com', 'Urubu100', 'Esmeralda'),
('DiamanteViolento', 'diamanteviolento@email.com', 'Urubu100', 'Diamante'),
('ComboPerfeito', 'comboperfeito@email.com', 'Urubu100', 'Diamante'),
('AlmaDeRiven', 'almaderiven@email.com', 'Urubu100', 'Diamante'),
('LaminaQuebrada', 'laminaquebrada@email.com', 'Urubu100', 'Diamante'),
('MestreDoDuelo', 'mestredoduelo@email.com', 'Urubu100', 'Mestre'),
('SemPiedade', 'sempiedade@email.com', 'Urubu100', 'Mestre'),
('TopDiffMestre', 'topdiffmestre@email.com', 'Urubu100', 'Mestre'),
('GMDoTop', 'gmdotop@email.com', 'Urubu100', 'Grão-Mestre'),
('EspadaRunica', 'espadarunica@email.com', 'Urubu100', 'Grão-Mestre'),
('ChallengerBR', 'challengerbr@email.com', 'Urubu100', 'Challenger'),
('DuelistaSupremo', 'duelistasupremo@email.com', 'Urubu100', 'Challenger');

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Fiora'
WHERE u.id IN (2,3,4,6,7,8,9,10,11,13,14,15,16,17,18,19,21,22,23,24,25,26,27,29,30,31,32,34,35,36,37,38,39,40,42,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Darius'
WHERE u.id IN (1,2,4,5,6,8,9,11,12,13,14,16,18,19,20,22,23,25,26,28,29,31,32,34,35,37,38,40,41,43,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Camille'
WHERE u.id IN (3,4,7,9,10,12,13,15,17,18,19,21,23,24,26,27,29,30,32,33,35,36,38,39,41,42,43,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Jax'
WHERE u.id IN (1,3,5,8,10,11,14,16,17,20,21,24,25,27,28,30,31,34,36,37,39,40,42,43,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Yasuo'
WHERE u.id IN (2,3,6,7,9,12,13,15,18,19,22,23,25,26,29,30,32,33,35,38,39,41,42,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Irelia'
WHERE u.id IN (4,6,8,11,13,15,19,21,24,26,28,31,33,35,37,38,40,42,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Garen'
WHERE u.id IN (1,2,5,7,9,10,12,14,16,17,20,22,23,27,29,34);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Malphite'
WHERE u.id IN (3,6,8,11,13,18,21,25,26,30,32,36,39,41,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Gnar'
WHERE u.id IN (4,9,12,15,19,22,24,27,31,33,35,38,40,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Aatrox'
WHERE u.id IN (2,5,10,14,17,23,28,30,34,37,41,42);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Akali'
WHERE u.id IN (3,7,11,16,20,25,29,32,36,39,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Kayle'
WHERE u.id IN (1,6,13,18,26,31,35,40,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Teemo'
WHERE u.id IN (4,8,12,21,24,27,33,38,42);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Mordekaiser'
WHERE u.id IN (5,9,15,19,22,30,37,41);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Vayne'
WHERE u.id IN (2,10,14,23,28,34,39,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Jayce'
WHERE u.id IN (7,11,17,25,29,36,40);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Nasus'
WHERE u.id IN (1,3,12,20,32,44);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Sett'
WHERE u.id IN (6,16,26,31,38,42);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Pantheon'
WHERE u.id IN (8,13,21,35,43);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Yone'
WHERE u.id IN (4,18,24,30,37);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Illaoi'
WHERE u.id IN (9,15,27,41);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Warwick'
WHERE u.id IN (2,19,33,39);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Volibear'
WHERE u.id IN (5,22,36);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Shen'
WHERE u.id IN (14,28,40);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Poppy'
WHERE u.id IN (10,23,34);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Zaahen'
WHERE u.id IN (17,29);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Dr. Mundo'
WHERE u.id IN (11,38);

INSERT INTO curtida_campeao (usuario_id, campeao_id)
SELECT u.id, c.id FROM usuario u JOIN campeao c ON c.nome = 'Gwen'
WHERE u.id IN (20,25);


INSERT INTO tentativa_quiz (usuario_id, pontuacao) VALUES
(1, 8), (1, 10), (1, 6),
(2, 5), (2, 9), (2, 7),
(3, 11), (3, 8), (3, 9),
(4, 4), (4, 6), (4, 8),
(5, 7), (5, 10), (5, 9),
(6, 3), (6, 5), (6, 8),
(7, 9), (7, 11), (7, 10),
(8, 6), (8, 7), (8, 9),
(9, 2), (9, 6), (9, 5),
(10, 8), (10, 9), (10, 11),
(11, 5), (11, 7), (11, 6),
(12, 10), (12, 8), (12, 11),
(13, 4), (13, 7), (13, 9),
(14, 6), (14, 8), (14, 10),
(15, 11), (15, 9), (15, 10),
(16, 3), (16, 4), (16, 7),
(17, 8), (17, 6), (17, 9),
(18, 5), (18, 10), (18, 8),
(19, 7), (19, 9), (19, 11),
(20, 2), (20, 5), (20, 6),
(21, 9), (21, 10), (21, 8),
(22, 6), (22, 7), (22, 5),
(23, 11), (23, 10), (23, 9),
(24, 4), (24, 8), (24, 6),
(25, 7), (25, 5), (25, 9),
(26, 10), (26, 11), (26, 8),
(27, 3), (27, 6), (27, 5),
(28, 8), (28, 9), (28, 7),
(29, 6), (29, 10), (29, 8),
(30, 11), (30, 9), (30, 10),
(31, 5), (31, 7), (31, 8),
(32, 4), (32, 6), (32, 9),
(33, 10), (33, 8), (33, 11),
(34, 7), (34, 9), (34, 6),
(35, 2), (35, 4), (35, 7),
(36, 9), (36, 11), (36, 8),
(37, 6), (37, 8), (37, 10),
(38, 5), (38, 9), (38, 7),
(39, 11), (39, 10), (39, 9),
(40, 3), (40, 5), (40, 8),
(41, 7), (41, 10), (41, 8),
(42, 4), (42, 6), (42, 9),
(43, 8), (43, 11), (43, 10),
(44, 5), (44, 7), (44, 9);