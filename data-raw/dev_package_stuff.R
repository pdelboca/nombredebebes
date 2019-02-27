library(devtools)
library(usethis)
library(desc)

# Remove default DESC
unlink("DESCRIPTION")
# Create and clean desc
my_desc <- description$new("!new")

# Set your package name
my_desc$set("Package", "nombredepersonas")

#Set your name
my_desc$set("Authors@R", "person('Patricio', 'Del Boca', email = 'patriciodelboca@gmail.com', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.1.0")

# The title of your package
my_desc$set(Title = "Nombre de Personas")
# The description of your package
my_desc$set(Description = "Nombres registrados en el Registro Nacional de las Personas (Argentina) agrupados por año.")
# The urls
my_desc$set("URL", "https://github.com/pdelboca/nombredepersonas")
my_desc$set("BugReports", "https://github.com/pdelboca/nombredepersonas/issues")
# Save everyting
my_desc$write(file = "DESCRIPTION")

# If you want to use the MIT licence, code of conduct, and lifecycle badge
use_mit_license(name = "Patricio Del Boca")
use_code_of_conduct()
use_lifecycle_badge("Experimental")
use_news_md()

# Get the dependencies

# Clean your description
use_tidy_description()
