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


#Naming routes
Use RESTFUL routes if possible. If not, do this
```
  get '<path>', :to => '<location>', as: :<name>
```

#Delete
Delete requires buttons, not links

```
<%= button_to "delete", location, :method => :delete %>
```


#Migrations for associations

To generate migrations for associations:

```
rails g migration <name> <name in plural>:<relationship>
rake db:migrate
```

For `belongs_to`, `relationship` can be `references or belongs_t`

#Removing column through migration

```
class RemoveLocationBelongsTo < ActiveRecord::Migration
  def change
      remove_column :locations :location_id
  end
end
```
