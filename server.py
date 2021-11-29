
"""Server for Event reminder web app."""

from flask import (Flask, render_template, request, flash, session, redirect, jsonify)
from sqlalchemy.orm import relation
from model import connect_to_db
import crud
from datetime import datetime, date, timedelta
import os
import pdb
from flask_mail import Mail, Message
from jinja2 import StrictUndefined



app = Flask(__name__)
app.secret_key = "dev"
app.jinja_env.undefined = StrictUndefined 



app = Flask(__name__)
app.config['SECRET_KEY'] = 'top-secret!'
app.config['MAIL_SERVER'] = 'smtp.sendgrid.net'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'apikey'
app.config['MAIL_PASSWORD'] = os.environ.get('SENDGRID_API_KEY')
app.config['MAIL_DEFAULT_SENDER'] = "rajani.velchuri@gmail.com"
mail = Mail(app)


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



@app.route("/users", methods=["POST"])
def register_user():
   name = request.form.get("name")
   phone_number = request.form.get("phone_number")
   email = request.form.get("email")
   password = request.form.get("password")
   user = crud.get_user_by_email(email)

   if user:
       flash("Cannot create an account or user already registered... Please try again.")
   else:
        new_user = crud.create_user(email, password,name,phone_number)
        print(new_user)
        flash("Account was created successfully. Please log in.")
   return redirect("/")


@app.route("/signup", methods=["GET"])
def signup_user():
    return render_template("sign_up.html")


@app.route("/login", methods=["POST"])
def log_in():
    email = request.form.get("email").lower()
    password = request.form.get("password")
    user = crud.login_user(email, password)
    if user:
        key = user.user_id
        session['key'] = key
        session['name'] = user.name
        # flash('Logged in!')
    else:
       flash("Try again")
    return redirect('/view_events')

@app.route("/logout")
def log_out():
    session["key"] = ""
    return render_template("homepage.html")





@app.route("/view_events", methods=["GET"])
def view_events():
    return render_template('/view_events.html'),200




@app.route('/birthday')
def all_birthday():
    """view all birthdays"""
    birthday = crud.get_birthday(session["key"])
    print(birthday)       
    print ("*******",type(birthday))
    return render_template("birthday_display.html", birthday = birthday,status=200)



@app.route('/demise')
def all_demise():
    """view all death Anniversaries"""
    demis_get = crud.get_demise(session["key"])
    print(demis_get)
    print("******************")
    return render_template("demise_display.html", demise = demis_get)



@app.route('/wedding')
def all_wedding():
    """view all wedding Anniversaries"""
    wed_get = crud.get_wedlock(session["key"])
    print(wed_get)
    print("******************")
    return render_template("wedding_display.html", wedding= wed_get)

@app.route('/vacation')
def all_vacations():
    """view all vacation list"""
    vac_get = crud.get_vacation(session["key"])
    print(vac_get)
    print("******************")
    return render_template("vacation_display.html", vacation = vac_get)


@app.route('/festivals')
def all_festivals():
    """view all festivals or important days list"""
    fest_get = crud.get_festival(session["key"])
    print(fest_get)
    print("******************")
    return render_template("festivals_display.html", festival = fest_get)


@app.route('/addbirthday', methods=["GET","POST"])
def add_birthday():
    """Add birthday"""
    try:
        if request.method == "POST":
    
            email = request.form.get('email')
            name = request.form.get('name')
            gender = request.form.get('gender')
            relation= request.form.get('relation')
            phone_number = request.form.get('phone_number')
            birth_date = datetime.strptime(request.form.get("birth_date"),"%Y-%m-%d" )
            new_birthday=crud.create_birthday(email, name, gender,relation,phone_number,birth_date,session['key'])
            # pdb.set_trace()
            print(new_birthday)
            flash("You've successfully added birthday details")
        return render_template("add_birthday.html"),201  
    except Exception as e:
        return jsonify({"message": "failed"}),400




@app.route('/adddemise', methods=["GET","POST"])
def add_demise():
    """Add death day"""
    try:
        if request.method == "POST":

            name = request.form.get('name')
            gender = request.form.get('gender')
            relation= request.form.get('relation')
            demise_date = datetime.strptime(request.form.get("demise_date"),"%Y-%m-%d" )

            crud.create_demise(name, gender,relation,demise_date,session['key'])
            flash("You've successfully added remembrance day details")
        return render_template("add_demise.html"),201
    except Exception as e:
        return jsonify({"message": "failed"}),400


