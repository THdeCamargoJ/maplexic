lexer grammar MaplexicLexer;

MAP: 'MAPA' | 'MAP' ;

/********************************* Punctuation ********************************/
HASH: '#' ;

DOT: '.' ;
COMMA: ',' ;
SEMI: ';' ;

QUOTE: '"' | '\'' ;

LBRACK: '[' ;
RBRACK: ']' ;
LPAREN: '(' ;
RPAREN: ')' ;

IMPORTANT: '!' ;

ASSIGN: '=' ;
COLON: ':' ;

/********************************* Definitions ********************************/
STRUCTURE: 'ESTRUTURA' | 'STRUCTURE' ;
CONTINENT: 'CONTINENTE' | 'CONTINENT' ;
ISLAND: 'ILHA' | 'ISLAND' ;
REGION: 'REGIÃO' | 'REGION' ;
BIOME: 'BIOMA' | 'BIOME' ;


/****************************** Simple properties *****************************/
SPACING: 'ESPAÇAMENTO' | 'SPACING';

// Procedural properties
NOISE: 'INTERFERÊNCIA' | 'NOISE';
OCTAVES: 'OCTAVES' ;
SEED: 'SEMENTE' | 'SEED';
LACUNARITY: 'LACUNAS' | 'LACUNARITY';
CONTINENTS: 'CONTINENTES' | 'CONTINENTS' ;

// Visual properties
ORIENTATION: 'ORIENTAÇÃO' | 'ORIENTATION';
SHAPE: 'FORMA' | 'SHAPE';
WIDTH: 'LARGURA' | 'WIDTH';
HEIGHT: 'ALTURA' | 'HEIGHT';
TEXTURE: 'TEXTURA' | 'TEXTURE';

// Toggle properties
ISLANDS: 'ILHAS' | 'ISLANDS';
RIVERS: 'RIOS' | 'RIVERS';
LAKES: 'LAGOS' | 'LAKES';


/***************************** Composed properties ****************************/
CANVAS: 'TELA' | 'CANVAS';
STRUCTURES: 'ESTRUTUAS' | 'STRUCTURES';
REGIONS: 'REGIÕES' | 'REGIONS';
PROCEDURAL: 'PROCEDURAL';
SIZE: 'TAMANHO' | 'SIZE';


/***************************** Specific properties ****************************/
COLOR: 'COR' | 'COLOR' ;
IMG: 'IMAGEM' | 'IMAGE' ;
ICON: 'ÍCONE' | 'ICON' ;

CENTERED: 'CENTRADO' | 'CENTERED' ;
LOCATION: 'LOCALIZAÇÃO' | 'LOCATION' ;

/******************************** Conjunctions ********************************/
AND: 'E' | 'AND' ;
IN: 'NO' | 'NA' | 'EM' | 'IN' ;
OF: 'DE' | 'DO' | 'DA' | 'OF' ;


/********************************** Keywords **********************************/
NORTH: 'NORTE' | 'NORTH' ;
SOUTH: 'SUL' | 'SOUTH' ;
EAST: 'LESTE' | 'EAST' ;
WEST: 'OESTE' | 'WEST' ;
SOUTHEAST: 'SUDESTE' | 'SOUTHEAST' ;
SOUTHWEST: 'SUDOESTE' | 'SOUTHWEST' ;
NORTHEAST: 'NORDESTE' | 'NORTHEAST' ;
NORTHWEST: 'NOROESTE' | 'NORTHWEST' ;

EQUATOR: 'EQUADOR' | 'EQUATOR' ;
MERIDIAN: 'MERIDIANO' | 'MERIDIAN' ;
NORTHERN_HEMISPHERE: 'HEMISFÉRIO NORTE' | 'NORTHERN HEMISPHERE' ;
SOUTHERN_HEMISPHERE: 'HEMISFÉRIO SUL' | 'SOUTHERN HEMISPHERE' ;
WESTERN_HEMISPHERE: 'HEMISFÉRIO OCIDENTAL' | 'WESTERN HEMISPHERE' ;
EASTERN_HEMISPHERE: 'HEMISFÉRIO ORIENTAL' | 'EASTERN HEMISPHERE' ;

CENTER: 'CENTRO' | 'CENTER' ;
LEFT: 'ESQUERDA' | 'LEFT' ;
RIGHT: 'DIREITA' | 'RIGHT' ;
TOP: 'ACIMA' | 'TOP' ;
BOTTOM: 'ABAIXO' | 'BOTTOM' ;

TRUE: 'V' | 'VERDADEIRO' | 'T' | 'TRUE' ;
FALSE: 'F' | 'FALSO' | 'FALSE' ;

BEGIN: 'INÍCIO' | 'BEGIN' ;
END: 'FIM' | 'END' ;


/*********************************** Unities **********************************/
PIXEL: 'px' ;
PERCENT: '%' ;
METER: 'm' ;
KILOMETER: 'km' ;
ANGLE: '°' | 'deg' | 'ang' ;

/************************************ Types ***********************************/
// definitions
fragment DIGIT: [0-9] ;
fragment LETTER: [a-zA-Z] ;
fragment UNICODE: 'u' HEX HEX HEX HEX ;
fragment HEX: [0-9a-fA-F] ;

// primitives
INT: DIGIT+ ;
FLOAT: DIGIT+ DOT DIGIT+ | DOT DIGIT+ ;
STRING: QUOTE .*? QUOTE ;

// composed
ID: ~('.' | '\n' | ' ' | [0-9])* ~('.' | ' ' | '\n' | ',' | ';' | ':' | '(' | ')' | '{' | '}' | '[' | ']' | '"' | '\'' | '#' | '!' ) ;

// special
HEXCOLOR: HASH HEX HEX HEX HEX HEX HEX ;
RGBCOLOR: 'rgb' LPAREN INT COMMA INT COMMA INT RPAREN ;
URL: 'url' LPAREN .+? RPAREN ;

/********************************* Skip tokens ********************************/

NEWLINE: '\n' ;
WS: [ \t\r\n]+ -> skip ;
LINE_COMMENT: '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT: '/*' .*? '*/' -> skip ;
