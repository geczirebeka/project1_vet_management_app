# project1_vet_management_app

Vet Management App

This is a Vet Management App that vetenirary practices can use to track their animals, customers and vets present at the practice.

Running Instructions:

To use this app you need to first clone it and then in the terminal first drop the database vet_manage, then create the database vet_manage. Next you need to run psql -d vet_manage -f db/vet_management.sql in your terminal so the database is running. When you run ruby app.rb the web page can be accessed through localhost/4567. On the web page you can see all the vets, customers and animals in the practice which can all be edited or deleted and new ones can be created.

Brief:

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet.

MVP
The practice wants to be able to register / track animals. Important information for the vets to know is -
Name
Date Of Birth (use a VARCHAR initially)
Type of animal
Contact details for the owner
Treatment notes
Be able to assign animals to vets
CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

Technologies Used:

-Ruby
-PostgreSQL
-Sinatra
-HTML
-CSS(for further changes)
