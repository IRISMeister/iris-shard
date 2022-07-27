import csv
import datetime
import sys

args = sys.argv
file=args[1]

ipath = 'isc-taxi-demo/'+file
opath = 'isc-taxi-demo/data/'+file
fi = open(ipath)
fo = open(opath,'w')

reader = csv.reader(fi)
writer = csv.writer(fo)

header = next(csv.reader(fi))
writer.writerow(header)

for row in reader:
    d1=datetime.datetime.strptime(row[1], '%m/%d/%Y %I:%M:%S %p')
    d2=datetime.datetime.strptime(row[2], '%m/%d/%Y %I:%M:%S %p')
    row[1]=datetime.datetime.strftime(d1,'%Y-%m-%d %H:%M:%S')
    row[2]=datetime.datetime.strftime(d2,'%Y-%m-%d %H:%M:%S')
    writer.writerow(row)
    #print(row)

fi.close()
fo.close()