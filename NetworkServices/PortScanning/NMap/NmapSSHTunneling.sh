#!/bin/bash

DestIP= # IP de la máquina de destino.
ServerIP= # IP de la máquina intermediaria.
ServerUser= # Usuario SSH de la máquina intermediaria.
ServerPass= # Contraseña SSH de la máquina intermediaria.

# Este script funciona pasándole como parámetro el número de puertos de los que queremos obtener un escaneo. Además hay que tener instalado 'sshpass', se puede descargar desde la apt (sudo apt-get install sshpass).

for Puerto in `seq 1 $1`
	do
		sshpass -p $ServerPass ssh -N -L 9999:$DestIP:$Puerto $ServerUser@$ServerIP 2> /dev/null & # Redirecicción de puertos.
		echo -n "$Puerto -> "
		nmap -sV -T5 127.0.0.1 -p 9999 | grep 9999 # Nmap por pantalla.
		kill `pidof sshpass` # Matamos la redirección de puertos para abrirla de nuevo con otro puerto en la siguiente iteración.
	done
		
# Con 'sshpass' nos libramos de introducir la contraseña en cada iteración y con el modificador '-N' evitamos que nos abra una shell ssh de la conexión con el servidor permitiéndonos pasar el proceso a segundo plano con el ampersand '&' y que la terminal no se quede estancada.
