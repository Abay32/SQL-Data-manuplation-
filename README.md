# SQL-Tutorial

Installing MySQL on macOS and Unix systems

Well, we think the easiest way to install MySQL, macOS and Unix, is to use open-source software called Homebrew.
Homebrew is a powerful package management system that helps us install software tools on MacOS and any other Unix-based system. 
Therefore, you’ll need to make sure you’ve set up Homebrew before installing MySQL.

You can refer to Homebrew’s website to learn more details.
https://brew.sh/

 

Step #1 Installing Homebrew Open Terminal and execute the following command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

Whether you are using MacOS or another Unix-based system, this command will access the GitHub repository where the source code of Homebrew has been stored. 
All you have to do is download it and install it on your system. Once you’ve set up Homebrew correctly, you can proceed with Step #2.


Step #2: Installing the MySQL Server and Workbench.

At that stage, there will be no easier job than installing these two. 
To install the MySQL Server, open the terminal window again, if you had closed it, and execute the following command:

brew install mysql

Very quickly, the MySQL Server will be all set up and configured for you. However, we need to make sure that it has been started. 
A way to do that is to start an instance of that server. You can start a server instance by running the following command in Terminal:

brew services start mysql

Then, you can check anytime if the server has been started successfully by executing the following command in Terminal:

brew services list

As you do that, a list with the Homebrew-related services will appear and the service of the MySQL Server should read started.
At that point, what’s left to do is download MySQL Workbench from the official MySQL page:

https://dev.mysql.com/downloads/workbench/

Scroll down to select the operating system you are using and install Workbench in the same way you would install any other application.


That’s it! You can now launch Workbench. Please see "TheClientServerModel.pdf" file from 365 teck to get started with the mysql workbench.

Once you install the mysql in your machine the next step is to downlod the employees.sql database to work with the datasets

