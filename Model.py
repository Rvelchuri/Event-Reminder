""" model for Event reminder web application"""
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import composite
from datetime import datetime


db = SQLAlchemy()

class User(db.Model):
    """A user."""
    __tablename__ = "users"

    user_id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    email = db.Column(db.String, unique=True)
    password = db.Column(db.String)
    name = db.Column(db.String)
    phone_number = db.Column(db.String)
    
    birthday = db.relationship('Birthday', back_populates ="user", uselist = False) 
    demise = db.relationship('Demise', back_populates ="user", uselist = False)
    wedlock = db.relationship('Wedlock', back_populates ="user", uselist = False)
    vacation = db.relationship('Vacation', back_populates ="user", uselist = False)
    festivals = db.relationship('Festivals', back_populates ="user", uselist = False)   

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'

""" creating Birthday Table"""
class Birthday(db.Model):

    __tablename__ = "birthdays"
    
    birth_id =db.Column(db.Integer,autoincrement=True,primary_key=True)
    email = db.Column(db.String, unique=True)
    name = db.Column(db.String,nullable = False)
    gender = db.Column(db.String)
    relation = db. Column(db.String)
    phone_number = db.Column(db.String)
    birth_date = db.Column(db.DateTime, nullable = False)
    user_id = db.Column(db.Integer,db.ForeignKey("users.user_id"))

    def __repr__(self):
        return f'<Birthdays   Name = {self.name} ,  Email={self.email}  , DOB = {self.birth_date}>'

    user = db.relationship('User', back_populates ="birthday", uselist = False)

# wedding = db.relationship('Wedlock', back_populates="birthdays")
# demi = db.relationship('Demise', back_populates = "birthdays")

""" Creating a Demise Table."""
class Demise(db.Model):

    __tablename__ = "demise"
    demise_id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    name = db.Column(db.String,nullable = False)
    gender = db.Column(db.String)
    relation = db. Column(db.String)
    demise_date = db.Column(db.DateTime,nullable = False)
    user_id = db.Column(db.Integer,db.ForeignKey("users.user_id"))

    def __repr__(self):
        return f'<Demise name = {self.name}, relation = {self.relation},  date ={self.demise_date}>'

    user = db.relationship('User', back_populates ="demise", uselist = False)



# wedding = db.relationship('Wedlock', back_populates="demi")
# birthdays = db.relationship('Birthday', back_populates="demi")

""" Creating Wedding Anniversary Table. """
class Wedlock(db.Model):
    """A user."""
    __tablename__ = "wedding"
    wedding_id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    mr_name = db.Column(db.String,nullable = False)
    mrs_name = db.Column(db.String,nullable = False)
    mr_email = db.Column(db.String,unique=True,nullable = False)
    mrs_email = db.Column(db.String,unique=True,nullable = False)
    mr_Phone_number = db.Column(db.String,unique=True,nullable = False)
    mrs_Phone_number = db.Column(db.String,unique=True,nullable = False)
    wedding_date = db.Column(db.DateTime,nullable = False)
    relation = db. Column(db.String)
    user_id = db.Column(db.Integer,db.ForeignKey("users.user_id"))

    def __repr__(self):
        return f'<Wedlock Mr.name = {self.mr_name} Mrs.name = {self.mrs_name} >'

    user = db.relationship('User', back_populates ="wedlock", uselist = False)

# birthdays = db.relationship('Birthday', back_populates="wedding")
# demi = db.realtionship('Demise', back_populates = "wedding")

""" Vacation Table. """
class Vacation(db.Model):
    """A user."""
    __tablename__ = "vacation"
    vac_id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    location_name = db.Column(db.String)
    vac_start_date = db.Column(db.DateTime)
    vac_end_date = db.Column(db.DateTime)
    user_id = db.Column(db.Integer,db.ForeignKey("users.user_id"))


    def __repr__(self):
        return f'<Vacation location = {self.location_name} StartDate = {self.vac_start_date} >'

    user = db.relationship('User', back_populates ="vacation", uselist = False)



""" Festivals or Important Days Table. """
class Festivals(db.Model):
    """A user."""
    __tablename__ = "festivals"
    festive_id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    festive_name = db.Column(db.String)
    overview = db.Column(db.String)
    festive_date = db.Column(db.DateTime)
    user_id = db.Column(db.Integer,db.ForeignKey("users.user_id"))


    def __repr__(self):
        return f'<Festivals FestivalName = {self.festive_name} Date = {self.festive_date} >'

    user = db.relationship('User', back_populates ="festivals", uselist = False)



def connect_to_db(flask_app, db_uri="postgresql:///events", echo=True): 
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")


if __name__ == "__main__":
    from server import app
    connect_to_db(app)

