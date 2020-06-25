ods excel file="c:\temp\image.xlsx";

data _null_;
  declare odsout obj();
    obj.image(file:"C:\Users\sasctp\pictures\banner_bi.jpg");
run;

proc print data=sashelp.heart(obs=5);
var Sex Height Weight Diastolic Systolic Smoking Cholesterol; 
run;

ods excel close;
