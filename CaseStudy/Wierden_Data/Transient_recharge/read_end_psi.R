##reading the pressure profile at the end of a SWAP simulation
## G. Bier , 7-7-26

read_H <- function(file) {
  
  txt <- readLines(file)
  
  # Aantal knopen
  n <- as.integer(sub(".*=\\s*", "", txt[grep("^NUMNOD", txt)]))
  
  # Regel waar H begint
  iH <- grep("^H\\s*=", txt)
  
  # Alles vanaf H verzamelen totdat de volgende variabele begint
  htxt <- sub("^H\\s*=\\s*", "", txt[iH])
  
  i <- iH + 1
  while (i <= length(txt) && !grepl("^[A-Z][A-Z0-9_]*\\s*=", txt[i])) {
    htxt <- paste(htxt, txt[i])
    i <- i + 1
  }
  
  # Omzetten naar numerieke vector
  H <- scan(text = htxt, quiet = TRUE)
  
  if (length(H) != n) {
    warning(sprintf("NUMNOD = %d, maar %d H-waarden gevonden.",
                    n, length(H)))
  }
  
  H
}

H <- read_H("holterberg_20151231.end")

plot(H,
     type = "b",
     pch = 16,
     xlab = "Knoopnummer",
     ylab = "Drukhoogte H",
     main = "Inspectie van H")
grid()
