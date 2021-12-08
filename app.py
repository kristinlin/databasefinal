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
    changePwd = ""
    if request.method == "POST":
        pwd = request.form["pwd"]
        changePwd = str(database.update_password(session["user"], pwd.strip()))
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
    noneFound = False
    if request.method == "POST":
        results = database.getSearch(request.form)
        noneFound = len(results) == 0
    return render_template(
        "search.html",
        courseSubjects=database.getCourseSubjects(),
        courseNum=database.getCourseNums(),
        results=results,
        noneFound=noneFound,
    )


@app.route("/courses", methods=["GET"])
def courses():
    if "user" not in session:
        return redirect(url_for("login"))

    courses = database.getStudentCourses(session["user"])
    return render_template("courses.html", courses=courses)


@app.route("/course", methods=["GET"])
def course():
    like = False
    cid = request.args.get("cid")
    pid = request.args.get("pid")
    prof = request.args.get("prof")
    course = request.args.get("course")

    selectedSemester = "-1"
    selectedSemesterName = "All Semesters"
    if "semester" in request.args:
        selectedSemester = request.args.get("semester")
        selectedSemesterName = request.args.get("semesterName")
    if "like" in request.args:
        like = request.args.get("like") == "True"
        if like:
            database.studentLikesReview(session["user"], request.args.get("reviewId"))
        else:
            database.studentRemoveLikeReview(
                session["user"], request.args.get("reviewId")
            )

    reviews = database.getReviewsForCourse(
        int(session["user"]), cid, pid, selectedSemester
    )
    semesters = database.getSemesters(cid, pid)
    return render_template(
        "course.html",
        professor=prof,
        pid=pid,
        cid=cid,
        course=course,
        selectedSemester=selectedSemester,
        selectedSemesterName=selectedSemesterName,
        semesters=semesters,
        reviews=reviews,
        reviewRatings=[str(review["rating"]) for review in reviews],
        abilities=[a["description"] for a in database.getAbilities()],
        reviewStrengths=["enthusiasm"],
        #     review["strength1"] for review in reviews if review["strength1"] is not None
        # ].append(
        #     [
        #         review["strength2"]
        #         for review in reviews
        #         if review["strength1"] is not None
        #     ]
        # ),
        reviewWeaknesses=["interactive"],
        #     review["weakness1"] for review in reviews if review["strength1"] is not None
        # ].append(
        #     [
        #         review["weakness2"]
        #         for review in reviews
        #         if review["strength1"] is not None
        #     ]
        # ),
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
    abilities = database.getAbilities()

    return render_template(
        "write.html",
        professor=profName,
        course=courseName,
        scid=studentCourseId,
        abilities=abilities,
    )


@app.route("/edit", methods=["GET"])
def edit():
    profName = request.args.get("profName")
    courseName = request.args.get("course")
    review = database.get_review(request.args["review"])
    abilities = database.getAbilities()
    return render_template(
        "edit.html",
        professor=profName,
        course=courseName,
        review=review,
        abilities=abilities,
    )


@app.route("/write/review", methods=["POST"])
def writeReview():
    # print("received review")
    # rating = request.form["rating"]
    # comment = request.form["comment"]
    # for item in request.form.items():
    #     print(item)
    database.create_review(request.args["scid"], request.form)
    return redirect(url_for("courses"))


@app.route("/edit/review", methods=["POST"])
def editReview():
    if "save" in request.form:
        database.edit_review(request.args["review_id"], request.form)
    else:
        database.delete_review(request.args["review_id"])
    return redirect(url_for("courses"))


if __name__ == "__main__":
    database.connectDb()
    app.run()
