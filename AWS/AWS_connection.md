# AWS_Connection

## Creating a new database "final-project-sunshinelist" on AWS using Amazon RDS:

![AWS_RDS_PostgreSQL_DB](https://user-images.githubusercontent.com/88908758/152419550-867795ac-081e-45e9-a0d3-79b4ee0cc263.PNG)

## Create an inbound rule on AWS as follows:

Step 1 Press the default security link

![Adding_Inbound_Rule_step1](https://user-images.githubusercontent.com/88908758/152419597-1bbb97d8-a783-4af6-b2d2-b7a7605ab4d5.PNG)

Step 2 Press inbound rules and edit it

![Adding_Inbound_Rule_step2](https://user-images.githubusercontent.com/88908758/152419637-d6bbf4df-11d5-448a-a4f5-80d1ad4c49e3.PNG)

Step 3 add a new rule as follows

![Adding_Inbound_Rule_step3](https://user-images.githubusercontent.com/88908758/152419676-788fd468-8760-4d6f-99b7-597393ece79c.PNG)


## Connect to PgAdmin through the following steps:

#### Copy the endpoint line to add to PgAdmin to connect

![Endpoint_usedTo_Connect_PgAdmin](https://user-images.githubusercontent.com/88908758/152419739-ba0047cd-5b53-473e-ba5d-584bc788cd1c.PNG)

#### Add new server to PgAdmin 

![Adding_new_server_to_PgAdmin](https://user-images.githubusercontent.com/88908758/152419795-89a0fcb7-9f8b-4e5d-8829-a0e2d57e30b7.PNG)

#### Connect to the new server using the Endpoint copied from AWS and add the password used when creating the database in AWS

![Connecting_to_AWS](https://user-images.githubusercontent.com/88908758/152419832-5684836b-b7bb-4e08-9a01-0f4919d40acd.PNG)


## Once connected the new server will show on the left and a database under it will show a database Postgres

![Connection_to_AWS_successful](https://user-images.githubusercontent.com/88908758/152419859-ba743194-8d4a-4016-97a9-f830e9084ac9.PNG)

 
