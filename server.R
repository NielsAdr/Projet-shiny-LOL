function(input, output) {
  
  #### Partie Introduction
  
  ## Chargement des polices
  # ATTENTION, CHEMIN A CHANGER
  
  font_add(family = "Spiegel", regular = "Spiegel-Regular.otf")
  
  ## Chargement des Images
  output$Jeu <- renderImage({
    list(src="jeu.jpeg",width = "550px",height = "350px")
  })
  output$Carte <- renderImage({
    list(src="CarteDuJeu.jpeg",width = "900px",height = "700px")
  })
  output$Toplane <- renderImage({
    list(src="toplane.jpeg",width="450px",heigt = "350px")
  })
  output$Jungle <- renderImage({
    list(src="jungle.png",width="450px",heigt = "350px")
  })
  output$Midlane <- renderImage({
    list(src="midlane.jpeg",width="400px",heigt = "350px")
  })
  output$ADC <- renderImage({
    list(src="botlane.jpeg",width="400px",heigt = "350px")
  })
  output$Support <- renderImage({
    list(src="botlane.jpeg",width="400px",heigt = "350px")
  })
  
  
  
  #### Partie visualisation du jeu de données et ACP
  
  
  output$summary <- renderPrint({summary(tri)})
  output$dataTable <- renderDataTable({
    tri
  })
  
  ### Visualisation des données
  
  # Thème des ggplots
  
  theme_lol <- function(){
      theme(panel.background = element_rect(fill = "#0A1428",
                                            colour = "#0A1428",
                                            size = 0.5, linetype = "solid"),
      text = element_text(color = "#C89B3C"),
      axis.text = element_text(color = "#C89B3C"),
      plot.background = element_rect(fill="#0A1428"),
      panel.grid.major = element_blank(),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5),
      strip.background = element_rect(fill="#C89B3C")
    )
  }
  
  # Choisir entre afficher les dragons ou l'herald
  objectif.choice <- reactive({
    if (input$to.plot == "dragons"){
      choice.plot <- 
        ggplot(data = tri, aes(x = factor(dragons))) +
        geom_bar(stat = "count", fill = c("#C8AA6E", "#0397AB", "#660000")) +
        xlab ("Equipe qui a tué le dragon")+
        ggtitle("Répartition du dragon dans le jeu de donnée", subtitle = "0 : aucune équipe, 1 : équipe bleue, 2 : équipe rouge") +
        theme_lol() # Application du thème
    }
    else{
      choice.plot <- 
        ggplot(data = tri, aes(x = factor(heralds))) +
        geom_bar(stat = "count", fill = c("#C8AA6E", "#0397AB", "#660000")) +
        xlab ("Equipe qui a tué l'herald")+
        ggtitle("Répartition de l'hérald dans le jeu de donnée", subtitle = "0 : aucune équipe, 1 : équipe bleue, 2 : équipe rouge") +
        theme_lol() # Application du thème
    }
    return(choice.plot)
  })
  output$plotObjectif <- renderPlot({objectif.choice()})
  
  # Effectifs de victoires par équipe
  output$plotBlueWins <- renderPlot ({
    ggplot(data = tri, aes(x = factor(blueWins))) +
      geom_bar(stat = "count", fill = c("#660000","#0397AB")) +
      xlab ("Gagnant")+
      ggtitle("Equipe gagnante", subtitle = "0 : rouge, 1 : bleue") +
      theme_lol() # Application du thème
  })
  
  # Régression linéaire de l'expérience en fonction de l'or gagné lors d'une défaite et lors d'une victoire
    output$plotGoldExp <- renderPlot ({
      ggplot (data = tri, aes(x= blueExperienceDiff, y=blueGoldDiff))+
        geom_point(color = "#C89B3C")+ geom_abline(color = "#660000") + 
        facet_wrap(~ blueWins, ncol = 2)+
        ggtitle("Gold/Exp en fonction de l'issue de la partie", subtitle = "1 : victoire équipe bleue, 0 : défaite équipe bleue")+
        xlab("blueExperienceDiff")+
        ylab("blueGoldDiff")+
        theme_lol()
  })
    
    # Matrice de scatterplots
  output$pairs <- renderPlot({
    pairs(~ blueWardsPlaced + blueWardsDestroyed+ blueGoldDiff+ blueKills + blueDeaths + blueTotalMinionsKilled + blueTotalJungleMinionsKilled+ blueExperienceDiff,data= tri,lower.panel= NULL )
  })
  
  
  ### ACP
  
  # Création de l'ACP en gardant seulement la variable qualitative blueWins
  
  res.PCA <- PCA(tri[,-c(4,19,20)],  quali.sup = c(1), graph = FALSE)
  
  ## Création des plots en fonction du choix des dimensions par l'utilisateur
  # Pour le graph des variables
  
  choix.dim.var <- reactive ({
    if (input$choix.dim == "1 et 2"){
      variable <- plot.PCA(res.PCA, axes = c(1,2),choix = 'var',habillage = 'cos2',select='contrib  9',unselect=0,title="Graphe des variables de l'ACP") 
    }
    else {
      variable <-plot.PCA(res.PCA, axes = c(1,3),choix = 'var',habillage = 'cos2',select='contrib  9',unselect=0,title="Graphe des variables de l'ACP") 
    }
    return(variable)
  })
  
  # Pour le graph des individus
  
  choix.dim.ind <- reactive ({
    if (input$choix.dim == "1 et 2"){
      ind <- plot.PCA(res.PCA, axes = c(1,2), invisible = c('ind.sup'),select='contrib  1562',habillage=1,title="Graphe des individus de l'ACP",label =c('ind','quali'))
    }
    else {
      ind <-plot.PCA(res.PCA, axes = c(1,3), invisible = c('ind.sup'),select='contrib  1562',habillage=1,title="Graphe des individus de l'ACP",label =c('ind','quali'))
    }
    return(ind)
  })
  
  # Output des graphs en fonction du choix ci-dessus
  
  output$graph_pca_var <- renderPlot({
    choix.dim.var()
  })
  output$graph_pca_ind <- renderPlot ({
    choix.dim.ind()
  })
  
  # Description du plan dim 1-2
  
  text1 <- "Le premier plan (axes 1 et 2)de l'ACP explique environ 40% des données.
