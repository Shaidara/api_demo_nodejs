# Welcome on this fabulous job posting API

## Instalation

Clone the project : git clone *https://github.com/Shaidara/exercise_backend.git*

1. If you do not have docker intalled, you can do it [here](https://docs.docker.com/get-docker/)
2. In a command prompt navigate to the project root : **cd ./exercise_backend**
3. Run : **npm install**
4. run : **docker-compose build**
5. run : **docker run local**

At this stage you must be able to see the message "Welcome to the job post API !" when you go onto : http://localhost:8888

As I used a posgres sql, you can connect to the docker database container via PgAdmin with these information :

- HOST: Your local IP address
- Port: 5432
- Username: admin
- Password: adminpass

After connecting to database, you can run file excercise-backend/database/data_exercise.sql

You can also use a local DB with this project, simply provide valid database information in _".env"_ file et run command : _npm start_

## Architecture

For this API, I've used a DDD (domain driven design) for the project. I have the following layers :

- Controller (receive client request and return response)
- Service (receive dto from controller and process request by applying business logic)
- Repository (receive entity from service and perform task. This layer is the one which interacts with the database)

I've used a PostgreSQL database for the purpose of this exercise.

## Test endpoints

**Automated tests Postman**

You can use postman to test endpoints by importing the following files into your postman :

    - ./exercise-backend/postman/Exercise backend.postman_collection.json
    - ./exercise-backend/postman/exercise backend env.postman_environment.json

After importing successfully, you can make a right click on the collection et select "Run Collection" to run all automated tests
