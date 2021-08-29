## Welcome to Contact Importer

### Creating database

Run the commands `rake db:create`, `rake db:migrate` and rake `db:seed` to setup the database

Once the database is setup, run the application using the command `rails s`, this will start the application on the link `http://localhost:3000`

### Contact process

Please create a new acocunt under the registration page. 

You will need to provice an email and password. 

Once an account is created, then you can be logged in and head over to the contacts page 

### Uploading contact file 

Please create a csv file with columns containing the information below: 

* name
* date_of_birth
* phone
* address
* credit_card
* franchise
* email

Once the file is uploaded, you will be redircted to a page that has a button to process the file. 

Click the process button and you will be redirected to a page where are requested to indentify the column numbers of the relevant information in the csv file. 

Once they have been indentified, click the start processing button and the application will process the csv file to import the contacts in the application. 

The processing of the file is take place in the background, and after a while, contacts will be imported in your contacts list. 

Once the file processing is complete, there is an error log created, if the prcoessing is complete and no errors are present, then the file status will be `finished`, if all the fileds have error, then the file status will be `failed`. 

Contacts will be showed under the contacts page once you are logged into the application. 



