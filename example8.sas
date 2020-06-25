ods excel;

proc report data=sashelp.class;
define age /style(column)={tagattr="type:String" pretext="Current age"};
run;

ods excel close;

