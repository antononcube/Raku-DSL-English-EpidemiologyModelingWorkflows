use lib './lib';
use lib '.';
use DSL::English::EpidemiologyModelingWorkflows;
use DSL::English::EpidemiologyModelingWorkflows::Grammar;

#say DSL::English::EpidemiologyModelingWorkflows::Grammar.subparse('calibrate for target DIPt -> tsDeathsUK, with scored stocks DIPt->1 and ISSPt ->3, over TPt in from 100000 to 1000000 step 100000, lpcr = 0 and aincp = c(12, 16, 21)');

say ToEpidemiologyModelingWorkflowCode('
     create with SEI2HR;
     assign 100000 to susceptible population;
     set infected normally symptomatic population to be 0;
     set infected severely symptomatic population to be 1;
     assign 0.56 to contact rate of infected normally symptomatic population;
     assign 0.58 to contact rate of infected severely symptomatic population;
     assign 0.1 to contact rate of the hospitalized population;
     simulate for 240 days;
     plot results;
     calibrate for target DIPt -> tsDeathsUK with scored stocks DIPt->1 and ISSPt ->3 over parameters TPt is in c(120000, 200000), aincp = c(12, 16, 21), aip from 0.4 to 0.8 and distance function `(Norm[#1-#2,Infinity]&)`;
', 'Python-ECMMon' );

#
#say to_ECMMon_Py('
#create object with model SEI2HR;
#extend by the adjacency matrix mat1 for the migrating stocks SPt, EPt, and RPt;
#batch simulate over TPt in from 100000 to 1000000 step 100000, lpcr = 0 and aincp = c(12, 16, 21) for 365 days;
#plot population results;
#plot solution histograms' );

#say to_ECMMon_R('
#create object with model SEI2HR;
#batch simulate over TPt in from 100000 to 1000000 step 100000, lpcr = 0 and aincp = c(12, 16, 21) for 365 days;
#plot population results;
#plot solution histograms' );


#say to_ECMMon_R('
#create object with model SEI2HR;
#simulate for 365 days;
#plot population results;
#plot solution histograms' );

#
#say to_ECMMon_R('
#     create with SEI2HR;
#     assign 100000 to total population;
#     set infected normally symptomatic population to be 1 and infected severely symptomatic population to be 1;
#     assign 0.56 to infected normally symptomatic population contact rate;
#     assign 0.58 to infected severely symptomatic population contact rate;
#     assign 0.1 to hospitalized population contact rate;
#     simulate for 240 days;
#     plot results;
#     show deceased infected population evolution' );
#
#say to_ECMMon_R('
#     create with SEI2HR;
#     assign 100000 to total population;
#     set infected normally symptomatic population to be 1 and severely symptomatic population to be 1;
#     assign 0.56 to normally symptomatic contact rate;
#     assign 0.58 to severely symptomatic contact rate;
#     set hospitalized contact rate to be 0.1;
#     simulate for one year;
#     plot results;
#     show deceased infected population evolution' );
