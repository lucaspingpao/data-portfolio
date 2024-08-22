# Lucas Pao Empirical Project 1 Part 1

# Overall -----------------------------------------------------------------

# Read Data
atlas <- read_dta("atlas.dta")
Tennessee <- subset(atlas, atlas$state == 47); head(Tennessee)
Davidson <- subset(Tennessee, Tennessee$county == 37); head(Davidson)
Belmont <- subset(Davidson, Davidson$tract == 16900); head(Belmont)

# Upward mobility of ALL Americans
US_kfrPooled <- atlas$kfr_pooled_pooled_p25; US_kfrPooled <- na.omit(US_kfrPooled); head(US_kfrPooled)
TN_kfrPooled <- Tennessee$kfr_pooled_pooled_p25; TN_kfrPooled <- na.omit(TN_kfrPooled); head(TN_kfrPooled)
Davidson_kfrPooled<- Davidson$kfr_pooled_pooled_p25; Davidson_kfrPooled <- na.omit(Davidson_kfrPooled); head(Davidson_kfrPooled)
Belmont_kfrPooled <- Belmont$kfr_pooled_pooled_p25; head(Belmont_kfrPooled)

# Upward mobility of White Americans
US_kfrWhite <- atlas$kfr_white_pooled_p25; US_kfrWhite <- na.omit(US_kfrWhite); head(US_kfrWhite)
TN_kfrWhite <- Tennessee$kfr_white_pooled_p25; TN_kfrWhite <- na.omit(TN_kfrWhite); head(TN_kfrWhite)
Davidson_kfrWhite<- Davidson$kfr_white_pooled_p25; Davidson_kfrWhite <- na.omit(Davidson_kfrWhite); head(Davidson_kfrWhite)
Belmont_kfrWhite <- Belmont$kfr_white_pooled_p25; head(Belmont_kfrWhite)

# Upward mobility of Black Americans
US_kfrBlack <- atlas$kfr_black_pooled_p25; US_kfrBlack <- na.omit(US_kfrBlack); head(US_kfrBlack)
TN_kfrBlack <- Tennessee$kfr_black_pooled_p25; TN_kfrBlack <- na.omit(TN_kfrBlack); head(TN_kfrBlack)
Davidson_kfrBlack<- Davidson$kfr_black_pooled_p25; Davidson_kfrBlack <- na.omit(Davidson_kfrBlack); head(Davidson_kfrBlack)
Belmont_kfrBlack <- Belmont$kfr_black_pooled_p25; head(Belmont_kfrBlack)

# Upward mobility of Hispanic Americans
US_kfrHisp <- atlas$kfr_hisp_pooled_p25; US_kfrHisp <- na.omit(US_kfrHisp); head(US_kfrHisp)
TN_kfrHisp <- Tennessee$kfr_hisp_pooled_p25; TN_kfrHisp <- na.omit(TN_kfrHisp); head(TN_kfrHisp)
Davidson_kfrHisp<- Davidson$kfr_hisp_pooled_p25; Davidson_kfrHisp <- na.omit(Davidson_kfrHisp); head(Davidson_kfrHisp)
Belmont_kfrHisp <- Belmont$kfr_hisp_pooled_p25; head(Belmont_kfrHisp)

# Question 5 --------------------------------------------------------------

# Average Upward Mobility of all Census Tracts in given region
mean(US_kfrPooled)
mean(TN_kfrPooled)
mean(Belmont_kfrPooled)
mean(US_kfrWhite)
mean(TN_kfrWhite)
mean(Belmont_kfrWhite)
mean(US_kfrBlack)
mean(TN_kfrBlack)
mean(Belmont_kfrBlack)
mean(US_kfrHisp)
mean(TN_kfrHisp)
mean(Belmont_kfrHisp)

# Question 6 --------------------------------------------------------------

