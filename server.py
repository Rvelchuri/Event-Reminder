
"""Server for Event reminder web app."""

from flask import (Flask, render_template, request, flash, session, redirect)
from sqlalchemy.orm import relation
from model import connect_to_db
import crud

from jinja2 import StrictUndefined

app = Flask(__name__)
app.secret_key = "dev"
app.jinja_env.undefined = StrictUndefined 


# Replace this with routes and view functions!
@app.route('/')
def homepage():
    return render_template('homepage.html')


def all_users():
    """view all Users"""
    users = crud.return_user()
    return render_template("all_users.html", users=users)



@app.route('/users/<user_id>')
def show_user(user_id):
    user =crud.get_user_by_id(user_id)
    return render_template("user_details.html", user=user)

# #  route to events page
# @app.route('/users/<user_id>')
# def show_events(user_id):
#     user =crud.get_event(user_id)
#     return render_template("add_events.html", user=user)

@app.route("/users", methods=["POST"])
def register_user():
   email = request.form.get("email")
   password = request.form.get("password")
   user = crud.get_user_by_email(email)

   if user:
       flash("Cannot create an account or user already registered... Please try again.")
   else:
        crud.create_user(email, password)
        flash("Account was created successfully. Please log in.")
   return redirect("/")



@app.route("/login", methods=["POST"])
def log_in():
    email = request.form.get("email").lower()
    password = request.form.get("password")

    user = crud.login_user(email, password)
    if user:
        key = user.user_id
        session['key'] = key
        flash('Logged in!')
    else:
       flash("Try again")
    return render_template('/view_events.html')



@app.route('/birthday')
def all_birthday():
    """view all birthdays"""
    birthday = crud.get_birthday()
    print(birthday)
    print ("*******",type(birthday))
    return render_template("birthday_display.html", birthday = birthday)

@app.route('/addbirthday')
def add_birthday():
    """Add birthday"""

    # email = request.form.get['email']
    # name = request.form.get('name')
    # gender = request.form.get('gender')
    # relation= request.form.get('relation')
    # phone_number = request.form.get('phone_number')
    # birth_date = request.form.get('birth_date')

    # crud.create_birthday(email, name, gender,relation,phone_number,birth_date)
    # flash("You've successfully added birthday details")
    return render_template("add_birthday.html")


if __name__ == "__main__":
    # DebugToolbarExtension(app)
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)



