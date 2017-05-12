# api-exercise
This project is an API with two endpoints.

Endpoint 1 - The client makes a ```POST``` request specifying a web page like www.google.com and the endpoint will open the web page and extract all the H1, H2, H3 and links from the web page.

Endpoint 2 - The client makes a ```GET``` request and it will retrieve from the database all the URLs stored with all the H1, H2, H3 and links associated with it.

How to use the API:
- You can call Endpoint 1 from the terminal by just doing ```curl -d "page_url=http://www.twitter.com" -X POST http://localhost:3000/api/v1/pages```
- You can call Endpoint 2 from the terminal by running ```curl http://localhost:3000/api/v1/pages```
  
How to set up the project locally:
- clone the repository
- make sure you already have PostgreSQL installed
- configure ```config/database.yml``` with your own credentials so you can have access to the database
- run in the console: ```bundle install``` so you get all the gems installed (including PostgreSQL gem)
- run ```rake db:create```
- run ```rake db:migrate```
- run all the specs to make sure everything is working as expected, by typing in the console: ```rspec```

By this time your project is set up. Now is time to see how beautiful it is when you run it :)

- Open a terminal, go to the project's path and run ```rails s``` for the project to run in ```http://localhost:3000```
- Open another terminal and hit the 'Endpoint 1' with a web page as a parameter. The API will open it, take the URL you passed in and also will take all the H1, H2, H3 and links from the page and store everything in the database.
- Now is time to hit 'Endpoint 2' in order to retrieve all the information stored in the database.

You can always send a message to me if you need some support :)

Alejandro Alvarez
Software Engineer & Ruby on Rails dev
