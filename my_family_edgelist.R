library(igraph)
plot(graph(edges=c(1,2,
                   3,4,
                   1,2)))
jer_fam <- graph(
  edges = c(
    "Jeremy","Kedra",
    "Jeremy","Dave",
    "Jeremy","Chris",
    "Jeremy","Rebecca",
    "Jeremy","William",
    "Jeremy","Owen",
    "Jeremy","Andrew",
    "Kedra","Rebecca",
    "Kedra","William",
    "Kedra","Owen",
    "Kedra","Andrew",
    "Chris","Tyler",
    "Chris", "Steven",
    "Chris","Lisa",
    "Chris","Jason",
    "Chris","Kim",
    "Dave","Tyler",
    "Dave", "Steven",
    "Dave","Lisa",
    "Dave","Jason",
    "Dave","Kim",
    "Dave","Chris",
    "Dave","Darrell",
    "Dave","Barbara",
    "Chris","Ray",
    "Chris","Leona",
    "Barbara","Darrell",
    "Leona","Ray"
  )
)

fam_data = read.csv('~/Documents/family.csv')

G = graph_from_data_frame(fam_data)

jer_fam = as.undirected(jer_fam)
plot(jer_fam)
betweenness(jer_fam)
degree(jer_fam)
eigen_centrality(jer_fam)
