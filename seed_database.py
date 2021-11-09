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
with open("test_data/birthday.json") as f:
    birthday_data = json.loads(f.read())

# Create birthdays, store them in list so we can use them
# to create birthdays.
birthdays_in_db = []
for birth in birthday_data:
    email,name,gender,relation,phone_number = (birth["email"],birth["name"],birth["gender"],birth["relation"],birth["phone_number"])
    birth_date = datetime.strptime(birth["birth_date"],"%Y-%m-%d" )

    #  get the name, relation, and email from the birthday
    # dictionary. Then, get the birth_date and convert it to a
    # datetime object with datetime.strptime
    
    # create a birthday here and append it to birthdays_in_db
    add_birth = crud.create_birthday(email,name,gender,relation, phone_number,birth_date)
    birthdays_in_db.append(add_birth)
 
 
   
  