*** Include this file to report on ADSA Dairy LP

set cat This is a category for reporting
/        Category        /;

** Display Results

Display                 vForageArea.l
Display                 vLeaseOut.l
Display                 vDMProduction.l
Display                 vConserved.l
Display                 vSupplPurch.l
Display                 vGrainToCows.l
Display                 vForageToCows.l
Display                 vConsToCows.l
Display                 vNumberCows.l
**Display                 vMilkProd.l
*Display                 vMilkProd.l
Display                 vMilkSold.l
*Display                 vFixedCosts.l
Display                 vHireLab.l
Display                 vCashTransfer.l
*Display                 vOverdraft.l

Parameter rtSupplPurch(k,g) The total of SupplPurch;
rtSupplPurch(k,g) = sum(s, vSupplPurch.l(k,s,g) );
Display rtSupplPurch

Parameter rtConserved(k,f,h) The total of Conserved;
rtConserved(k,f,h) = sum(s, vConserved.l(k,s,f,h) );
Display rtConserved

Parameter rtMilkSold(k,m) The total of MilkSold;
rtMilkSold(k,m) = sum(s, vMilkSold.l(k,s,m) );
Display rtMilkSold



Parameter rMilkSalesRevenue(k) The Revenue of MilkSales;
rMilkSalesRevenue(k) = sum(s, vTRMilkSales.l(k,s) );
Display rMilkSalesRevenue

Parameter rCullSalesRevenue(k) The Revenue of CullSales;
rCullSalesRevenue(k) = sum(s, vTRCullSales.l(k,s) );
Display rCullSalesRevenue

Parameter rLeaseOutRevenue(k) The Revenue of LeaseOut;
rLeaseOutRevenue(k) = sum(s, vTRLEaseOut.l(k,s) );
Display rLeaseOutRevenue

Parameter rForageEstabCost(k) The cost of Forage Establishment;
rForageEstabCost(k) = sum(s, vTCForageEstab.l(k,s) );
Display rForageEstabCost

Parameter rFertPurchCost(k) The cost of FertPurch;
rFertPurchCost(k) = sum(s, vTCFertPurch.l(k,s) );
Display rFertPurchCost

Parameter rWaterPurchCost(k) The cost of WaterPurch;
rWaterPurchCost(k) = sum(s, vTCWaterPurch.l(k,s) );
Display rWaterPurchCost

Parameter rMakingConservedCost(k) The cost of MakingConserved;
rMakingConservedCost(k) = sum(s, vTCMakingConserved.l(k,s) );
Display rMakingConservedCost

Parameter rFeedingConservedCost(k) The cost of FeedingConserved;
rFeedingConservedCost(k) = sum(s, vTCFeedingConserved.l(k,s) );
Display rFeedingConservedCost

Parameter rSupplPurchCost(k) The cost of SupplPurch;
rSupplPurchCost(k) = sum(s, vTCSupplPurch.l(k,s) );
Display rSupplPurchCost

Parameter rCowCostsCost(k) The cost of CowCosts;
rCowCostsCost(k) = sum(s, vTCCowCosts.l(k,s) );
Display rCowCostsCost

Parameter rHiredLabourCost(k) The cost of HiredLabour;
rHiredLabourCost(k) = sum(s, vTCHiredLabour.l(k,s) );
Display rHiredLabourCost

Parameter rFixedCostsCost(k) The cost of FixedCosts;
rFixedCostsCost(k) = sum(s, vTCFixedCosts.l(k,s) );
Display rFixedCostsCost

Parameter Profit The total profit;
Profit = vObjective.l;
Display Profit

Parameter ExpenditureReport(k,*,Cat) This is for a pie chart of costs;
ExpenditureReport(k,'Forage Establishment' ,'Category') = rForageEstabCost(k);
ExpenditureReport(k,'Fertiliser'           ,'Category') = rFertPurchCost(k)  ;
ExpenditureReport(k,'Irrigation'           ,'Category') = rWaterPurchCost(k) ;
ExpenditureReport(k,'Conserving feed'      ,'Category') = rMakingConservedCost(k) ;
ExpenditureReport(k,'Feeding conserved'    ,'Category') = rFeedingConservedCost(k);
ExpenditureReport(k,'Bought Supplements'   ,'Category') = rSupplPurchCost(k) ;
ExpenditureReport(k,'Cow Costs'            ,'Category') = rCowCostsCost(k)   ;
ExpenditureReport(k,'Hired Labour'         ,'Category') = rHiredLabourCost(k);
ExpenditureReport(k,'Fixed Costs'          ,'Category') = rFixedCostsCost(k) ;
ExpenditureReport(k,'Profit'               ,'Category') = Profit ;

