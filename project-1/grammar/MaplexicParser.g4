parser grammar MaplexicParser;

options { tokenVocab = MaplexicLexer; }

map: MAP ID LBRACE defList? (COMMA propDeclList)? RBRACE EOF 
    | MAP ID LBRACE propDeclList? (COMMA defList)? RBRACE EOF ;

definable: OBJECT
    | AREA ;

def: definable ID LBRACE defList? (COMMA propDeclList)? RBRACE
    | definable ID LBRACE propDeclList? (COMMA defList)? RBRACE ;

defList: def (COMMA def)* ;

simpleProp: NOISE
    | ALGORITHM
    | OCTAVES
    | LACUNARITY
    | SHAPE
    | SEED
    | WIDTH
    | ORIENTATION
    | HEIGHT ;

composedProp: PROCEDURAL 
    | SIZE 
    | IMG ;

rgb: RGB LPAR NUMBER COMMA NUMBER COMMA NUMBER RPAR ;

url: URL LPAR STRING RPAR ;

specificPropDecl: COLOR COLON rgb
    | COLOR COLON HEXCOLOR 
    | URL COLON url 
    | POS COLON LPAR NUMBER COMMA NUMBER RPAR ;

unity: PIXEL
    | PERCENT ;

propDecl: simpleProp COLON STRING 
    | simpleProp COLON NUMBER 
    | simpleProp COLON NUMBER unity
    | specificPropDecl
    | composedProp COLON LBRACE propDeclList? RBRACE ;

propDeclList: propDecl (COMMA propDecl)* ;

