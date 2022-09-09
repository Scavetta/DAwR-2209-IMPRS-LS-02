# SILAC Analysis
# Protein profiles during myocardial cell differentiation

# Load packages ----
library(tidyverse)
library(glue)

# Part 0: Import data ----
protein_df <- read.delim("data/Protein.txt")

# Examine the data:
glimpse(protein_df)


# Quantify the contaminants ----
# e.g. we can filter for only the contaminants
# This is a bit complicated
protein_df_con <- protein_df |> 
  filter(Contaminant == "+")
glimpse(protein_df_con)

# To expand:
protein_df$Contaminant == "+"

protein_df |> 
  filter(Contaminant == "+") |> 
  nrow() -> n_con

# length = number of elements (dataframe is actually a list with n number of elements)

# Nicest way:
sum(protein_df$Contaminant == "+")


# Proportion of contaminants

# Percentage of contaminants (just multiply proportion by 100)

# Transformations & cleaning data ----

# Remove contaminants ====


# log 10 transformations of the intensities ====


# Add the intensities ====


# log2 transformations of the ratios ====
# Super old-school, but perfectly legit:
# Uncomment these to see in actions 
# protein_df$Ratio.H.M <- log2(protein_df$Ratio.H.M)
# protein_df$Ratio.M.L <- log2(protein_df$Ratio.M.L)
# protein_df$Ratio.H.L <- log2(protein_df$Ratio.H.L)

# protein_df$Ratio.M.L_log2 <- log2(protein_df$Ratio.M.L)
# protein_df$Ratio.M.L_log10 <- log10(protein_df$Ratio.M.L)
# protein_df$Ratio.M.L_zscore <- scale(protein_df$Ratio.M.L)

# A bit more efficient:
# First find the columns we want to transform
# i.e. they start with "Ratio" but do NOT end with "Sig" 
protein_df <- read.delim("data/Protein.txt")

protein_df |> 
  as_tibble() |>
  select(starts_with("R"), -ends_with("Sig"))

# Second, apply a transformation to only those columns
protein_df |> 
  as_tibble() |>
  mutate(Ratio.H.M = log2(Ratio.H.M),
         Ratio.H.L = log2(Ratio.H.L),
         Ratio.M.L = log2(Ratio.M.L))

# use mutate_at()
protein_df |> 
  as_tibble() |>
  mutate_at(vars(starts_with("Rat"), -ends_with("Sig")), log2) 

# use across()
protein_df |> 
  as_tibble() |>
  mutate(across(c(starts_with("Rat"), -ends_with("Sig")), log2)) 

protein_df <- read.delim("data/Protein.txt")
protein_df |> 
  as_tibble() |>
  mutate(across(c(starts_with("Rat"), -ends_with("Sig")), list(log2 = log2, z_score = scale))) -> protein_df_transformed

# The nice tidy way of working with our data:
protein_df <- read.delim("data/Protein.txt")
# 1,207 × 4 to 3,621 × 3
protein_df |> 
  as_tibble() |>
  filter(Contaminant != "+") |> 
  select(Uniprot, starts_with("R"), -ends_with("Sig")) |> 
  pivot_longer(-Uniprot) |> 
  mutate(value = log2(value))


# add quotes? "" -> make it a character -> not appropriate
# add arguments? not necessary
# Is it the wrong structure? i.e. not a DF? no.

# Part 2: Query data using filter() ----
# Exercise 9.2 (Find protein values) ====





# Exercise 9.3 (Find significant hits) and 10.2 ====
# For the H/M ratio column, create a new data 
# frame containing only proteins that have 
# a p-value less than 0.05


# Exercise 10.4 (Find top 20 values) ==== 


# Exercise 10.5 (Find intersections) ====

