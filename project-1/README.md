# Maplexic

## Sobre o projeto

Se o objetivo da linguagem é expressar[^michaelis-online], então, pela própria natureza do verbo, exige-se complemento: expressar o quê e, mais, expressar a quem? Dentro do escopo das DSLs, a motivação para criá-las vem da tentativa de criar uma ferramenta que facilite a expressão do quê e do como se fazer algo; para a **Maplexic**, esse algo são os mapas de fantasia em 2D.

Usualmente esses mapas são elementos usados para auxiliar na criação de narrativas[^caeora-theory-of-maps][^roberts], seja moldando-as ou sendo por elas moldados. Mapa e narrativa andam, portanto, lado a lado no processo criativo. Dentro desse contexto, o público alvo da Maplexic não são cartógrafos ou designers de mapas, o público alvo são os criadores de narrativas. E, para que seja útil a esses criadores, a linguagem deve ser o mais próxima quanto possível da linguagem natural, para evitar que o criador gaste sua energia cognitiva com as nuances da linguagem ao invés de focar no processo criativo.

A simplicidade da Maplexic deve se expandir também para as complexidades por trás da criação de mapas realistas, porque o realismo é elemento útil do ponto de vista narrativo para melhorar a imersão no mundo que se está criando[^churchill][^appleby]. Esse realismo exige seguir certas regras: corpos de água têm fluxos das áreas mais altas para as mais baixas, montanhas estão localizadas na junção de placas tectônicas, desertos encontram-se nos mediterrâneos e nos polos etc[^caeora-mapmaking-geography-and-science]. Existem inúmeras questões topográficas a serem consideradas no processo de criação de um mapa, as quais a Maplexic considera complicações para o processo criativo de uma estória e das quais se compromete a cuidar para que o criador possa focar em questões mais importantes para a narrativa.


## Slides

[Maplexic](https://github.com/THdeCamargoJ/maplexic/blob/main/project-1/assets/Slides%20Maplexic.pdf)

## Sintaxe da Linguagem na Forma de Tutorial

### 1. Criando um mapa

Em Maplexic a definição de um mapa começa com `INÍCIO DO MAPA <id>` ou `BEGIN OF MAP <id>` e termina com `FIM DO MAPA` ou `END OF MAP`. Tudo referente ao mapa deve estar dentro desta estrutura; tudo após o fim do mapa será ignorado.

```
BEGIN OF MAP My Beautiful Map

END OF MAP
```

Mapas podem ser 

### 3. Definindo regiões e estruturas



### 4. Adicionando áreas (`area`)



### 5. Aninhando definições



### 6. Cores



### 7. Imagens



### 8. Geração procedural



### 9. Comentários



### 10. Separação de elementos



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



**Principais características da gramática:**



## Exemplos Selecionados

### Exemplo: Mapa de uma Dungeon



**Explicação do exemplo:**

- `map Dungeon { ... }` — Declara um mapa chamado *Dungeon* com dimensões de 100×80 pixels.


# Referências Bibliográficas

[^michaelis-online]: Michaelis online. Linguagem, https://michaelis.uol.com.br/moderno-portugues/busca/portugues-brasileiro/linguagem/

[^caeora-theory-of-maps]: Caeora. Theory of Maps. Acesso: https://www.caeora.com/post/theory-of-maps

[^roberts]: Jonathan Roberts. Worldbuilding by map. Acesso: https://medium.com/@jproberts00/worldbuilding-by-map-c5a55aa31fb1

[^caeora-mapmaking-geography-and-science]: Caeora. Mapmaking, Geography and Science. Acesso https://www.caeora.com/post/mapmaking-geography-science

[^churchill]: Carl Churchill. Why Bother With Fantasy Terrain? Acesso: https://churchillgeo.com/making-terrain-for-fantasy-maps-from-scratch/

[^killion]: Bob Killion. Coding a Fantasy World Map, Part I. Acesso: https://medium.com/@robertfkillion/coding-a-fantasy-world-map-part-i-b34f7b1e3407

[^appleby]: Kaeleb LD Appleby. Creating Realistic and Immersive Fantasy Worlds: A guide to mapmaking techniques. Acesso: https://www.kldappleby.com/blog/creating-realistic-and-immersive-fantasy-maps