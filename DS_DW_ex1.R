library(tidyverse)

raw_data <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/refine_original.csv")
raw_data %>% glimpse

#rename companies
raw_data <- raw_data$company
gsub(pattern =  "[p|P|f].*", replacement = "philips", x = company) 
gsub(pattern =  "[a|A].*", replacement = "azko", x = company) 
gsub(pattern =  "[v|V].*", replacement = "van houten", x = company)   
gsub(pattern =  "[u|U].*", replacement = "unilever", x = company)

#Separate product code and number
raw_data %>% separate("Product code / number", c("product_code", "number"), sep = "-")

#Add product categories
raw_data %>% mutate(product_category = case_when(
  product_code == "p" ~ "Smartphone",
  product_code == "v" ~ "TV",
  product_code == "x" ~ "Laptop",
  product_code == "q" ~ "Tablet"
))

#Add full address for geocoding
raw_data %>% unite("full_address", address, city, country, sep = ",")


#Creat dummy variable for company and product code
company_philips = ifelse(raw_data$company == "philips", 1, 0)%>% 
company_akzo = ifelse(raw_data$company == "akzo", 1, 0) %>% 
company_van_houten = ifelse(raw_data$company == "van houten", 1, 0)%>% 
company_unilever = ifelse(raw_data$company == "unilever", 1, 0)%>% 

product_smartphone = ifelse(product_code == "p", 1, 0)%>% 
product_tv = ifelse(product_code == "v", 1, 0)%>% 
product_laptop = ifelse(product_code == "x", 1, 0)%>% 
product_tablet = ifelse(product_code == "q", 1, 0)
  


  

                                  
                        
                                  