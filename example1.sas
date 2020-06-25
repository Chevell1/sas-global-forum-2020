cas mySess sessopts=(caslib=casuser locale="en_US");

proc casutil outcaslib="casuser";
 
load data=sashelp.orsales casout="sales;
save casdata="sales" casout="sales.xlsx"; 
list files;
quit;
