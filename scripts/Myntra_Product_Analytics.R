install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

library(readr)
library(dplyr)
library(ggplot2)

Myntra <- read.csv("data/myntra202305041052.csv")

dim(Myntra)
names(Myntra)
head(Myntra)
str(Myntra)
summary(Myntra)

sum(duplicated(Myntra))
sum(Myntra$rating==0)
sum(Myntra$ratingTotal==0)
max(Myntra$discount)

library(dplyr)
Myntra_clean <- Myntra %>% 
  filter(
    rating > 0,
    ratingTotal>0,
    discount <= 100
  )
dim(Myntra_clean)

nrow(Myntra_clean)
n_distinct(Myntra_clean$seller)
mean(Myntra_clean$price)
mean(Myntra_clean$mrp)
mean(Myntra_clean$rating)
mean(Myntra_clean$discount)

top_sellers <- Myntra_clean %>% 
  group_by(seller) %>%
  summarise(
    Total_Products = n()
  ) %>% 
  arrange(desc(Total_Products))
head(top_sellers,10)

best_sellers <- Myntra_clean %>%
  group_by(seller) %>%
  summarise(
    Average_Rating = mean(rating),
    Total_Products = n()
  ) %>%
  filter(Total_Products >= 50) %>%
  arrange(desc(Average_Rating))

head(best_sellers, 10)

popular_products <- Myntra_clean %>%
  arrange(desc(ratingTotal)) %>%
  select(
    name,
    seller,
    rating,
    ratingTotal
  )

head(popular_products,10)

highest_discount <- Myntra_clean %>%
  arrange(desc(discount)) %>%
  select(
    name,
    seller,
    price,
    mrp,
    discount
  )

head(highest_discount,10)

expensive_products <- Myntra_clean %>%
  arrange(desc(price)) %>%
  select(
    name,
    seller,
    price
  )

head(expensive_products,10)

library(ggplot2)
ggplot(Myntra_clean,
       aes(price))+
  geom_histogram(
    bins=30,
    fill="steelblue",
    color="black"
  )+
  labs(
    title="Distribution of Product Prices",
    x="Price",
    y="Count"
  )
ggsave(
  "outputs/Price_Distribution.png",
  width = 8,
  height = 5
)

ggplot(Myntra_clean,
       aes(rating))+
  geom_histogram(
    bins=20,
    fill="orange",
    color="black"
  )+
  labs(
    title="Distribution of Ratings"
  )
ggsave(
  filename = "outputs/Rating_Distribution.png",
  width = 8,
  height = 5
)


ggplot(Myntra_clean,
       aes(discount))+
  geom_histogram(
    bins=20,
    fill="green",
    color="black"
  )+
  labs(
    title="Distribution of Discounts"
  )
ggsave(
  filename = "outputs/Discount_Distribution.png",
  width = 8,
  height = 5
)

ggplot(Myntra_clean,
       aes(discount,rating))+
  geom_point(alpha=0.3)+
  labs(
    title="Discount vs Rating"
  )
ggsave(
  filename = "outputs/Discount_vs_Rating.png",
  width = 8,
  height = 5
)

ggplot(Myntra_clean,
       aes(price,rating))+
  geom_point(alpha=0.3)+
  labs(
    title="Price vs Rating"
  )
ggsave(
  filename = "outputs/Price_vs_Rating.png",
  width = 8,
  height = 5
)

top10 <- head(top_sellers, 10)

ggplot(top10,
       aes(x = reorder(seller, Total_Products),
           y = Total_Products)) +
  geom_col(fill = "purple") +
  coord_flip() +
  labs(
    title = "Top 10 Sellers",
    x = "Seller",
    y = "Total Products"
  )

ggsave(
  filename = "outputs/Top_Sellers.png",
  width = 8,
  height = 5
)

write.csv(
  Myntra_clean,
  "outputs/Myntra_clean.csv",
  row.names = FALSE
)
