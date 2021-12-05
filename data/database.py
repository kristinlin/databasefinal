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


# =====================================================================
# SEMESTER DATABASE FUNCTIONS
