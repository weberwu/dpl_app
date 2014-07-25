To run this app you should first install the required packages such as 'shiny', 'openNLP'

To envoke this app, you should use following commands:

	library(shiny)
	runApp()

If you meet problems like "error: unable to load shared object ... rJava.dll"
Try to modify environment variable by
	
	Sys.setenv(JAVA_HOME="")

and then rerun the "runApp" command


