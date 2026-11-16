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

INSERT INTO campeao VALUES
(NULL, 'Aatrox', 'A espada Darkin', 'Lutador', 'Média', 
'https://images7.alphacoders.com/977/thumb-1920-977848.jpg', 
'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/c/ce/Skin_Loading_Screen_Classic_Aatrox.jpg/revision/latest/scale-to-width-down/200?cb=20191212054334',
'Use seu Q e E reativamente, para desviar e dar dano ao mesmo tempo', 'Quanto mais você encurtar, melhor! aatrox é fragil se chegar nele andando',
'Guarde seu E para desviar do 3Q dele, assim negando mais parte do dano', 
'Vá para moita nivel 1 , e stack seu Q no tempo que a wave chegar, use seu 3 Q para tirar o osso revestido e jogue com pressao na wave. Todas as trocas que você encurtar, você vence',
'A partir do nível 6, qualquer gap você consegue dar 100-0, enxergue oportunidade de encurtar ou com ignite, ou com flash, principalmente se ele estiver com osso revestido em CD, todo all win você vence.',
'A partir desse ponto, você é mais forte na side e nas fights se tiver um pouco de vantagem, ele precisa coinflipar, tente sempre dar match onde ele estiver. Caso ele jogue side, puxe e dive ou puxe e rota para o mid.',
'Deixe SEMPRE imperceptível se você irá usar o Q para entrar nele e dar dano ou sair.');


/* ============================================================
   DADOS DE EXEMPLO
   As imagens usam o Data Dragon (CDN oficial da Riot).
   As dicas são rascunhos para você revisar e ajustar.
   ============================================================ */

INSERT INTO campeao
(nome, descricao, tipo, dificuldade, backGroundIMG, loadingScreenIMG,
 dica_geral_1, dica_geral_2, dica_geral_3,
 dica_nivel_1_5, dica_nivel_6_11, dica_nivel_12_max, dica_ouro)
VALUES
('Fiora', 'A Grande Duelista', 'Lutador', 'Difícil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Fiora_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Fiora_0.jpg',
'O W (parry) dela bloqueia o seu stun. Só use o W quando ela já tiver gasto o parry, senão você perde a troca.',
'Ela ganha dano e cura ao acertar os pontos vitais. Ande para longe do vital para ela não conseguir acertar fácil.',
'Fiora vence duelos longos e é muito forte no final do jogo. Seu foco é punir com burst enquanto ela está sem habilidades.',
'Você é mais forte nos primeiros níveis. Troque quando ela gastar o Q ou o W e use o E para absorver o dano da troca. Use essa força para pressionar a wave e tirar vantagem dela antes do nível 6.',
'Com o R você consegue matar ela em uma troca curta. Procure o gap quando o parry dela estiver em recarga e guarde o flash para o all-in, pois o Q dela cobre muita distância.',
'Aqui ela fica muito forte em duelos. Evite 1v1 isolado, jogue perto do time e só use o all-in quando o parry dela estiver em recarga.',
'Faça ela gastar o parry com o Q ou o E antes de entrar com o stun.'),

('Camille', 'A Sombra de Aço', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Camille_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Camille_0.jpg',
'A ponta do cone do W dela dá mais dano e cura. Fique colado nela para fugir da ponta e reduzir a cura.',
'O E dela precisa de parede para o primeiro gancho. Fique atento quando ela estiver perto de paredes, pois ela vai entrar rápido em você.',
'O passivo dela dá escudo depois de usar habilidade. Prefira trocas curtas e explosivas, não trocas longas.',
'Troque quando ela gastar o Q, porque o segundo Q é o que dá mais dano. Use o E para absorver o dano e volte com o stun. Evite ficar levando auto dela sem a sua vantagem.',
'Com o R você tem o burst para vencer. Lembre que o R dela te prende em uma área e você não consegue sair, então não entre em luta isolada com ele disponível.',
'Em teamfight ela procura o seu carry. No side, evite lutar sozinho contra ela, pois ela é muito forte em trocas longas.',
'Entre no cone do W dela e use o stun logo depois que ela gastar o Q.'),

