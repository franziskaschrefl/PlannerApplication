# PlannerApplication

## Features
### Landing Page

The Landing Page gives the user an aesthetically pleasing entrance into the application, preparing the user on the use of the application. 
One main feature of this screen is the personalized welcome animation. A mouse click leads the user to the main page of the application.

![Landing_page](https://github.com/user-attachments/assets/60d7b4a9-c554-497d-beb2-3649d6752c98)

### Main Page

The main page consists of:

#### Navbar

The Navbar shows the next and previous 3 days, clicking enables the user to switch between days accessing the todo tasks for the selected day. Only tasks created by this user can be accessed.

#### Main Screen
In the main portion of the screen is split into office and home tasks. The user can see the tasks that have been added for the selected day. A checkbox allows the user to mark tasks as done. 
The buttons on the right side of the screen allow editing and deleting of tasks. In the bottom right corner there is a green button,
which allows the user to add a new task to the system in order to add new tasks it is necessary to specify a title, begin date, whether the tasks is repeating, if so when it should end and whether it is an office of home job.

#### Sidebar
The sidebar can be shown by clicking on the three lines in the top left corner. The sidebar is both for nativation and for visualisation. For instance, the carlendar gives the user the possibility to jump more freely between days and 
a visual indicator on the calender also allows to see where in the month the selected days and today lie. 
The progressbar below the calendar visualizes how much of the year has passed. Moreover, the mood tracker feature allows the user to log today mood. Lastly, there are two buttons allowing navigation to both the Mood Overview and the ToDo Task Overview

![Main_Screen](https://github.com/user-attachments/assets/190fc84c-4928-4758-9ad7-524ec5df19de)

### Mood Overview

On the Mood Overview Screen it is possible to get a visualization of the mood logs which occured in the year, which the selected day belong to.

![Mood_Overview](https://github.com/user-attachments/assets/7afd762b-409c-49e3-ae92-f2ac4734f38f)

### ToDo Task Overview

The ToDo Task Overview allows users to see all todo tasks which are currently in the system and to sort them by clicking on the table heading. For instance a click on Type sorts the table asceding by type, a second click descending and a third undoes the sorting by this column. Sorting by multiple columns is possible. Moreover, it is possible to delete or edit any displayed task.

![ToDo_Overview](https://github.com/user-attachments/assets/233e198c-deb0-4e0b-9870-df7390211c8c)


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
