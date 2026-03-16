# DSL Maplexic

## Descrição Resumida da DSL

A **Maplexic** é uma Domain Specific Language (DSL) voltada para a criação procedural de mapas 2D para jogos.

**Contextualização:** A criação de mapas para jogos envolve ferramentas procedurais que, muitas vezes, exigem conhecimento técnico aprofundado. A Maplexic propõe uma camada de abstração que oculta essa complexidade, permitindo que designers — inclusive não-programadores — projetem mapas de forma procedural com facilidade.

**Motivação:** Acreditamos que o designer deve focar no lado criativo da construção de mapas, sem precisar gastar energia cognitiva com os detalhes técnicos das ferramentas procedurais. A linguagem atua como essa camada de abstração entre a intenção criativa e a geração procedural.

**Relevância:** A Maplexic é agnóstica de plataforma (*platform agnostic*) e acessível a todos (*procedural for all*), democratizando o acesso à geração procedural de mapas. Entre os elementos-chave contemplados pela linguagem estão: estradas e ruas, pontos de referência e de interesse, símbolos e ícones, e escala e legenda.

## Slides

[Maplexic](https://github.com/THdeCamargoJ/maplexic/blob/main/project-1/Slides%20Maplexic.pdf)

## Sintaxe da Linguagem na Forma de Tutorial

### 1. Criando um mapa

Todo programa Maplexic começa com a declaração de um `map`. O mapa é o elemento raiz que contém todos os outros elementos. Ele recebe um nome identificador e um bloco `{ }` com suas propriedades e definições internas.

```
map MeuMapa {
}
```

### 2. Definindo dimensões com `size`

A propriedade `size` é uma propriedade composta que agrupa `width` e `height`. Os valores numéricos podem usar as unidades `px` (pixels) ou `%` (percentual).

```
map MeuMapa {
  size: { width: 200px, height: 150px }
}
```

### 3. Adicionando objetos (`obj`)

Objetos representam elementos individuais no mapa — itens, personagens, portas, decorações, etc. São declarados com a palavra-chave `obj`, seguida de um nome e um bloco de propriedades.

```
map MeuMapa {
  size: { width: 200px, height: 150px },
  obj Arvore {
    pos: (10, 20),
    size: { width: 5px, height: 8px }
  }
}
```

A propriedade `pos` define a posição do objeto como um par de coordenadas `(x, y)`.

### 4. Adicionando áreas (`area`)

Áreas representam regiões do mapa — biomas, zonas, terrenos, etc. A sintaxe é análoga à de objetos, mas utiliza a palavra-chave `area`.

```
map MeuMapa {
  size: { width: 200px, height: 150px },
  area Floresta {
    size: { width: 80px, height: 60px },
    pos: (0, 0)
  }
}
```

### 5. Aninhando definições

Um dos recursos centrais da Maplexic é a **composição hierárquica**: objetos e áreas podem ser aninhados uns dentro dos outros, criando estruturas complexas. As coordenadas de `pos` dos elementos filhos são relativas ao elemento pai.

```
map Castelo {
  size: { width: 300px, height: 300px },
  area Patio {
    size: { width: 100px, height: 100px },
    pos: (100, 100),
    obj Fonte {
      pos: (50, 50),
      size: { width: 10px, height: 10px }
    }
  }
}
```

### 6. Cores

Elementos podem receber cores de duas formas: via função `rgb` ou via código hexadecimal.

```
map MeuMapa {
  size: { width: 100px, height: 100px },
  area Lago {
    size: { width: 30px, height: 20px },
    pos: (10, 10),
    color: rgb(0, 100, 200)
  },
  area Campo {
    size: { width: 40px, height: 40px },
    pos: (50, 50),
    color: #2E8B57
  }
}
```

### 7. Imagens

É possível associar uma imagem a um elemento através da propriedade `img`, usando a função `url` com o caminho do recurso entre aspas.

```
map MeuMapa {
  size: { width: 100px, height: 100px },
  obj Tesouro {
    pos: (25, 25),
    img: { url: url("assets/tesouro.png") }
  }
}
```

### 8. Geração procedural

A propriedade composta `procedural` agrupa parâmetros de geração procedural como `noise`, `algorithm`, `seed`, `octaves` e `lacunarity`.

```
map Terreno {
  size: { width: 256px, height: 256px },
  procedural: {
    noise: "perlin",
    algorithm: "diamond-square",
    seed: 42,
    octaves: 6,
    lacunarity: 2.0
  }
}
```

### 9. Comentários

Comentários de linha são iniciados por `//` e ignorados pelo parser. Use-os para documentar seu mapa.

```
// Mapa de exemplo
map Demo {
  size: { width: 50px, height: 50px }  // dimensões do mapa
}
```

### 10. Separação de elementos

Propriedades e definições dentro de um mesmo bloco são separadas por **vírgulas**.

```
map Aldeia {
  size: { width: 200px, height: 200px },
  obj Casa1 {
    pos: (10, 10),
    size: { width: 20px, height: 20px }
  },
  obj Casa2 {
    pos: (50, 10),
    size: { width: 20px, height: 20px }
  },
  obj Poco {
    pos: (30, 40)
  }
}
```

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
