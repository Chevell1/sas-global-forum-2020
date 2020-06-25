  /* Reference the tagset from support.sas.com. */
filename tpl url 
"http://support.sas.com/rnd/base/ods/odsmarkup/tableeditor/tableeditor.tpl";

/* Insert the tagset into the search path for ODS templates. */
ods path(prepend) work.templat(update);
%include tpl;

options noxsync noxwait;
/* Create sample data to which to add pivot data. */
ods excel file="c:\temp\report.xlsx" options(sheet_name="Sales");

proc print data=sashelp.prdsale;
run; 

ods excel close;

ods tagsets.tableeditor file="c:\temp\PivotTable.js"
options(update_target="c:\\temp\\report.xlsx"
        output_type="script"
        sheet_name="Sales"
        pivot_sheet_name="Profit Analysis"
        pivotrow="month,country" 
        pivotcol="product"
        pivotdata="actual" 
        pivot_slicer="MONTH" /* Has the match case in the source. */
        header_bgcolor="black"
        rowheader_bgcolor="black"
        rowheader_fgcolor="white"
        data_bgcolor="18"
        datalabel_bgcolor="magenta"
        pivotdata_fmt="$#,###.##"
);

data _null_;
file print;
put _all_;
run;
ods tagsets.tableeditor close;
x "c:\temp\PivotTable.js";
