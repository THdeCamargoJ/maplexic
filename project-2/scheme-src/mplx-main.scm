(load "mplx-prms.scm")

(display "Testando a primitiva\n")


(display "Criando mapas…\n")
(cria-mapa 'mapa-a 1000 1000)
(cria-mapa 'mapa-b 2000 1200)
(display mapas)
(newline)

(display "Adicionando objetos ao mapa-a\n")
(adiciona-objeto 'mapa-a 'obj-1 '(100 100))
(adiciona-objeto 'mapa-a 'obj-2 '(100 80))
(adiciona-objeto 'mapa-a 'obj-3 '(80 80))

(display mapas)
(newline)

(display "Localizando o mapa-a\n")
(display (localiza 'mapa 'mapa-a))
(newline)

(display "Localizando obj-1 no mapa-a\n")
(display (localiza 'objeto 'obj-1 'mapa-a))
(newline)

(display "Modificando nome do obj-1 para obj-modificado\n")
(altera 'nome (localiza 'objeto 'obj-1 'mapa-a) 'obj-modificado 'mapa-a)
(display (localiza 'objeto 'obj-modificado 'mapa-a))
(newline)