library(plyr)

# Part 1
# Merge training/test sets (3 of each)

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Part 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# Part 3
# Use descriptive activity names

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# Part 4
# Label the data set

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# Part 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)