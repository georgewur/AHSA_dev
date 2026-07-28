# Geometrie (NAP)
x_bodem_start  <- 0      # m
breedte_kanaal <- 20     # m

y_bodem_NAP    <- 5.0    # m NAP
hoogte_kanaal  <- 3.0    # m (bodem -> rand)
waterdiepte    <- 1.0    # m (bodem -> waterspiegel)

# Afgeleiden
x_links  <- x_bodem_start
x_rechts <- x_bodem_start + breedte_kanaal

y_rand_NAP  <- y_bodem_NAP + hoogte_kanaal
y_water_NAP <- y_bodem_NAP + waterdiepte

# Plot canvas
plot(
  NA,
  xlim = c(0, x_rechts),
  ylim = c(y_bodem_NAP, y_rand_NAP),
  xlab = "x (m)",
  ylab = "Height (m))",
  main = "Rectangular open water course",
  asp = 1
)

# Bodem
lines(
  c(x_links, x_rechts),
  c(y_bodem_NAP, y_bodem_NAP),
  lwd = 2
)

# Zijwanden
lines(c(x_links,  x_links),  c(y_bodem_NAP, y_rand_NAP), lwd = 2)
lines(c(x_rechts, x_rechts), c(y_bodem_NAP, y_rand_NAP), lwd = 2)

# Water
polygon(
  x = c(x_links, x_rechts, x_rechts, x_links),
  y = c(y_bodem_NAP, y_bodem_NAP, y_water_NAP, y_water_NAP),
  col = rgb(0.2, 0.4, 0.8, 0.4),
  border = NA
)

# Waterspiegel
lines(
  c(x_links, x_rechts),
  c(y_water_NAP, y_water_NAP),
  lty = 2,
  col = "blue",
  lwd = 2
)
