dat <- read.csv("pubmed_results.csv", strip.white = TRUE, 
    as.is=FALSE, row.names = NULL) 

head(dat)


omics <- grepl("omics", dat[, 1], ignore.case =T)
dat2 <- dat[, 1][omics]

library(qdap)
dat3 <- wfdf(dat2)

dat4 <- dat3[grepl("omics", dat3[, 1]), ,drop=FALSE]

dat5 <- tail(dat4[order(dat4[, 2]), ,drop=FALSE], 20)
names(dat5)[2] <- "Freq"
dat5[, 1] <- factor(dat5[, 1], levels=dat5[, 1])

pdf("foobar1.pdf", width=8, height=5)
ggplot(dat5) + geom_point(aes(Words, Freq), stat = "identity", fill = "darkblue", shape=3) + coord_flip() + theme_bw()

ggplot(head(dat5, 15)) + geom_point(aes(Words, Freq), stat = "identity", fill = "darkblue", shape=3) + coord_flip() + theme_bw()