# Chargement des packages

require(data.table)
require(bit64)
require (shinyWidgets)
require(FactoMineR)
require(shiny)
require(ggplot2)
require (shinyWidgets)
require(caret)
require(bslib)
require(fontawesome)
require(showtext)

# Chargement des données

donnees <- fread(file = "high_diamond_ranked_10min.csv")

# Tri des données

tri <- donnees[blueWardsPlaced < 30]
tri <- tri[redWardsPlaced < 30]
tri <- tri[,c("blueAvgLevel", "redAvgLevel", "gameId", "blueEliteMonsters", "redEliteMonsters", "blueTotalExperience", "redTotalExperience", "blueTotalGold", "redTotalGold", "redKills","redDeaths", "redFirstBlood", "blueGoldPerMin", "redGoldPerMin", "blueCSPerMin", "redCSPerMin","redExperienceDiff","redGoldDiff") := NULL]
tri$blueWins <- as.factor(tri$blueWins)

# Adaptation des variables
# On rassemble les Objectifs de chaque équipe sous une seule variable, 0 = aucune équipe, 1 = bleu, 2 = rouge

combiner <- function(Objectifblue,Objectifred){
  Objectif <- c(1:length(Objectifblue))
  for (k in (1:length(Objectifblue))){
    if (Objectifblue[k]==1){
      Objectif[k] <- 1
    }
    if (Objectifred[k]==1){
      Objectif[k] <- 2
    }
    if ((Objectifblue[k]==0)&((Objectifred[k]==0))){
      Objectif[k] <- 0
    }
  }
  return (Objectif)
}

# On utilise la fonction pour combiner les colonnes
heralds <- combiner(tri$blueHeralds,tri$redHeralds)
dragons <- combiner(tri$blueDragons,tri$redDragons)

tri$heralds <- heralds
tri$dragons <- dragons

# On retire les anciennes colonnes
tri <- tri[,c("blueHeralds","redHeralds","blueDragons","redDragons") := NULL]