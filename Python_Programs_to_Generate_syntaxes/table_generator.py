#Author : Bimalka Piyaruwan Thalagala
#git : https://github.com/bimalka98
#Date created : 18.06.2020
#Last Modified : 18.06.2020

num_cols = int(input('Number of columns:'))
max_char = []
for column in range(1,num_cols + 1):
    max_char.append(int(input('Maximum characters for column {}: '.format(column))))

print('Generating the table...')

with open('output.txt','w') as out:
    #beginning of a table environment declaration
    out.write('\\begin{table}[!h]\n')
    out.write('\t\\begin{tabular}{' +'l '*num_cols+ '}\n')

    #table CONTENT
    #Columns must be included in the infile as comma seperated format
    #column 1 content , column 2 content , column 3 content, and so on
    with open('input.txt', 'r') as infile:
        for line in infile.readlines():
            row = [phrase.strip() for phrase in line.split(',')]
            #Now we have a list  of items in following format
            # Each comma seperated item represents its corresponding column
            # ['Part 3', '46', 'Contains the actual destination or source address.']
            # Need to breakdown these items in order to fit into its column

    #end of a table environment
    out.write('\t\\end{tabular}\n')
    out.write('\t\\caption{\'Table caption here.\'}\n')
    out.write('\\end{table}')

# Define function to breakdown the item into pieces
def breakList(lst):
    main_lst = []

    for i in range(num_cols):
        sub_lst = []
        if len(lst[i]) <= max_char[i]:



print('Done')
