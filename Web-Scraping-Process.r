melbourne_df<-data.frame(price=integer(0),bedrooms=integer(0),bathrooms=integer(0),cbd_distance_less_than=integer(0),city=character(0))


require(RSelenium)

remdr<-remoteDriver()

open_page<-remdr$open()


remdr$navigate("http://www.gumtree.com.au/s-property-for-sale/melbourne/house/dwellingtype-house/k0c18367l3003435r100?price-type=fixed&fromSearchBox=true")

num_page<-1

while(num_page<=3){
  
  property_price<-remdr$findElements(using="xpath","//div[@class='j-ad-price ']//span[@class='j-original-price']")
  
  property_price_list<-unlist(sapply(property_price, function(x) x$getElementText()))
  
  property_price_list
  
  price_int_list<-sapply(property_price_list,function(x) {
    y<-gsub("\\$","",x)
    gsub(",","",y)
  }
  )
  
  price_int_list<-as.integer(price_int_list)
  
  
  number_bedrooms<-remdr$findElements(using="xpath","//span[@class='ad-listing__attribute-numberbedrooms_s']")
  number_bedrooms_list<-unlist(sapply(number_bedrooms, function(x) x$getElementText()))
  number_bedrooms_list2<-regmatches(number_bedrooms_list,regexpr("[0-9]+",number_bedrooms_list,perl=T))
  number_bedrooms_int_list<-as.integer(number_bedrooms_list2)
  
  
  number_bathrooms<-remdr$findElements(using="xpath","//span[@class='ad-listing__attribute-numberbathrooms_s']")
  number_bathrooms_list<-unlist(sapply(number_bathrooms, function(x) x$getElementText()))
  number_bathrooms_list2<-regmatches(number_bathrooms_list,regexpr("[0-9]+",number_bathrooms_list,perl=T))
  number_bathrooms_int_list<-as.integer(number_bathrooms_list2)
  number_bathrooms_int_list
  
  
  
  distance_cbd<-remdr$findElements(using="xpath","//div[@class='ad-listing__location']")
  distance_cbd_list<-unlist(sapply(distance_cbd, function(x) x$getElementText()))
  distance_cbd_int_list<-as.integer(regmatches(distance_cbd_list,regexpr("[0-9]+",distance_cbd_list,perl=T)))
  
  distance_range<-c("")
  i<-1
  for (distance in distance_cbd_int_list){
    if (distance<20) distance_range[i]<-20
    else if (distance>20 & distance<40) distance_range[i]<-40
    else if (distance>40 & distance<60) distance_range[i]<-60
    else if (distance>60 & distance<80) distance_range[i]<-80
    else if (distance>80 & distance<100) distance_range[i]<-100
    else distance_range[i]<-9999
    i=i+1
  }
  distance_cbd_int_list
  distance_range<-as.integer(distance_range)
  distance_range
  city<-character()
  city[1:length(price_int_list)]<-rep("melbourne",length(price_int_list))
  
  t_df<-as.data.frame(cbind(price_int_list,number_bedrooms_int_list,number_bathrooms_int_list,distance_range,city))
  colnames(t_df)<-c("price","bedrooms","bathrooms","cbd_distance_less_than","city")
  
  
  melbourne_df<-rbind(melbourne_df,t_df)
  npage<-remdr$findElement(using ="xpath","//a[@class='paginator__button paginator__button-next']")
  remdr$navigate(npage$getElementAttribute("href")[[1]])
  num_page=num_page+1
}
melbourne_df

#repeating the same process for sydney;


sydney_df<-data.frame(price=integer(0),bedrooms=integer(0),bathrooms=integer(0),cbd_distance_less_than=integer(0),city=character(0))


#require(RSelenium)

#remdr<-remoteDriver()

#open_page<-remdr$open()


remdr$navigate("http://www.gumtree.com.au/s-property-for-sale/sydney/house/dwellingtype-house/k0c18367l3003435r100?price-type=fixed&fromSearchBox=true")

num_page<-1

