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