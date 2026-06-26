# DSL `Maplexic`

## Descrição Resumida da DSL

Contextualização: O Maplexic é uma DSL construída sobre o Scheme focada na criação, manipulação e gestão de mapas para jogos.

Motivação: O desenvolvimento de mapas e a alocação de entidades em ambientes 2D geralmente exigem conhecimentos mais técnicos. O Maplexic visa abstrair a complexidade do gerenciamento de estado dessas estruturas, oferecendo uma sintaxe próxima do português para o design de fases sem muita dificuldade.

Relevância: A linguagem facilita o trabalho de game designers e desenvolvedores permitindo uma prototipação ágil de cenários. Utilizando as macros do Schemes, o Maplexic cria uma interface limpa que pode futuramente se integrar à geração procedural de mapas.
## Slides

> Coloque aqui o link para o PDF da apresentação parcial.

## Sintaxe da Linguagem na Forma de Tutorial

1. Criação de Mapas
Para inicializar um novo mapa, definimos seu nome, largura e altura.
`
(cria mapa 'nome-do-mapa com largura 1000 e altura 1000)
`
2. Adição de Objetos
Para popular o mapa, você pode inserir objetos passando o nome da entidade, o mapa de destino e a coordenada (X Y).
`
(adiciona 'nome-do-objeto ao 'nome-do-mapa em '(100 100))
`
3. Buscas e Localizações
É possível consultar o estado interno da engine buscando mapas inteiros ou objetos específicos dentro de um mapa.
`
(encontra mapa 'nome-do-mapa)
(encontra objeto 'nome-do-objeto no mapa 'nome-do-mapa)
`
4. Modificação de Atributos
A linguagem permite alterar as propriedades de entidades já instanciadas de forma dinâmica.
`
(muda 'nome do objeto 'objeto-antigo no mapa 'nome-do-mapa para 'objeto-novo)
`
## Gramática da Linguagem

(cria mapa 'id-mapa com largura numero e altura numero)

(adiciona 'id-objeto ao 'id-mapa em '(x y))

(encontra mapa 'id-mapa)

(encontra objeto 'id-objeto no mapa 'id-mapa)

(muda 'atributo do mapa 'id-mapa para novo-valor)

(muda 'atributo do objeto 'id-objeto no mapa 'id-mapa para novo-valor)

## Notebook
(https://github.com/THdeCamargoJ/maplexic/blob/projeto-2/project-2/maplexic-lisplike.ipynb)
## Exemplos Selecionados

Cria mapas:

`
(display "Criando mapas…\n")
(cria mapa 'mapa-principal com largura 1000 e altura 1000)
(cria mapa 'mapa-secundario com largura 2000 e altura 1200)
(display mapas)
(newline)
`

Adiciona objetos:

`
(display "Adicionando objetos ao mapa-principal")
(adiciona 'castelo ao 'mapa-principal em '(100 100))
(adiciona 'torre-mago ao 'mapa-principal em '(100 80))
(adiciona 'estabulo-vazio ao 'mapa-principal em '(80 80))
(newline)
(display mapas)
(newline)
`

Localiza o mapa principal:

`
(display "Localizando o mapa-principal\n")
(display (encontra mapa 'mapa-principal))
(newline)
`

Localiza objeto:

`
(display "Localizando torre-mago no mapa-principal\n")
(display (encontra objeto 'torre-mago no mapa 'mapa-principal))
`

Modifica nome do objeto:

`
(display "Modificando nome do obj-1 para obj-modificado\n")
(muda 'nome do objeto 'estabulo-vazio no mapa 'mapa-principal para 'estabulo-cheio)
(display (encontra objeto 'estabulo-cheio no mapa 'mapa-principal))
`
## Discussão e Conclusão

A ideia crua da DSL está funcionando, criar mapas e adicionar objetos a eles, os quais podem ser mudados. Apesar disso, falta definir algumas coisas para o rumo que a nossa linguagem tomará, por exemplo, por que usar macros e não funções e também parar de usar listas, preferindo o record.

# Trabalhos Futuros

Para o futuro, visamos implementar algo mais visual, com visualizações dos mapas criados, e talvez unir com a geração procedural de mapas.

# Referências Bibliográficas

https://dthompson.us/projects/chickadee.html
