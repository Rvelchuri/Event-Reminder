"""CRUD operations."""

from sqlalchemy.orm import relation
from model import db, User,Birthday,Demise,Wedlock,Vacation,Festivals, connect_to_db
from datetime import datetime


# Functions start here! 
if __name__ == '__main__':
    from server import app
    connect_to_db(app)

def create_user(email, password):
    
    """Create and return a new user."""

    user = User(email= email, password = password)

    db.session.add(user)
    db.session.commit()
    return user

def create_birthday(email, name, gender,relation,phone_number,birth_date):
    birth = Birthday(email = email, name = name, gender = gender,relation = relation, phone_number = phone_number, birth_date = birth_date)

    db.session.add(birth)
    db.session.commit()
    return birth

def create_demise(name, gender,relation,demise_date):
    remem = Demise(name = name, gender = gender,relation = relation, demise_date = demise_date)

    db.session.add(remem)
    db.session.commit()
    return remem

def create_wedlock(mr_name,mrs_name, mr_email,mrs_emial,mr_Phone_number,mrs_Phone_number,wedding_date,relation):
    weddi = Wedlock(mr_name = mr_name,mrs_name = mrs_name, mr_email= mr_email, mrs_emial = mrs_emial, 
    mr_Phone_number = mr_Phone_number, mrs_Phone_number = mrs_Phone_number, 
    wedding_date = wedding_date, relation = relation )

    db.session.add(weddi)
    db.session.commit()
    return weddi

def create_vacation(location_name, vac_start_date, vac_end_date):
    vacat = Vacation(location_name = location_name, vac_start_date = vac_start_date, vac_end_date = vac_end_date)

    db.session.add(vacat)
    db.session.commit()
    return vacat

def create_festivals(festive_name, overview, festive_date):
    festi = Festivals(festive_name = festive_name, overview = overview, festive_date = festive_date)

    db.session.add(festi)
    db.session.commit()
    return festi


def login_user(email, password):
    return User.query.filter((User.email == email) & (User.password == password)).first()

def get_user_by_email(email):
    return User.query.filter(User.email == email).first()


    
def return_birthday():
    return Birthday.query.all()

        
def return_birthday_by_user(user_id):
    return Birthday.query.filter(Birthday.user_id == user_id)


def get_birthday():
    """return all birthdays"""
    return Birthday.query.all()


def get_demise():
    """return all death Anniversaries"""
    return Demise.query.all()

# def get_event(user_id):
#     return User.query.get(user_id)

# def return_user():
#     return User.query.all()

# def get_birthday():
#     return Birthday.query.all()

# def get_birthday_by_name(name):
#     return Birthday.query.get(name)





