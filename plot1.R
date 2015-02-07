plot1 <- function (file){
  
  d <- read.table(file, sep=";", skip=66637, nrows=2879);

  colnames(d) <- colnames(read.table(file, header=T, nrows=1, sep=";"));

  d$Date <- as.Date(d$Date, format="%d/%M/%Y");

  d$Time <- strptime(d$Time, format="%T");

  png("plot1.png");

  hist(d$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red");
  
  dev.off();

  
}


