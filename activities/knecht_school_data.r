# Data comes from
# http://www.stats.ox.ac.uk/~snijders/siena/klas12b.zip
# which also includes a description of the data
setwd("~/Desktop/DeleteMe/snijders/") 

# Make friendship edgelist
friend_matrix = as.matrix(read.table("klas12b-net-2.dat"))
friend_matrix[friend_matrix==9] <- NA
G = graph_from_adjacency_matrix(friend_matrix)
G = simplify(G)
G_edgelist = as.data.frame(as_edgelist(G))
G_edgelist['type'] = 'friendship'

# Make primary school edgelist
klas12b.primary <- as.matrix(read.table("klas12b-primary.dat"))
primary_graph = graph_from_adjacency_matrix(klas12b.primary)
primary_graph = simplify(primary_graph)
primary_graph_edgelist = as.data.frame(as_edgelist(primary_graph))
primary_graph_edgelist$type = 'primary_school'

# Combine them into a new graph
G = graph_from_data_frame(rbind(G_edgelist, primary_graph_edgelist))


delinquency <- read.table("klas12b-delinquency.dat")[,2]
delinquency[delinquency == 0] <- NA
alcohol <- read.table("klas12b-alcohol.dat")[,2]
alcohol[alcohol == 0] <- NA
atts <- as.data.frame(read.table("klas12b-demographics.dat"))
colnames(atts) = c('sex', 'age', 'ethnicity', 'religion')
atts$sex[atts$sex == 1] <- 'F'
atts$sex[atts$sex == 2] <- 'M'
atts[atts == 0] <- NA

V(G)$delinquency <- delinquency
V(G)$alcohol_use <- alcohol
V(G)$sex <- atts$sex
V(G)$age <- atts$age
V(G)$ethnicity <- atts$ethnicity
V(G)$religion <- atts$religion

friend_net = subgraph.edges(G, E(G)[E(G)$type=='friendship'])

save(G, friend_net, file = '~/Teaching/communication_and_networks/activities/school_graph.Rdata')
