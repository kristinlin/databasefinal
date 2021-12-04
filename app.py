from flask import Flask, session, render_template, request, redirect, url_for

app = Flask(__name__)
app.secret_key = 'REALLYSECRET'


@app.route("/", methods=["GET"])
def homepage():
    if 'user' in session: 
        print(session['user'])
        return render_template("homepage.html")
    else: 
        return redirect(url_for("login"))


@app.route("/login", methods=["GET", "POST"])
def login():
    fail = False
    if request.method == 'POST':
        nuid = request.form['nuid']
        pwd = request.form['pwd']
        print(nuid + " " + pwd)
        if nuid == "00000": # TODO check user exists
            session['user'] = nuid
            return redirect(url_for("homepage"))
        fail = True
    return render_template("login.html", fail = fail)

@app.route("/account/logout", methods=["GET"])
def logout():
    session.pop('user')
    return redirect(url_for("login"))

@app.route("/account", methods=["GET", "POST"])
def account():
    if "user" not in session:
        return redirect(url_for("login"))
    changePwd = False
    if request.method == 'POST':
        pwd = request.form['pwd']
        print("new password: " + pwd)
        # TODO actually change password
        changePwd = True
    return render_template("account.html", student_name="Tester Name", nuid=session['user'], changePwd=changePwd)


@app.route("/search", methods=["GET", "POST"])
def search():
    if "user" not in session:
        return redirect(url_for("login"))
    results = []
    if request.method == 'POST':
        # TODO actually find the results
        results = [{"id":"123", "col1":"hello", "col2":"hello2", "col3":"hello3"},
        {"id": "123", "col1": "hello", "col2": "hello2", "col3": "hello3"}]
    return render_template("search.html", courseNum=["tester1", "tsester2"], results=results)


@app.route("/courses", methods=["GET"])
def courses():
    if "user" not in session:
        return redirect(url_for("login"))
    courses = [{"subject":"CS", "num":1800, "semester": "Fall2020", "title":"Discrete Structures", "reviewed":True},
    {"subject": "CS", "num": 3200, "semester": "Fall2020", "title": "Database Design", "reviewed": False}]
    return render_template("courses.html", courses=courses)

@app.route("/course", methods=["GET"])
def course():
    return render_template("course.html", courses=courses)

@app.route("/write", methods=["GET"])
def write():    
    return render_template("write.html", professor="Kathleen Durane", course="CS3200 Database Design")


@app.route("/write/review", methods=["POST"])
def writeReview():
    print("received review " + str(request))
    return redirect(url_for("courses"))


if __name__ == "__main__":
    app.debug = True
    app.run()