('Darius', 'A Mão de Noxus', 'Lutador', 'Difícil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Darius_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Darius_0.jpg',
'Fique fora do alcance do E dele. Se ele puxar você, ele acumula sangramento e você perde a troca.',
'O sangramento dele acumula. Troque rápido e saia antes de ele acumular os stacks.',
'Ele vence trocas longas e o R dele executa. Mantenha sua vida alta no late e não fique com pouca vida perto dele.',
'Dê trocas curtas: bata, use o Q e saia antes de ele acumular. Aproveite quando ele gastar o E para entrar e use o E (escudo) para absorver o Q dele. Controle a wave perto da sua torre quando ele estiver mais forte.',
'Com o R você tem mais burst, mas o R dele também executa. Não entre com pouca vida e guarde o flash para o caso de ele puxar com o E.',
'Ele é forte em fights e no 1v1. Jogue pelas laterais e use seu dash para sair do Q dele, pois a borda dá cura nele.',
'Troque só depois que ele usar o E, pois sem ele você consegue sair do alcance.'),

('Garen', 'O Poder de Demacia', 'Tanque', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Garen_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Garen_0.jpg',
'O Q dele silencia, e você fica sem habilidades. Respeite o Q dele nas trocas e entre quando ele estiver em recarga.',
'O W dele reduz o dano que você causa. Espere o W acabar antes de gastar o burst.',
'O passivo dele regenera quando ele fica sem apanhar. Mantenha pressão para ele nunca recuperar a vida.',
'Garen é forte nos primeiros níveis por causa do silêncio do Q. Troque quando o Q estiver em recarga e use o E para sair do giro dele. Evite o all-in dele nos níveis 1 e 2.',
'Com o R você mata ele em um burst curto, mas o R dele executa quando você está com pouca vida. Mantenha sua vida alta e guarde o flash.',
'No late ele é um tank com muito dano e execução. Jogue com o time, evite lutar sozinho com ele e dê foco no resto do time dele.',
'Espere ele gastar o Q e o W antes de entrar. Sem o silêncio, você ganha a troca.'),

('Gnar', 'O Elo Perdido', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gnar_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Gnar_0.jpg',
'Mini Gnar é ranged e fraco no corpo a corpo. Entre nele com o Q e o W quando ele estiver pequeno.',
'Mega Gnar tem stun e knockback. Fique longe de paredes quando ele estiver grande e fique atento à barra de fúria.',
'Quando a barra de fúria enche, ele vira Mega Gnar. Evite brigar nessa hora e espere a transformação acabar.',
'Mini Gnar tem poke, então não fique tomando dano de longe. Entre com o Q quando ele estiver sem o bumerangue, que é o Q dele, e force trocas curtas. Evite lutar quando ele estiver quase grande.',
'Com o R você ganha o burst. Cuidado com o Mega Gnar: o W dele dá stun e o R joga para o lado. Use o E para desviar do W e não lute perto de paredes.',
'Em fights ele fica muito forte. Seu papel é pegar o lado dele e não ficar na fila para o R dele. Evite ficar perto de paredes nas lutas.',
'Entre nele quando estiver pequeno e fique longe de paredes quando estiver grande.'),

('Illaoi', 'A Sacerdotisa do Kraken', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Illaoi_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Illaoi_0.jpg',
'Os tentáculos dela dão muito dano. Saia da área dos tentáculos quando ela usar habilidades.',
'O E dela é um projétil: desvie com o dash, porque acertar deixa você vulnerável aos tentáculos.',
'Ela tem dano em área muito forte. Não lute em cima dos tentáculos e jogue pelas laterais.',
'Entre quando os tentáculos não estiverem por perto e troque rápido, saindo antes de ela usar o Q. Use o E para absorver o dano do tentáculo se for preciso.',
'No nível 6 o R dela é perigoso, com tentáculos em área. Fique fora do alcance quando ela estiver para ultar e use o flash se precisar sair.',
'Ela é forte no side e em fights de área. Evite brigar dentro da área dos tentáculos e foque matar ela antes de ela usar o R.',
'Quando ela errar o E, é o seu momento de entrar com o stun.'),

('Irelia', 'A Dançarina das Lâminas', 'Lutador', 'Difícil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Irelia_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Irelia_0.jpg',
'O Q dela reseta ao matar minions. Fique atento quando a wave tiver minions baixas, que ela usa para chegar em você.',
'O E dela é um stun com duas lâminas. Fique atento ao cruzamento e use o dash para sair.',
'Ela tem muita mobilidade e vence você em trocas longas. Você ganha com burst e posicionamento.',
'Troque quando ela estiver sem minion para o Q, assim ela não consegue entrar. Use o E para absorver o dano da troca e volte com o stun. Evite brigar quando ela tiver o passivo cheio de stacks.',
'Com o R você tem mais burst do que ela. Mantenha o flash para o E dela e não fique em área aberta com o R dela.',
'Ela fica forte nas fights, pois o R dela cria uma parede. Fique de fora até ela gastar e jogue com o time.',
'Mate os minions baixos antes dela, para ela perder o gap do Q.'),

