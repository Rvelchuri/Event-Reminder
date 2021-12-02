"""CRUD operations."""

import re
from typing import List
from sqlalchemy.orm import relation
from model import db, User,Birthday,Demise,Wedlock,Vacation,Festivals, connect_to_db
from datetime import datetime, time, timedelta, date
from flask import session
import pdb

# Functions start here! 
if __name__ == '__main__':
    from server import app
    connect_to_db(app)

def create_user(email, password,name, phone_number):
    
    """Create and return a new user."""

    user = User(email= email, password = password,name = name, phone_number = phone_number)

    db.session.add(user)
    db.session.commit()
    return user

def create_birthday(email, name, gender,relation,phone_number,birth_date,user_id):
    birth = Birthday(email = email, name = name, gender = gender,relation = relation, phone_number = phone_number, birth_date = birth_date, user_id = user_id)
    db.session.add(birth)
    db.session.commit()
    return birth

def create_demise(name, gender,relation,demise_date,user_id):
    remem = Demise(name = name, gender = gender,relation = relation, demise_date = demise_date,user_id = user_id)

    db.session.add(remem)
    db.session.commit()
    return remem

def create_wedlock(mr_name,mrs_name,mr_email,mrs_email,mr_Phone_number,mrs_Phone_number,wedding_date,relation,user_id):
    weddi = Wedlock(mr_name = mr_name,mrs_name = mrs_name, mr_email= mr_email, mrs_email = mrs_email, 
    mr_Phone_number = mr_Phone_number, mrs_Phone_number = mrs_Phone_number, 
    wedding_date = wedding_date, relation = relation, user_id = user_id )

    db.session.add(weddi)
    db.session.commit()
    return weddi

def create_vacation(location_name, vac_start_date, vac_end_date,user_id):
    vacat = Vacation(location_name = location_name, vac_start_date = vac_start_date, vac_end_date = vac_end_date,user_id = user_id)

    db.session.add(vacat)
    db.session.commit()
    return vacat

def create_festivals(festive_name, overview, festive_date, user_id):
    festi = Festivals(festive_name = festive_name, overview = overview, festive_date = festive_date, user_id=user_id)

    db.session.add(festi)
    db.session.commit()
    return festi


def login_user(email, password):
    return User.query.filter((User.email == email) & (User.password == password)).first()

def get_user_by_email(email):
    return User.query.filter(User.email == email).first()


    
def return_birthday():
    return Birthday.query.all()



def get_birthday(user_id):
    """return all birthdays"""
    return Birthday.query.filter(Birthday.user_id == user_id)
    # return Birthday.query.all()


def get_demise(user_id):
    """return all death Anniversaries"""

    return Demise.query.filter(Demise.user_id == user_id)
    # return Demise.query.all()

def get_wedlock(user_id):
    """return all wedding Anniversaries"""
    return Wedlock.query.filter(Wedlock.user_id == user_id)
    # return Wedlock.query.all()

  
def get_vacation(user_id):
    """return all vacations"""
    return Vacation.query.filter(Vacation.user_id == user_id)
    # return Vacation.query.all()

def get_festival(user_id):
    """return all festivals"""
    return Festivals.query.filter(Festivals.user_id == user_id)
    # return Festivals.query.all()

def get_user_by_id(user_id):
    return User.query.get(user_id)



def get_upcoming_birthday(user_id):
    # birthdate = db.session.query.(Birthday.birth_date,Birthday.name,Birthday.email,Birthday.phone_number,Birthday.user_id).all()
    birthdate = Birthday.query.filter(Birthday.user_id == user_id).all()
    str_happy = "Wish Happy birthday"
    str_one = " let them eat cake ...its first birthday"
    str_five = " let them eat cake ...its fifth birthday"
    str_ten = " let them eat cake ...its tenth birthday"
    str_sixteen = "sweet sixteen... its 16th birthday"
    str_eighteen = "let them vote....its 18th birthday"
    str_thirty ="lets settle down.... its 30th birthday"
    str_forty ="still young.... its 40th birthday"
    str_fifty = "Growing old is mandatory... its 50th birthday"
    str_sixty = "getting better everyday... its 60th birthday"
    # print(birthdate)
    birthdate_list = []
    
    for bday in birthdate:
        birthdate_dict = {}
        day = bday.birth_date
        now = datetime.now()
        if now.month in [10,11,12] and day.month in [1,2,3]:
            day_this_year = datetime(year=datetime.now().year+1, month=day.month, day=day.day)
            print(birthdate)
        else:
            day_this_year = datetime(year=datetime.now().year, month=day.month, day=day.day)

        nextday_date = datetime.now() + timedelta(days=90)
        if day_this_year > now and day_this_year < nextday_date:
            birthdate_dict["name"] = bday.name
            birthdate_dict["date"] = bday.birth_date
            birthdate_dict["email"] = bday.email
            birthdate_dict["type"] = "birthday"
           
            # birthdate_list.append(birthdate_dict)
            # pdb.set_trace()   
            year = timedelta(days=365)
            special = int((now-day)/year)
            print(special)
            if special ==1:
               birthdate_dict["message"] = str_one
            elif special ==5:
               birthdate_dict["message"] = str_five
            elif special ==10:
               birthdate_dict["message"] = str_ten
            elif special ==16:
               birthdate_dict["message"] = str_sixteen
            elif special ==18:
               birthdate_dict["message"] = str_eighteen
            elif special ==30:
               birthdate_dict["message"] = str_thirty
            elif special ==40:
               birthdate_dict["message"] = str_forty
            elif special ==50:
               birthdate_dict["message"] = str_fifty
            elif special ==60:
               birthdate_dict["message"] = str_sixty
            else:
                birthdate_dict["message"] = str_happy
          
            birthdate_list.append(birthdate_dict)
            print(birthdate_list)
    return birthdate_list

