$Title Solve linear problem

$ontext
Sets
         i rows /row1,row2/
         j cols /col1,col2/ ;

Parameters

         b(i)RHS
         / row1     4
           row2     3/ ;

Table   a(i,j) Values in a matrix
         col1    col2
row1        1       1
row2        2       1 ;

Free Variables x(i)


Display
$offtext

Sets
         i rows /row1,row2/
         j cols /col1,col2/ ;

Parameters

         b(i) RHS
         / row1     4
           row2     3/ ;

Table   a(i,j) Values in a matrix
         col1    col2
row1        1       1
row2        2       1 ;

Free Variables x(j) answer
                 y ;


Equations
         solution(i)        Trying to find sol
         obj                Objective x to y    ;

solution(i) ..    Sum(j,a(i,j)*x(j)) =e= b(i);
obj ..           Sum(i,b(i)*y) =e= 0   ;

model test /all/;

solve test using LP max y

Display y.l;

Display x.l;
