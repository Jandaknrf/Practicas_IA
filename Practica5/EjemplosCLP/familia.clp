(deffacts inicio
    (dd juan maria rosa m)
    (dd juan maria luis h)
    (dd jose laura pilar m)
    (dd luis pilar miguel h)
    (dd miguel isabel jaime h)
    (dd pedro rosa pablo h)
    (dd pedro rosa begoña m))

;(dd Juan María Rosa m) indica que Juan y María son los padres de Rosa y que Rosa es una mujer. 

(defrule padre
    (dd ?x ? ?y ?)
    =>
    (assert (padre ?x ?y)))

(defrule madre
    (dd ? ?x ?y ?)
    =>
    (assert (madre ?x ?y)))

(defrule hijoPorPadre
    (dd ?x ? ?y h)
    =>
    (assert(hijo ?y ?x)))

(defrule hijoPorMadre
    (dd ? ?x ?y h)
    =>
    (assert(hijo ?y ?x)))

(defrule hijaPorPadre
    (dd ?x ? ?y m)
    =>
    (assert(hija ?y ?x)))

(defrule hijaPorMadre
    (dd ? ?x ?y m)
    =>
    (assert(hija ?y ?x)))

(defrule hermano
    (dd ?p ?m ?h1 ?)
    (dd ?p ?m ?h2 h)
    (test (neq ?h1 ?h2))
    =>
    (assert (hermano ?h2 ?h1)))

(defrule hermana
    (dd ?p ?m ?h1 ?)
    (dd ?p ?m ?h2 m)
    (test (neq ?h1 ?h2))
    =>
    (assert (hermana ?h2 ?h1)))

(defrule abueloPorPadre
	(padre ?a ?p)
    (padre ?p ?h)
	=>
	(assert (abuelo ?a ?h)))

(defrule abueloPorMadre
	(padre ?a ?m)
	(madre ?m ?h)
	=>
	(assert (abuelo ?a ?h)))

(defrule abuelaPorPadre
	(madre ?a ?p)
    (padre ?p ?h)
	=>
	(assert (abuela ?a ?h)))

(defrule abuelaPorMadre
	(madre ?a ?m)
    (madre ?m ?h)
	=>
	(assert (abuela ?a ?h)))

(defrule ascendientePadre
    (padre ?x ?y)
    =>
    (assert(ascendiente ?x ?y)))
    
(defrule ascendienteMadre
    (madre ?x ?y)
    =>
    (assert(ascendiente ?x ?y)))

(defrule ascendienteRec
    (ascendiente ?x ?y)
    (ascendiente ?y ?z)
    =>
    (assert(ascendiente ?x ?z)))
	
	
(defrule primoPadreHermano
    (padre ?p ?b)
    (hermano ?q ?p)
    (hijo ?a ?q)
    =>
    (assert(primo ?a ?b)))

(defrule primoPadreHermana
    (padre ?p ?b)
    (hermana ?q ?p)
    (hijo ?a ?q)
    =>
    (assert(primo ?a ?b)))

(defrule primoMadreHermano
    (madre ?p ?b)
    (hermano ?q ?p)
    (hijo ?a ?q)
    =>
    (assert(primo ?a ?b)))

(defrule primoMadreHermana
    (madre ?p ?b)
    (hermana ?q ?p)
    (hijo ?a ?q)
    =>
    (assert(primo ?a ?b)))

(defrule primaPadreHermano
    (padre ?p ?b)
    (hermano ?q ?p)
    (hija ?a ?q)
    =>
    (assert(prima ?a ?b)))

(defrule primaPadreHermana
    (padre ?p ?b)
    (hermana ?q ?p)
    (hija ?a ?q)
    =>
    (assert(prima ?a ?b)))

(defrule primaMadreHermano
    (madre ?p ?b)
    (hermano ?q ?p)
    (hija ?a ?q)
    =>
    (assert(prima ?a ?b)))

(defrule primaMadreHermana
    (madre ?p ?b)
    (hermana ?q ?p)
    (hija ?a ?q)
    =>
    (assert(prima ?a ?b)))