##############################################################################################

def get_upcoming_demise(user_id):
    # death = db.session.query(Demise.demise_date,Demise.name).all()
    death = Demise.query.filter(Demise.user_id == user_id).all()
    print(death)
    death_list = []
    for dday in death:
        death_dict = {}
        day = dday.demise_date
        # year,month,date = date.split()
        # month = int(month)
        # day = int(day)
        now = datetime.now()

        if now.month in [10,11,12] and day.month in [1,2,3]:
            day_this_year = datetime(year=datetime.now().year+1, month=day.month, day=day.day)
        
        else:
            day_this_year = datetime(year=datetime.now().year, month=day.month, day=day.day)
            print(day_this_year)
       
        nextday_date = datetime.now() + timedelta(days=90)
        if day_this_year > now and day_this_year < nextday_date:
            death_dict["name"] = dday.name
            death_dict["date"] = dday.demise_date
            death_dict["email"] = ""
            death_dict["type"] = "demise"
            # death_dict["special bday"] = 
            death_list.append(death_dict)


            print(death_list)
            

    return death_list

###################################


def get_upcoming_vacations(user_id):
    # vacat = db.session.query(Vacation.vac_start_date,Vacation.location_name).all()
    vacat = Vacation.query.filter(Vacation.user_id == user_id).all()
    vacat_list = []
    for vday in vacat:
        vacat_dict = {}
        day = vday.vac_start_date
        now = datetime.now()
        if now.month in [10,11,12] and day.month in [1,2,3]:
            day_this_year = datetime(year=datetime.now().year+1, month=day.month, day=day.day)
            
        else:
            day_this_year = datetime(year=datetime.now().year, month=day.month, day=day.day)
        
      
        nextday_date = datetime.now() + timedelta(days=90)
        if day_this_year > now and day_this_year < nextday_date:
            vacat_dict["name"] = vday.location_name
            vacat_dict["date"] = vday.vac_start_date
            vacat_dict["email"] = ""
            vacat_dict["type"] = "vacation"
            vacat_list.append(vacat_dict)
       
    return vacat_list



def get_upcoming_festivals(user_id):
    # fest = db.session.query(Festivals.festive_date,Festivals.festive_name).all()
    fest = Festivals.query.filter(Festivals.user_id == user_id).all()
    fest_list = []
    for fday in fest:
        fest_dict = {}
        day = fday.festive_date
        now = datetime.now()
        if now.month in [10,11,12] and day.month in [1,2,3]:
            day_this_year = datetime(year=datetime.now().year+1, month=day.month, day=day.day)
            
        else:
            day_this_year = datetime(year=datetime.now().year, month=day.month, day=day.day)
        nextday_date = datetime.now() + timedelta(days=90)
        if day_this_year > now and day_this_year < nextday_date:
            fest_dict["name"] = fday.festive_name
            fest_dict["date"] = fday.festive_date
            fest_dict["email"] = ""
            fest_dict["type"] = "festival"

            fest_list.append(fest_dict)
    return fest_list



def get_upcoming_weddings(user_id):
    # wedd = db.session.query(Wedlock.wedding_date,Wedlock.mr_name,Wedlock.mrs_name,Wedlock.mr_email,Wedlock.mrs_email).all()
    wedd = Wedlock.query.filter(Wedlock.user_id == user_id).all()
    wedd_list = []
    for wday in wedd:
        wedd_dict = {}
        day = wday.wedding_date
        now = datetime.now()
        if now.month in [10,11,12] and day.month in [1,2,3]:
            day_this_year = datetime(year=datetime.now().year+1, month=day.month, day=day.day)
            print(wedd)

        else:
            day_this_year = datetime(year=datetime.now().year, month=day.month, day=day.day)
           
        nextday_date = datetime.now() + timedelta(days=90)
        if day_this_year > now and day_this_year < nextday_date:
            # wedd_dict[wday[1]] = wday[0]
            # wedd_dict[wday[2]] = wday[0]
            wedd_dict["name"] = wday.mr_name + " weds " + wday.mrs_name
            # wedd_dict["mrs_name"] = wday.mrs_name
            wedd_dict["date"] = wday.wedding_date
            wedd_dict["email"] = wday.mr_email
            # wedd_dict["mrs_email"] = wday.mrs_email
            wedd_dict["type"] = "wedding"

            wedd_list.append(wedd_dict)
        
    return wedd_list
   









