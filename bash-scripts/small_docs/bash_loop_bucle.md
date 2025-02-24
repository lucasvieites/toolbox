## Bucle «for»

En línea de comando:

```
for i in $( command ); do command $i; done
```

En un script:

```#!/bin/bash
for i in $( command ); do
	command $i
done
```

EJEMPLOS:

Hacer copia de seguridad de todos los archivos .html

```
for i in $( ls *html ); do cp $i $i.bak; done
```

## Bucles «while» y «until»

 Crear 22 archivos con nombres entre el 0 y el 21
```
i=0
while [ $i -lt 22 ]
do
	touch $i
	i=$[$i+1]
done
```

Borramos esos mismos archivos con «until»
```
i=0
until [ $i -eq 22 ]
do
	rm $i
	i=$[$i+1]
done

```