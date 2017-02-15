<!-- theme: sjaakvandenberg/cleaver-light -->
<!--theme: jdan/cleaver-retro-->
theme: cleaver-light

---
##Model view controler

---

##Routing
Bestämmer URLer för views/controllers

```
app/routes.rb
```

```ruby
  #Set default route to character_manager.index
  root 'character_manager#index'

  #Make url/character/create route to character_manager.create
  get 'character/create' => 'character_manager#create'

  #Make url/character/deselect route to character_manager.deselect. 
  #Also generate a function called deselect_character_path to get that URL
  get 'character/deselect' => 'character_manager#deselect', as: :deselect_character

  #Make welcome/increment/<id> map to welcome.increment and set params[:id] to
  <id>
  get 'welcome/increment/:id' => 'welcome#increment'
```

---

##Methods

Get är data som ses i URL fältet
```ruby
yoloswag.org/din_mamma?swag=69&level=9001
                      ^^^^^^^^^^^^^^^^^^^
```
Använd inte för känslig data eftersom att det skickas i klartext

Post skickas gömt men struktureras på samma sätt


```ruby
  get 'welcome/increment/:id' => 'welcome#increment'
  post 'welcome/increment/:id' => 'welcome#increment'
```

Rails har även andra methods `patch, delete`


---
##Relationsdatabaser

Databaser är 2d struktuer, typ excel eller structar där
kolumner är 'variabler' och rader är instanser av 'data'

```
| id | username        | created | permission |
| 0  | swagger123      | ...     | user       |
| 2  | Kaninmannen     | ...     | admin      |
| 3  | Dödsanarkisten1 |         |            |
```

Fälten kan bara innehålla enkla datatyper -> inga listor

---

##Relationsdatabaser

Vi vill att alla users ska ha en lista av kontrakt

```
| id | Company name | created | permission |
| 0  | SAAB         | ...     | user       |
| 1  | Boardeaser   | ...     | admin      |
| 2  | Ericsson     | ...     | user       |
```

```
| id | namn                   | ... | user_id |
| 0  | gripen                 | ... | 0       |
| 1  | Missiler, saudiarabien | ... | 0       |
| 2  | 8G                     | ... | 2       |
            ....
```

Relationen ligger alltså inte i usern, utan i objektet som usern har.

---

##I rails

```ruby
class Location < ActiveRecord::Base
    has_many :paths
    ...
end
```

Fler relationer

```ruby
:belongs_to
:has_many
:has_one
...
```

---
##Ändring av databasen

```bash
rails g migration <namn> user_id:integer
```

Genererar filen
```
db/migrate/<namn>
```
```ruby
class AddLocationToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :location, index: true
    add_foreign_key :characters, :location
  end
end
```

Som ändrar databsen som är beskriven i
```
db/schema.db
```

Uppdatera databasen
```
rake db:migrate
```

---

