---
title: "README"
output: html_document
---

<h3>Choices: </h3>
I decided that final result should be kept in one file, I don't see how in this case breaking tidy data into subsets would be beneficial for further processing.
I also decided to remove all strictly unneeded variables from memory so the end result of the script are just two variables (their names are printed on the output scripts) and one file (point 5).
I also chose to not include <i>meanFreq</i> columns.
I also assumed that script is executed in the same catalog as folder `UCI HAR Dataset`.

<h3>Processing:</h3>
I load unviersal files, the proceed similarly with each group (test and train) of files: I load main data, then I extend each data.frame with information about subject and activity (activity is labeled).
After that I bind both subsets into complete set of data.

In order to proceed to point 5 I use regular expressions to identify column names that covers either <i>mean</i> or standard deviation (<i>std</i>). 

Then I use `aggregate` function to calculate average of each variable identified earlier for each combination of <i>subject</i> and <i>activity</i> and save it to separate variable.
