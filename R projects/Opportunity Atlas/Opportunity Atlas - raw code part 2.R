# Lucas Pao Empirical Project 1 Part 2

rm(list=ls())

library(tidyverse)
library(haven)

## Read data 
atlas <- read_dta("atlas.dta")
Nashville <- subset(atlas, atlas$state == 47 & atlas$cz == 5600)

#Report correlations
p <- 20
c1 <- matrix(0, p, 1)
c2 <- matrix(0, p, 1)

c1[1] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$hhinc_mean2000, use="complete.obs")
c1[2] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$mean_commutetime2000, use="complete.obs")
c1[3] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$frac_coll_plus2010, use="complete.obs")
c1[4] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$foreign_share2010, use="complete.obs")
c1[5] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$med_hhinc2016, use="complete.obs")
c1[6] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$popdensity2010, use="complete.obs")
c1[7] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$poor_share2010, use="complete.obs")
c1[8] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$gsmn_math_g3_2013, use="complete.obs")
c1[9] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$rent_twobed2015, use="complete.obs")
c1[10] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$singleparent_share2010, use="complete.obs")
c1[11] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$traveltime15_2010, use="complete.obs")
c1[12] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$emp2000, use="complete.obs")
c1[13] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$mail_return_rate2010, use="complete.obs")
c1[14] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$ln_wage_growth_hs_grad, use="complete.obs")
c1[15] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$jobs_total_5mi_2015, use="complete.obs")
c1[16] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$jobs_highpay_5mi_2015, use="complete.obs")
c1[17] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$nonwhite_share2010, use="complete.obs")
c1[18] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$ann_avg_job_growth_2004_2013, use="complete.obs")
c1[19] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$job_density_2013, use="complete.obs")
c1[20] <- cor(Nashville$kfr_pooled_pooled_p25, Nashville$jail_pooled_pooled_p25, use="complete.obs")

c2[1] <- "hhinc_mean2000"
c2[2] <- "mean_commutetime2000"
c2[3] <- "frac_coll_plus2010"
c2[4] <- "foreign_share2010"
c2[5] <- "med_hhinc2016"
c2[6] <- "popdensity2010"
c2[7] <- "poor_share2010"
c2[8] <- "gsmn_math_g3_2013"
c2[9] <- "rent_twobed2015"
c2[10] <- "singleparent_share2010"
c2[11] <- "traveltime15_2010"
c2[12] <- "emp2000"
c2[13] <- "mail_return_rate2010"
c2[14] <- "In_wage_growth_hs_grad"
c2[15] <- "jobs_total_5mi_2015"
c2[16] <- "jobs_highpay_5mi_2015"
c2[17] <- "nonwhite_share2010"
c2[18] <- "ann_avg_job_growth_2004_2013"
c2[19] <- "job_density_2013"
c2[20] <- "jail_pooled_pooled_p25"

data_for_graph <- data.frame(c1, c2)

# Change name of data frame columns
names(data_for_graph)[1] <- "Correlation"
names(data_for_graph)[2] <- "Covariate"

## Visualize data / Plot correlates
ggplot(data = data_for_graph ) +
  geom_point(aes(y= Covariate, x= Correlation))  +
  geom_vline(xintercept=0) 

sink(file="Nashville_log.txt", split=TRUE)
sink()