Display ExpenditureReport

Display vTCGrowingAndFeeding.l

Parameter TCGAndFPerHa(k,f)   Total cost growing and feeding per ha;
TCGAndFPerHa(k,f) = ( vTCGrowingAndFeeding.l(k,f) / vForageArea.l(k,f)        )$(vForageArea.l(k,f)>0) ;
Display TCGAndFPerHa;

Parameter ForageTonnageGrown(k,f)      Tonnes grown;
ForageTonnageGrown(k,f) = 30 * ( sum(s, vForageArea.l(k,f)*GF(s,f) /1000 )) ;
Display ForageTonnageGrown;

Parameter ForageTonnageEaten(k,f)      Tonnes eaten ie grazed and fed as conserved;
ForageTonnageEaten(k,f) = 30 * ( sum(s, sum(c, sum(h, vConsToCows.l(k,s,c,f,h) ))) + sum(s, sum(c, vForageToCows.l(k,s,c,f) )) ) /1000 ;
Display ForageTonnageEaten;

Parameter TCForagePerTGrown(k,f)   Total effective cost per tonne grown;
TCForagePerTGrown(k,f) = ( vTCGrowingAndFeeding.l(k,f) / ForageTonnageGrown(k,f)     )$(vForageArea.l(k,f)>0) ;
Display TCForagePerTGrown;

Parameter TCForagePerTEaten(k,f)   Total effective cost per tonne eaten;
TCForagePerTEaten(k,f) = ( vTCGrowingAndFeeding.l(k,f) / ForageTonnageEaten(k,f) )$(vForageArea.l(k,f)>0) ;
Display TCForagePerTEaten;

$ontext
***PLOTTING OUTPUT***
* Plot Forage Production
Parameter ForageProd(s,f) The optimal Forage production in tonnes;
ForageProd(s,f)= vForageArea.l(f)*GF(s,f)*30/1000;
$set domain s
$set labels s
$set series f

$libinclude xlchart ForageProd
*$offtext

*$ontext
* Plot Supplement use
Parameter SupplUse(s,g) The optimal Supplement Use;
SupplUse(s,g)=vSupplPurch.l(s,g);
$set domain s
$set labels s
$set series g

$libinclude xlchart SupplUse
*$offtext

*$ontext
* Plot cows calved
Parameter Cows(c) Cows calved in each month;
Cows(c)= vNumberCows.l(c);
$set domain c
$set labels c
*$set series

$libinclude xlchart Cows

* Plot Milk sold
Parameter Milk(s,m) Milk sold to contract and to spot market;
Milk(s,m)= vMilkSold.l(s,m);
$set domain s
$set labels s
$set series m

$libinclude xlchart Milk
*$offtext

* Plot Labour Requirement
Parameter FTES(s) The optimal Full time Equivalent Labour Requirement;
FTES(s)= vHireLab.l(s)/160;
* 48 weeks worked per year per FTE with 40 hour weeks divided by 12 months is 160 hours per FTE per month
$set domain s
$set labels s
*$set series

$libinclude xlchart FTES

$offtext

$ontext
* Plot Cash at end of month
Parameter CashAtEOM(s) The cash BAlance at the End of the Month;
CashAtEOM(s)= vCashTransfer.l(s);
$set domain s
$set labels s
*$set series

$libinclude xlchart CashAtEOM

$offtext

$ontext
***PLOTTING SCATTER XY GRAPHS***

*Illustrate gnupltxy usage

SETS
LINES      Lines in graph /A,B/
POINTS     Points on line /1*10/
ORDINATES  ORDINATES      /X-AXIS,Y-AXIS/  ;

TABLE GRAPHDATA(LINES,POINTS,ORDINATES)
       X-AXIS   Y-AXIS
A.1       1       1
A.2       2       4
A.3       3       9
A.4       5      25
A.5      10     100
B.1       1       2
B.2       3       6
B.3       7      15
B.4      12      36
;
*$LIBINCLUDE GNUPLTXY GRAPHDATA Y-AXIS X-AXIS
$offtext

$ontext
#user model library stuff
Main topic Output
Featured item 1 Graphics
Featured item 2 GNUPLTXY.gms
Featured item 3
Featured item 4
Description
Illustrate GNUPLTXY usage
$offtext