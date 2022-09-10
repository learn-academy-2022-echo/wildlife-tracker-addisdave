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

$Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

$Branch: animal-crud-actions

$Acceptance Criteria

$Create a resource for animal with the following information: common name and scientific binomial.

$ rails generate resource Animal common_name:string scientific_binomial:string
$ rails routes -E   //will show all accessable routes//
$ rails db:migrate  // will update the schema//
$ rails c   and start building by // adding new information into DB//

$Add few animals in terminal rails c
 Animal.create common_name:"Lion", scientific_binomial:"Panthera leo"

 Animal.create common_name:"Tiger", scientific_binomial:"Panthera tigris"

 Animal.create common_name:"Jaguar", scientific_binomial:"Panthera onca"

Done

$In WILDANIMAL-API app, make all the required CRUD actions in the animals_controller.rb file
After this you should see the data response of all the animals in Postman app. Make sure you run the server rails s in terminal. 


$IN Postman app

$GET url: localhost/3000/animals
select JSON from the Body field to see the output in an array of objects.
Done

$Can create a new animal in the database

$In Postman app

$SELECT HTTML VERB "POST" FROM DROP-DOWN LIST.
URL localhost:3000/animals
Select "Body"
Select "raw"
Select "JSON"

{"common_name": "Zebra", 
 "scientific_binomial": "Equus zebra"
}

Should see an output return of with Status: 200 Ok with a standand response for successful HTTP request. If we had not rendered joson: animal, we would have had a stautus code with a 204 No Content, eventhough it was still pushed in i.e because nothing to show. 

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

$Can update an existing animal in the database

SELECT HTTML VERB "PATCH" FROM DROP-DOWN LIST.
URL localhost:3000/students/4
Select "Body"
Select "raw"
Select "JSON"

{
    "common_name": "Cayote",
    "scientific_binomial": "Canis lupus Linnaeus",
    "id": 4,
    "created_at": "2022-09-09T20:58:04.163Z",
    "updated_at": "2022-09-09T21:29:59.466Z"
}


$Can remove an animal entry in the database

SELECT HTTML VERB DELETE FROM DROP-DOWN LIST.
URL localhost:3000/students/4
Select Body
Select raw
Select JSON

Notice id 4 database is permanently destroyed including its id #.

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

$Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

$Create new branch git checkout -b sighting-crud-actions

$ rails routes -E   //will show all accessable routes//
$ rails db:migrate  // will update the schema//
$ rails c   and start building by // adding new first information into DB//

$  Sighting.create latitude:45.454350, longitude:-121.933136, date:20220101, animal_id:1
  TRANSACTION (0.2ms)  BEGIN
  Sighting Create (8.3ms)  INSERT INTO "sightings" ("latitude", "longitude", "date", "animal_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["latitude", 45.45435], ["longitude", -121.933136], ["date", 20220101], ["animal_id", 1], ["created_at", "2022-09-10 05:05:23.041001"], ["updated_at", "2022-09-10 05:05:23.041001"]]                                                                            
  TRANSACTION (7.4ms)  COMMIT                                                                               
 =>                                                                                                         
%Sighting:0x00007f90382e6100                                                                               
 id: 1,                                                                                                     
 latitude: 45.45435,                                                                                        
 longitude: -121.933136,                                                                                    
 date: 20220101,                                                                                            
 animal_id: 1,                                                                                              
 created_at: Sat, 10 Sep 2022 05:05:23.041001000 UTC +00:00,                                                
 updated_at: Sat, 10 Sep 2022 05:05:23.041001000 UTC +00:00>                                                

$Branch: sighting-crud-actions



$Acceptance Criteria

$Create a resource for animal sightings with the following information: latitude, longitude, date
Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")

$rails generate resource Sighting latitude:float longitude:float date:date animal_id:integer


$Can create a new animal sighting in the database

$In WILDANIMAL-API app, make all the required CRUD actions in the sightings_controller.rb file 

$Make sure sightings_controller.rb  def index includes start_date and end_date.


After this you should see the data response of all the animals in Postman app. Make sure you run the server rails s  in terminal.

$In Postman app

$SELECT HTTML VERB "POST" FROM DROP-DOWN LIST.
URL localhost:3000/sightings
Select "Body"
Select "raw"
Select "JSON"

{
  "latitude": 45.4545,
  "longitude": -120.933136,
  "date": "2022-01-01",
  "animal_id": 2
}
 
{
  "latitude": 44.4545,
  "longitude": -122.933136,
  "date": "2022-01-02",
  "animal_id": 3
}

$New created.

{
    "id": 2,
    "latitude": 45.4545,
    "longitude": -120.933136,
    "date": "2022-01-01",
    "animal_id": 2,
    "created_at": "2022-09-10T06:37:50.707Z",
    "updated_at": "2022-09-10T06:37:50.707Z"
}

{
    "id": 3,
    "latitude": 44.4545,
    "longitude": -122.933136,
    "date": "2022-01-02",
    "animal_id": 3,
    "created_at": "2022-09-10T07:31:37.347Z",
    "updated_at": "2022-09-10T07:31:37.347Z"
}

$Can update an existing animal sighting in the database

SELECT HTTML VERB "PATCH" FROM DROP-DOWN LIST.
URL localhost:3000/sightings/3
Select "Body"
Select "raw"
Select "JSON"

$Can remove an animal sighting in the database

SELECT HTTML VERB DELETE FROM DROP-DOWN LIST.
URL localhost:3000/sightings/3
Select Body
Select raw
Select JSON