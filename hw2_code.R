library(tidyverse)
library(rigr)
fev <- read_csv("~/Desktop/UW MS Biostat/BIOST Winter 2022/Biost 515/R dataset/fev.csv")

#Q1
fev %>%
  ggplot(aes(x = height, y = fev)) +
  geom_point(cex = 0.7) +
  xlab("Height (inches)") +
  ylab("FEV (L/s)") +
  theme_bw() +
  geom_smooth(aes(col = "Lowess smoother"), se=F, method = "loess", show.legend=T)+
  geom_smooth(aes(col = "Linear regression"), se=F, method = "lm", show.legend = T) +
  scale_color_manual(name = "",
                     values = c("Lowess smoother"="blue",
                                "Linear regression"="red")) +
  NULL

fev %>%
  ggplot(aes(x = height, y = fev)) +
  geom_point(cex = 0.7) +
  xlab("Height (inches)") +
  ylab("FEV (L/s)") +
  theme_bw() +
  geom_smooth(aes(col = "Linear regression"), se=F, method = "lm", show.legend = T) +
  scale_color_manual(name = "",
                     values = c("Linear regression"="red")) +
  NULL
  
#different way to plot
plot(fev ~ height, data=fev, main ="FEV vs. Height", 
       xlab="Height (inches)", ylab="FEV (L/s)")

#Q2
fev_mod1 <- regress("mean", fev ~ height, data = fev)
fev_mod1
fev.ci <- fev_mod1 %>% 
  coef() %>% 
  as.data.frame() %>% 
  select(c("Estimate", "Naive SE", "Robust SE", "95%L", "95%H",
           "Pr(>|t|)")) %>% round(4)
fev.ci

#different way to store CI
fev.ci1 <- (fev_mod1 %>% coef)["height", c("Estimate", "Naive SE", "Robust SE", "95%L", "95%H",
           "Pr(>|t|)")] %>% round(4)
fev.ci1

#Q4
fev_log <- fev %>% 
  mutate(log_fev = log(fev))

fev_mod2 <- regress("mean", log_fev ~ height, data = fev_log)

fev_mod2

fev.log.ci <- (fev_mod2 %>% coef)["height", c("Estimate", "Naive SE", "Robust SE", "95%L", "95%H",
                                           "Pr(>|t|)")] %>% round(4)
fev.log.ci

regress("geometric mean", fev ~ height, data = fev)

#Q5
fev_above45 <- fev %>% 
  mutate(height_ab45 = height-45)

fev_mod3 <- regress("mean", fev ~ height_ab45, data = fev_above45)

fev_mod3

fev.ab45.ci <- (fev_mod3 %>% coef)["height_ab45", c("Estimate", "Naive SE", "Robust SE", "95%L", "95%H",
                                              "Pr(>|t|)")] %>% round(4)
fev.ab45.ci

fev_above45 %>%
  ggplot(aes(x = height_ab45, y = fev)) +
  geom_point(cex = 0.7) +
  xlab("Height above 45 (inches)") +
  ylab("FEV (L/s)") +
  theme_bw() +
  geom_smooth(aes(col = "Linear regression"), se=F, method = "lm", show.legend = T) +
  scale_color_manual(name = "",
                     values = c("Linear regression"="red")) +
  NULL

#Q6
# Residual plots of Q2 
mod1_resids <- fev_mod1 %>% residuals
fev_mod1_resids <- fev %>% mutate(mod1_resids)
fev_mod1_resids %>% ggplot(aes(height, mod1_resids)) +
  geom_point() +
  xlab("height (inches)") +
  ylab("Residual") 

# Residual plots of Q4
mod2_resids <- fev_mod2 %>% residuals
fev_mod2_resids <- fev %>% mutate(mod2_resids)
fev_mod2_resids %>% ggplot(aes(height, mod2_resids)) +
  geom_point() +
  xlab("height (inches)") +
  ylab("Residual") 

# Q7
# Here's a linear model with fev ~ height + female using rigr:regress
fev_female <- fev %>% 
  mutate(female = ifelse(sex == "female", 1, 0))
fev_mod4 <- regress("mean", fev ~ height + female, data = fev_female)
fev.female.ci <- fev_mod4 %>% coef %>% round(4)
fev.female.ci

# Q8
# Here's a linear model with fev ~ height + male using rigr:regress
fev_male <- fev %>% 
  mutate(male = ifelse(sex == "male", 1, 0))
fev_mod5 <- regress("mean", fev ~ height + male, data = fev_male)
fev.male.ci <- fev_mod5 %>% coef %>% round(4)
fev.male.ci