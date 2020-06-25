ods escapechar="^";
title "Summary of Financials for year 2019";
ods excel file="c:\temp\drill.xlsx" options(sheet_interval="none"
                                            sheet_name="Summary" 
                                            embedded_titles="yes"
                                            start_at="2,2");

ods text='=hyperlink("mailto:joe.doe@sas.com","Hyperlink to Email")';
ods text='=hyperlink("#Beds!a1","Hyperlink to Embedded Worksheet")';
ods text='=hyperlink("c:\[drill.xlsx]#Beds!a1","Hyperlink to External Worksheet")';
ods text='=hyperlink("http://www.sas.com","Hyperlink to URL")';
ods text='=hyperlink("file://c:\temp.pdf","Hyperlink to PDF File")';

title "Summary Worksheet";
proc report data=sashelp.prdsale spanrows 
     style(report)={pretext=" "}; 
column product country actual predict;
define country / group; 
define product / group style(column)={textdecoration=underline color=blue}; 

compute product;
if product="SOFA" then call define(_col_,"url","Sofa");
else if product="CHAIR" then  call define(_col_,"url","#Chair!a1");
else if product="DESK" then call define(_col_,"url","#Desk!a1");
else if product="TABLE" then call define(_col_,"url","#Table!a1");
else if product="BED" then call define(_col_,"url","#bed!a1");
endcomp;
run;


ods excel options(sheet_name="#byval(product)"
                  sheet_interval="bygroup" );

title link="#summary!a1" "Back to summary";
proc report data=sashelp.prdsale;
column product country region actual predict;
 by product;
run;

ods excel close;