('Jax', 'O Grão-Mestre das Armas', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jax_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Jax_0.jpg',
'O E dele desvia de todos os ataques básicos e depois dá stun. Não entre nele com auto, espere o E acabar.',
'O W dele aumenta o dano da próxima auto. Fique atento ao tempo de recarga e troque depois que ele gastar.',
'Jax escala muito no final do jogo. Tente ter vantagem cedo e fechar objetivos.',
'Troque quando ele gastar o E. Use o stun para impedir que ele entre com o Q e use o seu E para absorver o dano do W. Evite all-in com o E dele disponível.',
'Com o R você pega burst, mas ele tem o R dele para ficar mais forte. Evite brigar quando ele estiver com o passivo cheio e espere ele errar o E.',
'Aqui ele é muito forte em split push e em fights. Evite 1v1 sozinho e use o seu time para pegar ele.',
'Espere ele gastar o E e entre com o stun logo em seguida.'),

('Jayce', 'O Defensor do Amanhã', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jayce_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Jayce_0.jpg',
'Jayce é ranged no começo e faz poke. Use o E para bloquear o Q dele e feche a distância.',
'Em forma de martelo ele tem o E, que empurra. Fique atento ao tempo de recarga e fuja do knockback.',
'Ele é forte no early e perde força no late. Pressione quando ele estiver sem habilidades.',
'Evite ficar parado tomando poke. Entre com o Q quando ele gastar o Q e o W e force trocas curtas. Segure a wave perto da sua torre se ele estiver forte.',
'Com o R você tem mais burst do que ele. Jayce tem muita mobilidade com o martelo, então mantenha o flash e o E para sair do knockback.',
'Ele fica muito forte em fights com o canhão. Seu foco é pegar ele fora de posição e usar o stun para impedir a troca de forma.',
'Use o E para bloquear o Q dele e entre logo depois, enquanto ele está sem habilidades.'),

('Kayle', 'A Justa', 'Mago', 'Fácil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kayle_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Kayle_0.jpg',
'Kayle é fraca nos primeiros níveis. Pressione ela até o nível 6 para ela nunca escalar.',
'O Q dela é um slow e o W dá velocidade e cura. Desvie do Q com o dash e entre no W quando ela gastar.',
'O R dela deixa ela intocável por um tempo. Não gaste o burst quando ela estiver para ultar.',
'Este é o seu melhor momento. Entre com o stun e o Q e force trocas fortes. Use o E para chegar nela e negue o farm dela, pois ela precisa de tempo para escalar.',
'Com o R você mata ela em um all-in. Cuidado com o R dela: ela fica intocável por alguns segundos, então espere acabar para continuar.',
'No nível 16 ela fica muito forte, com dano em área. Se ela escalou, evite lutar e jogue com o time para dar foco antes disso.',
'Mate ela antes do nível 6 e 11: depois ela escala muito e vira ameaça no late.'),

('Kled', 'O Cavaleiro Rabugento', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kled_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Kled_0.jpg',
'Kled tem a Skaarl, a montaria. Quando a Skaarl morre, ele fica fraco e perde a mobilidade.',
'O Q dele puxa você. Desvie com o dash, pois quando ele acerta você perde a troca.',
'O R dele é um avanço em linha e dá muita velocidade. Fique atento quando ele ultar.',
'Kled é forte nos primeiros níveis, principalmente com a montaria. Evite trocar enquanto o Q estiver disponível e entre quando ele gastar. Se ele ficar sem a Skaarl, é o seu momento de matar.',
'Com o R você tem mais burst. Mantenha o flash para o Q e o E dele, que prendem você, e jogue com o time ao redor.',
'No late ele tem muita mobilidade e dano. Evite brigar de frente e pegue ele fora de posição, quando a Skaarl estiver em recarga.',
'Quando a Skaarl morrer, entre nele: ele fica muito mais fraco.'),

