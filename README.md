# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7

* System dependencies (charkick, yarn,bootsrap, npm, popper) 

* Database Userd Oracle

* Database initialization (Get Oracle Connection String using tnsping dn_name)

                                                          COVID VACCINATION SYSTEM
We are students of FAST NUCES and we were assigned a Covid development application in which we have implemented many features using ruby on rails. Through this technique, we have properly binded our whole application which is then further divided into different namespaces such as 
•	Admin Namespace 
•	User Namespace 
•	Header Namespace 
All these namespaces are used in layering our application. Each namespace has different function and different tasks. 
	Admin Namespace 
Admin namespace gives you every authority i.e.
	Getting Vaccines 
	Creating Vaccine Centers
	Allot Vaccines to vaccine centers i.e., decide how many and what type of vaccine will be sent to vaccine centers. 
	Making someone head of vaccine center i.e., choose a participant who will manage the vaccine center and will be the user of head namespace 
	Admin namespace also give admin the authority to change the head of a vaccine center. 

	User namespace 
In user namespace, user can sign up using their email after which the program will randomly assign a vaccine and vaccine center for the user automatically. 
In our application, there are two types of vaccines 
•	Single Dose
•	Double Dose
User will be allotted any kind of vaccine with a unique pin that will be required while getting vaccinated and location of vaccines canter where user will get vaccinated 
	Head namespace
Head namespace will be logged in by the head of a vaccine center. It gives the head of vaccine center complete authority to get complete information of people that will get vaccinated in vaccine center. Head can vaccinate user by clicking on vaccinated button given on the screen but before getting vaccinated user must tell the unique pin to head so that there won’t be any bluff. We have maintained the integrity of our application with the help of unique code so that people can’t get vaccinated in place of any other person. 
When a person is vaccinated, the application will check if the vaccine was single dose or double dose. If the vaccine is double dosed, the user will be applicable for second dose. If the user is completely vaccinated, user’s name will be added to the list of “fully vaccinated people”. The user’s dashboard will also show the “fully vaccinated” label. 
In the application, we have also provided a chart to head and admin that shows list of people in vaccination center, people that are partially vaccinated, people that are fully vaccinated and people remaining.





