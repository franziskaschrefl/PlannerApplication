# PlannerApplication

## Features
### Landing Page

The Landing Page gives the user an aesthetically pleasing entrance into the application, preparing the user on the use of the application. 
One main feature of this screen is the personalized welcome animation. A mouse click leads the user to the main page of the application.

![Landing_page](https://github.com/user-attachments/assets/60d7b4a9-c554-497d-beb2-3649d6752c98)


## Motivation

I started this project as a leisure activity to improve my coding skills, specifically in C#, HTML, and CSS, 
and to integrate these with Blazor. Additionally, the project aimed to teach me how to develop a new project 
from scratch, handling everything from design to implementation on my own. Moreover, this project was an 
opportunity to connect my coding skills with my PostgreSQL knowledge to create a persistent application.

Because of technical reasons, this project was created by Franziska Schrefl using two GitHub accounts, franziskaschrefl and a AManOfFortune, however all code was written by Franziska Schrefl.

## Lessons Learned
These improvements can be observed in the source code as the project progressed:

- Dividing CSS code into separate files for each Razor file enhances readability and makes the code easier to manage.
- Centering a div using `display: flex` is often preferable to using `position: absolute`.
- It’s important to break pages into different components. Creating a new .razor file for each distinct section of the software is preferable.
- Adding CSS code (besides basic positioning) is best done after the core functionality is implemented.
- Correct positioning is crucial, as incorrect positioning can cause issues later on.
- Avoid using absolute positioning.
- Using singleton objects to store data shared across multiple components improves code readability and simplifies refreshing data.

# Getting Started

1. Clone the project onto your local machine
2. Open the .sln file with visual studio
3. If prompted install necessary dependencies
4. Download binaries as zip from https://www.enterprisedb.com/download-postgresql-binaries
5. Unzip and Copy their content to the "postgre" folder.
6. You should now have 3 batch-files and a folder named "pgsql" inside the postgre folder.
7. Now you should be able to test the database by running the "start_db.cmd" file (this should later be done by the application)
8. After successfully starting the database, you can import all tables by running the "import_db.cmd" file while the database is running.
9. Now you can run the application after selecting PlannerApplication_pureBlazor as the startup project.
