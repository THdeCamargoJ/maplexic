lexer grammar MaplexicLexer;

/* Definitions */
MAP: 'map' ;
OBJECT: 'obj' ;
AREA: 'area' ;

/* Simple properties */
ALGORITHM: 'algorithm' ;
HEIGHT: 'height' ;
LACUNARITY: 'lacunarity' ;
NOISE: 'noise' ;
OCTAVES: 'octaves' ;
ORIENTATION: 'orientation' ;
SEED: 'seed' ;
SHAPE: 'shape' ;
WIDTH: 'width' ;

/* Composed properties */
POS: 'pos' ;
PROCEDURAL: 'procedural' ;
SIZE: 'size' ;

/* Specific properties */
COLOR: 'color' ;
IMG: 'img' ;

/* Keywords */
RGB: 'rgb' ;
URL: 'url' ;

/* Unities */
PIXEL: 'px' ;
PERCENT: '%' ;

NUMBER: [0-9]+ ('.' [0-9]+)? ;
ID: [a-zA-Z_][a-zA-Z0-9_]* ;

STRING: '"' ( ESCSEQ | ~["\\] )* '"' ;

fragment ESCSEQ: '\\' (["\\/bfnrt] | UNICODE) ;
fragment UNICODE: 'u' HEX HEX HEX HEX ;
fragment HEX: [0-9a-fA-F] ;

HEXCOLOR: '#' HEX HEX HEX HEX HEX HEX ;

HASH: '#' ;
COMMA: ',' ;
SEMI: ';' ;
COLON: ':' ;
LBRACE: '{' ;
RBRACE: '}' ;
LPAR: '(' ;
RPAR: ')' ;

WS: [ \t\r\n]+ -> skip ;
COMMENT: '//' ~[\r\n]* -> skip ;
