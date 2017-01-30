Views render output from controllers

Controllers handle requests.

Models store data for controllers to use



#Adding models
```
    rails generate model <name> [<variable_name>:<datatype>..]
```

Then update the database
```
    rake db:migrate
```


#*\_path
You can find out what `*_path` functions you can use by running 
```
rake routes
```
And reading the "Prefix line"

#Routing to a controller
Controllers have uppercase names along the lines of `<name>Controller` while
the routing should have `<name>` in snakecase
