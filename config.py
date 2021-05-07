
# database = "sqlite"
# database = "mssql"
# database = "mongo"
# database = "postgres_local"
database = "postgres_heroku"

connect_string = ""

if database == "sqlite":
    connect_string = "sqlite:///belly_button.db"
elif database == "mssql":    
    connect_string = "mssql+pymssql://user:pass@server:port/database"
elif database == "postgres_local":
    connect_string = "postgresql+psycopg2://postgres:pgadmin@localhost/belly_button"
elif database == "postgres_heroku":    
    connect_string = "postgresql+psycopg2://dwyuaoaaolfruv:3fd2f7ffcda5579ffbab3e989c31ae4fb4641eaabefbf45b1d2665387157f4c3@ec2-34-193-113-223.compute-1.amazonaws.com:5432/d5ub94bci8grkb"
elif database == "mongo":        
    connect_string = "mongodb+srv://user:pass@mongo-server/?retryWrites=true&w=majority"
