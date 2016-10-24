#
# Warning: forget about this use ggplot2. It's _that_ better!
#
perf_data = read.table("qps.txt", sep=" ")

png(filename="qps.png", bg="white")

# type=o: join w/ lines
# axes: don't show axes so we can customize
# ann: don't show annotations so we can customize
plot(perf_data$V5, type="o", axes=FALSE, ann=FALSE)

# las: label horizontal
axis(2, las=1, at=100*0:1200)

box()

title(main="Queries per seconds")
title(xlab="Samples (5 sec)")

dev.off()

