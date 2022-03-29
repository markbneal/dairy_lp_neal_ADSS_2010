set xl = CreateObject("Excel.Application")
xl.Visible = True
set wb = xl.WorkBooks.Add
dim csvdir
csvdir = "C:\Documents and Settings\Mark\My Documents\gamsdir\"
sub addchart(p,rows,cols,title)
  On Error Resume Next
  wb.worksheets(p).Delete
  wb.worksheets(p&"_data").Delete
  set ws = wb.worksheets.add
  ws.activate
  ws.Name = p & "_data"
  set objtab = ws.querytables.add ("TEXT;"&csvdir&p&".csv", ws.range("a1"))
  objTab.TextFileCommaDelimiter = True
  objTab.Refresh False
  ws.range("a1").resize(rows,cols).NumberFormat = "General"
  set c = wb.charts.add
  c.ChartType = 4
  c.Name = p
  if cols=2 then
    c.HasLegend = false
    c.SetSourceData ws.Range("b1").resize(rows,1),2
    c.SeriesCollection(1).XValues = ws.Range("a1").resize(rows,1)
  else
    c.SetSourceData ws.Range("a1").resize(rows,cols),2
  end if
  c.Location = 1
  c.HasTitle = True
  c.ChartTitle.Text = title
  c.SeriesCollection(1).Border.LineStyle = 1      ' xlContinuous
  c.SeriesCollection(2).Border.LineStyle = -4115  ' xlDash
  c.SeriesCollection(3).Border.LineStyle = -4118  ' xlDot
  c.SeriesCollection(4).Border.LineStyle = 4      ' xlDashDot
  c.SeriesCollection(5).Border.LineStyle = 5      ' xlDashDotDot
  c.SeriesCollection(1).Border.Weight = -4138     ' xlMedium xlThin=2
  c.SeriesCollection(2).Border.Weight = -4138
  c.SeriesCollection(3).Border.Weight = -4138
  c.SeriesCollection(4).Border.Weight = -4138
  c.SeriesCollection(5).Border.Weight = -4138
  c.SeriesCollection(1).MarkerStyle = -4142 ' xlNone
  c.SeriesCollection(2).MarkerStyle = -4142
  c.SeriesCollection(3).MarkerStyle = -4142
  c.SeriesCollection(4).MarkerStyle = -4142
  c.SeriesCollection(5).MarkerStyle = -4142


' Reading xlchart.opt -- Options Specified by User


' Mark's attempt to make graph a pie graph

  c.ChartType = xlLineMarkersStacked



'        Product a graphics file with the graph in either GIF or JPG
'        formats:

  c.export "C:\Documents and Settings\Neal\My Documents\gamsdir\"&p&".gif","GIF"
  c.export "C:\Documents and Settings\Neal\My Documents\gamsdir\"&p&".jpg","JPG"




  c.deselect
end sub
call addchart("SupplUse",13,13,"The optimal Supplement Use")
set ws = wb.worksheets.add
ws.activate
ws.Name = "XLCHART Information"
ws.range("a1") = "XLCHART called from GAMS"
ws.range("a3") = "Called from C:\Documents and Settings\Mark\My Documents\gamsdir\ADSA Dairy LP Report.gms, line 1831"
ws.range("a5") = "Date: 05/22/06"
ws.range("a6") = "Time: 20:54:15"
wb.sheets("SupplUse").activate
xl.UserControl = true
