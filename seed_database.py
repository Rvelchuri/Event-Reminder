from datetime import datetime
import os
from  random import choice,randint

from sqlalchemy.orm import relation
import crud
import model
import server
import json

os.system("dropdb events")
os.system("createdb events")
model.connect_to_db(server.app)
model.db.create_all()

# Load birthday data from JSON file
with open("data/birthday.json") as f:
    birthday_data = json.loads(f.read())

# Create birthdays, store them in list so we can use them
# to create fake ratings later
birthdays_in_db = []
for birth in birthday_data:
    name,relation,email,gender, phone_number = (birth["name"],birth["relation"],birth["email"],birth["gender"],birth["phone_number"])
    birth_date = datetime.strptime(birth["birth_date"],"%Y-%m-%d" )

    # TODO: get the name, relatin, and email from the birthday
    # dictionary. Then, get the birth_date and convert it to a
    # datetime object with datetime.strptime
    
    # TODO: create a birthday here and append it to birthdays_in_db
    add_birth = crud.create_birthday(email,name,gender,relation, birth_date,)
    birthdays_in_db.append(add_birth)
 
 # TODO: create a user here
for n in range(2):
    email = f'user{n}@test.com'  # Voila! A unique email!
    password = 'test'

      # TODO: create 10 ratings for the user
    user = crud.create_user(email,password)
    for _ in range(10):
        random_movie = choice(movies_in_db)
        score = randint(1,5)
        crud.create_rating(user,random_movie,score)
  