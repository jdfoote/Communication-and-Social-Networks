library(tidygraph)
library(ergm)
library(intergraph)
library(tidyverse)

wd <- '~/Teaching/communication_and_networks/exams/r_practice_'
# Makes an exponential random graph based on the `ffe_elite` dataset
statnet_G <- networkdata::ffe_friends |> as_tbl_graph() |> as.undirected |> asNetwork()
# Create a simple ERGM model
ffe.fit <- ergm(statnet_G ~ edges + nodefactor('cabinet') + nodematch('cabinet'))
# Create a simulated network
sim_net <- simulate(ffe.fit)
# Change to igraph format
igraph_sim <- asIgraph(sim_net) |> as_tbl_graph()
# export the edgelist and node_atts
igraph_sim |> activate(edges) |> as_tibble() |> select(from, to) |> write_csv(paste0(wd, 'edges.csv'))
igraph_sim |> activate(nodes) |> 
  mutate(id = 1:nrow(.N())) |>
  as_tibble() |> 
  relocate(id) |> 
  write_csv(paste0(wd, 'nodes.csv'))

