=begin comment
#==============================================================================
#
#   Bulgarian (standard) actions in Raku Perl 6
#   Copyright (C) 2022  Anton Antonov
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
#   ʇǝu˙oǝʇsod@ǝqnɔuouoʇuɐ,
#   Windermere, Florida, USA.
#
#==============================================================================
=end comment

use v6.d;

use DSL::Shared::Actions::Bulgarian::Standard::PipelineCommand;

class DSL::English::EpidemiologyModelingWorkflows::Actions::Bulgarian::Standard
        is DSL::Shared::Actions::Bulgarian::Standard::PipelineCommand {

    # Separator
    method separator() { ";\n" }

    # Top
    method TOP($/) { make $/.values[0].made; }

    # workflow-command-list
    method workflow-commands-list($/) { make $/.values>>.made.join(" ;\n"); }

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
            make 'от ' ~ $<range-spec-from>.made ~ ' до ' ~ $<range-spec-to>.made ~ ' със стъпка ' ~ $<range-spec-step>.made;
        } else {
            make 'от ' ~ $<range-spec-from>.made ~ ' до ' ~ $<range-spec-to>.made;
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
    method create-simple($/) { make 'създай обект (за епидемиологгични симулации)'; }
    method create-by-single-site-model($/) {
        make 'създай обект с модела: ' ~ $<single-site-model-spec>.made;
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
    method population-death-rate-spec($/) { make 'смъртност на популчцията'; }
    method infected-normally-symptomatic-population-death-rate-spec($/) { make 'смъртност на заразените с нормални симптоми'; }
    method infected-severely-symptomatic-population-death-rate-spec($/) { make 'смъртност на заразените с тежки симптоми'; }
    method severely-symptomatic-population-fraction-spec($/) { make 'пропорция на популацията с тежки симптоми'; }
    method contact-rate-for-the-normally-symptomatic-population-spec($/) { make 'честота на контакти на популацията с нормални симптоми'; }
    method contact-rate-for-the-severely-symptomatic-population-spec($/) { make 'честота на контакти на популацията с тежки симптоми'; }
    method average-infectious-period-spec($/) { make 'среден инфекциозен период'; }
    method average-incubation-period-spec($/) { make 'среден инкубационен период'; }
    method lost-productivity-cost-rate-spec($/) { make 'скорост на загуба на продуктивност'; }
    method hospitalized-population-death-rate-spec($/) { make 'смъртност на хоспитализираната популация'; }
    method contact-rate-for-the-hospitalized-population-spec($/) { make 'честота на контакти на хоспитализиранат популация'; }
    method number-of-hospital-beds-rate-spec($/) { make 'брой на болнични легла'; }
    method hospital-services-cost-rate-spec($/) { make 'цена на болничните услуги'; }
    method number-of-hospital-beds-change-rate-spec($/) { make 'изменимост на броя на болничните легла'; }
    method hospitalized-population-medical-supplies-consumption-rate-spec($/) { make  'консумация на медицински средсва от хоспитализираната популация'; }
    method un-hospitalized-population-medical-supplies-consumption-rate-spec($/) { make 'консумация на медицински средсва от не-хоспитализираната популация'; }
    method medical-supplies-production-rate-spec($/) { make  'скорост на продукция на медицински средства'; }
    method medical-supplies-production-cost-rate-spec($/) { make  'скорост на цена на продукция на медицински средства'; }
    method medical-supplies-delivery-rate-spec($/) { make 'скорост на доставка на медицински средства'; }
    method medical-supplies-delivery-period-spec($/) { make  'период на доставка на медицински средства'; }
    method medical-supplies-consumption-rate-tp-spec($/) { make 'скорост на доставка на медицински средства'; }
    method medical-supplies-consumption-rate-insp-spec($/) { make 'скорост на доставка на медицински средства [INSP]'; }
    method medical-supplies-consumption-rate-issp-spec($/) { make 'скорост на доставка на медицински средства [ISSP]'; }
    method medical-supplies-consumption-rate-hp-spec($/) { make 'скорост на доставка на медицински средства [HP]'; }
    method capacity-to-store-hospital-medical-supplies-spec($/) { make 'капацитет за съхранение на медицински средства в болници'; }
    method capacity-to-store-produced-medical-supplies-spec($/) { make 'капацитет за съхранение на произведени медицински средства'; }
    method capacity-to-transport-produced-medical-supplies-spec($/) { make 'капацитет за транспорт на произведени медицински средства'; }

    # Assign parameters command
    method assign-parameters-command($/) { make $/.values[0].made; }

    # Assign initial conditions command
    method assign-initial-conditions-command ($/) { make $/.values[0].made; }
    method assign-value-to-stock($/) { make 'присвои началното условие на ' ~ $<stock-spec>.made ~ ' да е ' ~ $<number-value>.made;}

    # Assign rates command
    method assign-rate-values-command ($/) { make $/.values[0].made; }
    method assign-value-to-rate($/) { make 'присвои на скоростната променлива ' ~ $<rate-spec>.made ~ ' стойността: ' ~ $<number-value>.made;}

    # Simulate
    method simulate-command($/) { make $/.values[0].made; }
    method simulate-simple-spec($/) { make 'симулирай'; }
    method simulate-over-time-range($/) { make 'симулирай за време: ' ~ $<time-range-spec-command-part>.made; }

    # Time range specification
    method time-range-spec-command-part($/) { make $<time-range-spec>.made; }
    method time-range-spec($/) { make $/.values[0].made; }

    method time-range-simple-spec($/) { make '"MaxTime" -> ' ~ $<number-value>.made; }

    method time-range-element-list($/) { make $<time-range-element>>>.made.join(', '); }

    method time-range-element($/) { make $/.values[0].made; }
    method time-range-max($/) { make 'максимално време: ' ~ $<number-value>.made; }
    method time-range-min($/) { make 'минимално време: '  ~ $<number-value>.made; }
    method time-range-step($/) { make 'със стъпка: ' ~ $<number-value>.made; }

    method max-time($/) { make 'максимално време: ' ~ $<number-value>.made; }

    # Batch Simulate
    method batch-simulate-command($/) { make $/.values[0].made; }
    method batch-simulate-over-parameters($/) {
        if $<time-range-spec> {
            make 'партидна симулация с параметри: ' ~ $<batch-simulation-parameters-spec>.made ~ ' за времената: ' ~ $<time-range-spec>.made;
        } else {
            make 'партидна симулация ' ~ $<batch-simulation-parameters-spec>.made;
        }
    }

    method batch-simulation-parameters-spec($/) { make $/.values[0].made; }
    method batch-parameters-data-frame-spec($/) { make 'пардидни параметри: ' ~ $<dataset-name>.made; }
    method batch-parameter-outer-form-spec($/) { make 'пардидни параметри: ' ~ $<parameter-range-spec-list>.made; }
    method parameter-range-spec-list($/) { make '<|' ~ $<parameter-range-spec>>>.made.join(', ') ~ '|>'; }
    method parameter-spec($/) { make $/.values[0].made; }
    method parameter-values($/) { make $/.values[0].made; }
    method parameter-range-spec($/) { make $<parameter-spec>.made ~ ' -> ' ~ $<parameter-values>.made; }

    # Calibrate
    method calibrate-command($/) { make $/.values[0].made; }
    method calibration-spec($/) { make 'калибрирай модела с параметри: ' ~ $<calibration-arguments-list>.made; }

    method calibration-arguments-list($/) { make $<calibration-argument>>>.made.join(', '); }
    method calibration-argument($/) { make $/.values[0].made; }

    method calibration-target-spec($/) { make $<target-stock-spec>.made; }
    method target-stock-spec($/) { make '"Target" -> <|' ~ $<stock-spec>.made ~ ' -> ' ~ $<variable-name>.made ~ '|>' ; }

    method calibration-parameters-spec($/) { make 'калибрационни параметри: ' ~ $<parameter-span-spec-list>.made; }
    method parameter-span-spec-list($/) { make '<|' ~ $<parameter-span-spec>>>.made.join(', ') ~ '|>'; }
    method parameter-span-spec($/) { make $<parameter-spec>.made ~ ' -> ' ~ $<parameter-span>.made; }
    method parameter-span($/) { make $/.values[0].made; }

    method calibration-distance-function-spec($/) { make 'дистанционна функция: ' ~ $/.values[0].made; }
    method distance-function-spec($/) { make $/.values[0].made; }

    method calibration-method-spec($/) { make 'метод: ' ~ $/.values[0].made; }
    method minimization-method-spec($/) { make $/.values[0].made; }

    method calibration-stock-weights-spec($/) { '"StockWeights" ->' ~ make $/.values[0].made; }
    method scored-stocks-spec($/) { make $/.values[0].made; }

    # Plot command
    method plot-command($/) { make $/.values[0].made; }
    method plot-solutions($/) {
        if $<time-range-spec-command-part> {
            make 'начертай решенията за времената ' ~ $<time-range-spec-command-part>.made;
        } else {
            make 'начертай решенията';
        }
    }
    method plot-population-solutions($/) {
        if $<time-range-spec-command-part> {
            make 'начертай решенията на популациите за времената: ' ~ $<time-range-spec-command-part>.made;
        } else {
            make 'начертай решенията на популациите';
        }
    }
    method plot-solution-histograms($/) {
        if $<time-range-spec-command-part> {
            make 'начертай хистограмите на решенията за времената: ' ~ $<time-range-spec-command-part>.made;
        } else {
            make 'начертай хистограмите на решенията';
        }
    }

    # Extend single site model command
    method extend-single-site-model-command($/) { make $/.values[0].made; }

    method extend-by-matrix($/) {
        if $<migrating-stocks-subcommand> {
            make 'разшири с аджунктираната матрица: ' ~ $<variable-name>.made ~ ' за мигриращите популации: ' ~ $<migrating-stocks-subcommand>.made;
        } else {
            make 'разшири с аджунктираната матрица: ' ~ $<variable-name>.made;
        }
    }

    method extend-by-traveling-patterns-dataframe($/) { make 'развири модела с пътната таблицата: ' ~ $<dataset-name>.made; }
    method extend-by-country-spec($/) { make 'разшири модела със страните: ' ~ $<country-spec>.made; }
    method country-spec($/) { make $<variable-name>; }

    method migrating-stocks-subcommand($/) { make $<stock-specs-list>.made; }
    method stock-specs-list($/) { make '{' ~ $<stock-spec>>>.made.join(', ') ~ '}'; }


    ## Setup code
    method setup-code-command($/) {
    make 'SETUPCODE' => q:to/SETUPEND/
    Import["https://raw.githubusercontent.com/antononcube/SystemModeling/master/Projects/Coronavirus-propagation-dynamics/WL/MonadicEpidemiologyCompartmentalModeling.m"];
    SETUPEND
  }
}
