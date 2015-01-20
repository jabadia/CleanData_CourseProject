run_analysis <- function(nrows=-1,output.name='output.txt')
{
	# first of all, read in the feautres.txt file to identify which columns we are interested in
	message('reading feature column names')
	features <- read.table('features.txt', sep=' ', header=F)
	names(features) <- c('index','name')
	columns <- features[grep("mean\\()|std\\()",features$name),]

	# read activity labels
	message('reading activity labels')
	activity.labels <- read.table('activity_labels.txt', sep=' ', header=F, row.names=1, stringsAsFactors=T)
	names(activity.labels) <- c('label')

	# read data
	message('reading test data')
	read.table('test/X_test.txt', nrows=nrows) -> X_test
	read.table('test/y_test.txt', nrows=nrows) -> y_test
	message('reading train data')
	read.table('train/X_train.txt', nrows=nrows) -> X_train
	read.table('train/y_train.txt', nrows=nrows) -> y_train

	message('read ', dim(X_test)[1],' observations from test data')
	message('read ', dim(X_train)[1],' observations from train data')

	# stitch data together and select relevant columns
	message('stitching test+train and selecting columns')

	# stitch test + train data
	X_data <- rbind(X_test,X_train)	
	y_data <- rbind(y_test,y_train)

	# select only relevant columns in X_data
	names(X_data) <- features$name
	X_data <- X_data[,columns$index]

	# replace activity labels
	names(y_data) <- c("activity.label")
	y_data$activity.label <- activity.labels[ y_data$activity, 'label']

	# stitch X+y
	data <- cbind(y_data,X_data)

	# summarize 
	message('summarizing (mean) by activity')
	summary <- aggregate(data[,-1],by=list(Activity = data$activity.label), FUN=mean)

	# write tidy summary dataset
	message('write table into output.txt')
	write.table(summary,output.name,row.name=F)

	# return results
	return(list(
		data=data, 
		summary=summary
	))
}

