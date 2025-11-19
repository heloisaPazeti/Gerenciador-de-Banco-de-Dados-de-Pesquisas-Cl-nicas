import psycopg2

def GetConnection():

    return psycopg2.connect(
        host="localhost",
        port=5432,
        database="trabalhobd",
        user="grupoquatro",
        password="4444"
    )


def GetCursor():

    conn = GetConnection()
    return conn.cursor()

def CloseConn(cursor, connection):

    cursor.close()
    connection.close()

#def Rollback():