('Malphite', 'Fragmento do Monólito', 'Tanque', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Malphite_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Malphite_0.jpg',
'Malphite é tank e tem muito escudo. Não gaste burst nele quando o escudo estiver ativo.',
'O R dele é uma investida com knockup em área. Guarde o E ou o flash para desviar.',
'Ele é forte contra dano físico quando tem armadura. Fique atento ao quanto ele está acumulando.',
'Dê trocas curtas e saia: ele tem o Q com slow, então use o E para absorver o dano do Q. Evite ficar longe da sua torre se ele estiver com o slow.',
'O R dele é perigoso e você precisa guardar o dash para desviar. Com o R você tem mais burst, mas ele tem muita defesa.',
'No late ele é uma ameaça em fights por causa do R. Seu papel é pegar o carry dele e jogar em volta, evitando entrar na fila do R.',
'Guarde o E para o R dele e entre nele com o stun logo depois que ele gastar.'),

('Mordekaiser', 'O Revenante de Ferro', 'Mago', 'Difícil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Mordekaiser_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Mordekaiser_0.jpg',
'O R dele isola você em outra dimensão e rouba seus atributos. Evite lutar com ele quando o R estiver disponível.',
'O E dele puxa você. Fique fora de linha e use o dash para sair do alcance.',
'O W dele dá escudo e cura. Troque quando o W estiver em recarga e use o seu stun para interromper.',
'Troque quando ele gastar o Q, que é o principal dano dele. Use o E para absorver o dano e entre com o stun. Evite ficar em linha reta com o E dele.',
'O R dele é o grande perigo: você fica preso em um duelo com ele. Com o seu R você tem mais burst, mas só entre se ele estiver sem R ou sem o W.',
'No late ele é muito forte em duelos. Jogue em grupo e evite o 1v1, pois o R dele te tira da luta.',
'Entre só quando o R dele estiver em recarga: no duelo isolado você perde.'),

('Nasus', 'O Curador das Areias', 'Lutador', 'Fácil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Nasus_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Nasus_0.jpg',
'Mate ele cedo antes de ele acumular o Q. Se ele errar o Q, você ganha a troca.',
'O W dele deixa você lento. Respeite o W e use o dash para sair do alcance.',
'O R dele aumenta a vida e o dano dele. Evite lutar quando o R estiver ativo.',
'É um bom matchup. Pressione ele quando ele for dar last hit e não deixe acumular o Q. Use o E para absorver o dano e o stun para cortar a troca.',
'Com o R você tem muito burst. Quando ele usar o R, você consegue kitar com o dash e esperar acabar.',
'No late ele é um tank forte. Evite 1v1 com ele de R ativo e foque no resto do time dele.',
'Mate ele antes de ele acumular o Q: depois disso ele vira um tank muito forte.'),

('Ornn', 'O Fogo sob a Montanha', 'Tanque', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ornn_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ornn_0.jpg',
'Ornn é tank e o E dele dá stun contra paredes. Fique longe de paredes quando o E estiver disponível.',
'O Q dele cria pilares que bloqueiam o dash. Cuidado com o caminho do seu Q.',
'Ele é fraco no começo e forte no late. Pressione cedo para tirar vantagem dele.',
'Nos primeiros níveis ele é bem mais fraco. Entre nele com o stun e o Q e troque. Segure a wave perto da sua torre quando ele estiver forte.',
'Com o R você tem burst, mas ele é muito tank. Cuidado com o R dele, que vem com onda em linha: desvie com o dash.',
'Em fights ele é muito forte por causa do R e dos buffs de item. Seu papel é pegar o dano dele e jogar em volta sem entrar na onda.',
'Use o dash para desviar do R e evite ficar perto de paredes com o E dele disponível.'),

('Renekton', 'O Carniceiro das Areias', 'Lutador', 'Difícil',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Renekton_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Renekton_0.jpg',
'Renekton é forte no começo. Evite trocar quando ele tiver fúria, pois o dano e o stun do W aumentam.',
'O W dele é um stun. Use o dash ou o E para sair e não deixe ele acertar.',
'Depois do nível 6 ele fica mais forte com o R. Jogue com cuidado até lá e tente ter o farm.',
'Este é o momento difícil. Evite trocas quando ele tiver fúria e entre só depois que ele gastar o E. Segure a wave perto da sua torre para ele não conseguir all-in.',
'Com o R você nivela, mas o R dele dá vida e dano em área. Mantenha o flash para o E dele e não fique preso na parede.',
'No late ele continua forte em duelos curtos. Evite o 1v1 e use sua mobilidade para pegar ele em fights.',
'Espere ele gastar o E e o W: sem eles ele não consegue fechar o all-in.'),

