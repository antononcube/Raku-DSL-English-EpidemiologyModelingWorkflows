=begin comment
#==============================================================================
#
#   ECMMon-WL actions in Raku Perl 6
#   Copyright (C) 2020  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @@@ posteo ... net,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku Perl6 see https://perl6.org/ .
#
#==============================================================================
#
#   The actions are implemented for the grammar:
#
#     DSL::English::EpidemiologyModelingWorkflows::Grammar
#
#   and the software monad ECMMon-WL:
#
#     https://github.com/antononcube/SystemModeling/blob/master/Projects/Coronavirus-propagation-dynamics/WL/MonadicEpidemiologyCompartmentalModeling.m
#
#==============================================================================
#
#   The code below is derived from the code for ECMMon-WL by simple
#   unfolding of the monadic pipeline into assignment.
#
#==============================================================================
=end comment

use v6;

use DSL::English::EpidemiologyModelingWorkflows::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;

class DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    # Separator
    method separator() { " \\[DoubleLongRightArrow]\n" }

    # Top
    method TOP($/) { make $/.values[0].made; }

    # workflow-command-list
    method workflow-commands-list($/) { make $/.values>>.made.join(" \\[DoubleLongRightArrow]\n"); }

    # workflow-command
    method workflow-command($/) { make $/.values[0].made; }

    # General
    method dataset-name($/) { make $/.values[0].made; }
    method variable-name($/) { make $/.Str; }
    method list-separator($/) { make ','; }
    method variable-names-list($/) { make '{' ~ $<variable-name>>>.made.join(', ') ~ '}'; }
    method integer-value($/) { make $/.Str; }
    method number-value($/) { make $/.Str; }
    method number-value-list($/) { make '{' ~ $<number-value>>>.made.join(', ') ~ '}'; }
    method r-range-spec($/) { make 'Range[' ~ $<number-value-list>.made.substr(1,*-1) ~ "]"; }
    method wl-range-spec($/) { make 'Range[' ~ $<number-value-list>.made.substr(1,*-1) ~ "]"; }
    method r-numeric-list-spec($/) { make $<number-value-list>.made; }
    method wl-numeric-list-spec($/) { make $<number-value-list>.made; }
    method span-spec($/)    { make '{' ~ $<from>.made ~ ', ' ~ $<to>.made ~ '}'; }
    method r-span-spec($/)  { make '{' ~ $<from>.made ~ ', ' ~ $<to>.made ~ '}'; }
    method wl-span-spec($/) { make '{' ~ $<from>.made ~ ', ' ~ $<to>.made ~ '}'; }
    method wl-expr($/) { make $/.Str.substr(1,*-1); }

    # Range spec
    method range-spec($/) {
        if $<range-spec-step> {
            make 'Range[' ~ $<range-spec-from>.made ~ ', ' ~ $<range-spec-to>.made ~ ', ' ~ $<range-spec-step>.made ~ ']';
        } else {
            make 'Range[' ~ $<range-spec-from>.made ~ ', ' ~ $<range-spec-to>.made ~ ']';
        }
    }
    method range-spec-from($/) { make $<number-value>.made; }
    method range-spec-to($/) { make $<number-value>.made; }
    method range-spec-step($/) { make $<number-value>.made; }

    # Trivial
    method trivial-parameter($/) { make $/.values[0].made; }
    method trivial-parameter-none($/) { make 'None'; }
    method trivial-parameter-empty($/) { make '{}'; }
    method trivial-parameter-automatic($/) { make 'Automatic'; }
    method trivial-parameter-false($/) { make 'False'; }
    method trivial-parameter-true($/) { make 'True'; }

    # (Scored) item lists
    method scored-stock-spec($/) { make $<stock-spec>.made ~ '->' ~ $<number-value>.made ; }
    method scored-stocks-list($/) { make '<|' ~ $<scored-stock-spec>>>.made.join(', ') ~ '|>'; }

    # Data load commands
    method data-load-command($/) { make $/.values[0].made; }
    method use-object($/) { make $<variable-name>.made; }

    # Creation
    method create-command($/) { make $/.values[0].made; }
    method create-simple($/) { make 'ECMMonUnit[]'; }
    method create-by-single-site-model($/) {
        make 'ECMMonUnit[' ~ $<single-site-model-spec>.made ~ ']';
    }

    # Single site model spec
    method single-site-model-spec($/) { make $/.values[0].made; }
    method SIR-spec($/) { make 'SIRModel[t]'; }
    method SEIR-spec($/) { make 'SEIRModel[t]'; }
    method SEI2R-spec($/) { make 'SEI2RModel[t]'; }
    method SEI2HR-spec($/) { make 'SEI2HRModel[t]'; }
    method SEI2HREcon-spec($/) { make 'SEI2HREconModel[t]'; }

    # Stock specification
    method stock-spec($/) { make $/.values[0].made; }
    method total-population-spec($/) { make 'TP'; }
    method susceptible-population-spec($/) { make 'SP'; }
    method exposed-population-spec($/) { make 'EP'; }
    method infected-normally-symptomatic-population-spec($/) { make 'INSP'; }
    method infected-severely-symptomatic-population-spec($/) { make 'ISSP'; }
    method recovered-population-spec($/) { make 'RP'; }
    method money-of-lost-productivity-spec($/) { make 'MLP'; }
    method hospitalized-population-spec($/) { make 'HP'; }
    method deceased-infected-population-spec($/) { make 'DIP'; }
    method medical-supplies-spec($/) { make 'MS'; }
    method medical-supplies-demand-spec($/) { make 'MSD'; }
    method hospital-beds-spec($/) { make 'HB'; }
    method money-for-medical-supplies-production-spec($/) { make 'MMSP'; }
    method money-for-hospital-services-spec($/) { make 'MHS'; }
    method hospital-medical-supplies-spec($/) { make 'HMS'; }

    # Rate specification
    method rate-spec($/){ make $/.values[0].made; }
    method population-death-rate-spec($/) { make '\[Mu][TP]'; }
    method infected-normally-symptomatic-population-death-rate-spec($/) { make '\[Mu][INSP]'; }
    method infected-severely-symptomatic-population-death-rate-spec($/) { make '\[Mu][ISSP]'; }
    method severely-symptomatic-population-fraction-spec($/) { make 'sspf'; }
    method contact-rate-for-the-normally-symptomatic-population-spec($/) { make '\[Beta][INSP]'; }
    method contact-rate-for-the-severely-symptomatic-population-spec($/) { make '\[Beta][ISSP]'; }
    method average-infectious-period-spec($/) { make 'aip'; }
    method average-incubation-period-spec($/) { make 'aincp'; }
    method lost-productivity-cost-rate-spec($/) { make 'lpcr'; }
    method hospitalized-population-death-rate-spec($/) { make '\[Mu][HP]'; }
    method contact-rate-for-the-hospitalized-population-spec($/) { make '\[Beta][HP]'; }
    method number-of-hospital-beds-rate-spec($/) { make 'nhbr[TP]'; }
    method hospital-services-cost-rate-spec($/) { make 'hscr'; }
    method number-of-hospital-beds-change-rate-spec($/) { make 'nhbcr'; }
    method hospitalized-population-medical-supplies-consumption-rate-spec($/) { make  'hpmscr'; }
    method un-hospitalized-population-medical-supplies-consumption-rate-spec($/) { make 'upmscr'; }
    method medical-supplies-production-rate-spec($/) { make  'msprHB'; }
    method medical-supplies-production-cost-rate-spec($/) { make  'mspcrHB'; }
    method medical-supplies-delivery-rate-spec($/) { make 'msdrHB'; }
    method medical-supplies-delivery-period-spec($/) { make  'msdpHB'; }
    method medical-supplies-consumption-rate-tp-spec($/) { make 'mscrTP'; }
    method medical-supplies-consumption-rate-insp-spec($/) { make 'mscr[INSP]'; }
    method medical-supplies-consumption-rate-issp-spec($/) { make 'mscr[ISSP]'; }
    method medical-supplies-consumption-rate-hp-spec($/) { make 'mscr[HP]'; }
    method capacity-to-store-hospital-medical-supplies-spec($/) { make '\[Kappa][HMS]'; }
    method capacity-to-store-produced-medical-supplies-spec($/) { make '\[Kappa][MS]'; }
    method capacity-to-transport-produced-medical-supplies-spec($/) { make '\[Kappa][MSD]'; }

    # Assign parameters command
    method assign-parameters-command($/) { make $/.values[0].made; }

    # Assign initial conditions command
    method assign-initial-conditions-command ($/) { make $/.values[0].made; }
    method assign-value-to-stock($/) { make 'ECMMonAssignInitialConditions[<|' ~ $<stock-spec>.made ~ '[0] -> ' ~ $<number-value>.made ~ '|>]';}

    # Assign rates command
    method assign-rate-values-command ($/) { make $/.values[0].made; }
    method assign-value-to-rate($/) { make 'ECMMonAssignRateRules[<|' ~ $<rate-spec>.made ~ ' -> ' ~ $<number-value>.made ~ '|>]';}

    # Simulate
    method simulate-command($/) { make $/.values[0].made; }
    method simulate-simple-spec($/) { make 'ECMMonSimulate[]'; }
    method simulate-over-time-range($/) { make 'ECMMonSimulate[' ~ $<time-range-spec-command-part>.made ~ ']'; }

    # Time range specification
    method time-range-spec-command-part($/) { make $<time-range-spec>.made; }
    method time-range-spec($/) { make $/.values[0].made; }

    method time-range-simple-spec($/) { make '"MaxTime" -> ' ~ $<number-value>.made; }

    method time-range-element-list($/) { make $<time-range-element>>>.made.join(', '); }

    method time-range-element($/) { make $/.values[0].made; }
    method time-range-max($/) { make '"MaxTime" -> ' ~ $<number-value>.made; }
    method time-range-min($/) { make '"MinTime" -> '  ~ $<number-value>.made; }
    method time-range-step($/) { make '"Step" -> ' ~ $<number-value>.made; }

    method max-time($/) { make '"MaxTime" -> ' ~ $<number-value>.made; }

    # Batch Simulate
    method batch-simulate-command($/) { make $/.values[0].made; }
    method batch-simulate-over-parameters($/) {
        if $<time-range-spec> {
            make 'ECMMonBatchSimulate[ ' ~ $<batch-simulation-parameters-spec>.made ~ ', ' ~ $<time-range-spec>.made ~ ' ]';
        } else {
            make 'ECMMonBatchSimulate[ ' ~ $<batch-simulation-parameters-spec>.made ~ ' ]';
        }
    }

    method batch-simulation-parameters-spec($/) { make $/.values[0].made; }
    method batch-parameters-data-frame-spec($/) { make '"Parameters" -> ' ~ $<dataset-name>.made; }
    method batch-parameter-outer-form-spec($/) { make '"Parameters" -> ' ~ $<parameter-range-spec-list>.made; }
    method parameter-range-spec-list($/) { make '<|' ~ $<parameter-range-spec>>>.made.join(', ') ~ '|>'; }
    method parameter-spec($/) { make $/.values[0].made; }
    method parameter-values($/) { make $/.values[0].made; }
    method parameter-range-spec($/) { make $<parameter-spec>.made ~ ' -> ' ~ $<parameter-values>.made; }

    # Calibrate
    method calibrate-command($/) { make $/.values[0].made; }
    method calibration-spec($/) { make 'ECMMonCalibrate[ ' ~ $<calibration-arguments-list>.made ~ ' ]'; }

    method calibration-arguments-list($/) { make $<calibration-argument>>>.made.join(', '); }
    method calibration-argument($/) { make $/.values[0].made; }

    method calibration-target-spec($/) { make $<target-stock-spec>.made; }
    method target-stock-spec($/) { make '"Target" -> <|' ~ $<stock-spec>.made ~ ' -> ' ~ $<variable-name>.made ~ '|>' ; }

    method calibration-parameters-spec($/) { make '"Parameters" -> ' ~ $<parameter-span-spec-list>.made; }
    method parameter-span-spec-list($/) { make '<|' ~ $<parameter-span-spec>>>.made.join(', ') ~ '|>'; }
    method parameter-span-spec($/) { make $<parameter-spec>.made ~ ' -> ' ~ $<parameter-span>.made; }
    method parameter-span($/) { make $/.values[0].made; }

    method calibration-distance-function-spec($/) { make 'DistanceFunction ->' ~ $/.values[0].made; }
    method distance-function-spec($/) { make $/.values[0].made; }

    method calibration-method-spec($/) { make 'Method -> ' ~ $/.values[0].made; }
    method minimization-method-spec($/) { make $/.values[0].made; }

    method calibration-stock-weights-spec($/) { '"StockWeights" ->' ~ make $/.values[0].made; }
    method scored-stocks-spec($/) { make $/.values[0].made; }

    # Plot command
    method plot-command($/) { make $/.values[0].made; }
    method plot-solutions($/) {
        if $<time-range-spec-command-part> {
            make 'ECMMonPlotSolutions[' ~ $<time-range-spec-command-part>.made ~ ']';
        } else {
            make 'ECMMonPlotSolutions[]';
        }
    }
    method plot-population-solutions($/) {
        if $<time-range-spec-command-part> {
            make 'ECMMonPlotSolutions[ "Stocks" -> __ ~~ "Population", ' ~ $<time-range-spec-command-part>.made ~ ']';
        } else {
            make 'ECMMonPlotSolutions[ "Stocks" -> __ ~~ "Population"]';
        }
    }
    method plot-solution-histograms($/) {
        if $<time-range-spec-command-part> {
            make 'ECMMonPlotSolutionHistograms[' ~ $<time-range-spec-command-part>.made ~ ']';
        } else {
            make 'ECMMonPlotSolutionHistogramss[]';
        }
    }

    # Extend single site model command
    method extend-single-site-model-command($/) { make $/.values[0].made; }

    method extend-by-matrix($/) {
        if $<migrating-stocks-subcommand> {
            make 'ECMMonExtendByAdjacencyMatrix[ ' ~ $<variable-name>.made ~ ', "MigratingPopulations" -> ' ~ $<migrating-stocks-subcommand>.made ~ ']';
        } else {
            make 'ECMMonExtendByAdjacencyMatrix[ mat = ' ~ $<variable-name>.made ~ ']';
        }
    }

    method extend-by-traveling-patterns-dataframe($/) { make 'ECMMonExtendByDataFrame[' ~ $<dataset-name>.made ~ ']'; }
    method extend-by-country-spec($/) { make 'ECMMonExtendByCountry[' ~ $<country-spec>.made ~ ']'; }
    method country-spec($/) { make $<variable-name>; }

    method migrating-stocks-subcommand($/) { make $<stock-specs-list>.made; }
    method stock-specs-list($/) { make '{' ~ $<stock-spec>>>.made.join(', ') ~ '}'; }


    # Pipeline command overwrites
    ## Object
    method assign-pipeline-object-to($/) { make 'ECMMonAssignTo[ ' ~ $/.values[0].made ~ ' ]'; }

    ## Value
    method assign-pipeline-value-to($/) { make 'ECMMonValueAssignTo[ ' ~ $/.values[0].made ~ ' ]'; }
    method take-pipeline-value($/) { make 'ECMMonTakeValue[]'; }
    method echo-pipeline-value($/) { make 'ECMMonEchoValue[]'; }
    method echo-pipeline-funciton-value($/) { make 'ECMMonEchoFunctionValue[ ' ~ $<pipeline-function-spec>.made ~ ' ]'; }

    ## Context
    method take-pipeline-context($/) { make 'ECMMonTakeContext[]'; }
    method echo-pipeline-context($/) { make 'ECMMonEchoContext[]'; }
    method echo-pipeline-function-context($/) { make 'ECMMonEchoFunctionContext[ ' ~ $<pipeline-function-spec>.made ~ ' ]'; }

    ## Echo messages
    method echo-command($/) { make 'ECMMonEcho[ ' ~ $<echo-message-spec>.made ~ ' ]'; }

    ## Setup code
    method setup-code-command($/) {
    make 'SETUPCODE' => q:to/SETUPEND/
    Import["https://raw.githubusercontent.com/antononcube/SystemModeling/master/Projects/Coronavirus-propagation-dynamics/WL/MonadicEpidemiologyCompartmentalModeling.m"];
    SETUPEND
  }
}
