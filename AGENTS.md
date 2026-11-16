# AGENTS.md

## Visão geral

Este projeto é uma aplicação web educacional sobre League of Legends, desenvolvida individualmente por Luigi, estudante do 1º semestre de Análise e Desenvolvimento de Sistemas (ADS) na SPTech.

O objetivo da aplicação é compartilhar conhecimentos sobre League of Legends, utilizando a experiência de mais de 10 anos do desenvolvedor no jogo, incluindo conquistas como Challenger, Top 1 Brasil e Top 2 mundial.

O conteúdo será voltado à comunidade de League of Legends, com foco especial em jogadores que desejam aprender a jogar melhor com a campeã Riven.

Os principais conteúdos e funcionalidades previstos incluem:

- Matchups e estratégias para enfrentar diferentes campeões.
- Runas e escolhas situacionais.
- Combos e mecânicas da Riven.
- Quizzes para testar e reforçar o conhecimento dos jogadores.
- Conteúdos sobre tomada de decisão e raciocínio durante as partidas.
- Dashboard com gráficos e informações relevantes.

Além de seu propósito educacional para os jogadores, o projeto tem como objetivo acadêmico e pessoal aprofundar os conhecimentos do desenvolvedor em CSS, desenvolvimento web e integração entre uma aplicação web, uma API e um banco de dados.

O projeto deve priorizar soluções simples, didáticas e compreensíveis, permitindo que o desenvolvedor aprenda durante cada etapa da implementação.

O desenvolvedor é estudante do 1º semestre de Análise e Desenvolvimento de Sistemas e está aprendendo. Conhece pouco de manipulação de DOM. O objetivo é entender o que está sendo feito, e não apenas receber o código pronto.

## Tecnologias

As tecnologias e ferramentas previstas para o projeto são:

- **HTML:** estruturação das páginas e dos elementos da aplicação.
- **CSS:** estilização, organização visual, responsividade e efeitos visuais.
- **JavaScript:** interatividade das páginas, resposta às ações dos usuários e implementação da lógica da aplicação.
- **Node.js:** execução de JavaScript no servidor e implementação da lógica do backend.
- **web-data-viz:** API ou recurso utilizado no projeto, conforme sua implementação existente.
- **MySQL:** banco de dados para armazenar e consultar as informações da aplicação.
- **Máquina virtual (VM):** ambiente utilizado para hospedar ou executar o MySQL.
- **Chart.js:** biblioteca utilizada para criar gráficos na dashboard.

As funcionalidades previstas incluem login, cadastro, quiz e dashboard.

Antes de utilizar ou adicionar qualquer tecnologia, biblioteca ou dependência, o agente deve verificar o que já está instalado e como o projeto está implementado.

Não adicionar frameworks ou bibliotecas desnecessários sem a autorização do desenvolvedor.

## Comandos

Os comandos inicialmente previstos para trabalhar com o projeto são:

- `npm install`: instala as dependências declaradas no projeto.
- `npm start`: inicia a aplicação conforme o script definido no `package.json`.

Antes de executar comandos, verificar se o projeto possui os arquivos e as configurações necessários.

Não alterar o `package.json`, adicionar dependências ou modificar scripts sem autorização prévia.

Caso algum comando não funcione, analisar a causa e explicar o problema antes de propor alterações.

## Arquitetura

A arquitetura deve ser identificada a partir da estrutura real do projeto.

Antes de implementar funcionalidades, o agente deve analisar os arquivos e diretórios existentes para compreender como o frontend, o backend, a API e o banco de dados se relacionam.

### Organização do projeto

- Identificar as pastas responsáveis pelo frontend, backend, estilos, scripts, recursos visuais e demais componentes existentes.
- Identificar os arquivos responsáveis pela conexão com o banco de dados e pela comunicação com a API.
- Verificar como as páginas compartilham estilos, scripts e componentes.
- Seguir a organização existente ao criar novos arquivos.
- Não criar estruturas de pastas, camadas ou abstrações desnecessárias.

### Fluxo de uma funcionalidade

Ao analisar ou implementar uma funcionalidade, identificar:

1. Onde a interação acontece na interface.
2. Qual código JavaScript trata essa interação.
3. Se há comunicação com o backend ou com uma API.
4. Como os dados são consultados, processados e armazenados no MySQL, quando aplicável.
5. Como o resultado retorna à interface e é apresentado ao usuário.

Esse fluxo deve ser explicado de maneira didática, de acordo com a implementação real.

### Implementação de novas funcionalidades

