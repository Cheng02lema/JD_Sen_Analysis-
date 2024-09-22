file1 = './data/jd_comment_1.csv'
file2 = './data/jd_comment_3.csv'
output_file = './data/merged_file.csv'

with open(file1, 'r') as f1:
    with open(file2, 'r') as f2:
        with open(output_file, 'w') as out_f:
            for line in f1:
                out_f.write(line)
            for line in f2:
                out_f.write(line)
