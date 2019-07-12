#---------------------------------------------------------------------------------------------------#
#  ___           _          _                 _  __                                                 
# |_ _|  _ __   (_)   ___  (_)   ___    _    | |/ /         _ __ ___     ___    __ _   _ __    ___ 
#  | |  | '_ \  | |  / __| | |  / _ \  (_)   | ' /   ____  | '_ ` _ \   / _ \  / _` | | '_ \  / __|
#  | |  | | | | | | | (__  | | | (_) |  _    | . \  |____| | | | | | | |  __/ | (_| | | | | | \__ \
# |___| |_| |_| |_|  \___| |_|  \___/  (_)   |_|\_\        |_| |_| |_|  \___|  \__,_| |_| |_| |___/
#---------------------------------------------------------------------------------------------------#

# Este codigo es utilizado para explicar como funciona el k-means con datos reales.

#---------------------------------------------------------------------------------------------------#


rm(list=ls())

#Leemos los datos
my_data<-USArrests

# 1) Verifique si el dataset contiene NA’s.
#Verificamos si el dataset tiene NA's
# Recordemos que sapply aplica la función que digamos a cada columna de mi matriz. Por ejemplo:
head(sapply(my_data,mean))
head(sapply(my_data,function(x) mean(x)/2))
# En este caso, aplicamos la función any que me dice si alguno cumple algo, en este caso su is.na. 
sapply(my_data,function(x) any(is.na(x)))

#No queremos que el algoritmo dependa de una unidad variable arbitraria. ES decir, queremos hacer scaling
my_data<-scale(my_data) 
head(my_data)

#veamos las distancias entre cada estado
distance <- get_dist(my_data)
# Rojo: más distancia: Azul oscuro, menos distancia. 
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

#"Entrenamos" el kmeans
# Lo entrenamos usando dos centros (es decir, dos grupos)
# Hacemos 10 intentos y me quedo con la mejor de las inicialiaciones. 
my_kmeans_2<-kmeans(my_data,centers = 2,nstart = 10)
str(my_kmeans_2)
my_kmeans_2
my_kmeans_2&centers

#Visualizamos el cluster: Tengo 4 variables, pero para respresnetarlo en dos tengo que hacer dos opciones. 
#Veamos dos librería distinta:
# Este te coge las componente principales (hace un cambio de base)
fviz_cluster(my_kmeans_2, data = my_data)
#Este coge las dos variables m´sa importante
ggplot(aes(UrbanPop, Murder, color = factor(my_kmeans_2$cluster),
           label = row.names(USArrests)),
       data = as.data.frame(my_data)) +
  geom_text()


#--------------------- Inicio: Visualizacion ------------------------------#

#"entrenamos" otros kmeans
my_kmeans_3 <- kmeans(my_data, centers = 3, nstart = 10)
my_kmeans_4 <- kmeans(my_data, centers = 4, nstart = 10)
my_kmeans_5 <- kmeans(my_data, centers = 5, nstart = 10)

# plots para comparar
plot_1 <- fviz_cluster(my_kmeans_2, geom = "point", data = my_data) + ggtitle("2 groups")
plot_2 <- fviz_cluster(my_kmeans_3, geom = "point",  data = my_data) + ggtitle("3 groups")
plot_3 <- fviz_cluster(my_kmeans_4, geom = "point",  data = my_data) + ggtitle("4 groups")
plot_4 <- fviz_cluster(my_kmeans_5, geom = "point",  data = my_data) + ggtitle("5 groups")


grid.arrange(plot_1, plot_2, plot_3, plot_4, nrow = 2)

# Con 5 centros  no me quedo, porque se entremezclan

#--------------------- Fin: Visualizacion ------------------------------#



#---------------- Inicio: Numero optimo de clusters (Elbow method) --------------------#


set.seed(123)

# function to compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(my_data, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = NULL to k = NULL
k.values <- NULL

# extract wss for NULL clusters
wss_values <- NULL(k.values, wss)

plot(NULL)


#Manera mas rapida
set.seed(123)

fviz_nbclust(my_data, kmeans, method = "wss")


#---------------- Fin: Numero optimo de clusters (Elbow method) --------------------#



#---------------- Inicio: Numero optimo de clusters (Average Silhouette Method) --------------------#


# function to compute average silhouette for k clusters
avg_sil <- function(k) {
  km.res <- kmeans(my_data, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(my_data))
  mean(ss[, 3])
}

# Compute and plot wss for k = NULL to k = NULL
k.values <- NULL

# extract avg silhouette for 2-15 clusters
avg_sil_values <- NULL(NULL, NULL)

plot(NULL,
     xlim=c(0,15))


#Manera automatica
fviz_nbclust(my_data, kmeans, method = "silhouette")


#---------------- Fin: Numero optimo de clusters (Average Silhouette Method) --------------------#





#---------------- Inicio: Numero optimo de clusters (Gap Statistic Method) --------------------#


# compute gap statistic
set.seed(123)
gap_stat <- clusGap(NULL, FUN = NULL, nstart = NULL,
                    K.max = NULL, B = NULL)
# Print the result
print(gap_stat, method = "firstmax")


#Manera automatica
fviz_gap_stat(gap_stat)


#---------------- Fin: Numero optimo de clusters (Gap Statistic Method) --------------------#






#---------------- Inicio: Resultados finales --------------------#

set.seed(123)
my_final_kmeans <- NULL
print(NULL)

fviz_cluster(NULL, data = NULL)


USArrests  %>%
  mutate(Cluster = my_final_kmeans$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")


#---------------- Fin: Resultados finales --------------------#





#---------------- Inicio: Evaluar una nueva observacion --------------------#

new_obs<-c(11,250,60,22)


#TAREA: cree una funcion para evaluar nuevas observaciones.




#---------------- Fin: Evaluar una nueva observacion --------------------#







