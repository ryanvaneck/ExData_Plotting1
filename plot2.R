plot2 <- function(file){

  d <- read.table(file, sep=";", skip=66637, nrows=2879);

  colnames(d) <- colnames(read.table(file, header=T, nrows=1, sep=";"));

  d <- data.frame(strptime(paste(d$Date,d$Time), format="%d/%M/%Y %T"), d[3:9]);

  colnames(d)[1] = "Time";

  d$Time <- as.POSIXlt(d$Time);

  png("plot2.png");

  plot(d$Time, d$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)");

  dev.off();

}
