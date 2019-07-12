# Aprendizaje no supervisado

En unsupervised learning no tenemos variable respuesta.

Necesitamos agrupar registros que se parecen entre sí, aunque no me vaya a decir qué son realmente. 

## Tipos
**Modelos para hacer clustering**

* K-means.
* Hierarchical Clustering.
* Probabilistic Clustering.

**Algoritmos de reducción de dimensionalidad**
¡No son para hacer clustering, para eso están después los de arriba!
Nos convierten un datset en otro. 
* Principal Component Analysis.
* Singular Value Decomposition (u otras factorizaciones de matrices).
* t-Distributed Stochastic Neighbor Embedding. 

**Unsupervised Deep Learning**

* Autoencoders.
* Anomaly detection.


##Conceptos 

### Métrica (o distancia)

Para agrupar, necesitamos definir distancias. Importantísimo en aprendizaje supervisado. 

Una métrica 𝑑:𝑋×𝑋→ (0,Infinito)  es una función que satisface las siguientes condiciones para cada 𝑥, 𝑦∈𝑋:

*𝑑 𝑥,𝑦 ≥0, no negativa.

*𝑑 𝑥,𝑦 =0⟺𝑥=𝑦, identidad indecirnible.

*𝑑 𝑥,𝑦 =𝑑 𝑦,𝑥 , simetría.

* 𝑑 𝑥,𝑧 ≤𝑑 𝑥,𝑦 + 𝑑 𝑦,𝑧 , desigualdad triangular.

Tipos:

* Distancia euclideana.
* Distancia de Minkowski.
* Distancia de Manhattan.
* Distancia de Levenshtein.
* Distancia del infimo y supremo.

### Scaling

Tenemos un dataset con dos variables.

- Pesos: que va de 0 a 120. 
- Número de hijo: que va de 0 a 10. 

Si yo eso lo represento en un plano X,Y, me salen que un tío que tiene 60 k y 0 hijos se parece mucho a otro que pesa 60 y tiene 10, Hay que normalizar eso, para que todas las variables estén entre 0 y 1. 

**Métodos de normalización**

Existen varias formas de normalizar los valores de las variables. Uno es la estandarización de la escala completa de todos los valores de las variables, es decir, que  𝑥 𝑖 ∈ 0,1 , conocida como min-max normalization, y se obtiene aplicando la siguiente transformación:

![f1](media/formula1.PNG) 

También puede usarse la que seguramente muchos conocen:

![f1](media/formula2.PNG) 

### N/A

Como tenemos que calcular distancias, qué hacemos con valores queno tienen valor para una variable. 

Lo mejor es asignarle la **moda**, no la **media**


## Hierarchical Clustering

Un poco más difícil de entender. Henry nunca lo ha usado para datos reales

## Dimensionaliadades altas, como enfrentarnos a ellas. 

Por ejemplo, 


Como normalmente 