Antes de propor alterações, o agente deve identificar os arquivos envolvidos, explicar quais mudanças seriam necessárias e apresentar um plano de implementação.

O plano deve reunir todas as alterações necessárias para atender à solicitação, indicando os arquivos afetados e o objetivo de cada mudança.

O agente deve aguardar a aprovação explícita do desenvolvedor antes de iniciar a implementação. Após a aprovação, poderá executar todas as alterações previstas no plano aprovado sem solicitar autorização para cada arquivo individualmente.

Caso seja necessário realizar alterações que não estejam contempladas no plano aprovado, o agente deverá apresentar as mudanças adicionais e solicitar uma nova autorização.

A implementação deve respeitar a arquitetura existente e priorizar o reaproveitamento do código atual, sem introduzir complexidade desnecessária.

## Padrões de desenvolvimento

### JavaScript

- Utilizar `let` para declarar variáveis, conforme a preferência do desenvolvedor.
- Priorizar código simples, legível e fácil de compreender.
- Evitar abstrações, padrões de projeto e soluções avançadas quando uma implementação direta atender à necessidade.
- Utilizar funções com responsabilidades claras.
- Evitar duplicação desnecessária de código.
- Explicar os conceitos novos utilizados durante as implementações.
- Utilizar apenas estruturas básicas: `for`, `if/else`, `else if` e `function`.
- Não utilizar arrow functions, `.map`, `.filter`, `.forEach`, spread, destructuring nem outras sintaxes avançadas.
- As regras de JavaScript acima valem para o frontend e para o restante do projeto. Os arquivos do fluxo de rotas têm uma exceção, descrita na seção "Rotas da API".
- Utilizar JavaScript puro. A única biblioteca permitida é o Chart.js, já prevista para a dashboard.

### Manipulação do DOM

- Para pegar elementos, utilizar `document.querySelector`, `document.querySelectorAll` e `document.getElementById`.
- Para percorrer os elementos retornados pelo `querySelectorAll`, utilizar o `for`.
- Para esconder ou mostrar elementos, utilizar `style.display = "none"` e `style.display = "flex"`.
- Para criar elementos novos, utilizar `createElement` e `appendChild`.
- Para alterar estilos por meio de classes, utilizar `classList.add`, `classList.remove` e `classList.contains`.
- Não adicionar atributos ARIA (`aria-*`) ao HTML nem código JavaScript para manipulá-los, conforme a preferência do desenvolvedor por código mais simples nesta etapa do aprendizado.

### Rotas da API

O desenvolvedor conhece pouco sobre rotas. Ao criar ou alterar uma rota, o agente deve ensinar o fluxo e seguir o documento `PASSO_A_PASSO_CRIAR_ROTA_NA_API.md`, localizado na pasta `DOCUMENTOS_DE_APOIO`.

- Ler o documento antes de montar o plano de implementação.
- Seguir os passos na ordem descrita no documento, sem pular etapas e sem criar uma estrutura própria.
- Ensinar o fluxo completo da requisição, de acordo com a implementação real do projeto: de onde ela sai na interface, por quais arquivos passa até chegar ao banco de dados e como a resposta volta para a tela.
- Explicar, a cada passo, o papel do arquivo que está sendo criado ou alterado e por que ele é necessário.
- Se o documento conflitar com alguma regra deste arquivo (além da exceção de JavaScript descrita abaixo) ou com o código existente, apontar a incoerência e perguntar ao desenvolvedor antes de seguir.

#### Exceção às regras de JavaScript nos arquivos de rotas

- Nos arquivos do fluxo de rotas (`app.js`, os arquivos de `routes`, `controllers` e `models`), o agente pode utilizar tudo o que o documento utiliza e o padrão já existente nesses arquivos, mesmo que as regras de JavaScript acima proíbam. Isso inclui `var`, `const`, arrow functions, `.then()` e `.catch()`, template strings e a forma abreviada de exportar objetos com `module.exports`.
- Nessas rotas, esta exceção tem prioridade sobre as regras de JavaScript acima, inclusive sobre o uso de `let`.
- A exceção vale apenas para esses arquivos. No frontend e no restante do projeto, continuam valendo as regras de JavaScript e de DOM.
- Quando usar um conceito dessa exceção, explicar o que ele é e por que está sendo usado (por exemplo, o que é uma promise e para que servem o `.then()` e o `.catch()`).

### Nomenclatura

Utilizar o padrão `snake_case` para nomes de arquivos, variáveis, funções, identificadores HTML e demais elementos nomeados pelo desenvolvedor, sempre que tecnicamente aplicável.

Exemplos:

