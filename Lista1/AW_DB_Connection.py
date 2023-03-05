import sqlalchemy as sa
from sqlalchemy.sql import text
from sqlalchemy.engine import URL
import pandas as pd

pd.set_option('display.expand_frame_repr', False)

from config import SERVER, PORT, USER, PASSWORD, DB

url = URL.create(
  'mssql+pymssql',
  username=USER,
  password=PASSWORD,
  host=SERVER,
  port=PORT,
  database=DB
)

engine = sa.create_engine(url)

sql = '''
    SELECT TerritoryID, Name, CountryRegionCode, SalesYTD, SalesLastYear
    FROM Sales.SalesTerritory
'''

with engine.connect().execution_options(autocommit=True) as conn:
  query = conn.execute(text(sql))
  
  df = pd.DataFrame(query.fetchall())
  print(df)
  df.to_csv('SalesTeritory.csv')