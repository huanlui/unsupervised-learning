#---------------------------------------------------------------------------------------------------#
#  ___           _          _                 _             ____    _   _   _____ 
# |_ _|  _ __   (_)   ___  (_)   ___    _    | |_          / ___|  | \ | | | ____|
#  | |  | '_ \  | |  / __| | |  / _ \  (_)   | __|  _____  \___ \  |  \| | |  _|  
#  | |  | | | | | | | (__  | | | (_) |  _    | |_  |_____|  ___) | | |\  | | |___ 
# |___| |_| |_| |_|  \___| |_|  \___/  (_)    \__|         |____/  |_| \_| |_____|
#---------------------------------------------------------------------------------------------------#

# Este codigo es utilizado como ejemplo para entender el algoritmo de t-distributed Stochastic Neighbor Embedding.
#---------------------------------------------------------------------------------------------------#



rm(list=ls())

#Lectura de los datos de MNIST (numeros escritos a mano)
my_data <- as.data.frame(fread("./data_in/zip.train"))

#Tomamos solo 1/3 de los datos simplemente por costes computacionales
my_data <- sample_frac(my_data,1/3)


#Damos formato a los datos y guardamos la etiqueta
my_labels<-my_data$V1
my_data$V1<-as.factor(my_labels)


#Las siguientes linease se utilizan para realizar el plot y dar un correcto
# formato de visualizacion
colors <- rainbow(length(unique(my_data$V1))) #use ?rainbow
names(colors) <- unique(my_data$V1)


#Ejecutamos el algoritmo para los datos de MNIST, suprimiendo la columna de las etiquetas
tsne <- Rtsne(my_data[,-1], dims = 2, verbose=TRUE, max_iter = 500)
#-1 es que quitamos la colummna ya hecha. 

#Hacemos un plot de los datos "vacio"
plot(tsne$Y, t='n', main="2D t-distributed Stochastic Neighbor Embedding para el MNIST dataset",
     xlab = "t-SNE coordenada 1",ylab="t-SNE coordenada 2")

#Anadimos la etiqueta segun corresponda
text(tsne$Y, labels=my_labels, col=colors[my_data$V1])


#que pasa si hacemos lo mismo pero en 3 dimensiones
tsne3D <- Rtsne(my_data[,-1], dims = 3, verbose=TRUE, max_iter = 500)
#damos formato a los datos
data_to_plot<-as.data.frame(tsne3D$Y)


#plot 3d usando libreria plotly
# color: es cuantos colores voy a hacer. Lo saco de las etiquetas convertidas a factor. 
# colors: (definido arriba). Colores diferentes cogidos de la función rainbow . 
plot_ly(data_to_plot, x=~V1, y=~V2, z=~V3, color= as.factor(my_labels), colors = colors) %>%
  add_markers() %>%
  plotly::layout(scene = list(xaxis = list(title = 'Coordenada 1 t-SNE'),
                      yaxis = list(title = 'Coordenada 2 t-SNE'),
                      zaxis = list(title = 'Coordenada 3 t-SNE')))




#No ejecutar, a menos que se desee hacer plot de los numeros
row<-2
COLORS <- c("white", "black")
CUSTOM_COLORS <- colorRampPalette(colors = COLORS)
CUSTOM_COLORS_PLOT <- colorRampPalette(brewer.pal(10, "Set3"))


z <- array(as.vector(as.matrix(my_data[row, -1])), dim = c(16, 16))
z <- z[, 16:1]  ##right side up
par(mfrow = c(1, 1), pty = "s", mar = c(1, 1, 1, 1), xaxt = "n", yaxt = "n")
image(1:16, 1:16, z, main = my_data[row, 1], col = CUSTOM_COLORS(256))


#Tarea: realizar un algoritmo de clustering que realice un agrupamiento como el de la imagen
tsne_scaled<-scale(tsne$Y) 

head(tsne$Y)
head(tsne_scaled)

my_kmeans<-kmeans(tsne_scaled,centers = 10,nstart = 10)
my_kmeans$cluster
fviz_cluster(my_kmeans, data = tsne_scaled)

#----------------------------------------------------------------------#
#  _____   _                 _             ____    _   _   _____ 
# |  ___| (_)  _ __    _    | |_          / ___|  | \ | | | ____|
# | |_    | | | '_ \  (_)   | __|  _____  \___ \  |  \| | |  _|  
# |  _|   | | | | | |  _    | |_  |_____|  ___) | | |\  | | |___ 
# |_|     |_| |_| |_| (_)    \__|         |____/  |_| \_| |_____|
#----------------------------------------------------------------------#



