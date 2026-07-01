# DSL `Maplexic`

## Descrição Resumida da DSL

Contextualização: O Maplexic é uma DSL construída sobre o Scheme focada na criação, manipulação e gestão de mapas para jogos.

Motivação: O desenvolvimento de mapas e a alocação de entidades em ambientes 2D geralmente exigem conhecimentos mais técnicos. O Maplexic visa abstrair a complexidade do gerenciamento de estado dessas estruturas, oferecendo uma sintaxe próxima do português para o design de fases sem muita dificuldade.

Relevância: A linguagem facilita o trabalho de game designers e desenvolvedores permitindo uma prototipação ágil de cenários. Utilizando as macros do Schemes, o Maplexic cria uma interface limpa que pode futuramente se integrar à geração procedural de mapas.
## Slides

> Coloque aqui o link para o PDF da apresentação parcial.

## Sintaxe da Linguagem na Forma de Tutorial

1. Definição de Esquemas
Antes de instanciar entidades, a linguagem permite definir a estrutura de dados que compõe mapas e objetos, informando os campos necessários.
`
(maplexic esquema mapa nome largura altura objetos)
(maplexic esquema objeto nome posicao largura altura cor)
`

2. Criação de Entidades (Mapas e Objetos)
Com os esquemas definidos, você pode criar instâncias passando os pares de campo e valor. O Maplexic suporta texturas nomeadas nativas (ex: floresta, agua, pedra) ou cores em hexadecimal.
`
(define mapa-principal (maplexic cria mapa nome mapa-principal largura 1000 altura 1000 objetos ()))
(define castelo (maplexic cria objeto nome castelo posicao (650 600) largura 300 altura 300 cor pedra))
`

3. Buscas e Localizações
É possível consultar o estado interno e os atributos de qualquer entidade registrada utilizando a palavra-chave encontra.
`
(maplexic encontra largura de mapa-principal)
`

4. Adição de Objetos ao Mapa
Para popular o cenário, você insere uma lista de objetos diretamente em um mapa existente.
`
(set! mapa-principal (maplexic adiciona (castelo) em mapa-principal))
`

5. Visualização
A DSL possui suporte nativo para renderizar o estado atual do mapa e seus objetos diretamente para um arquivo visual vetorial.
`
(mapa->svg mapa-principal "mapa-principal.svg")
`
## Gramática da Linguagem
A linguagem é controlada por uma macro principal (maplexic) que ramifica em quatro operações fundamentais:

    (Definição de Esquema): (maplexic esquema <tipo> <campo1> <campo2> ...)

    (Criação de Entidade): (maplexic cria <tipo> <campo1> <valor1> <campo2> <valor2> ...)

    (Consulta de Atributo): (maplexic encontra <campo> de <registro>)

    (Composição de Mapa): (maplexic adiciona (<objeto1> <objeto2> ...) em <mapa>)

## Notebook
(github.com/THdeCamargoJ/maplexic/blob/main/project-3/maplexic.ipynb)
## Exemplos Selecionados

Criando estruturas e o mapa base:
`
(display "Criando mapa...\n")
(maplexic esquema mapa nome largura altura objetos)
(maplexic esquema objeto nome posicao largura altura cor)
(define mapa-principal (maplexic cria mapa nome mapa-principal largura 1000 altura 1000 objetos ()))
`

Criando objetos com texturas validadas:
`
(display "Criando objetos com texturas...\n")
(define lago  (maplexic cria objeto nome lago posicao (250 650) largura 300 altura 250 cor agua))
(define heroi (maplexic cria objeto nome heroi posicao (560 580) largura 30 altura 40 cor "#ff552f"))
`

Consultando valores:
`
(display "Lendo largura:\n")
(display (maplexic encontra largura de mapa-principal))
`

Adicionando objetos e exportando para SVG:
`
(display "Adicionando objetos ao mapa-principal...\n")
(set! mapa-principal
  (maplexic adiciona (lago heroi) em mapa-principal))
(mapa->svg mapa-principal "mapa-principal.svg")
`
## Discussão e Conclusão

Com base no que desenvolvemos esse semestre, nossa linguagem passou por várias mudanças até chegarmos a essa versão final. A ideia original de usar geração procedural acabou se mostrando além do nosso escopo ideal, o que levou à mudança para uma linguagem mais generelizada para descrição de mapas.

A escolha de utilizar macros no Scheme nos permitiu uma sintaxe customizada, limpa e com validações em tempo de expansão (como a verificação de propriedades como as cores). A nossa última adição nessa parte do projeto, o visualizador de mapas em SVG, reflete bem como essa estrutura de dados se tornou prática e as mudanças que fizemos. Com ele, podemos visualizar como os objetos ficariam dispostos no mapa, com algumas opções de customização de tamanho e cor, apesar de bem cruas por enquanto.

# Trabalhos Futuros

Futuramente, visando algo que possa ser usado mais praticamente na área de desenvolvimento de jogos, adicionar suporte à sprites é uma ideia que pensamos, além de adicionar movimentos aos objetos. Essas são medidas que deixariam a nossa linguagem mais dinâmica e mais adequada para o uso em gamedev.

# Referências Bibliográficas

https://dthompson.us/projects/chickadee.html
