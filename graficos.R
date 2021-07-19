library(tidyverse)

starwars

#relacao peso x altura

starwars %>% ggplot()

starwars %>% ggplot()+geom_point(aes(x=mass, y=height))

max(starwars$mass, na.rm=TRUE) #o jabba

#vamos tirar o jabba da base
starwars %>% filter(mass<500) 
