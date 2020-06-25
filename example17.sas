 proc fcmp;
   declare object py(python);
     submit into py;
     def MyFunc(arg1,arg2):
       "Output: MyKey" 
       from openpyxl import load_workbook
       from openpyxl.worksheet.table import Table, TableStyleInfo
       wb=load_workbook(filename=arg1) 
       ws=wb.active
       # define a table style
       med=TableStyleInfo(name='TableStyleMedium16',showColumnStripes=True)
       # Create a table
       tab=Table(displayName="Table1",ref="A1:J1441",tableStyleInfo=med)
       # Add the table to the worksheet
       ws.add_table(tab) 
       wb.save(filename=arg2)
     endsubmit;
     rc=py.publish();
     rc=py.call("MyFunc","sales.xlsx","excel_table.xlsx");
 run;
 