proc fcmp;
  declare object py(python);
    /* Create an embedded Python block to write your Python function */
      submit into py;
      def MyFunc(arg1,arg2):
         "Output: MyKey"
         from openpyxl import load_workbook
         wb=load_workbook(filename=arg1)
         ws=wb.active
         ws.title="Sales"
         ws.sheet_properties.tabColor="FF0000"
   endsubmit;
  /* Publish the code to the Python interpreter */
   rc=py.publish();
  /* Call the Python function from SAS */
   rc=py.call("MyFunc","sales.xlsx","sales_update.xlsx");
run;
  