Les variables blueDeaths et redAssists sont fortement corrélées, 
ainsi que blueAssists et blueKills et enfin blueGoldDiff et blueExperienceDiff.
Ces 6 variables sont bien représentées sur les axes et y contribuent bien (cos2 élevé).
Un écart positif d'expérience et d'or entre les bleus et les rouges est dans le même demi-cercle 
que le nombre de personnages tués par les bleus. 
C'est cohérent étant donné que les kills rapportent de l'or et de l'expérience.
Sur le graphe des individus, on voit bien que le demi-cercle droit est associé aux parties dont l'issue a été gagnante pour les bleus."
  
  # Description du plan dim 1-3
  
  text2 <- "Le plan 1-3 explique environ 36% des données. Sur ce plan,
les variables redWardsDestroyed et redWardsPlaced sont corrélées, 
ainsi que blueWardsDestroyed et blueWardsPlaced. Elles sont bien
représentées sur l'axe 1-3."
  
  #On exporte le texte correspondant pour les variables
  
  output$text.var <- renderText({
    if (input$choix.dim == "1 et 2"){
      return(text1)
    }else{
      return(text2)
    }
  })
  
  #On exporte le texte correspondant pour les individus
  
  output$text.ind <- renderText({
    if (input$choix.dim == "1 et 2"){
      return(text1)
    }else{
      return(text2)
    }
  })
  
  
  #### Partie Prédiction
  
  ## initialisation
  
  # On retire des individus pour la construction du modèle
  
  index_out <- sample.int(dim(tri)[1], 10)
  games_out <- tri[index_out,]
  
  # On prend les individus restants pour la construction du modèle
  
  games_cv <- tri[-index_out,]
  
  # On stocke les indices des parties du train/test choisi par l'utilisateur dans une variable temporaire

  split_tmp <- reactive({
    split <- as.numeric(input$train_test_ratio)/100
    indexes <- createDataPartition(games_cv$blueWins, p = split, list = FALSE)
    return(indexes)
  })
  
  ## On affiche les différent jeux de données
  
  output$table <- renderDataTable({
    id_split <- split_tmp()
    
    # On split en train/test set
    
    # Trainset
    train <- games_cv[id_split, ]
    
    # Testset
    test <- games_cv[-id_split, ]
    if(input$selected_set=="Entraînement"){
      return(train)
    }
    else if (input$selected_set=="Test"){
      return(test)
    }
    else if(input$selected_set=="Simulation"){
      return(games_out)
    }
  })
  
  ## Construction du modèle
  
  # On stocke le modèle calulé dans dans une variable temporaire
  
  model_tmp <- reactive({
    id_split <- split_tmp()
    train <- games_cv[id_split, ]
    trCtrl <- trainControl(method = "repeatedcv", repeats = input$n_rep, number = input$k_folds)
    model <- train(blueWins ~., data = train, method = "lda", trControl = trCtrl, metrics = 'Accuracy')
    return(model)
  })
  
  # On évalue la performance du modele en cours
  
  output$model_eval <- renderPrint({
    model <- model_tmp()
    model
  })
  
  # On affiche plus clairement l'accuracy du modèle
  
  output$acc <- renderText({
    model <- model_tmp()
    # On arrondi la valeur d'accuracy à 3 décimales
    acc <- round(model$results$Accuracy, digits = 3)
    return(as.character(acc))
  })
  
  ## Pari avec le modèle de prédiction
  
  # Indice temporaire choisi parmi les dix parties de simulations
  game_tmp <- reactive({
    game <- as.numeric(input$n_game)
    return(game)
  })
  
  # On affiche la partie de simulation choisie dans le jdd simulation
  output$chosen_game <- renderPrint({
    model <- model_tmp()
    game <- game_tmp()
    sample <- games_out[game,2:18]
    return(sample)
  })
  
  # On regarde la prédiction du modèle en cours pour la partie choisie
  output$res_game <- renderPrint({
    model <- model_tmp()
    game <- game_tmp()
    sample <- games_out[game,]
    pred_sample <- predict(model, sample)
    eval <- data.frame(original = sample$blueWins, pred = pred_sample)
    
    # On regarde la prédiction de la machine
    if(eval[2]==0){
      return("L'ordinateur pense que la partie sera perdue")
    }else if(eval[2]==1){
      return("L'ordinateur pense que vous allez gagner!")
    }
  })
  
  # On regarde si l'utilisateur choisi de se fier à son modèle
  choix_tmp <- reactive({
    choix <- input$trust
    return(choix)
  })
  
  # On regarde si l'utilisateur a fait le bon pari
  output$model_pred <- renderPrint({
    model <- model_tmp()
    game <- game_tmp()
    bet <- choix_tmp()
    sample <- games_out[game,]
    pred_sample <- predict(model, sample)
    eval <- data.frame(original = sample$blueWins, pred = pred_sample)
    # On regarde si l'utilisateur a choisi de faire confiance au modèle:
    # Et on compare la vraie issue de partie à la prédiction
    if(bet == "Indécision"){
      return("Allez faites un choix!")
    }
    # Si OUI + ordi prediction vrai 
    else if((bet == "Oui") & (eval[1]==eval[2])){
      return("BRAVO!!! Vous avez eu raison de faire confiance à votre modèle! La prédiction est de la machine est vraie")
    }
    # Si Non + ordi pred vrai
    else if((bet == "Non") & (eval[1]==eval[2])){
      return("Dommage votre modèle avait pourtant la bonne réponse... Vous auriez dû lui faire confiance.")
    }
    # Si Non + ordi faux
    else if((bet == "Non") & (eval[1]!=eval[2])){
      return("Bravo! Vous avez eu raison, votre modèle s'est trompé!")
    }
    # Il reste que si Oui + ordi faux
    else{
      return("Dommage votre modèle s'est trompé... Vous n'auriez pas dû lui faire confiance.")
    }
  })
  
}
