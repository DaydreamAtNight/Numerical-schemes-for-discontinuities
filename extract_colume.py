import pandas
csvFile = pandas.read_table("slide59.dat", sep="\s+")
print(list(csvFile.iloc[:,0]))