#!/bin/bash

# Lista de nombres de archivos que estás buscando (separados por espacios)
nombres_a_buscar=("frases4.ml" "ej42.ml" "ej43.ml" "power.ml" "ej31.ml" "prime.ml" "fibto.ml" "collatz.ml" "mylist.ml")

# Directorio en el que deseas buscar
directorio_de_busqueda="."

# Directorio de destino para copiar los archivos encontrados
directorio_destino="./entrega2/"

# Archivo de registro para los archivos no encontrados
archivo_registro="./no_encontrados.txt"

# Inicializar el archivo de registro (o borrar si ya existe)
> "$archivo_registro"

# Iterar sobre la lista de nombres y buscar/copiar cada archivo
for nombre in "${nombres_a_buscar[@]}"; do
    find "$directorio_de_busqueda" -type f -name "$nombre" -exec cp {} "$directorio_destino" \; -print 2>> "$archivo_registro"
done

# Imprimir mensaje de finalización
echo "Proceso completado. Revisa el archivo de registro: $archivo_registro"
