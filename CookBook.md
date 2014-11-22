---
title: "CodeBook"
output: html_document
---

<h3>Study:</h3>
Generally speaking I imported all the files into R, used <i>dim</i>, <i>head</i> and sometime <i>table</i> on each and noted this information down. After that it was failry clear how to proceed and transform data. 

<h3>Choices: </h3>
I decided that final result should be kept in one file, I don't see how in this case breaking tidy data into subsets would be beneficial for further processing.
I also decided to remove all strictly unneeded variables from memory so the end result of the script are just two variables (their names are printed on the output scripts) and one file (point 5).
I also chose to not include <i>meanFreq</i> columns.
I also assumed that script is executed in the same catalog as folder `UCI HAR Dataset`.

<h3>Variables:</h3>
In the end there are just two variables:

`DataExtracted` - this is data set that includes all variables for all observations and - of course - information about subject and activity.

`AvgsForDataExtracted` - this is data set that is result of calculating mean of each variable for each subject and activity and - of course - includes subject and activity.

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
