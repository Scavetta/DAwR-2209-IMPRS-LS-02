# Element 7: Tidyverse -- tidyr ----

# Load packages ----
# This should already be loaded if you executed the commands in the previous file.
library(tidyverse)

# Get a play data set:
PlayData <- read_tsv("data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation height & width
PlayData$height/PlayData$width

# For the other scenarios, tidy data would be a 
# better starting point:
# 4 arguments
# 1 - data
# 2,3 - key,value pair - i.e. name for OUTPUT
# 4 - the ID or the MEASURE variables

# using ID variables ("exclude" using -)
pivot_longer(PlayData, 
             names_to = "key",
             values_to = "value",
             -c("type", "time"))

# using MEASURE variables
PlayData_t <- pivot_longer(PlayData, 
                           names_to = "key", 
                           values_to = "value", 
                           c("height", "width"))

PlayData |> 
  pivot_longer(c("height", "width"),
               names_to = "key", 
               values_to = "value") -> PlayData_t

# Scenario 2: Transformation across time 1 & 2
# difference from time 1 to time 2 for each type and key (height & width)
# we only want one value as output

# A height (20 - 10)
# A width (60 - 50)
# B height (40 - 30)
# B width (80 - 70)

# in the current untidy way: POSSIBLE BUT NOT NICE
PlayData$height[PlayData$type == "A" & PlayData$time == 2] - PlayData$height[PlayData$type == "A" & PlayData$time == 1]
PlayData$height[PlayData$type == "B" & PlayData$time == 2] - PlayData$height[PlayData$type == "B" & PlayData$time == 1]
PlayData$width[PlayData$type == "A" & PlayData$time == 2] - PlayData$width[PlayData$type == "A" & PlayData$time == 1]
PlayData$width[PlayData$type == "B" & PlayData$time == 2] - PlayData$width[PlayData$type == "B" & PlayData$time == 1]

# in the tidydata formatted data:
PlayData_t |> 
  group_by(type, key) |>
  summarise(time_diff = value[time == 2] - value[time == 1],
            time_ratio = value[time == 2]/value[time == 1])



# As an aside use this to "see" the groups
  arrange(type, key) |>
  # group_split(type, key) |> 
  
  
# standardize to time 1


# Scenario 3: Transformation across type A & B
# A/B for each time and key

