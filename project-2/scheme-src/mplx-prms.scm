(load "mplx-defs.scm")



;primitiva para acessar campos de um registro
(define (acessa item record)
  (cond ((eq? (car record) 'mapa) (list-ref record (cdr (assq item mapa-schema))))
        ((eq? (car record) 'objeto) (list-ref record (cdr (assq item objeto-schema))))
        (else (display "Registro desconhecido\n"))))


;primitiva para verificar se a entidade é a que estamos procurando
(define (igual? entidade nome-entidade) (eq? (acessa 'nome entidade) nome-entidade))


;primitiva para criar mapa:
(define (cria-mapa nome largura altura)
  (let ([novo-mapa (list 'mapa nome largura altura '())]) ;lista vazia para objetos
    (set! mapas (cons novo-mapa mapas))))


(define (localiza-mapa nome-mapa)
  (let ([mapa (car mapas)])
    (do [(resto mapas (cdr resto))
         (m mapa (car resto))]
        [(or (igual? m nome-mapa) (null? m))
          (set! mapa m)])
    (if (null? mapa) (display "Mapa não encontrado\n")
      mapa)))

(define (localiza-objeto nome-objeto nome-mapa)
  (let* ([mapa (localiza 'mapa nome-mapa)]
         [objeto (car (acessa 'objetos mapa))])
    (do [(resto (acessa 'objetos mapa) (cdr resto))
          (obj objeto (car resto))]
        [(or (igual? obj nome-objeto) (null? obj))
          (set! objeto obj)])
    (if (null? objeto) (display "Objeto não encontrado\n")
      objeto)))


;primitiva para localizar entidade
(define (localiza tipo-entidade id . nome-mapa)
  (cond [(eq? tipo-entidade 'mapa) (localiza-mapa id)]
        [(eq? tipo-entidade 'objeto) (localiza-objeto id (car nome-mapa))]
        [else (display "Entidade desconhecida\n")]))

(define (altera-mapa atributo nome-mapa novo-valor)
  (set! mapas
    (map (lambda (mapa)
      (if (igual? mapa nome-mapa)
          (list 'mapa
                (if (eq? atributo 'nome)
                  novo-valor
                  (acessa 'nome mapa))
                (if (eq? atributo 'largura)
                  novo-valor 
                  (acessa 'largura mapa))
                (if (eq? atributo 'altura)
                  novo-valor
                  (acessa 'altura mapa))
                (if (eq? atributo 'objetos)
                  novo-valor
                  (acessa 'objetos mapa)))
          mapa)) mapas)))

(define (altera-objeto atributo nome-objeto novo-valor nome-mapa)
  (set! mapas
    (map (lambda (mapa)
      (if (igual? mapa nome-mapa)
        (let* ([objetos (acessa 'objetos mapa)]
               [novo-objetos (map (lambda (objeto)
                  (if (igual? objeto nome-objeto)
                    (list 'objeto
                        (if (eq? atributo 'nome)
                          novo-valor
                          (acessa 'nome objeto))
                        (if (eq? atributo 'posicao)
                          novo-valor
                          (acessa 'posicao objeto)))
                    objeto))
                  objetos)])
          (list 'mapa
                (acessa 'nome mapa)
                (acessa 'largura mapa)
                (acessa 'altura mapa)
                novo-objetos))
        mapa))
      mapas)))


;primitiva para mudar atributo de uma entidade
(define (altera atributo entidade novo-valor . nome-mapa)
  (let ([tipo-entidade (acessa 'tipo entidade)]
        [nome-entidade (acessa 'nome entidade)])
    (cond [(eq? tipo-entidade 'mapa) (altera-mapa atributo nome-entidade novo-valor)]
          [(eq? tipo-entidade 'objeto) (altera-objeto atributo nome-entidade novo-valor (car nome-mapa))]
          [else (display "Entidade desconhecida\n")])))


;primitiva para adicionar objetos a um mapa
(define (adiciona-objeto nome-mapa nome posicao)
  (let* ([novo-objeto (list 'objeto nome posicao)]
         [mapa (localiza 'mapa nome-mapa)]
         [objetos (acessa 'objetos mapa)]
         [novo-objetos (cons novo-objeto objetos)])
    (altera 'objetos mapa novo-objetos)))