# Standard deviation of Upward Mobility of all Census Tracts in given region
sd(US_kfrPooled)
sd(TN_kfrPooled)
sd(Davidson_kfrPooled)
sd(US_kfrWhite)
sd(TN_kfrWhite)
sd(Davidson_kfrWhite)
sd(US_kfrBlack)
sd(TN_kfrBlack)
sd(Davidson_kfrBlack)
sd(US_kfrHisp)
sd(TN_kfrHisp)
sd(Davidson_kfrHisp)

# Question 7 --------------------------------------------------------------

# Histogram of home county
hist(Davidson_kfrPooled)
hist(Davidson_kfrWhite)
hist(Davidson_kfrBlack)
hist(Davidson_kfrHisp)

# Question 8 --------------------------------------------------------------
# See results from Question 5 and 6


# Question 9 --------------------------------------------------------------

# Correlation coefficients

# Upward Mobility vs. Employment Rate
Davidson_kfr_vs_emp <- data.frame(Davidson$kfr_pooled_pooled_p25, Davidson$emp2000)
Davidson_kfr_vs_emp <- na.omit(Davidson_kfr_vs_emp)
cor(Davidson_kfr_vs_emp$Davidson.kfr_pooled_pooled_p25, Davidson_kfr_vs_emp$Davidson.emp2000)

# Upward Mobility vs. High-Paying Jobs
Davidson_kfr_vs_jobs <- data.frame(Davidson$kfr_pooled_pooled_p25, Davidson$jobs_highpay_5mi_2015)
Davidson_kfr_vs_jobs <- na.omit(Davidson_kfr_vs_jobs)
cor(Davidson_kfr_vs_jobs$Davidson.kfr_pooled_pooled_p25, Davidson_kfr_vs_jobs$Davidson.jobs_highpay_5mi_2015)

# Upward Mobility vs. Job Growth
Davidson_kfr_vs_jobgrowth <- data.frame(Davidson$kfr_pooled_pooled_p25, Davidson$ann_avg_job_growth_2004_2013)
Davidson_kfr_vs_jobgrowth <- na.omit(Davidson_kfr_vs_jobgrowth)
cor(Davidson_kfr_vs_jobgrowth$Davidson.kfr_pooled_pooled_p25, Davidson_kfr_vs_jobgrowth$Davidson.ann_avg_job_growth_2004_2013)

# Question 10 --------------------------------------------------------------

summary(Davidson_kfr_vs_emp$Davidson.emp2000)
# Scatter plot Upward Mobility vs. Employment Rate
g <- ggplot(Davidson_kfr_vs_emp, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.emp2000))
g + geom_point(shape=1, alpha=1/2)
# Binscatter Upward Mobility vs. Employment Rate
g <- ggplot(Davidson_kfr_vs_emp, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.emp2000))
g + stat_binmean(n = 20) + stat_smooth(method = "lm", se = FALSE) + geom_point(shape=1, alpha=1/8)

# Scatter plot Upward Mobility vs. High-Paying Jobs
g <- ggplot(Davidson_kfr_vs_jobs, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.jobs_highpay_5mi_2015))
g + geom_point(shape=1, alpha=1/2)
# Binscatter Upward Mobility vs. High-Paying Jobs
g <- ggplot(Davidson_kfr_vs_jobs, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.jobs_highpay_5mi_2015))
g + stat_binmean(n = 20) + stat_smooth(method = "lm", se = FALSE) + geom_point(shape=1, alpha=1/8)

# Scatter plot Upward Mobility vs. Job Growth
g <- ggplot(Davidson_kfr_vs_jobgrowth, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.ann_avg_job_growth_2004_2013))
g + geom_point(shape=1, alpha=1/2)
# Binscatter Upward Mobility vs. Job Growth
g <- ggplot(Davidson_kfr_vs_jobgrowth, aes(x = Davidson.kfr_pooled_pooled_p25 , y = Davidson.ann_avg_job_growth_2004_2013))
g + stat_binmean(n = 20) + stat_smooth(method = "lm", se = FALSE) + geom_point(shape=1, alpha=1/8)

