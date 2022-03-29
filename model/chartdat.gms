$title Create an example GDX file for the IDE Charting facility (CHARTDAT,SEQ=313)
*
* Create gdx file for charting demo
* The generated gdx file can be used to follow the charting examples in the GAMSIDE
*
*
* GAMS Development Corporation, Formulation and Language Examples.
*
$stitle data for single lines, bars, pie
set       years / y1998*y2005 /
parameter YearDataA(years), YearDataB(years), YearDataC(years);

YearDataA(years) = uniform(100, 200);
YearDataB(years) = uniform(100,200);
YearDataC(years) = uniform(75, 125);


$stitle data for functions
set       p / p1*p100 /
parameter Points(p,*)
scalar    x / 0.0 /, delta;

delta = 2.0 * Pi / (Card(p) - 1);
Loop(p,
   Points(p, 'x') = Eps + sin(x);
   Points(p, 'y') = Eps + Cos(3*x);
   x = x + delta;
   );


$stitle data vector 3D
set       d         / d1*d20 /
          xyz       / x0, y0, z0, x1, y1, z1 /
          xy(xyz)   / x0, y0, x1, y1 /
          xy1(xy)   / x1, y1 /
          xyz0(xyz) / x0, y0, z0 /
          xy0(xy)   / x0, y0 /
parameter Vector3D(d, xyz), Vector2D(d, xy), Vector2Db(d, xy)
          Scatter3D(d, xyz0), Scatter2D(d, xy0);

vector3D(d, xyz)   = uniform(1, 10);
vector2D(d, xy)    = vector3D(d, xy);
Vector2Db(d, xy)   = Vector2D(d, xy);
Vector2Db(d, xy1)  = uniform(1, 10);
scatter3D(d, xyz0) = vector3D(d, xyz0);
scatter2D(d, xy0)  = vector2D(d, xy0);


$stitle data for gantt graph
set   task     / task1*task3 /
      resource / resource1*resource3 /
      sl       / start, length /
table GanttData(task, resource, sl)
                  start   length
task1.resource1    1        8
task1.resource3   12        2
task2.resource2    2        4
task2.resource3    7        3
task3.resource1    10       1
task3.resource2    8        3
task3.resource3    4        2;


$stitle data for surface graph
set       s / s1*s50 /; alias(s, ss)
parameter Surface(s, ss)
scalar    x,y;

loop((s, ss),
   x = (Ord(s) - 1)/ (Card(s) - 1) * 30 - 15;
   y = (Ord(ss) - 1)/ (Card(ss) - 1) * 30 - 15;
   surface(s, ss) = Sin(sqrt(sqr(x) + sqr(y))) / sqrt(sqr(x) + sqr(y))
   );


$stitle data for multi line graph
set       time0       / t0*t100 /
          time(time0) / t1*t100 /
          stock       / IBM, DELL, HP, SUN /
parameter StockData(time, stock, xy0);

option seed=12345;
StockData(time, stock, 'x0') = jstart - Card(time) + Ord(time);
StockData('t1', stock, 'y0') = 100;
loop(time,
   StockData(time+1, stock, 'y0') = StockData(time, stock, 'y0') + Uniform(-1, 1);
   );


$stitle data for fan graph
set       scenario / scen1*scen1000 /
          timex    / t0*t135 /
parameter ScenarioData(timex, scenario)
scalar scale, x, dx, v;

ScenarioData('t0', scenario) = Abs(1 + Normal(2, 2));
scale = sum(scenario, ScenarioData( 't0', scenario));
ScenarioData('t0', scenario) = ScenarioData('t0', scenario) / scale;
ScenarioData('t1', scenario) = 100;
loop((timex, scenario)$(Ord(timex) > 1),
   x  = ScenarioData(timex, scenario);
   v  = Mod(UniformInt(1, 4), 3);
   dx = 0;
   if( V = 0, dx = 0 );
   if( V = 1, dx = 1$(Ord(timex) > Card(timex) / 2) );
   if( V = 2, dx = -2$(Ord(timex) > Card(timex) / 1.5) );
   dx = dx + Uniform(-2, 2);
   dx$(Abs(x + dx - 100) > 25) = 0;
   ScenarioData(timex+1, scenario) =  x + dx;
   );

* Export the data to a GDX file
execute_unload 'chartdata.gdx',
   YearDataA ,YearDataB, YearDataC,
   Points,
   Vector2D, Vector2dB, Vector3D,
   Scatter2D, Scatter3D,
   GanttData,
   Surface,
   StockData,
   ScenarioData;

* generate a chart file
* open the file in the GAMSIDE to view the chart
file f /testchart.gch/; put f;
$onput
[CHART]
GDXFILE=chartdata.gdx
TITLE=StockData
[SERIES1]
SYMBOL=StockData
TYPE=multi-linex
$offput
