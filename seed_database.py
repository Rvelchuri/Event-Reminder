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
 

# Load demise data from JSON file
with open("test_data/demise.json") as f:
    demise_data = json.loads(f.read())

    demise_in_db = []
for demis in demise_data:
    name,gender,relation = (demis["name"],demis["gender"],demis["relation"])
    demise_date = datetime.strptime(demis["demise_date"],"%Y-%m-%d" )

    add_demise = crud.create_demise(name,gender,relation,demise_date)
    demise_in_db.append(add_demise)



# Load wedding data from JSON file
with open("test_data/wedlock.json") as f:
    wedlock_data = json.loads(f.read())

    wedlock_in_db = []
for wed in wedlock_data:
    mr_name,mrs_name,mr_email,mrs_email,mr_Phone_number, mrs_Phone_number,relation = (wed["mr_name"],wed["mrs_name"],wed["mr_email"],wed["mrs_email"],wed["mr_Phone_number"],wed["mrs_Phone_number"],wed["relation"])
    wedding_date = datetime.strptime(wed["wedding_date"],"%Y-%m-%d" )

    add_wedlock = crud.create_wedlock(mr_name,mrs_name,mr_email,mrs_email,mr_Phone_number,mrs_Phone_number,wedding_date,relation)
    demise_in_db.append(add_wedlock)
 
   
  