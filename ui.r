fluidPage(
  # Choix du theme dashboardshiny
  theme = bs_theme(version = 4,
                   bootswatch = "lux",
                   bg = "#0A1428",
                   fg = "#C89B3C"),
  # Affichage du logo
    navbarPage(
      titlePanel(title =
                   div(
                     img(
                       src = "icone.png",
                       height = 70,
                       width = 70,
                       style = "margin:10px 10px"
                     ),
                     "League Of Legends",
                   )
      ),
      navbarMenu("Introduction",
                 icon = icon("gamepad"),
                 tabPanel("Présentation de League Of Legends" ,style = "font-family: Spiegel;",
                          navlistPanel(
                            ## Onglet de résumé rapide du jeu
                            tabPanel("Résumé rapide du jeu",
                                     mainPanel(imageOutput("Jeu"),
                                               p("League of Legends (LOL) est un jeu du type MOBA c’est-à-dire Multiplayer Online Battle Area. 10 joueurs s’affrontent en équipes de 5, les bleus et les rouges. Chaque joueur a un poste défini avant la partie, selon son poste il ne jouera pas au même endroit, ni de la même façon que les autres joueurs.", align = "justify"),
                                               p("Le but du jeu est de détruire le Nexus ennemi, pour cela, il faut détruire toutes les tours sur le chemin jusqu’à celui-ci sur au moins l’une des 3 voies possible (bottom, mid, top), puis détruire celui-ci. Des minions/sbires apparaissent à intervalles périodiques de chaque côté de la carte, ceux-ci vous permettront de gagner de l’or pour acheter des équipements et ainsi rendre votre champion plus puissant, mais aussi de détruire les tours. Une partie dure environ 25 à 30 minutes.", align = "justify"),
                                               p("Lorsque vous mourrez, votre champion ressuscite après un temps défini selon votre niveau (de plus en plus long). Attention de ne pas trop mourir, les ennemis gagnent de l’argent et profitent de votre non-présence sur la carte pour prendre des objectifs, et ainsi, l’avantage.", align = "justify"),
                                               p("A partir d’un jeu de données sur les 10 premières minutes de jeu d’équipes de joueurs de haut niveau (dans les 0,1% de meilleurs joueurs), il est intéressant de se demander si les paramètres des 10 premières minutes de jeu peuvent prédire l’issue d’une partie.", align = "justify")
                                     )
                            ),
                            ## Onglet de carte du jeu
                            tabPanel("Carte du jeu",
                                     mainPanel(imageOutput("Carte")
                                     )
                            ),
                            ## Onglet des différents rôles
                            tabPanel("Différents rôles",
                                     mainPanel(
                                       tabsetPanel(
                                         ## Description de la Toplane
                                         tabPanel("Top",
                                                  imageOutput("Toplane"),
                                                  p("Nous allons prendre la carte de haut en bas et commencer par la voie du haut. C’est un rôle dans lequel un joueur doit être très autonome. La voie du haut est souvent considérée comme une « île » puisque les junglers et les midlaners ont tendance à se déplacer vers la voie du bas pour contrôler le dragon.", align = "justify"),
                                                  p("Voilà pourquoi les champions jouant dans la voie du haut ont souvent une capacité de survie élevée ou des engagements décents pour démarrer des escarmouches pour le contrôle de la voie. Il existe différents types de classes de top lane que nous allons examiner maintenant : ", align = "justify"),
                                                  tabsetPanel(
                                                    tabPanel("Les tanks",
                                                             p("Les tanks sont probablement la première chose à laquelle vous pensez quand il s’agit de top laners. Ce sont les grands champions costauds qui peuvent résister aux dégâts. Ils sont ennuyeux à jouer, mais leur capacité de survie est exceptionnelle. Pour une raison quelconque, l’équipe ennemie se concentrera toujours sur vous (probablement parce que vous êtes gros) en donnant à vos alliés le temps d’infliger des dégâts.", align = "justify"),
                                                             p("Vous construirez des objets de résistance magique et d’armure en tant que champions tank", align = "justify")),
                                                    tabPanel("Les bruisers",
                                                             p("Les bruisers sont une autre classe dans League of Legends, mais cette classe n’est pas exclusive à la voie du haut.", align = "justify"),
                                                             p("Ces champions ont un grand engagement et adorent escarmoucher. Ils ne sont pas aussi résistants que les tanks mais ils auront des dégâts insensés dans leur kit.", align = "justify"))
                                                  )),
                                         ## Description de la Jungle
                                         tabPanel("Jungle",
                                                  imageOutput("Jungle"),
                                                  p("Les junglers sont les champions qui se déplacent entre les différentes voies. Ils commencent à prendre de l'expérience et de l'or sur les monstres de la jungle avant de se déplacer dans les différentes voies et de les ganker. Un gank fait référence à un champion qui se déplace dans une autre voie pour s’engager dans une petite escarmouche et se battre, ce dans quoi les junglers excellent.", align = "justify"),
                                                  p("Vous contrôlez le déroulement du jeu et prenez des décisions avec les informations que vous recueillez, tout en gardant un œil sur le jungler adverse. Dans ce rôle, il existe également différentes classes à examiner : ", align = "justify"),
                                                  tabsetPanel(
                                                    tabPanel("Les farmers",
                                                             p("Ce sont des junglers qui farmeront (récolter de l'expérience et de l'or) constamment leur jungle pour gagner le plus d’or possible. Ces champions ne gankeront qu’une fois qu’ils seront sûrs à cent pour cent qu’un gank réussira réellement.", align = "justify"),
                                                             p("Ce sont des champions qui porteront une fois que vous aurez atteint le milieu de partie. Assurez-vous donc de jouer en toute sécurité jusque-là. Vous obtenez des informations et faites savoir à votre équipe où se trouve l’ennemi, mais vous n'irez pas dans la jungle adverse avant d’avoir quelques objets.", align = "justify")),
                                                    tabPanel("Les gankers",
                                                             p("Ce sont des champions qui aiment chercher des ganks tôt. Vous voudrez gagner autant d’or que possible pour devenir le 'carry' de votre équipe (personne qui contribue très fortement à la victoire de l'équipe). Vous remporterez cet or en tuant des champions adverses", align = "justify"),
                                                             p("Vous ne vous soucierez pas de savoir si l’ennemi essaie d’envahir pour prendre votre jungle car vous pourrez le tuer, ou bien prendre sa jungle pendant ce temps. Vous recherchez des combats à gauche et à droite.", align = "justify"))
                                                  )),
                                         ## Description du Mid
                                         tabPanel("Mid",
                                                  imageOutput("Midlane"),
                                                  p("La voie médiane est souvent considérée comme le rôle le plus important dans League of Legends. C’est le cœur de l’équipe et le chemin le plus rapide vers la base ennemie. La voie médiane contrôle le rythme du jeu et selon le champion que vous choisissez de jouer, le déroulement du jeu sera soit rapide, soit lent.", align = "justify"),
                                                  p("Il existe de nombreux champions différents sur la voie médiane, comme dans tout autre rôle, donc bien sûr, nous devons également passer en revue certaines classes de champions qui différencient les mid laners les uns des autres : ", align = "justify"),
                                                  tabsetPanel(
                                                    tabPanel("Les mages",
                                                             p("Les mages sont un rôle unique qui peut encore une fois être divisé en deux rôles. Contrôlez les mages et les mages itinérants. Les mages de contrôle sont pour ceux d’entre vous qui aiment avoir le contrôle et jouer la sécurité. Les mages de contrôle ont besoin de farm beaucoup et de jouer en toute sécurité avant de pouvoir vraiment commencer. Vous resterez probablement dans la voie pendant la majeure partie du début du jeu et ne partirez pas en vadrouille.", align = "justify"),
                                                             p("D’autre part, les mages itinérants, vont push (pousser les minions sur la tour adverse) leur voie puis se dirigeront vers la voie du haut ou la voie du bas, pour aider leur équipe. Ils aident le reste de leur équipe et gagnent des avantages tout autour de la carte grâce à leur mobilité rapide.", align = "justify")),
                                                    tabPanel("Les assassins",
                                                             p("Ce sont des champions qui peuvent récolter quelques éliminations tôt, puis faire effet boule de neige jusqu’en fin de partie.", align = "justify"),
                                                             p("Ce sont des champions qui excelleront également en itinérance, semblable aux mages errants. Ils peuvent apparaître dans la voie du bas de nulle part ou se cacher dans un buisson, attendant que le mid laner adverse baisse sa garde.", align = "justify"))
                                                  )),
                                         ## Description de l'ADC
                                         tabPanel("Adc",
                                                  imageOutput("ADC"),
                                                  p("La voie du bas est l’un des rôles les plus populaires de League of Legends. En tant que bot laner, vous avez le choix de jouer un APC — Ability Power Carry (joueur d'attaque magique) — ou un ADC — Attack Damage Carry (joueur d'attaque physique).", align = "justify"),
                                                  p("La plupart des champions de la voie du bas commenceront plutôt faibles, leur manque de mobilité et d’armure les rend sensibles aux ganks, mais dans les dernières étapes du jeu, ils sont souvent considérés comme le principal porteur de n’importe quel combat. Donc, si vous voulez être le héros de votre équipe, alors c’est le poste qu’il vous faut.", align = "justify"),
                                                  tabsetPanel(
                                                    tabPanel("Les Hyper Carry",
                                                             p("L’hyper carry est le champion qui démarre extrêmement faible. Vous avez un objectif en tête dans les premières étapes du jeu et c’est de farm.", align = "justify"),
                                                             p("Une fois que vous parvenez à acheter quelques objets, vous serez la principale source de dégâts pour votre équipe. Obtenir quelques victimes tôt est également formidable, car cela vous permet d’acheter plus tôt les objets de dégâts dont vous avez tant besoin, et donc devancer l'ADC adverse", align = "justify")),
                                                    tabPanel("Les Intimidateurs de voie",
                                                             p("C'est un puissant bot laner en début de partie. Ce champion vous permet de push constamment dans la botlane. Vous devez cependant faire attention à ne pas vous faire ganker, étant si proche de la tourelle ennemie, il est donc important de garder la vision dans la rivière pour vous assurer que le jungler adverse n’est pas en train de descendre vers vous.", align = "justify"),
                                                             p("Vous voudrez également jouer les intimidateurs de voie aux côtés des supports d’engagement, car vous serez ceux qui feront le premier pas dans les escarmouches dès le début.", align = "justify"))
                                                  )),
                                         ## Description du Support
                                         tabPanel("Support",
                                                  imageOutput("Support"),
                                                  p("Le rôle de support est celui que la plupart considèrent comme le plus facile. Le point principal du support est de permettre à l’équipe de profiter de ses capacités de guérison, d’affaiblissement ou de protection.", align = "justify"),
                                                  p("Le support joue dans la voie du bas aux côtés de l’ADC ou de l’APC. Ils aident leur partenaire à prendre de l’avance dans la voie et selon le type de support que vous jouez, vous pouvez parcourir la carte pour aider le reste de votre équipe ou rester à côté de votre partenaire de la voie du bas.", align = "justify"),
                                                  tabsetPanel(
                                                    tabPanel("Les supports d'engagement",
                                                             p("En tant que support d’engagement, vous devez avoir un œil attentif sur le positionnement des ennemis. Un pas trop loin en avant et vous serez le seul à bondir dessus, faisant savoir à votre partenaire de voie qu’il est temps d’entrer. En raison de cette nature agressive pendant la phase de laning, nous vous suggérons d’associer des supports d’engagement avec des champions intimidateurs de voie.", align = "justify"),
                                                             p("Les supports d’engagement sont plus tank et ont dans leur kit de sorts de quoi attirer l'ennemi ou de quoi l'étourdir et/ou de quoi le ralentir qui permettra à toute escarmouche de commencer. ", align = "justify")),
                                                    tabPanel("Les supports enchanteurs",
                                                             p("Les enchanteurs sont des champions de guérison et de protection. Ils sont beaucoup moins agressifs que leurs homologues d'engagement et resteront en arrière et s’assureront que leur équipe reste en vie pendant des combats prolongés.", align = "justify"),
                                                             p("L’objectif principal ici n’est pas d’infliger des dégâts ou de commencer des combats, mais plutôt vous voudrez garder votre partenaire (ADC) en vie afin qu’il puisse farm en paix et ne pas mourir à aucun gank. Cependant, vous devrez également vous méfier car vous êtes vous-même assez faible !", align = "justify"))
                                                  ))
                                       )
                                     )
                            )
                          )
                 ),
                 # Description du jeu de données
                 tabPanel("Présentation du jeu de données",style = "font-family: Spiegel;", 
                          p("Nous disposons d'un jeu de données contenant des valeur sur les informations des 10 premières minutes de jeu d'environ 10 000 parties avec 38 variables, 19 par équipe. Source : Kaggle."),
                          p("Il n'y a aucune donnée manquante dans ce jeu de données, en revanche nous avons eu affaire à des abérations, nottament au niveau des balises de vision, nous avons donc sélectionné les parties ou les équipes en posaient 30 ou moins dans les 10 premières minutes de jeu (déjà un gros chiffre)."),
                          p("Nous avons aussi supprimé les doublons de données, les morts et kills de l'équipe rouge sont forcément les kills et les morts de l'équipe bleue, la différence de golds des rouges est le contraire de celle du côté bleu, etc ..."),
                          p("Nous avons retiré d'autres données comme le niveau moyen des champions car celui-ci est déjà résumé par l'expérience de chaque équipe, elle même résumée par la différence d'expérience entre les 2 équipes."),
                          p("Enfin, nous avons fusionné les données des objectifs (heralds et dragons), sachant qu'en 10 minutes, ces objectifs n'ont pu être pris qu'une seule fois. Donc 0 signifie que l'objectif n'a été récupéré par aucune des 2 équipes, 1 signifie que l'équipe bleue a récupéré l'objectif et 2 l'équipe rouge."),
                          p("Nous arrivons donc à un total de 20 variables et 6812 individus"),
                          p(" "),
                          p(" "),
                          tags$h4(p("Problématique :", align = "center")),
                          tags$h5(p("Dans quelle mesure les données les 10 premières minutes d'une partie peuvent prédire son issue ?", align = "center"))
                 )
      ),
      navbarMenu("Explorations des données",
                 icon = icon("chart-area"),
                 tabPanel ("Aperçu des données", 
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Résumé des données", "Summary",verbatimTextOutput("summary")),
                               tabPanel ("Head", dataTableOutput(outputId = "dataTable"))))),
                 tabPanel("Visualisation graphique",style = "font-family: Spiegel;", 
                          mainPanel(
                            tabsetPanel(
                              tabPanel("Equipe gagnante",plotOutput ("plotBlueWins")),
                              tabPanel("Plot Objectifs" ,
                                       sidebarLayout(
                                         sidebarPanel(
                                           # Choix du graph à afficher par l'utilisateur
                                           radioButtons(inputId = "to.plot", label = "Choix du graphe à afficher", choices = c("heralds", "dragons"), selected = "heralds")),
                                         mainPanel(tags$h6("Représentation des objectifs (dragons et heralds) dans le jeu de données", align = "center"),
                                                   p("Durant les 10 premières minutes, ces objectifs apparaissent 1 fois chacun. Il sont donc chacuns récupérés au plus 1 fois par 1 équipe."), plotOutput ("plotObjectif"))
                                       )),
                              tabPanel ("Autres graphes",plotOutput ("plotGoldExp")),
                              tabPanel ("Scatterplot",
                                        p("On veut observer quelles variables sont corrélées entre elles ou non ", align ="center"),
                                        plotOutput("pairs"))
                            ))),
                 tabPanel("Analyses", 
                          tabPanel("Analyses",
                                   sidebarLayout(
                                     sidebarPanel(
                                       # Choix des dimensions à afficher sur l'ACP
                                       radioButtons(inputId = "choix.dim", label = "Dimensions à afficher", choices = c("1 et 2", "1 et 3"), selected = "1 et 2")
                                     ),
                                     mainPanel(tabsetPanel(
                                       tabPanel("ACP : Graphe des variables",plotOutput("graph_pca_var"),verbatimTextOutput("text.var")),
                                       tabPanel("ACP : graphe des individus", plotOutput("graph_pca_ind"),verbatimTextOutput("text.ind"))
                                       
                                     )
                                     )
                                   )
                          )
                 )
      ),
      navbarMenu("Outil de prédiction",
                 icon = icon("laptop"),
                 
                 tabPanel("Visualisation des données",style = "font-family: Spiegel;",
                          sidebarLayout(
                            sidebarPanel(
                              h4("Partitions du jeu de données :"),
                              # Choix de l'affichage par l'utilisateur
                              selectInput("selected_set",
                                          "Visualisation des parties",
                                          choices = c("Entraînement","Test","Simulation"), "Simulation"),
                              br(),
                            ),
                            
                            mainPanel(
                              tags$h3("Visualisation du jeu de données sélectionné : "),
                              dataTableOutput(outputId = "table")
                            )
                          )
                 ),
                 
                 
                 tabPanel("Construisez votre modèle",style = "font-family: Spiegel;",
                          sidebarLayout(
                            sidebarPanel(
                              # Choix du nombre de segments du jeu d'entrainement
                              sliderInput(inputId = "k_folds",
                                          "Nombre de segments du jeu d'entrainement lors de la validation croisée",
                                          min = 2,
                                          max = 50,
                                          value = 3),
                              
                              # Choix de la proportion du train test
                              sliderInput(inputId = "train_test_ratio",
                                          "Quel proportion du jeu de données voulez vous utiliser comme jeu d'entrâinement pour construire votre modèle de prédiction? (Environ 70% à 80% semble être un bon comprmis, mais faites vous plaisir!)",
                                          min = 1,
                                          max = 100,
                                          value = 80),
                              
                              # Choix du nombre de répétitions de la validation croisée
                              sliderInput(inputId = "n_rep",
                                          "Nombre de répétitions pour la validation croisée",
                                          min = 1,
                                          max = 200,
                                          value = 5)
                            ),
                            
                            mainPanel(
                              
                              tags$h3("Evaluation du modèle :"),
                              tags$h6("(Veuillez patienter quelques secondes svp... Cela peut prendre un moment si la validation croisée à beaucoup de répitions et de folds à tester.)"),
                              verbatimTextOutput(outputId = "model_eval"),
                              
                              tags$h4('La "précision" du modèle est de  :'),
                              textOutput(outputId = 'acc')
                            )
                          )
                 ),
                 
                 tabPanel("Pariez avec ou contre votre modèle de prédiction",style = "font-family: Spiegel;",
                          sidebarLayout(
                            sidebarPanel(
                              
                              tags$h3("Sélection d'une partie :"),
                              # Choisir laquelle des 10 parties on veut utiliser pour le test
                              radioButtons(inputId = "n_game",
                                           label = "Sélectionner une des 10 parties à tester",
                                           choices = c(1:10)),
                              
                              tags$h4("Description de la partie choisie  :"),
                              verbatimTextOutput(outputId = "chosen_game")
                            ),
                            
                            mainPanel(
                              
                              tags$h4("Voici la prédiction de l'issue de la partie de votre modèle :"),
                              verbatimTextOutput(outputId = "res_game"),
                              
                              tags$h4("A vous de jouer, faites un pari!"),
                              # Dialogue avec l'utilisateur, savoir s'il croit le modèle ou non, selon ce qu'il pense des données
                              radioButtons(inputId = "trust",
                                           label = "Choisissez-vous de faire confiance à votre modèle de prédiction?",
                                           choices = c("Indécision", "Oui", "Non")),
                              
                              tags$h3("Issue de la partie  :"),
                              verbatimTextOutput(outputId = "model_pred")
                            )
                          )
                 )
      )
    )
  )
  