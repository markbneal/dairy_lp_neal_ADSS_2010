
$eolcom #
***OPTIONS***

Set s Seasons  / Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec /;
Set m MilkMarkets   / Contract, Spot /;
Set g Grain    / WheatGrain, BarleyGrain, OatsGrain, TriticaleGrain, SorghumGrain,
                 MaizeGrain, LupinsGrain, CanolaGrain,
                 LucerneHay, CloverHay, OatenHay, CerealStraw               /;

Set k Possible States / MPriceUpRainUp, MPriceUpRainAvg, MPriceUpRainDown,
                    MPriceAvgRainUp, MPriceAvgRainAvg, MPriceAvgRainDown,
                    MPriceDownRainUp, MPriceDownRainAvg, MPriceDownRainDown /;

Set j State multiplier titles /p, MilkPVar, CullPVar, RainVar, WaterPVar, FeedPVar /;

Table State(k,j)       State multiplier values
$ondelim
$include State.csv                                                              # use for actual
*$include StateFlat.csv                                                         # Use for testing
$offdelim
display State;


Parameter Stateten(k,j) State multiplier values by 10;
Stateten(k,j)=State(k,j)*10;
display Stateten;

*Milk prices and contract volumes
Table MPUni(s,m)       Prices for milk Uniform through year      (Dol per L)
$ondelim
$include MPUni.csv
$offdelim
display MPUni;

Parameter MilkVar(k) State based Milk price multiplier
                 /  MPriceUpRainUp       1.15
                    MPriceUpRainAvg      1.15
                    MPriceUpRainDown     1.15
                    MPriceAvgRainUp      1.00
                    MPriceAvgRainAvg     1.00
                    MPriceAvgRainDown    1.00
                    MPriceDownRainUp     0.90
                    MPriceDownRainAvg    0.90
                    MPriceDownRainDown   0.90  /;

Parameter kMPUni(k,s,m);
kMPUni(k,s,m)=MPUni(s,m)*MilkVar(k);
display kMPUni;

Table CS(s,g)  Cash use for supplement (inc grain) (dol per t)
$ondelim
$include CS.csv
$offdelim
display CS;

Parameter FeedVar(k) State based Feed price multiplier
                 /  MPriceUpRainUp       0.65
                    MPriceUpRainAvg      1.00
                    MPriceUpRainDown     1.35
                    MPriceAvgRainUp      0.65
                    MPriceAvgRainAvg     1.00
                    MPriceAvgRainDown    1.35
                    MPriceDownRainUp     0.65
                    MPriceDownRainAvg    1.00
                    MPriceDownRainDown   1.35  /;

Parameter kCS(k,s,g);
kCS(k,s,g)= CS(s,g)*FeedVar(k);
Display kCS;


Parameter WaterVar(k) State based Temp Water price multiplier
                 /  MPriceUpRainUp       0.50
                    MPriceUpRainAvg      1.00
                    MPriceUpRainDown     2.50
                    MPriceAvgRainUp      0.50
                    MPriceAvgRainAvg     1.00
                    MPriceAvgRainDown    2.50
                    MPriceDownRainUp     0.50
                    MPriceDownRainAvg    1.00
                    MPriceDownRainDown   2.50  /;
**Take out dwater (dynamic water var)


Scalar WaterPumpCost Water cost per ML for pumping ($ per ML)
* 45 water plus 22 pumping electricity gives 67 (if double to 90+22=112
                 /   22    /;
Scalar WaterTempPrice Water cost per ML for temporary purchase ($ per ML)
                 /   100    /;
Scalar WaterPrice Water cost per ML for electricity plus temporary purchase ($ per ML);
* eg 45 water plus 22 pumping electricity gives 67 (if double to 90+22=112
WaterPrice=WaterPumpCost+WaterTempPrice;
display WaterPrice;

Parameter kWaterPrice(k);
kWaterPrice(k)= WaterPrice*WaterVar(k);
Display kWaterPrice;


Scalar CullRevenuePerMilker Cull and calf sales per milker      / 150 /;

Parameter CullVar(k) State based Cull price multiplier
                 /  MPriceUpRainUp       1.50
                    MPriceUpRainAvg      1.20
                    MPriceUpRainDown     0.90
                    MPriceAvgRainUp      1.25
                    MPriceAvgRainAvg     1.00
                    MPriceAvgRainDown    0.75
                    MPriceDownRainUp     1.00
                    MPriceDownRainAvg    0.80
                    MPriceDownRainDown   0.60  /;

Parameter kCullVar(k);
kCullVar(k)= CullRevenuePerMilker*CullVar(k);
Display kCullVar;