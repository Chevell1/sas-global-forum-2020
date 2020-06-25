 
proc sort data=sashelp.orsales out=temp nodupkey;
by product_line;
run;

ods escapechar="^";
ods excel file="c:\temp\contents.xlsx" options(sheet_name="Summary"
                                               embedded_titles="yes");
proc odstext data=temp;
p "=hyperlink("||'"[contents.xlsx]'|| product_line ||'!A1"'||',' || 
quote("Product: "||product_line)||")";
run;

ods excel options(sheet_name="#byval(product_line)");

proc print data=temp;
by product_line;
run;

ods excel close;