@app.route('/addwedding', methods=["GET","POST"])
def add_wedlock():
    """Add wedding"""
    try:
        if request.method == "POST":
        
            mr_name = request.form.get('mr_name')
            mrs_name = request.form.get('mrs_name')
            mr_email = request.form.get('mr_email')
            mrs_email = request.form.get('mrs_email')
            mr_Phone_number = request.form.get('mr_phone_number')
            mrs_Phone_number = request.form.get('mrs_phone_number')
            relation = request.form.get('relation')
            wedding_date = datetime.strptime(request.form.get("wedding_date"),"%Y-%m-%d" )

            crud.create_wedlock(mr_name,mrs_name,mr_email,mrs_email,mr_Phone_number,mrs_Phone_number,wedding_date,relation,session['key'])
            flash("You've successfully added wedding details")
        return render_template("add_wedding.html"),201
    except Exception as e:
        return jsonify({"message": "failed"}),400




@app.route('/addvacation', methods=["GET","POST"])
def add_vacation():
    """Add vacation"""
    try:
        if request.method == "POST":

            location_name= request.form.get('location_name')
            vac_start_date = datetime.strptime(request.form.get("vac_start_date"),"%Y-%m-%d" )
            vac_end_date = datetime.strptime(request.form.get("vac_end_date"),"%Y-%m-%d" )
            if vac_end_date < vac_start_date:
                flash(" please enter valid end date")
            else:
                crud.create_vacation(location_name, vac_start_date, vac_end_date,session['key'])
            # print(new_vacation)
                flash("You've successfully added vacation details")
        return render_template("add_vacation.html"),201
    except Exception as e:
        return jsonify({"message": "failed"}),400




@app.route('/addfestivals', methods=["GET","POST"])
def add_festival():
    """Add festival"""
    try:
        if request.method == "POST":

            festive_name= request.form.get('festive_name')
            overview = request.form.get('overview')
            festive_date = datetime.strptime(request.form.get("festive_date"),"%Y-%m-%d" )

            crud.create_festivals(festive_name, overview, festive_date,session['key'])
            flash("You've successfully added festival details")
        return render_template("add_festivals.html"),201
    except Exception as e:
        return jsonify({"message": "failed"}),400




@app.route('/upcomingbday')
def get_upcoming_birthday():
    try:
        birthday_dic = crud.get_upcoming_birthday(session["key"])
        print(birthday_dic)
        return jsonify (birthday_dic),200 
    except Exception as e:
        return jsonify({"message": "failed"}),400



@app.route('/upcomingdday')
def get_upcoming_demise_day():
    try:
        death_dic = crud.get_upcoming_demise(session["key"])
        return jsonify (death_dic),200
    except Exception as e:
        return jsonify({"message": "failed"}),400

@app.route('/upcomingvday')
def get_upcoming_vacation_day():
    try:
        vacat_dic = crud.get_upcoming_vacations(session["key"])
        death_dic = crud.get_upcoming_demise(session["key"])
        fest_dic = crud.get_upcoming_festivals(session["key"])
        wedd_dic = crud.get_upcoming_weddings(session["key"])
        birthday_dic = crud.get_upcoming_birthday(session["key"])
        # pdb.set_trace()
        vacat_dic.extend(death_dic)
        vacat_dic.extend(fest_dic)
        vacat_dic.extend(wedd_dic)
        vacat_dic.extend(birthday_dic)
        return jsonify (vacat_dic),200
    except Exception as e:
        return jsonify({"message": "failed"}),400


@app.route('/upcomingfday')
def get_upcoming_festivals_day():
    try:
        fest_dic = crud.get_upcoming_festivals(session["key"])
        return jsonify (fest_dic)
    except Exception as e:
        return jsonify({"message": "failed"}),400



@app.route('/upcomingwday')
def get_upcoming_wedding_day():
    try:
        wedd_dic = crud.get_upcoming_weddings(session["key"])
        return jsonify (wedd_dic),200
    except Exception as e:
        return jsonify({"message": "failed"}),400
    




#sending Email
@app.route('/sendmail', methods=['GET', 'POST'])
def index():
    try:
        if request.method == 'POST':
            pdb.set_trace()
            print (request.data)
            recipient = request.json['recipient']
            type = request.json["type"]
            mesg= ""
            if type == "wedding":
                mesg = " Happy Anniversary"
            elif type == "birthday":
                mesg = " Happy Birthday"
            msg = Message(mesg, recipients=[recipient])
            # msg.body = ('Congratulations!')
            msg.html = ('<h1>{}</h1>'
                    '<p>Congratulations!  </p>'.format(mesg))
            mail.send(msg)
            flash(f'A test message was sent to {recipient}.')
            return jsonify({"message":"success"}),200
    except Exception as e:
        return jsonify({"message": "failed"}),400

    
    



if __name__ == "__main__":
    # DebugToolbarExtension(app)
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)



