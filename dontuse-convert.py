import pandas as pd

dtype = {
    'passenger_count':'int8',
    'RatecodeID':'int8',
    'PULocationID':'int16',
    'DOLocationID':'int16',
    'payment_type':'int8',
    'fare_amount': 'float16', 
    'extra': 'float16', 
    'mta_tax': 'float16', 
    'trip_distance': 'float16', 
	'tip_amount': 'float16',
	'improvement_surcharge': 'float16',
	'total_amount': 'float16',
	'congestion_surcharge': 'float16'
}

#df = pd.read_csv (r"isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv",dtype=dtype)
df = pd.read_csv (r"isc-taxi-demo/10M.csv",dtype=dtype)

#print(pd.to_datetime(df['tpep_pickup_datetime']))
df['tpep_pickup_datetime']=pd.to_datetime(df['tpep_pickup_datetime'])
df['tpep_dropoff_datetime']=pd.to_datetime(df['tpep_dropoff_datetime'])

df.to_csv (r"isc-taxi-demo/data/10M.csv", index=None)
