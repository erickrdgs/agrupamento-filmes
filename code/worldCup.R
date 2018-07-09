fifa <- read_csv(here("data/soccer.csv"))

fifa$date <- as.factor(format(fifa$date, "%Y"))

colnames(fifa)[1] <- "year"


brazil <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Brazil" | away_team == "Brazil"))

italy <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Italy" | away_team == "Italy"))

germany <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Germany" | away_team == "Germany"))

argentina <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Argentina" | away_team == "Argentina"))

mexico <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Mexico" | away_team == "Mexico"))

spain <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Spain"| away_team == "Spain"))

france <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "France"| away_team == "France"))

england <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "England"| away_team == "England"))

belgium <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Belgium"| away_team == "Belgium"))

uruguay <- fifa %>%
    filter(tournament == "FIFA World Cup" & (home_team == "Uruguay"| away_team == "Uruguay"))

brazil[brazil$away_team == "Brazil",
       c("home_team", "away_team", "home_score", "away_score")] <- brazil[brazil$away_team == "Brazil",
                                                                          c("away_team", "home_team", "away_score", "home_score")]
italy[italy$away_team == "Italy",
      c("home_team", "away_team", "home_score", "away_score")] <- italy[italy$away_team == "Italy",
                                                                        c("away_team", "home_team", "away_score", "home_score")]
germany[germany$away_team == "Germany",
        c("home_team", "away_team", "home_score", "away_score")] <- germany[germany$away_team == "Germany",
                                                                            c("away_team", "home_team", "away_score", "home_score")]
argentina[argentina$away_team == "Argentina",
          c("home_team", "away_team", "home_score", "away_score")] <- argentina[argentina$away_team == "Argentina",
                                                                                c("away_team", "home_team", "away_score", "home_score")]
mexico[mexico$away_team == "Mexico",
       c("home_team", "away_team", "home_score", "away_score")] <- mexico[mexico$away_team == "Mexico",
                                                                          c("away_team", "home_team", "away_score", "home_score")]
spain[spain$away_team == "Spain",
      c("home_team", "away_team", "home_score", "away_score")] <- spain[spain$away_team == "Spain",
                                                                        c("away_team", "home_team", "away_score", "home_score")]
france[france$away_team == "France",
       c("home_team", "away_team", "home_score", "away_score")] <- france[france$away_team == "France",
                                                                          c("away_team", "home_team", "away_score", "home_score")]
england[england$away_team == "England",
        c("home_team", "away_team", "home_score", "away_score")] <- england[england$away_team == "England",
                                                                            c("away_team", "home_team", "away_score", "home_score")]
belgium[belgium$away_team == "Belgium",
        c("home_team", "away_team", "home_score", "away_score")] <- belgium[belgium$away_team == "Belgium",
                                                                            c("away_team", "home_team", "away_score", "home_score")]
uruguay[uruguay$away_team == "Uruguay",
        c("home_team", "away_team", "home_score", "away_score")] <-uruguay[uruguay$away_team == "Uruguay",
                                                                           c("away_team", "home_team", "away_score", "home_score")]

brazil <- brazil %>%
    group_by(year) %>%
    summarise(team = "Brazil", scored = sum(home_score), taken = sum(away_score))

italy <- italy %>%
    group_by(year) %>%
    summarise(team = "Italy", scored = sum(home_score), taken = sum(away_score))

germany <- germany %>%
    group_by(year) %>%
    summarise(team = "Germany", scored = sum(home_score), taken = sum(away_score))

argentina <- argentina %>%
    group_by(year) %>%
    summarise(team = "Argentina", scored = sum(home_score), taken = sum(away_score))

mexico <- mexico %>%
    group_by(year) %>%
    summarise(team = "Mexico", scored = sum(home_score), taken = sum(away_score))

spain <- spain %>%
    group_by(year) %>%
    summarise(team = "Spain", scored = sum(home_score), taken = sum(away_score))

france <- france %>%
    group_by(year) %>%
    summarise(team = "France", scored = sum(home_score), taken = sum(away_score))

england <- england %>%
    group_by(year) %>%
    summarise(team = "England", scored = sum(home_score), taken = sum(away_score))

belgium <- belgium %>%
    group_by(year) %>%
    summarise(team = "Belgium", scored = sum(home_score), taken = sum(away_score))

uruguay <- uruguay %>%
    group_by(year) %>%
    summarise(team = "Uruguay", scored = sum(home_score), taken = sum(away_score))

worldCup <- rbind(brazil, italy, germany, argentina, mexico, spain, france, england, belgium, uruguay)

worldCup <- worldCup[order(worldCup$year), ]

worldCup %>%
    write_csv(here("data/worldCup.csv"))


