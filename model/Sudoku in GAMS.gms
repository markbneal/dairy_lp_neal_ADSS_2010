$Title An LP for solving sudoku (Neal, 2006)
* 9*9 sudoku

Set r rows  / r1*r9 /
Set c columns / c1*c9 /
Set v values / a, b, c, d, e, f, g, h, i /

Variables        x(r,c,v)        This is matrix solution
                 Placed          This is the number of values placed

Binary Variable x(r,c,v);
Free Variable Placed;

Equations        objective       how many values are placed
                 row    each of v rows with v values
                 col    each of v columns with v values;
*                 given   given variables;

objective..     sum(r,sum(c,sum(v,x(r,c,v))))   =e=  Placed;
row(r,v)..      sum(c, x(r,c,v))                =e=  1.0;
col(c,v)..      sum(r, x(r,c,v))                =e=  1.0;
*given..         x(1,1,1)                       =e=  1;


 Model sudoku / objective, row, col / ;

 Solve sudoku using mip maximizing Placed;

Display x.l