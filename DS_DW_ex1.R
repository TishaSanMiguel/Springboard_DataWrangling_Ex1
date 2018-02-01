library(tidyverse)

raw_data <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/refine_original.csv")
raw_data %>% glimpse

#rename companies
company <-raw_data$company
gsub(pattern =  "[p|P|f].*", replacement = "philips", x = company)
gsub(pattern =  "[a|A].*", replacement = "azko", x = company)
gsub(pattern =  "[v|V].*", replacement = "van houten", x = company)
gsub(pattern =  "[u|U].*", replacement = "unilever", x = company)

#separate product code and product number
separate(raw_data, "Product code / number", c("product code", "number"), sep = "-") 

#create a product category
product_code <- c("p", "v", "x", "q")
product <- c("Smartphone", "TV", "Laptop", "Tablet")
mutate(raw_data, product_category = replace(product_code, product))


#add full ddress for geocoding
unite(raw_data, "full_address", address, city, country, sep = ",")

#creat dummy variable for company and product code
company_philips = ifelse(raw_data$company == "philips", 1, 0)%>% 
company_akzo = ifelse(raw_data$company == "akzo", 1, 0) %>% 
company_van_houten = ifelse(raw_data$company == "van houten", 1, 0)%>% 
company_unilever = ifelse(raw_data$company == "unilever", 1, 0)%>% 

product_smartphone = ifelse(product_code == "p", 1, 0)%>% 
product_tv = ifelse(product_code == "v", 1, 0)%>% 
product_laptop = ifelse(product_code == "x", 1, 0)%>% 
product_tablet = ifelse(product_code == "q", 1, 0)
  


  

                                  
                        
                                  