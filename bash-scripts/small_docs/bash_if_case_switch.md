## if else

	#!/bin/bash
	if [[ -d $HOME/agendas/ ]]; then
		# directory exists
		echo "directorio existe"
	else
		echo "directorio NO existe, lo creamos"
		mkdir $HOME/agendas 
	fi


Se utilizan los corchetes dobles para evitar que haya cadenas vacías que rompan
la ejecución del test. Por ejemplo:

	lines=""
	if [ $lines -eq 0 ]


bash lo traduce como:

	if [  -eq 0 ]

lo que haría que la expresión no tenga sentido. Esto se soluciona con:

	lines=""
	if [[ $lines -eq 0 ]]

## case

	case "$var" in
	value1)
		commands;
		;;
	value2)
		commands;
		;;
	*)
		commands;
		;;
	esac

Ejemplo:

	case "$1" in
	'start')
		/usr/app/startup-script
		;;
	'stop')
		/usr/app/shutdown-script
		;;
	'restart')
		echo "Usage: $0 [start|stop]"
		;;
	esac
