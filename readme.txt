Write a ruby command line tool that can parse the two sets of data and output any discrepancies.

The data sits in two CSV files, each with three columns:

Account Email, YouTube Channel, Subscriber Count

Assume the account emails are the same between files and reliable.

Your command line tool should take the two files and a third optional concern as arguments.

Example Usage:

data_checker [file1.csv] [file2.csv] [concern]
* concern is optional

Options:

concerns: Optional subscriber_count or channel_ownership

Output a list of account emails with a discrepancy, line delimited
If a concern is provided, only output discrepancies related to that data
If no concern is provided, output all the unique discrepancies

Example Output:

test_1@gmail.com
test_2@gmail.com
test_3@gmail.com
