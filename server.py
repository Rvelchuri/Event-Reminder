
"""Server for movie ratings app."""

from flask import (Flask, render_template, request, flash, session, redirect)
# from model import connect_to_db
# import crud

from jinja2 import StrictUndefined

app = Flask(__name__)
app.secret_key = "dev"
app.jinja_env.undefined = StrictUndefined



# Replace this with routes and view functions!
@app.route('/')
def homepage():
    return render_template('homepage.html')



@app.route("/login", methods=["POST"])
def log_in():
    email = request.form.get("email")
    password = request.form.get("password")

    user = crud.login_user(email, password)
    if user:
        key = user.user_id
        session['key'] = key
        flash('Logged in!')
    else:
       flash("Try again")

    return redirect("/")



if __name__ == "__main__":
    # DebugToolbarExtension(app)
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
