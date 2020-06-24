library("tm")

setwd(dir = "/Users/basileroth/Desktop/Work/ETS/MTI830/Devoirs/Data-Mining-Projects/")
journals <- Corpus(DirSource("Federalist",encoding = "UTF-8"),readerControl = list(language = "eng"))

journals <- tm_map(journals,stripWhitespace)
journals <- tm_map(journals,tolower)
journals <- tm_map(journals,removePunctuation)
journals <- tm_map(journals,removeNumbers)
journals <- tm_map(journals,removeWords,stopwords("english"))

tdm <- TermDocumentMatrix(journals)

vectorOfTerms <- Terms(tdm)

findFreqTerms(tdm,10)

X_tdf <- weightTfIdf(tdm, normalize = FALSE)
X_tdf_norm <- weightTfIdf(tdm, normalize = TRUE)
X <- tdm


R <- svd(X)
U <- R$u
V <- R$v
S <- diag(R$d)

plot(V[,1],V[,2], main = "2 D graph", pch = 20, col = 1)
text(V[,1],V[,2],seq(length(journals)),pos = 2,col = "red")
