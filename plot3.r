plot3 <- function(file){

  d <- read.table(file, sep=";", skip=66637, nrows=2879);

  colnames(d) <- colnames(read.table(file, header=T, nrows=1, sep=";"));

  d <- data.frame(strptime(paste(d$Date,d$Time), format="%d/%M/%Y %T"), d[3:9]);

  colnames(d)[1] = "Time";

  d$Time <- as.POSIXlt(d$Time);

  png("plot3.png");

  plot(d$Time, d$Sub_metering_1,  type="l", xlab=NA, ylim=c(0,40), ylab="Energy sub metering");

  par(new=T);

  plot(d$Time, d$Sub_metering_2, type="l", col="red", xlab=NA, ylab=NA, ylim=c(0,40));

  par(new=T);

  plot(d$Time, d$Sub_metering_3, type="l", col="blue", xlab=NA, ylab=NA, ylim=c(0,40));

  dev.off();
}
