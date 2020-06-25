 proc export data=sashelp.orsales outfile="c:\temp\table.xlsx" 
dbms=xlsx replace;
run;

