#language: es

Característica: Navegación por revistas del dominio genome.cshlp.org a través del proxy
  Para testear el proxy
  Como testeador
  Necesito navegar por la revistas del dominio genome.cshlp.org y chequear sus resultados

Escenario: Acceder al website de la revista Genome Research
  Cuando navego a la revista 'Genome Research' a través del proxy
  Entonces todos los enlaces devueltos acceden a traves del proxy 

Escenario: Acceder a un artículo de la revista Genome Research
  Dado que la revista 'Genome Research' tiene un artículo 'nombre_artículo'
  Cuando pongo 'nombre_artículo' en el cajón Buscar
  Y hago clic en primer enlace del resultado
  Entonces obtengo un artículo en formato pdf

