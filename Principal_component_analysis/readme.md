# Principal component analysis

Usas una matriz de cambio de base para reducir el número de componentes (variables) de un dataset. Es decir, queremos reducir el número de columnas, hablando en plata.

![dimensionalidad](https://cdncontribute.geeksforgeeks.org/wp-content/uploads/Dimensionality_Reduction_1.jpg)

## La maldición de la dimensionalidad
¿Por qué deberíamos eliminar 80 columnas de nuestro conjunto de datos cuando podríamos incorporarlo directamente a nuestro algoritmo de aprendizaje automático y dejar que se encargue del resto?

* A medida que aumenta el número de variables, el modelo se vuelve más complejo.
* Cuanto mayor sea el número de variables, más posibilidades hay de que tengamos overfitting.
* Un modelo de machine learning que está entrenado con un gran número de variables, depende cada vez más de los datos con los que fue entrenado.
* Menos variables en nuestro conjunto de entrenamiento, implican menos suposiciones que nuestro modelo tendrá que hacer.
