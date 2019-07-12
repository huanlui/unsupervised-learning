# 

Mucho más complicado pero mucho más potente que PCA. 

* Al igual que el PCA, es una técnica de proyección, o reducción de dimensión, que se aplica con la intención de visualizar N variables en 2.
* Uno de los resultados de t-SNE es una matriz de dos dimensiones (puede ser de tres también), donde cada observación (fila) representa un dato de entrada. Luego podemos aplicar un clustering y agrupar los casos según su distancia en este nuevo mapa de 2 dimensiones. 
* t-SNE mapea los datos multidimensionales a un espacio dimensional inferior.
* Después de este proceso, las variables de entrada ya no son identificables, y no puede hacerse ninguna inferencia basada únicamente en la salida del t-SNE. Por lo tanto, es principalmente una técnica de exploración y visualización de datos.

![comparación](https://miro.medium.com/max/736/1*LeOHKmUFha2r3QJ7riR1zg.png)

A fondo: https://lvdmaaten.github.io/
Más ligero: https://towardsdatascience.com/visualising-high-dimensional-datasets-using-pca-and-t-sne-in-python-8ef87e7915b

