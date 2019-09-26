import mysql.connector
from pydal import DAL

# pip install pydal

config = {
  'user': 'root',
  'password': 'root',
  'host': 'mysql',
  'database': 'mysql',
  'raise_on_warnings': True
}

try:
    cnx = mysql.connector.connect(**config)
    print "Connection Successful"
    cursor = cnx.cursor()
    cursor.execute("USE {0}".format(config['database']))
    cursor.execute("SHOW TABLES")
    for (table_name,) in cursor:
        print(table_name)

    connection_string = 'mysql://{0}:{1}@{2}/{3}'.format(config['user'], config['password'], config['host'], config['database'])
    print "CONNECTION STRING: " +connection_string
    db = DAL(connection_string)
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print "Something is wrong with your user name or password" 
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print "Database does not exist" 
  else:
    print(err)
else:
  cnx.close()