('Sett', 'O Chefão', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Sett_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Sett_0.jpg',
'A vida cinza dele vira escudo e dano com o W. Não dê muito dano antes do W, pois você aumenta o dano dele.',
'O E dele puxa e dá stun. Fique atento ao alcance e use o dash para fugir.',
'Ele é forte em trocas longas e no late. Troque em burst curto e saia.',
'Evite dar autos nele de graça: a vida cinza vira dano. Entre quando ele gastar o W e use o E para absorver o dano. Trate o W dele com respeito.',
'Com o R você tem burst, mas o R dele te arrasta e joga no chão. Guarde o flash e o E para essa situação.',
'No late ele é um bruiser muito forte. Jogue em volta e pegue o time dele, e não fique em linha com o R dele.',
'Espere ele gastar o W antes de usar o seu burst: o escudo some e o dano cai.'),

('Shen', 'O Olho do Crepúsculo', 'Tanque', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Shen_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Shen_0.jpg',
'O E dele é um taunt. Desvie com o dash, pois se acertar você é forçado a bater nele.',
'O R dele ajuda aliados do mapa todo. Fique atento ao mapa e à lane quando ele tiver o R.',
'Shen é muito tank. Seu foco é trocas curtas e sair. Não fique muito tempo perto dele.',
'Você é mais forte nos primeiros níveis. Troque quando ele gastar o Q e o E e use o stun. Evite lutar perto da torre dele.',
'Com o R você tem mais burst, mas ele tem escudo no passivo. Segure o dash para o taunt e não entre quando ele estiver com o escudo cheio.',
'No late ele é um tank de ult global. Jogue com o time e foque no resto do time dele.',
'Segure o E para desviar do taunt: se ele acertar, você perde a troca.'),

('Teemo', 'O Batedor Veloz', 'Mago', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Teemo_0.jpg',
'Os cogumelos dele ficam invisíveis. Compre controle de visão antes de entrar nos arbustos.',
'O Q dele cega os ataques básicos, mas as suas habilidades continuam acertando. Não tenha medo de lutar.',
'Ele é ranged e faz poke. Feche a distância com o Q e o E e force trocas curtas.',
'Entre nele com o Q e o W e force trocas curtas. Cuidado com os cogumelos nos arbustos: use controle de visão. Segure a wave perto da sua torre se ele estiver forte.',
'Com o R você mata ele em um burst. O R dele coloca muitos cogumelos, então evite brigar perto deles.',
'No late ele faz muito dano a distância e tem cogumelos. Evite entrar em área aberta e jogue com o time.',
'Compre controle de visão e mate ele rápido: ele é frágil se você chegar nele.'),

('Tryndamere', 'O Rei Bárbaro', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Tryndamere_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Tryndamere_0.jpg',
'O R dele impede ele de morrer por alguns segundos. Não gaste o burst quando ele ultar, espere acabar.',
'O W dele diminui seu dano e deixa você lento. Fique atento ao tempo de recarga dele.',
'Ele é muito forte no late com fúria cheia. Tente ter vantagem cedo e fechar objetivos.',
'Pressione ele nos primeiros níveis. Troque quando ele gastar o Q e use o E para absorver o dano. Evite brigar quando a fúria dele estiver cheia.',
'Com o R você tem mais burst. Se ele usar o R dele, use o dash para sair e espere acabar antes de continuar.',
'No late ele é forte em split push. Evite o 1v1 de R dele ativo e jogue em volta com o time.',
'Se ele usar o R, afaste-se e espere acabar: gastar burst nele é desperdício.'),

('Volibear', 'A Tempestade Implacável', 'Tanque', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Volibear_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Volibear_0.jpg',
'O Q dele dá stun na primeira auto. Desvie com o E quando ele vier para cima.',
'O W dele causa sangramento e cura. Ele fica muito forte nas trocas longas.',
'O R dele desativa torres e dá dano em área. Fique atento à torre e ao ult dele.',
'Ele é forte nos primeiros níveis. Evite trocar com o Q disponível e entre só depois que ele gastar. Use o E para chegar e o stun para impedir o avanço.',
'Com o R você tem burst, mas o dele dá muito dano em área. Mantenha o flash para o R e o Q dele.',
'No late ele é um tank muito forte. Seu papel é pegar o dano do outro lado e fugir do R dele.',
'Use o E para desviar do Q dele, e depois entre com o stun.'),

