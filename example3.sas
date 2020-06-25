ods escapechar="^";
ods excel file="filter.xlsx" options(sheet_interval="none"
                                     autofilter="1-4"
                                     start_at="3,3");
proc odstext;
p 'Total Sales'  / style={color=red};;
p "=Text(SUBTOTAL(9,G10:G9999),""$#,###.00"")";
p " ";
p 'Average Sales' /  style={color=purple};
p "=Text(SUBTOTAL(1,G10:G9999),""$#,###.00"")";
p " ";
p 'Items Visible' /  style={color=blue}; 
p "=SUBTOTAL(2,G10:G9999)";
run;

proc report data=sashelp.prdsale;
column COUNTRY REGION PRODUCT YEAR ACTUAL PREDICT;
run;

ods excel close;
