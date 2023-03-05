import os
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

SERVER = os.environ.get("SERVER")
PORT = os.environ.get('PORT')
USER = os.environ.get('USER')
PASSWORD = os.environ.get('PASSWORD')
DB = os.environ.get('DB')
print(PASSWORD)