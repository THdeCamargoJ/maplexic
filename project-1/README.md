# DSL Maplexic

## Descrição Resumida da DSL

A **Maplexic** é uma Domain Specific Language (DSL) voltada para a criação procedural de mapas 2D para jogos.

**Contextualização:** A criação de mapas para jogos envolve ferramentas procedurais que, muitas vezes, exigem conhecimento técnico aprofundado. A Maplexic propõe uma camada de abstração que oculta essa complexidade, permitindo que designers — inclusive não-programadores — projetem mapas de forma procedural com facilidade.

**Motivação:** Acreditamos que o designer deve focar no lado criativo da construção de mapas, sem precisar gastar energia cognitiva com os detalhes técnicos das ferramentas procedurais. A linguagem atua como essa camada de abstração entre a intenção criativa e a geração procedural.

**Relevância:** A Maplexic é agnóstica de plataforma (*platform agnostic*) e acessível a todos (*procedural for all*), democratizando o acesso à geração procedural de mapas. Entre os elementos-chave contemplados pela linguagem estão: estradas e ruas, pontos de referência e de interesse, símbolos e ícones, e escala e legenda.

## Slides

> Coloque aqui o link para o PDF da apresentação.

## Sintaxe da Linguagem na Forma de Tutorial

> Apresente um guia de sintaxe da linguagem na forma explicativa.

## Gramática da Linguagem

A gramática da Maplexic é definida utilizando ANTLR4, separada em dois arquivos: um lexer e um parser.

### Lexer (`MaplexicLexer.g4`)

O lexer define os tokens da linguagem, organizados nas seguintes categorias:

- **Definições:** `map`, `obj`, `area` — palavras-chave para declarar mapas, objetos e áreas.
- **Propriedades simples:** `algorithm`, `height`, `lacunarity`, `noise`, `octaves`, `orientation`, `seed`, `shape`, `width` — configuram características individuais dos elementos.
- **Propriedades compostas:** `pos`, `procedural`, `size`, `img` — agrupam sub-propriedades dentro de blocos.
- **Propriedades específicas:** `color`, `img` — permitem atribuir cores (via `rgb(r,g,b)` ou hexadecimal `#RRGGBB`) e imagens (via `url("...")`).
- **Unidades:** `px` (pixels) e `%` (percentual).
- **Literais:** números inteiros e decimais (`NUMBER`), identificadores (`ID`), strings entre aspas duplas (`STRING`) com suporte a sequências de escape, e cores hexadecimais (`HEXCOLOR`).
- **Outros:** comentários de linha (`// ...`) e espaços em branco são ignorados.

### Parser (`MaplexicParser.g4`)

O parser define a estrutura hierárquica da linguagem:

```antlr
map         : MAP ID '{' defList? (',' propDeclList)? '}'
            | MAP ID '{' propDeclList? (',' defList)? '}' ;

definable   : OBJECT | AREA ;

def         : definable ID '{' defList? (',' propDeclList)? '}'
            | definable ID '{' propDeclList? (',' defList)? '}' ;

defList     : def (',' def)* ;

simpleProp  : NOISE | ALGORITHM | OCTAVES | LACUNARITY
            | SHAPE | SEED | WIDTH | ORIENTATION | HEIGHT ;

composedProp: PROCEDURAL | SIZE | IMG ;

propDecl    : simpleProp ':' STRING
            | simpleProp ':' NUMBER
            | simpleProp ':' NUMBER unity
            | specificPropDecl
            | composedProp ':' '{' propDeclList? '}' ;

specificPropDecl
            : COLOR ':' rgb
            | COLOR ':' HEXCOLOR
            | URL ':' url
            | POS ':' '(' NUMBER ',' NUMBER ')' ;

rgb         : RGB '(' NUMBER ',' NUMBER ',' NUMBER ')' ;
url         : URL '(' STRING ')' ;
unity       : PIXEL | PERCENT ;

propDeclList: propDecl (',' propDecl)* ;
```

**Principais características da gramática:**

- Um programa Maplexic consiste em uma declaração `map` com um identificador e um bloco delimitado por `{ }`.
- Dentro de um mapa, é possível declarar **objetos** (`obj`) e **áreas** (`area`), cada um com seu próprio bloco de propriedades e sub-definições.
- As definições são **aninháveis**: um objeto pode conter outros objetos ou áreas internamente, permitindo composição hierárquica de mapas.
- Propriedades e definições são separadas por vírgulas.

## Exemplos Selecionados

### Exemplo: Mapa de uma Dungeon

O exemplo abaixo define um mapa de dungeon com uma sala principal contendo uma porta e um cofre:

```
map Dungeon {
  size: { width: 100px, height: 80px },
  obj SalaPrincipal {
    size: { width: 20px, height: 15px },
    pos: (40, 30),
    obj Porta {
      size: { width: 1px, height: 2px },
      pos: (0, 0)
    },
    obj Cofre {
      pos: (5, 5)
    }
  }
}
```

**Explicação do exemplo:**

- `map Dungeon { ... }` — Declara um mapa chamado *Dungeon* com dimensões de 100×80 pixels.
- `obj SalaPrincipal { ... }` — Define um objeto *SalaPrincipal* de 20×15 pixels, posicionado nas coordenadas (40, 30) do mapa.
- `obj Porta { ... }` — Objeto aninhado dentro de *SalaPrincipal*, representando uma porta de 1×2 pixels na posição (0, 0) relativa à sala.
- `obj Cofre { ... }` — Outro objeto aninhado, um cofre posicionado em (5, 5) dentro da sala.

Este exemplo demonstra as principais capacidades da linguagem nesta etapa: **declaração hierárquica** de elementos, uso de **propriedades compostas** (`size`) e **posicionamento** via coordenadas (`pos`).

# Referências Bibliográficas

> Lista de artigos, links e referências bibliográficas.
