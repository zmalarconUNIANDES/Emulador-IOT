atget id id
set meng 0

data p "hola" id id
send p

loop
read mens
rdata mens tipo valor1 valor2
cprint "Nodo Base " tipo
if( tipo == "alerta")
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2
   
end
if(tipo == "critico")
	cprint "Nodo descargado en: longitud" valor1 ", latitud: " valor2
	data p "stop"	
	send p
	wait 1000
	stop
end
if(tipo == "stopMen")
	cprint "Maximo mensajes" 
	data p "stop"	
	send $p
	wait 1000
	stop
end
if(tipo == "stopBat")
	cprint "Baterry empty" 
	data p "stop"
	send $p
	wait 1000
	stop
end

wait 100