(deftemplate persona
	(slot nombre)
	(slot sexo)
	(slot edad)
	(slot altura)
	(slot lecuestahablar)
	(slot legustasalir)
	(slot numeroamigos)
	(slot religion)
	(slot tweeter)
	(slot facebook)
	(slot temperamento)
	(slot caracter)
    (slot muysociable)
    (slot timido)
)

(deffacts Personas
	(persona (nombre Pepe) (sexo V) (edad 26) (lecuestahablar si)(numeroamigos 21))
	(persona (nombre Pepa) (sexo M) (edad 25) (lecuestahablar si)(numeroamigos 21))	
)

;;--------------------- Reglas de palabras ---------------------

(defrule timido
?p <- (persona (lecuestahablar si))
=>
(modify ?p (timido si))
)

(defrule muysociable
?p <- (persona (tweeter si)(facebook si)(numeroamigos ?num))
(test (> ?num 20))
=>
(modify ?p (muysociable si))
)

(defrule extrovertido
?p <- (persona (legustasalir si)(muysociable si))
=>
(modify ?p (caracter extrovertido))
)

(defrule introvertido
?p <- (persona (timido si)(numeroamigos ?num))
(test (<= ?num 20))
=>
(modify ?p (caracter extrovertido))
)

(defrule compatibles1
?p1 <- (persona(nombre ?nom1)(sexo ?sexo)(religion ?reli)(caracter ?cara))
?p2 <- (persona(nombre ?nom2)(sexo ?sexo)(religion ?reli)(caracter ?cara))
(test (neq ?nom1 ?nom2))
=>
(assert(compatibles ?nom1 ?nom2))
)


(defrule compatibles2
?p1 <- (persona(nombre ?nom1)(sexo ?sexo1)(religion ?reli1)(caracter noclasificable)(numeroamigos ?num1))
?p2 <- (persona(nombre ?nom2)(sexo ?sexo2)(religion ?reli2)(caracter noclasificable)(numeroamigos ?num2))
(test (neq ?nom1 ?nom2))
(test (neq ?sexo1 ?sexo2))
(test (neq ?reli1 ?reli2))
(test (> ?num1 20))
(test (> ?num2 20))
=>
(assert(compatibles ?nom1 ?nom2))
)

(defrule cita1
(compatibles ?nom1 ?nom2)
(persona(nombre ?nom1)(edad ?edad1))
(persona(nombre ?nom2)(edad ?edad2))
(test (neq ?nom1 ?nom2))
(test (< (abs (- ?edad1 ?edad2)) 10))
=>
(assert(cita ?nom1 ?nom2))
)

(defrule cita2
(compatibles ?nom1 ?nom2)
(persona(nombre ?nom1)(edad ?edad1))
(persona(nombre ?nom2)(edad ?edad2))
(test (neq ?nom1 ?nom2))
(test (> (abs (- ?edad1 ?edad2)) 10))
(test (> ?edad1 50))
(test (> ?edad2 50))
=>
(assert(cita ?nom1 ?nom2))
)

(reset)
(facts)
(watch all)
(run)
