parser grammar MaplexicParser;

options { tokenVocab = MaplexicLexer; }

map: BEGIN OF MAP id NEWLINE (definable_body NEWLINE)* END OF MAP .*? EOF ;

definable: STRUCTURE
    | CONTINENT
    | ISLAND
    | REGION
    | BIOME ;

definable_decl: BEGIN OF definable id NEWLINE (definable_body NEWLINE)* END OF definable ;

definable_body: prop_decl | definable_decl ;

simple_prop: SPACING
    | CONTINENTS
    | NOISE
    | OCTAVES
    | SEED
    | LACUNARITY
    | ORIENTATION
    | SHAPE
    | WIDTH
    | HEIGHT
    | COLOR
    | IMG
    | ICON
    | TEXTURE
    | ISLANDS
    | RIVERS
    | LAKES ;

composed_prop: CANVAS
    | CONTINENTS
    | STRUCTURES
    | REGIONS
    | PROCEDURAL
    | ICON 
    | LOCATION
    | IMG
    | SIZE ;

unity: PIXEL
    | PERCENT
    | METER
    | KILOMETER
    | ANGLE ;

number: (INT | FLOAT) unity? ;

bool: TRUE | FALSE ;

simple_prop_decl: simple_prop COLON ( STRING | bool )
    | simple_prop COLON ( HEXCOLOR | RGBCOLOR | URL ) 
    | simple_prop COLON number
    | simple_prop COLON id ;

composed_prop_decl: composed_prop LPAREN (NEWLINE prop_decl | prop_decl NEWLINE)* RPAREN ;

prop_decl: simple_prop_decl | composed_prop_decl ;

id: ID* ID ;