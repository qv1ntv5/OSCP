#Este script va a intentar lanazar una conexión SSH en segundo plano, lo cual eviatará que el proceso del script se quede bloqueado.

bash -c "ssh -o ConnectTimeout=5 gsanmillan@198.27.82.39 -N -D 2525" 2>log.txt & #Lanzamos un túnel SSH que abre un socket en el puerto 2525. El tiempo de espera es 5 segundos, si en cinco segundos no se ha completado la conexión SSH cierra la sesión.

#Ahora, el objetivo del script es verificar que el estado de la conexión es correcto. Para ello, lo que buscamos es comprobar la existencia de un socket SSH en el puerto 2525 y verificar que esta conexión está asociada al proceso de nuestro comando SSH.

sleep 5 #Esperamos 5 segundos por si existe algún error de timeout.

if [ -s log.txt ]; then # Comprobamos el fichero en busca de errores,

    error=$(cat log.txt)
    zenity --error --text="$error" --title="Warning!" 2>/dev/null
    kill $(ps -aux | grep ssh | grep 198.27.82.39 | sed 's/ /,/g' | sed 's/,\+/,/g' | cut -d ',' -f2)
                        # Si ha habido algún error, se muestra por pantalla y se mata cualquier proceso SSH con la sonda externa.
else

    zenity --info --text="Tráfico proxificado a traves del puerto 2525." --title="Success!" 2>/dev/null
    proxychains -q qterminal
                        # Si no ha habido ningún error, se muestra por pantalla y se lanza una terminal proxificada.

fi

rm log.txt # Por último se borra el fichero con el log