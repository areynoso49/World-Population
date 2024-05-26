### Renaming the dataset ###
pop = World_Population_2023

### Rename land area variable ###
pop$land_area = pop$`Land Area (km2`

### Visualization of scatter plot between population and land area ###
plot(pop$Population, pop$`Land Area (km2`, main = "Correlation between Population and Land Size", 
     xlab = "Population", ylab = "Land Area", col = "blue", pch = 16)

### Creating a training and testing dataset ###
subset = sample(nrow(pop), nrow(pop) *0.8)
train_pop = pop[subset,]
test_pop = pop[-subset,]

### Build a Linear regression model between population and land area ###
pop_lm = lm(Population ~ land_area, train_pop)
summary(pop_lm)

### The performance of the linear regression model shows that land area does have an effect on 
### population size, however the adjusted r-squared also tells us that land area size is not the 
### only factor that influences population size. Land area size could only predict 22% of the 
### country's population size. 

predict = predict(pop_lm, test_pop)
actual_values = test_pop$Population

mse = mean((actual_values - predict)^2)
print(mse)

### The MSE can be expressed as 2.90012×10^16 = 29,001,200,000,000,000. This number may seem 
### like a very large error and indeed it is, however it is important to keep into consideration 
### the size of the numbers I calculated. Majority of the population and land area numbers are 
### between 6 to 8 figure numbers. So when adding all of the errors together, squaring it, and 
### then dividing by the number of countries, we can assume the number will be large. 
### In summary, although land area size does account for some of the reason for population size, 
### there are other factors that should be considered when studying the causes of population size. 