- Arquivo: `login_usuario.js`
- Variável: `nome_usuario`
- Função: `validar_cadastro()`
- Identificador HTML: `ipt_email_usuario`

Respeitar as limitações e convenções das tecnologias utilizadas, especialmente quando uma biblioteca ou API exigir nomes específicos.

### HTML e CSS

- Manter o HTML organizado e semanticamente adequado.
- Utilizar nomes consistentes para classes e identificadores CSS.
- Evitar duplicação desnecessária de regras de estilo.
- Preservar o design e o comportamento existentes.
- Priorizar soluções CSS simples antes de recorrer a JavaScript para resolver problemas exclusivamente visuais.
- Não alterar elementos visuais fora do escopo solicitado.
- Utilizar apenas flexbox nos layouts de CSS. Nunca utilizar `display: grid`.

### Commits

Quando houver necessidade de criar mensagens de commit, utilizar o padrão Conventional Commits.

Tipos previstos:

- `feat`: nova funcionalidade.
- `fix`: correção de problema.
- `docs`: documentação.
- `style`: alterações de formatação que não modificam a lógica.
- `refactor`: reorganização interna do código sem mudança intencional de comportamento.
- `perf`: melhoria de desempenho.

Exemplos:

- `feat: adicionar quiz de matchups`
- `fix: corrigir validacao do cadastro`
- `docs: atualizar instrucoes do projeto`

Não criar commits sem autorização explícita.

## Cuidados e restrições

### Autorização para alterações

**Nenhuma alteração nos arquivos do projeto deve ser realizada sem a autorização prévia do desenvolvedor.**

Antes de implementar qualquer mudança, o agente deve:

1. Analisar o código e identificar a causa ou a necessidade da alteração.
2. Explicar o problema ou o objetivo da mudança.
3. Informar quais arquivos serão afetados.
4. Apresentar um plano com as alterações propostas e explicar por que cada uma é necessária.
5. Aguardar a aprovação explícita do desenvolvedor.

Após a aprovação, executar o conjunto de alterações descrito no plano, sem ampliar o escopo por iniciativa própria.

Se surgir a necessidade de realizar mudanças adicionais, apresentar uma nova proposta e aguardar autorização.

### Preservação do código existente

- Não refatorar partes do projeto sem autorização.
- Não reescrever arquivos inteiros quando uma alteração localizada for suficiente.
- Não remover funcionalidades, estilos, componentes ou trechos de código sem autorização.
- Não modificar configurações, dependências ou estrutura de pastas por iniciativa própria.
- Não realizar alterações adicionais apenas por considerar que o código poderia ser melhorado.
- Se identificar problemas fora do escopo solicitado, explicá-los e pedir autorização antes de corrigi-los.

### Aprendizado do desenvolvedor

O projeto tem como um de seus principais objetivos o aprendizado.

Por isso, toda implementação deve ser acompanhada de uma explicação que apresente:

- O que foi alterado.
- Por que a alteração foi necessária.
- Como o código funciona.
- Como os componentes envolvidos se relacionam.
- Quais conceitos novos foram utilizados.

Sempre que possível, explicar o raciocínio passo a passo e evitar simplesmente fornecer código pronto sem contextualização.

Não presumir conhecimentos avançados do desenvolvedor. Introduzir conceitos novos gradualmente e esclarecer termos técnicos quando necessário.

Além disso, em toda implementação que envolva código:

- Explicar cada comando novo utilizado em uma frase simples.
- Comentar o código em português, dizendo o que cada bloco faz.
- No final, indicar onde o desenvolvedor mexe para mudar itens como texto, cor, quantidade de cards e nome de classe.
- Se existir uma forma simples e uma forma avançada de resolver, utilizar a simples e avisar que a outra existe.

### Segurança e integridade dos dados

- Não executar comandos destrutivos ou operações que possam apagar ou modificar dados importantes sem autorização explícita.
- Não alterar o banco de dados, suas tabelas ou seus registros sem autorização.
- Não presumir que uma operação funcionou sem verificar seu resultado.

## Regra geral

Antes de implementar qualquer alteração, seguir as tecnologias, a arquitetura, as convenções e as restrições descritas neste documento.

Caso alguma informação esteja ausente, analisar o código existente e seguir os padrões já adotados no projeto, sem inventar estruturas ou comportamentos.

Em caso de dúvida, apresentar a análise e solicitar esclarecimentos ao desenvolvedor.

**A prioridade é desenvolver uma aplicação funcional e bem organizada, enquanto o desenvolvedor compreende o código e evolui tecnicamente.**
