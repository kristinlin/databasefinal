from flask import Flask, session, render_template, request, redirect, url_for
from data import database 

app = Flask(__name__)
app.secret_key = "REALLYSECRET"


@app.route("/", methods=["GET"])
def homepage():
    if "user" in session:
        print(session["user"])
        return render_template("homepage.html")
    else:
        return redirect(url_for("login"))


@app.route("/login", methods=["GET", "POST"])
def login():
    fail = False
    if request.method == "POST":
        nuid = request.form["nuid"]
        pwd = request.form["pwd"]
        if database.student_login(nuid, pwd):
            session["user"] = nuid
            return redirect(url_for("homepage"))
        fail = True
    return render_template("login.html", fail=fail)


@app.route("/account/logout", methods=["GET"])
def logout():
    session.pop("user")
    return redirect(url_for("login"))


@app.route("/account", methods=["GET", "POST"])
def account():
    if "user" not in session:
        return redirect(url_for("login"))
    changePwd = False
    if request.method == "POST":
        pwd = request.form["pwd"]
        changePwd = database.update_password(session["user"], pwd)
    return render_template(
        "account.html",
        student=database.getStudent(session["user"]),
        changePwd=changePwd,
    )


@app.route("/search", methods=["GET", "POST"])
def search():
    if "user" not in session:
        return redirect(url_for("login"))
    results = []
    if request.method == "POST":
        # TODO actually find the results
        results = [
            {"id": "123", "col1": "hello", "col2": "hello2", "col3": "hello3"},
            {"id": "123", "col1": "hello", "col2": "hello2", "col3": "hello3"},
        ]
    return render_template(
        "search.html", courseNum=["tester1", "tsester2"], results=results
    )


@app.route("/courses", methods=["GET"])
def courses():
    if "user" not in session:
        return redirect(url_for("login"))
    
    courses = database.getStudentCourses(session["user"])
    
    # [
    #     {
    #         "subject": "CS",
    #         "num": 1800,
    #         "semester": "Fall2020",
    #         "title": "Discrete Structures",
    #         "reviewed": True,
    #     },
    #     {
    #         "subject": "CS",
    #         "num": 3200,
    #         "semester": "Fall2020",
    #         "title": "Database Design",
    #         "reviewed": False,
    #     },
    # ]
    return render_template("courses.html", courses=courses)


@app.route("/course", methods=["GET"])
def course():
    semester = "All semesters"
    like = False
    courseId = request.args.get("courseId")
    if "semester" in request.args:
        semester = request.args.get("semester")
    if "like" in request.args:
        like = request.args.get("like") == "True"
    reviews = [
        {
            "id": 123,
            "comment": "Wooohoo my comment is here",
            "rating": 9.6,
            "helpful": 6,
        }
    ]

    return render_template(
        "course.html",
        professor="Kathleen Durane",
        courseId=courseId,
        course="CS3200 Database Design",
        semester=semester,
        reviews=reviews,
        like=like,
    )


@app.route("/write", methods=["GET"])
def write():
    
    args = request.args.items()
    for arg in args:
        print(arg)

    profName = request.args.get("profName")
    courseName = request.args.get("course")
    studentCourseId = request.args.get("scid")

    return render_template(
        "write.html", professor=profName, course=courseName, scid=studentCourseId
    )


@app.route("/edit", methods=["GET"])
def edit():
    
    return render_template(
        "write.html", professor="Kathleen Durane", course="CS3200 Database Design"
    )

@app.route("/write/review", methods=["POST"])
def writeReview():
    print("received review " + str(request))
    return redirect(url_for("courses"))


if __name__ == "__main__":
    database.connectDb()
    app.run()