('Yasuo', 'O Imperdoável', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yasuo_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Yasuo_0.jpg',
'O W dele bloqueia projéteis, inclusive o seu R. Espere ele gastar o muro de vento antes de usar o R.',
'O escudo do passivo dele some quando você acerta nele. Faça um bom primeiro hit.',
'O E dele é um dash que depende de minions. Quando não tiver minion por perto, ele não tem mobilidade.',
'Troque quando ele gastar o E ou o W. Use o E para chegar e o stun para cortar a troca. Evite lutar com muitos minions perto dele.',
'Com o R você tem muito burst. Evite ser jogado para o alto pelo Q3 dele, pois o R dele depende disso.',
'No late ele fica muito forte com críticos. Evite fights em área aberta e jogue com o time para pegar ele.',
'Espere o muro de vento dele acabar para usar o R: ele bloqueia o seu projétil.'),

('Yone', 'O Inesquecível', 'Lutador', 'Média',
'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yone_0.jpg',
'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Yone_0.jpg',
'O Q3 dele é um redemoinho que joga para o alto. Desvie com o dash para não ficar vulnerável.',
'O E dele deixa ele fora do corpo e depois volta com dano. Ele fica forte nas trocas longas com o E.',
'Ele é frágil se você acertar o burst. Entre com o stun e o Q e pressione.',
'Troque quando ele gastar o Q3 ou o W. Use o E para chegar nele e o stun para cortar o avanço. Evite brigar com o E dele disponível.',
'Com o R você tem mais burst. O R dele puxa os inimigos em linha e joga para o alto. Mantenha o flash para o R.',
'No late ele é muito forte em fights. Seu papel é pegar ele fora de posição. Jogue em volta do time e evite entrar de frente.',
'Pegue ele sem o E: sem o retorno ele é frágil e você vence a troca.');


/* Usuários de teste (a senha é só para testes; no projeto real, guarde o hash) */
INSERT INTO usuario (nome, email, senha, lol_rank) VALUES
('riven_main', 'riven_main@email.com', 'senha123', 'Challenger'),
('jogador_ferro', 'jogador_ferro@email.com', 'senha123', 'Ferro'),
('jogador_ouro', 'jogador_ouro@email.com', 'senha123', 'Ouro'),
('novato', 'novato@email.com', 'senha123', 'Unranked');

/* Tentativas de quiz (a data_hora entra sozinha) */
INSERT INTO tentativa_quiz (usuario_id, pontuacao) VALUES
((SELECT id FROM usuario WHERE nome = 'riven_main'), 15),
((SELECT id FROM usuario WHERE nome = 'riven_main'), 14),
((SELECT id FROM usuario WHERE nome = 'jogador_ferro'), 5),
((SELECT id FROM usuario WHERE nome = 'jogador_ferro'), 8),
((SELECT id FROM usuario WHERE nome = 'jogador_ouro'), 10),
((SELECT id FROM usuario WHERE nome = 'novato'), 3);

/* Curtidas de match-ups */
INSERT INTO curtida_campeao (usuario_id, campeao_id) VALUES
((SELECT id FROM usuario WHERE nome = 'riven_main'), (SELECT id FROM campeao WHERE nome = 'Aatrox')),
((SELECT id FROM usuario WHERE nome = 'riven_main'), (SELECT id FROM campeao WHERE nome = 'Fiora')),
((SELECT id FROM usuario WHERE nome = 'riven_main'), (SELECT id FROM campeao WHERE nome = 'Yasuo')),
((SELECT id FROM usuario WHERE nome = 'riven_main'), (SELECT id FROM campeao WHERE nome = 'Irelia')),
((SELECT id FROM usuario WHERE nome = 'jogador_ouro'), (SELECT id FROM campeao WHERE nome = 'Aatrox')),
((SELECT id FROM usuario WHERE nome = 'jogador_ouro'), (SELECT id FROM campeao WHERE nome = 'Darius')),
((SELECT id FROM usuario WHERE nome = 'jogador_ouro'), (SELECT id FROM campeao WHERE nome = 'Malphite')),
((SELECT id FROM usuario WHERE nome = 'jogador_ferro'), (SELECT id FROM campeao WHERE nome = 'Teemo')),
((SELECT id FROM usuario WHERE nome = 'jogador_ferro'), (SELECT id FROM campeao WHERE nome = 'Garen')),
((SELECT id FROM usuario WHERE nome = 'novato'), (SELECT id FROM campeao WHERE nome = 'Aatrox'));