# Grazing dairy farm linear programming model: State contingent approach to risk

This repo has a gams linear progamming model that has been extended to consider risk, specifically variable milk prices and water availability. The relevant paper is Neal et al. (2010) (1), available here (https://www.researchgate.net/publication/272418709_Optimal_Choice_of_Dairy_forages_Considering_risk_in_a_state_contingent_approach). It extends the model of Neal et al. (2007)(2) found here (https://github.com/markbneal/dairy_lp_neal_JDS_2007).

## Abstract

To produce milk at a low cost, grazed perennial pasture systems, particularly those including perennial ryegrass (Lolium perenne), are considered appropriate. Alternative annual forage systems with higher production of dry matter per unit area are being considered, although these often incur higher costs of conservation and feeding than grazed pastures, and consequently do not necessarily increase farm profit. The optimal choice of forages can be posed as a linear programming model, but the typical formulation of a linear programming model does not consider risk from different prices for inputs and outputs, and does not consider the risk of varying availability of resources such as rainfall and irrigation water, with both of these forms of risk figuring prominently in Australian dairying. To effectively find an optimal choice with consideration of these forms of risk, a linear programming model was modified to be considered as a state contingent model, with differing states occurring with a certain probability, where each state was characterised by differing prices and water availability. It was found that annual species feature more prominently in the optimal choice under risk than they would in the riskless case, with between 10 and 20% of the farm area switching from perennials to annuals.

## Model description

A state contingent model is one where some decision variables must be chosen before the state of nature is known. For example, in this model, stocking rate and forages must be determined before the it is clear what occurs: in this case milk price and water availability ('season' affects rainfall and price of water). 

Each state is assigned a probability, and the weighted average profitability is maximised, with some decision variables fixed across states, and others allowed to vary by state. The model resembles a discrete stochastic programming model. 

This model takes a long time to solve. The two state contingent versions are without or with the protein model preferred by JDS reviewers respectively: "ADSA Dairy LP State Contingent.gms", "JDS 2011 Dairy LP State Contingent UDP RDP.gms". The use of load point to load a basis is probably recommended.


## References

(1) (2010) Optimal Choice of Dairy forages: Considering risk (in a state contingent approach), 
Proceedings of the 4th Australasian Dairy Science Symposium At: Melbourne
https://www.researchgate.net/publication/272418709_Optimal_Choice_of_Dairy_forages_Considering_risk_in_a_state_contingent_approach

(2) Neal M, Neal J, Fulkerson WJ (2007) Optimal Choice of Dairy Forages in Eastern Australia, Journal of Dairy Science, 90(6), P3044-3059, DOI: https://doi.org/10.3168/jds.2006-645
