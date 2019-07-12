# Hierachical Clustering

Este método Henry no lo ha usado en la vida real. 

Una especie de árbol que te va diciendo grupos y subgrupos, etc. 

En Hierarchical Clustering, se clasifica los objetos en una jerarquía similar a un diagrama en forma de árbol que se denomina dendrograma. La distancia de división o unión (Split o merge) (llamada Height o altura) se muestra en el eje y del dendrograma. Ejemplo:

![dendograma](https://support.minitab.com/es-mx/minitab/18/cluster_obs_dendrogram_with_final_partition_glove_testers.png)

Algoritmo:

![algotirmo](https://www.brandidea.com/images/datascience/hierarchicalclustering.jpg)

Ver Linkage Methods en presentación


## Ejercicio

Ejercicio Hierarchical Clustering.

El objetivo es crear un modelo que permita agrupar por los tipos de trigo de acuerdo a sus características. Las tareas a desarrollar son las siguientes:
1. Lea el dataset “seed_dataset_modified.txt”
2. Para clustering, es recomendable realizar una acción previa antes de ajustar el modelo, ¿qué debe realizar? (Hint: No Ayuda)
3. Genere la matriz de distancias, para esto use la función get_dist o dist.
4. Use un hclust con average linkage y grafíquelo.
5. Con la función cutree, divida el hclust anterior en 3 centros. Analice, qué hace exactamente esta función.
6. Convierta el hclust a un dendograma y use la función color_branches para obtener una mejor visualización.
7. ¿Cuántas observaciones se asignaron a cada cluster?
8. Tarea: con la ayuda del paquete ggplot, analice la variable perímetro y área.
9. Compare lo real con lo observado (recuerde que en la práctica esto nunca ocurrirá).
