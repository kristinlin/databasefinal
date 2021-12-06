import pymysql

cnx = None


def connectDb():
    global cnx
    valid_login = False
    while not valid_login:
        username = input("Enter your username: ")
        pwd = input("Enter your password: ")
        try:
            cnx = pymysql.connect(
                host="localhost",
                user=username,
                password=pwd,
                db="das_a_link_dd",
                charset="utf8mb4",
                cursorclass=pymysql.cursors.DictCursor,
            )
            valid_login = True
            break
        except pymysql.err.OperationalError as e:
            print("Try again. Connection failed due to following error:")
            print("Error: %d: %s" % (e.args[0], e.args[1]))


# =====================================================================
# STUDENT DATABASE FUNCTIONS


def student_login(nuid, pwd):
    cur = cnx.cursor()
    success = False
    try:
        login_select = 'student_login({},"{}")'.format(nuid, pwd)
        cur.execute("select " + login_select)
        res = cur.fetchall()
        print(res[0][login_select])
        cur.close()
        success = res[0][login_select] == 1
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return success


def update_password(nuid, newPwd):
    cur = cnx.cursor()
    success = False
    try:
        cur.callproc("update_pwd", [nuid, newPwd])
        success = True
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return success


def getStudent(nuid):
    cur = cnx.cursor()
    student = {}
    try:
        student_select = "select * from student where student.nuid = {}".format(nuid)
        cur.execute(student_select)
        res = cur.fetchall()
        student = res[0]
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return student


# =====================================================================
# STUDENT_COURSE DATABASE FUNCTIONS


def getSemester(sid):
    cur = cnx.cursor()
    semester = ""
    try:
        sem_select = "sid_semester({})".format(sid)
        cur.execute("select " + sem_select)

        res = cur.fetchall()
        semester = res[0][sem_select]
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return semester


def getStudentCourseReview(student_course_id):
    cur = cnx.cursor()
    review_id = -1

    try:
        review_select = "student_course_review({})".format(student_course_id)
        cur.execute("select " + review_select)

        res = cur.fetchall()
        review_id = res[0][review_select]
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return review_id


def getProfName(pid):
    cur = cnx.cursor()
    profname = ""
    try:
        sem_select = "pid_profname({})".format(pid)
        cur.execute("select " + sem_select)

        res = cur.fetchall()
        profname = res[0][sem_select]
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return profname


def getStudentCourses(nuid):
    cur = cnx.cursor()
    courses = []
    try:
        cur.callproc("get_student_courses", [nuid])
        courses = cur.fetchall()

        for course in courses:
            course["semester"] = getSemester(course["sid"])
            course["review_id"] = getStudentCourseReview(course["student_course_id"])
            course["prof_name"] = getProfName(course["pid"])

    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()

    return courses


def getAbilities():
    cur = cnx.cursor()
    abilities = []
    try:
        cur.callproc("get_abilities", [])
        abilities = cur.fetchall()
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return abilities


def create_review(scid, review):
    cur = cnx.cursor()
    try:
        rating = float(review["rating"])
        comment = review["comment"]
        str1 = None if review["str1"] == "-1" else int(review["str1"])
        str2 = None if review["str2"] == "-1" else int(review["str2"])
        wk1 = None if review["wk1"] == "-1" else int(review["wk1"])
        wk2 = None if review["wk2"] == "-1" else int(review["wk2"])
        cur.callproc("insert_review", [rating, scid, comment, str1, str2, wk1, wk2])
        cur.fetchall()
        cnx.commit()
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()


def get_review(review_id):
    cur = cnx.cursor()
    review = []
    try:
        cur.callproc("get_review", [review_id])
        review = cur.fetchall()[0]
        print(review)
    except pymysql.err.OperationalError as e:
        print(e)
    cur.close()
    return review
