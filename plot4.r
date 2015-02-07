plot4 <- function(file){

  d <- read.table(file, sep=";", skip=66637, nrows=2879);

  colnames(d) <- colnames(read.table(file, header=T, nrows=1, sep=";"));

  d <- data.frame(strptime(paste(d$Date,d$Time), format="%d/%M/%Y %T"), d[3:9]);

  colnames(d)[1] = "Time";

  d$Time <- as.POSIXlt(d$Time);

  png("plot4.png");

  par(mfrow=c(2,2));

  plot(d$Time, d$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)");

  plot(d$Time, d$Voltage, type="l", xlab="datetime", ylab="Voltage");

  plot(d$Time, d$Sub_metering_1,  type="l", xlab=NA, ylim=c(0,40), ylab="Energy sub metering");

  par(new=T);

  plot(d$Time, d$Sub_metering_2, type="l", col="red", xlab=NA, ylab=NA, ylim=c(0,40));

  par(new=T);

  plot(d$Time, d$Sub_metering_3, type="l", col="blue", xlab=NA, ylab=NA, ylim=c(0,40));

  plot(d$Time, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power");

  dev.off();

  
}
