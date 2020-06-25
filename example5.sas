ods escapechar="^";
ods excel file="filter.xlsx" options(autofilter="all");

proc report data=sashelp.orsales(obs=3);
column Year Product_Line Profit;
run; 

proc report data=sashelp.orsales(obs=3) 
style(header)={posttext="^{nbspace 4}" asis=on};
column Year Product_Line  Profit;
run;

ods excel close;
