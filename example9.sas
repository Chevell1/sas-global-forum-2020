data one;
  length Var1 $75;
  set sashelp.orsales;
  Var1="This is a long value that is used to demonstrate how values display";
run;

ods excel file="c:\temp\wrap.xlsx" options(flow="tables" sheet_name="test"  
                                           absolute_column_width="4.1in,5,7,15,18"); 
proc print data=one noobs;
var Var1 Year Quarter Product_Line Product_Group;
run;

ods excel close;
