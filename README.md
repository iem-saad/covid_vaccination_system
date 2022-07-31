# COVID VACCINATION SYSTEM :stethoscope:

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

> Ruby version 2.7

> System dependencies (chartkick, yarn,bootsrap, npm, popper) 

> Database Used => Oracle

> Database initialization (Get Oracle Connection String using tnsping dn_name)

# ABOUT APP
I am a student of FAST NUCES and I was assigned a Covid development application in which we have implemented many features using ruby on rails. Through this technique, I have properly binded whole application which is then further divided into different namespaces such as 
- Admin Namespace 
- User Namespace 
- Vaccination Center Head Namespace

All these namespaces are used in layering application. Each namespace has different function and different tasks. 

##	Admin Namespace 
Admin namespace gives you every authority i.e.

- Getting Vaccines

- Creating Vaccine Centers

- Allocate Vaccines to vaccine centers i.e., decide how many and what type of vaccine will be sent to vaccine centers. 

- Making someone head of vaccine center i.e., choose a participant who will manage the vaccine center and will be the user of head namespace 

- Admin namespace also give admin the authority to change the head of a vaccine center. 

##	User Namespace
In user namespace, user can sign up using their email after which the program will randomly assign a vaccine and vaccine center for the user automatically. 
In this application, there are two types of vaccines

- Single Dose

- Double Dose

User will be allotted any kind of vaccine with a unique pin that will be required while getting vaccinated and location of vaccines canter where user will get vaccinated.

##	Vaccination Center Head Namespace

Vaccination Center Head namespace will be logged in by the head of a vaccine center. It gives the head of vaccine center complete authority to get complete information of people that will get vaccinated in vaccine center. Head can vaccinate user by clicking on vaccination button given on the screen but before getting vaccinated user must tell the unique pin to head so that there won’t be any bluff. I have maintained the integrity of our application with the help of unique code so that people can’t get vaccinated in place of any other person.
When a person is vaccinated, the application will check if the vaccine was single dose or double dose. If the vaccine is double dosed, the user will be applicable for second dose. If the user is completely vaccinated, user’s name will be added to the list of “fully vaccinated people”. The user’s dashboard will also show the “fully vaccinated” label. 
In the application, we have also provided a chart to head and admin that shows list of people in vaccination center, people that are partially vaccinated, people that are fully vaccinated and people remaining.

Following is snapshot of UI of this project.
As the main learning object of project was to work on ROR with Oracle custom queries hence for front-end I usedaa bootstrap 4 template name `novena`

![fast vacc](https://user-images.githubusercontent.com/54322326/182030787-d148165a-1bc5-43d3-96b3-a2789c8b42b8.JPG)

