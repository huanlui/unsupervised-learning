# Principal component analysis

Usas una matriz de cambio de base para reducir el número de componentes (variables) de un dataset. Es decir, queremos reducir el número de columnas, hablando en plata.

![dimensionalidad](https://cdncontribute.geeksforgeeks.org/wp-content/uploads/Dimensionality_Reduction_1.jpg)

## La maldición de la dimensionalidad
¿Por qué deberíamos eliminar 80 columnas de nuestro conjunto de datos cuando podríamos incorporarlo directamente a nuestro algoritmo de aprendizaje automático y dejar que se encargue del resto?

* A medida que aumenta el número de variables, el modelo se vuelve más complejo.
* Cuanto mayor sea el número de variables, más posibilidades hay de que tengamos overfitting.
* Un modelo de machine learning que está entrenado con un gran número de variables, depende cada vez más de los datos con los que fue entrenado. Necesitaremos además más filas para entranar si tenemos muchas columnas. 
* Menos variables en nuestro conjunto de entrenamiento, implican menos suposiciones que nuestro modelo tendrá que hacer.

## ¿Cómo elegimos las variables que mejor expxlican?

Si una variable es función de otra, entonces tenemos información redunante. 

Se hacen una serie de cálculos matemáticos que podemos ver en el PPTX. 

## PCA: Desventajas

Asume linealidad en los datos, por lo que no detecta cuando hay relaciones no lineales entre variables. 