while(num_page<=3){
  
  property_price<-remdr$findElements(using="xpath","//div[@class='j-ad-price ']//span[@class='j-original-price']")
  
  property_price_list<-unlist(sapply(property_price, function(x) x$getElementText()))
  
  property_price_list
  
  price_int_list<-sapply(property_price_list,function(x) {
    y<-gsub("\\$","",x)
    gsub(",","",y)
  }
  )
  
  price_int_list<-as.integer(price_int_list)
  
  
  number_bedrooms<-remdr$findElements(using="xpath","//span[@class='ad-listing__attribute-numberbedrooms_s']")
  number_bedrooms_list<-unlist(sapply(number_bedrooms, function(x) x$getElementText()))
  number_bedrooms_list2<-regmatches(number_bedrooms_list,regexpr("[0-9]+",number_bedrooms_list,perl=T))
  number_bedrooms_int_list<-as.integer(number_bedrooms_list2)
  
  
  number_bathrooms<-remdr$findElements(using="xpath","//span[@class='ad-listing__attribute-numberbathrooms_s']")
  number_bathrooms_list<-unlist(sapply(number_bathrooms, function(x) x$getElementText()))
  number_bathrooms_list2<-regmatches(number_bathrooms_list,regexpr("[0-9]+",number_bathrooms_list,perl=T))
  number_bathrooms_int_list<-as.integer(number_bathrooms_list2)
  number_bathrooms_int_list
  
  
  
  distance_cbd<-remdr$findElements(using="xpath","//div[@class='ad-listing__location']")
  distance_cbd_list<-unlist(sapply(distance_cbd, function(x) x$getElementText()))
  distance_cbd_int_list<-as.integer(regmatches(distance_cbd_list,regexpr("[0-9]+",distance_cbd_list,perl=T)))
  
  distance_range<-c("")
  i<-1
  for (distance in distance_cbd_int_list){
    if (distance<20) distance_range[i]<-20
    else if (distance>20 & distance<40) distance_range[i]<-40
    else if (distance>40 & distance<60) distance_range[i]<-60
    else if (distance>60 & distance<80) distance_range[i]<-80
    else if (distance>80 & distance<100) distance_range[i]<-100
    else distance_range[i]<-9999
    i=i+1
  }
  distance_cbd_int_list
  distance_range<-as.integer(distance_range)
  distance_range
  city<-character()
  city[1:length(price_int_list)]<-rep("sydney",length(price_int_list))
  
  t_df<-as.data.frame(cbind(price_int_list,number_bedrooms_int_list,number_bathrooms_int_list,distance_range,city))
  colnames(t_df)<-c("price","bedrooms","bathrooms","cbd_distance_less_than","city")
  
  
  sydney_df<-rbind(sydney_df,t_df)
  npage<-remdr$findElement(using ="xpath","//a[@class='paginator__button paginator__button-next']")
  remdr$navigate(npage$getElementAttribute("href")[[1]])
  num_page=num_page+1
}

sydney_df
write.csv(melbourne_df,file="melbourne_df.csv")
write.csv(sydney_df,file="sydney.csv")

r_df<-read.csv("melbourne_df.csv",stringsAsFactors = T)

final_df<-rbind(melbourne_df,sydney_df)

#final_df<-final_df[c(-140,-73),]
str(final_df)
final_df$price<-as.integer(as.character(final_df$price))
str(final_df)

final_df<-final_df[complete.cases(final_df),]


install.packages("ggplot2")

library(ggplot2)

write.csv(final_df2,file="final_df2.csv")

final_df2<-read.csv("final_df2.csv",row.names = NULL)

str(final_df2)
final_df2$bedrooms<-as.factor(final_df2$bedrooms)
final_df2$bathrooms<-as.factor(final_df2$bathrooms)
final_df2$cbd_distance_less_than<-as.factor(final_df2$cbd_distance_less_than)


aggregate(final_df2["price"],final_df2["city"],FUN=mean)

ggplot(final_df2,aes(x=city,y=price))+geom_boxplot()


ggplot(final_df2,aes(x=bedrooms,y=price))+geom_boxplot()+facet_wrap(~city)
