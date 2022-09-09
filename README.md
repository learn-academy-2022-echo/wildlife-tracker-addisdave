$ rails new wildanimal-api -d postgresql -T
$ cd wildanimal-api
$ rails db:create
$ git remote add origin https://github.com/learn-academy-2022-echo/wildlife-tracker-addisdave.git
$ git status
$ git add .
$ git commit -m "initial commit"
$ git push origin main
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails s to check if server is running.
$ git push origin main again
$ create a new branch animal-crud-actions
$ code .
Create a resource for animal with the following information: common name and scientific binomial
$ rails generate resource Animal common_name:string scientific_binomial:string
$ rails routes -E
$ rails db:migrate
$ rails c   and start building.

Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

Branch: animal-crud-actions

Acceptance Criteria

Create a resource for animal with the following information: common name and scientific binomial.

$ rails generate resource Animal common_name:string scientific_binomial:string
$ rails routes -E
$ rails db:migrate
$ rails c   and start building.

Add few animals in terminal rails c
 Animal.create common_name:"Lion", scientific_binomial:"Panthera leo"

 Animal.create common_name:"Tiger", scientific_binomial:"Panthera tigris"

 Animal.create common_name:"Jaguar", scientific_binomial:"Panthera onca"

Done

In WILDANIMAL-API app, make all the required CRUD actions in the animals_controller.rb file
After this you should 
Can see the data response of all the animals in Postman app. Make sure you run the server rails s  in terminal. 


IN Postman app

GET url: localhost/3000/animals
select JSON from the Body field to see the output in in array of objects.
Done

Can create a new animal in the database

In Postman app
SELECT HTTML VERP POST FROM DROP DOWN MENU.
URL localhost:3000/animals
Select Body
Select raw
Select JSON

{"common_name": "Zebra", 
 "scientific_binomial": "Equus zebra"
}

Should see an output return of with Status: 200 Ok with a standand response for successful HTTP Rrequest. If we had not rendered joson: animal, we would have had a stautus code with a 204 No Content eventhough it was still pushed in because nothing to show. 

{
    "id": 4,
    "common_name": "Zebra",
    "scientific_binomial": "Equus zebra",
    "created_at": "2022-09-09T20:58:04.163Z",
    "updated_at": "2022-09-09T20:58:04.163Z"
}

{
    "id": 5,
    "common_name": "Wolf",
    "scientific_binomial": "Canis lupus",
    "created_at": "2022-09-09T21:25:16.631Z",
    "updated_at": "2022-09-09T21:25:16.631Z"
}

Can update an existing animal in the database

SELECT HTTML VERP PATCH FROM DROP DOWN MENU.
URL localhost:3000/students/4
Select Body
Select raw
Select JSON

{
    "common_name": "Cayote",
    "scientific_binomial": "Canis lupus Linnaeus",
    "id": 4,
    "created_at": "2022-09-09T20:58:04.163Z",
    "updated_at": "2022-09-09T21:29:59.466Z"
}


Can remove an animal entry in the database

SELECT HTTML VERP POST FROM DROP DOWN MENU.
URL localhost:3000/students/4
Select Body
Select raw
Select JSON

Notice 4 data base is permanently destroyed including its id.

[
    {
        "id": 1,
        "common_name": "Lion",
        "scientific_binomial": "Panthera leo",
        "created_at": "2022-09-09T18:07:09.488Z",
        "updated_at": "2022-09-09T18:07:09.488Z"
    },
    {
        "id": 2,
        "common_name": "Tiger",
        "scientific_binomial": "Panthera tigris",
        "created_at": "2022-09-09T18:22:43.964Z",
        "updated_at": "2022-09-09T18:22:43.964Z"
    },
    {
        "id": 3,
        "common_name": "Jaguar",
        "scientific_binomial": "Panthera onca",
        "created_at": "2022-09-09T18:28:33.926Z",
        "updated_at": "2022-09-09T18:28:33.926Z"
    },
    {
        "id": 5,
        "common_name": "Wolf",
        "scientific_binomial": "Canis lupus",
        "created_at": "2022-09-09T21:25:16.631Z",
        "updated_at": "2022-09-09T21:25:16.631Z"
    }
]