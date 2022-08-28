set ant 999
set ite 0
battery set 100

atget id id
getpos2 lonSen latSen

loop
wait 100
read mens
rdata mens tipo valor
cprint "Nodo sensor" tipo
if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
end

if (tipo=="stop")
   data mens "stop"
   send mens * id
   cprint "Para sensor: " id
   stop
end

delay 1000

areadsensor tempSen
rdata tempSen SensTipo idSens temp
print temp
if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
end

inc ite
print ite
cprint "iteee" ite
if (ite >= 1000)
   data mens "stopMen" lonSen latSen
   send mens ant 
   wait 1000
   stop
end

battery bat
if(bat<1)
   data mens "stopBat" lonSen latSen bat
   send mens ant
end

