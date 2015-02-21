setwd("./UCI\ HAR\ Dataset")
# Getting appropriate features
all_features <- read.table('features.txt', col.names = c('index', 'name'))
features <- subset(all_features, grepl('-(mean|std)[(]', all_features$name))
activities <- read.table("activity_labels.txt")

# Getting data from files connected features we need
x_test <- read.table("test/X_test.txt")
names(test_data) <- features$name

x_train <- read.table("train/X_train.txt", header = FALSE)
train_data <- x_train[, features$index]
names(train_data) <- features$name

#Getting ys and subjects and factorize
y_test <- read.table("test/Y_test.txt", header = FALSE)[, 1]
test_data$label <- factor(y_test, levels=activities$level, labels=activities$label)
y_train <- read.table("train/Y_train.txt", header = FALSE)[, 1]
train_data$label <- factor(y_train, levels=activities$level, labels=activities$label)

subject_test <- read.table("test/subject_test.txt", header = FALSE)[, 1]
test_data$subject <- factor(subject_test)
subject_train <- read.table("train/subject_train.txt", header = FALSE)[, 1]
train_data$subject <- factor(subject_train)

# Merging test and train data
x <- rbind(test_data, train_data)
test_data <- x_test[, features$index]

tidy_data <- data.table(x)[, lapply(.SD, mean), by=list(label, subject)]
# Creating a file with tidy data 
setwd("..")
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
