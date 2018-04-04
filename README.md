docker-mongodb
====================
Base docker image to run a MongoDB database server

MongoDB version
---------------

3.4

Running the MongoDB server
--------------------------

To create the image `joaquinnicolas96/docker-mongodb`, execute the following cmd:

    docker run -d -p 27017:27017 joaquinnicolas96/docker-mongodb

The first time that you run your container, a new random password will be set.
To get the password, check the logs of the container by running:
```
        docker logs <CONTAINER_ID>
```
You will see an output like the following:

```
        ========================================================================
            You can now connect to this MongoDB server using:

                mongo admin -u admin -p 5elsT6KtjrqV --host <host> --port <port>

            Please remember to change the above password as soon as possible!
        ========================================================================
```

In this case, `5elsT6KtjrqV` is the password set.
You can then connect to Mongo:
```
    mongo admin -u admin -p 5elsT6KtjrqV
```

Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a randomly generated one, you can
set the environment variable `MONGODB_ADMIN_PASS` to your specific password when running the container:

```
    docker run -d -p 27017:27017  -e MONGODB_ADMIN_PASS="mypass" joaquinnicolas96/docker-mongodb
```

You can now test your new admin password:
```
     mongo admin -u admin -p mypass
     curl --user admin:mypass --digest http://localhost:28017/

```


Setting a specific user:database
--------------------------------

```
    docker run -d -p 27017:27017  -e MONGODB_APPLICATION_USER="user" -e MONGODB_APPLICATION_DATABASE="mydatabase" -e MONGODB_APPLICATION_PASS="mypass" joaquinnicolas96/docker-mongodb

```

You can now test your new credentials:
```
    mongo mydatabase -u user -p mypass
```

Note: with mongo 3.x an admin user is also created with the same credentials
```
    mongo admin -u user -p mypass

```

Run MongoDB without password
----------------------------
```
    docker run -d -p 27017:27017 -e AUTH=no joaquinnicolas96/docker-mongodb
```

Setting a specific role:user:database
---------------------------- 

You can create a mongo app role and assign it to a mongo application user.

```
    docker run -d -p 27017:27017  -e MONGODB_APPLICATION_USER="user" -e MONGODB_APPLICATION_DATABASE="mydatabase" -e MONGODB_APPLICATION_PASS="mypass" -e 
    MONGODB_APP_ROLE="app-role"
    joaquinnicolas96/docker-mongodb
```