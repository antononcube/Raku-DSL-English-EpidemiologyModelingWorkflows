=begin comment
#==============================================================================
#
#   Epidemiology Modeling workflows grammar in Raku Perl 6
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
#   antononcube @ gmail . com,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku Perl6 see https://raku.org/ (https://perl6.org/) .
#
#==============================================================================
=end comment

use v6;

unit module DSL::English::EpidemiologyModelingWorkflows::Grammar;

use DSL::Shared::Roles::English::CommonParts;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::ErrorHandling;
use DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases;

grammar DSL::English::EpidemiologyModelingWorkflows::Grammar
        does DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases
        does DSL::Shared::Roles::ErrorHandling {
    # TOP
    rule TOP {
        <pipeline-command> |
        <data-load-command> |
        <create-command> |
        <assign-initial-conditions-command> |
        <assign-parameters-command> |
        <simulate-command> |
        <batch-simulate-command> |
        <calibrate-command> |
        <plot-command> |
        <sensitivity-analysis-command> |
        <extend-single-site-model-command> }

    # Scored stocks list
    token score-association-symbol { '=' | '->' | '→' }
    token score-association-separator { <.ws>? <score-association-symbol> <.ws>? }
    regex scored-stock-spec { <stock-spec> <.score-association-separator> <number-value> }
    rule scored-stocks-list { <scored-stock-spec>+ % <list-separator> }

    # Load data
    rule data-load-command { <use-object> }
    rule use-object { [<.use-verb> | <.using-preposition>] <.the-determiner>? [ <.object-noun> | <.simulation-object-phrase> ] <variable-name> }

    # Create command
    rule create-command { <create-by-single-site-model> | <create-simple> }
    rule create-preamble-phrase { <generate-directive> [ <.a-determiner> | <.the-determiner> ]? [ <object-noun> | <simulation-object-phrase> ] }
    rule create-simple { <create-preamble-phrase> <simple-way-phrase>? | <simple> <simulation-object> [ 'creation' | 'making' ] }
    rule create-by-single-site-model { [ <create-preamble-phrase> | <create-directive> ] <.by-preposition> <.the-determiner>? <.model>? <single-site-model-spec> <.model>? }

    # Single-site model spec
    rule single-site-model-spec { <SIR-spec> | <SEIR-spec> | <SEI2R-spec> | <SEI2HR-spec> | <SEI2HREcon-spec> }
    rule SIR-spec { 'SIR' | 'sir' | <susceptible> <infected> <recovered> }
    rule SEIR-spec { 'SEIR' | 'seir' | <susceptible> <exposed> <infected> <recovered> }
    rule SEI2R-spec { 'SEI2R' | 'sei2r' | <susceptible> <exposed> <infected> [ 'two' | '2' ] <recovered> }
    rule SEI2HR-spec { 'SEI2HR' | 'sei2hr' | <susceptible> <exposed> <infected> [ 'two' | '2' ] <hospitalized> <recovered>  }
    rule SEI2HREcon-spec {
        'SEI2HREcon' | 'sei2hrecon' |
        <susceptible> <exposed> <infected> [ 'two' | '2' ] <hospitalized> <recovered> <economics> |
        <economics> <SEI2HR-spec>
  }

    # Stock specification
    rule stock-spec {
        <total-population-spec> | <susceptible-population-spec> |
        <exposed-population-spec> | <infected-normally-symptomatic-population-spec> |
        <infected-severely-symptomatic-population-spec> | <recovered-population-spec> |
        <money-of-lost-productivity-spec> | <hospitalized-population-spec> |
        <deceased-infected-population-spec> | <medical-supplies-spec> |
        <medical-supplies-demand-spec> | <hospital-beds-spec> |
        <money-for-medical-supplies-production-spec> | <money-for-hospital-services-spec> |
        <hospital-medical-supplies-spec> }
    rule total-population-spec { <total> <population> | 'TP[t]' | 'TPt' }
    rule susceptible-population-spec { <susceptible> <population> | 'SP[t]' | 'SPt' }
    rule exposed-population-spec { <exposed> <population> | 'EP[t]' | 'EPt' }
    rule infected-normally-symptomatic-population-spec { <infected>? <normally> <symptomatic> <population> | 'INSP[t]' | 'INSPt' | 'INSP' }
    rule infected-severely-symptomatic-population-spec { <infected>? <severely> <symptomatic> <population> | 'ISSP[t]' | 'ISSPt' | 'ISSP' }
    rule recovered-population-spec { <recovered> <population> | 'RP[t]' | 'RPt' }
    rule money-of-lost-productivity-spec { <money> <of-preposition> <lost> <productivity> | 'MLP[t]' | 'MLPt' }
    rule hospitalized-population-spec { <hospitalized> <population> | 'HP[t]' | 'HPt' }
    rule deceased-infected-population-spec { <deceased> <infected> <population> | 'DIP[t]' | 'DIPt' }
    rule medical-supplies-spec { <medical> <supplies> | 'MS[t]' | 'MSt' }
    rule medical-supplies-demand-spec { <medical> <supplies> <demand> | 'MSD[t]' | 'MSDt' }
    rule hospital-beds-spec { <hospital> <beds> | 'HB[t]' | 'HBt' }
    rule money-for-medical-supplies-production-spec { <money> <for-preposition> <medical> <supplies> <production> | 'MMSP[t]' | 'MMSPt' }
    rule money-for-hospital-services-spec { <money> <for-preposition> <hospital> <services> | 'MHS[t]' | 'MHSt' }
    rule hospital-medical-supplies-spec { <hospital> <medical> <supplies> | 'HMS[t]' | 'HMSt' }

    # Rate specification
    rule rate-spec {
        <population-death-rate-spec> | <infected-normally-symptomatic-population-death-rate-spec> |
        <infected-severely-symptomatic-population-death-rate-spec> |
        <severely-symptomatic-population-fraction-spec> | <contact-rate-for-the-normally-symptomatic-population-spec> |
        <contact-rate-for-the-severely-symptomatic-population-spec> | <average-infectious-period-spec> |
        <average-incubation-period-spec> | <lost-productivity-cost-rate-spec> |
        <hospitalized-population-death-rate-spec> | <contact-rate-for-the-hospitalized-population-spec> |
        <number-of-hospital-beds-rate-spec> | <hospital-services-cost-rate-spec> |
        <number-of-hospital-beds-change-rate-spec> | <hospitalized-population-medical-supplies-consumption-rate-spec> |
        <un-hospitalized-population-medical-supplies-consumption-rate-spec> | <medical-supplies-production-rate-spec> |
        <medical-supplies-production-cost-rate-spec> | <medical-supplies-delivery-rate-spec> |
        <medical-supplies-delivery-period-spec> |
        <medical-supplies-consumption-rate-tp-spec> |
        <medical-supplies-consumption-rate-insp-spec> |
        <medical-supplies-consumption-rate-issp-spec> |
        <medical-supplies-consumption-rate-hp-spec> |
        <capacity-to-store-hospital-medical-supplies-spec> |
        <capacity-to-store-produced-medical-supplies-spec> |
        <capacity-to-transport-produced-medical-supplies-spec> }
    rule population-death-rate-spec { <population> <death> <rate> | 'deathRateTP' | 'μ[TP]' | 'μTP' }
    rule infected-normally-symptomatic-population-death-rate-spec { <infected> <normally> <symptomatic> <population> <death> <rate> | 'deathRateINSP' | 'death' 'rate' ['INSP' | 'insp' ] | 'μ[INSP]' | 'μINSP' }
    rule infected-severely-symptomatic-population-death-rate-spec { <infected> <severely> <symptomatic> <population> <death> <rate> | 'deathRateISSP' | 'μ[ISSP]' | 'μISSP' }
    rule severely-symptomatic-population-fraction-spec { <severely> <symptomatic> <population> <fraction> | 'sspf[SP]' | 'sspfSP' | 'sspf' }
    rule contact-rate-for-the-normally-symptomatic-population-spec { <contact> <rate> [ <for-preposition> | <of-preposition> ]? <the-determiner>? <infected-normally-symptomatic-population-spec> | 'contactRateINSP' | 'β[INSP]' | 'βINSP' }
    rule contact-rate-for-the-severely-symptomatic-population-spec { <contact> <rate> [ <for-preposition> | <of-preposition> ]? <the-determiner>? <infected>? <severely> <symptomatic> <population> | 'contactRateISSP' | 'β[ISSP]' | 'βISSP' }
    rule average-infectious-period-spec { <average> <infectious> <period> | 'aip' }
    rule average-incubation-period-spec { <average> <incubation> <period> | 'aincp' }
    rule lost-productivity-cost-rate-spec { <lost> <productivity> <cost> <rate> | 'lpcr[ISSP,INSP]' | 'lpcrISSP_INSP' | 'lpcr' }
    rule hospitalized-population-death-rate-spec { <hospitalized> <population> <death> <rate> | 'deathRateHP' | 'μ[HP]' | 'μHP' }
    rule contact-rate-for-the-hospitalized-population-spec { <contact> <rate> [ <for-preposition> | <of-preposition> ]? <the-determiner>? <hospitalized> <population> | 'contactRateHP' | 'β[HP]' | 'βHP' }
    rule number-of-hospital-beds-rate-spec { <number> <of-preposition> <hospital> <beds> <rate> | 'nhbr[TP]' | 'nhbrTP' }
    rule hospital-services-cost-rate-spec { <hospital> <services> <cost> <rate> | 'hscr[ISSP,INSP]' | 'hscrISSP_INSP' }
    rule number-of-hospital-beds-change-rate-spec { <number> <of-preposition> <hospital> <beds> <change> <rate> | 'nhbcr[ISSP,INSP]' | 'nhbcrISSP_INSP' }
    rule hospitalized-population-medical-supplies-consumption-rate-spec { <hospitalized> <population> <medical> <supplies> <consumption> <rate> | 'hpmscr[ISSP,INSP]' | 'hpmscrISSP_INSP' }
    rule un-hospitalized-population-medical-supplies-consumption-rate-spec { <un-hospitalized> <population> <medical> <supplies> <consumption> <rate> | 'upmscr[ISSP,INSP]' | 'upmscrISSP_INSP' }
    rule medical-supplies-production-rate-spec { <medical> <supplies> <production> <rate> | 'mspr[HB]' | 'msprHB' }
    rule medical-supplies-production-cost-rate-spec { <medical> <supplies> <production> <cost> <rate> | 'mspcr[HB]' | 'mspcrHB' }
    rule medical-supplies-delivery-rate-spec { <medical> <supplies> <delivery> <rate> | 'msdr[HB]' | 'msdrHB' }
    rule medical-supplies-delivery-period-spec { <medical> <supplies> <delivery> <period> | 'msdp[HB]' | 'msdpHB' }
    rule medical-supplies-consumption-rate-tp-spec { <medical> <supplies> <consumption> <rate> | 'mscr[TP]' | 'mscrTP' }
    rule medical-supplies-consumption-rate-insp-spec { <medical> <supplies> <consumption> <rate> | 'mscr[INSP]' | 'mscrINSP' }
    rule medical-supplies-consumption-rate-issp-spec { <medical> <supplies> <consumption> <rate> | 'mscr[ISSP]' | 'mscrISSP' }
    rule medical-supplies-consumption-rate-hp-spec { <medical> <supplies> <consumption> <rate> | 'mscr[HP]' | 'mscrHP' }
    rule capacity-to-store-hospital-medical-supplies-spec { <capacity> <to-preposition> <store> <hospital> <medical> <supplies> | 'capacityHMS' | 'κ[HMS]' | 'κHMS' }
    rule capacity-to-store-produced-medical-supplies-spec { <capacity> <to-preposition> <store> <produced> <medical> <supplies> | 'capacityMS' | 'κ[MS]' | 'κMS' }
    rule capacity-to-transport-produced-medical-supplies-spec { <capacity> <to-preposition> <transport> <produced> <medical> <supplies> | 'capacityMSD' | 'κ[MSD]' | 'κMSD' }

    # Assign parameters command
    rule assign-parameters-command { <assign-initial-conditions-command> | <assign-rate-values-command> }

    # Assign initial conditions command
    rule assign-initial-conditions-command { <assign-value-to-stock> }
    rule assign-value-to-stock {
        <.assign-directive> <number-value> <.to-preposition> <.the-determiner>? <stock-spec> |
        <.set-directive> <stock-spec> <.to-preposition> <.be-verb>? <number-value> }

    # Assign rate values command
    rule assign-rate-values-command { <assign-value-to-rate> }
    rule assign-value-to-rate {
        <.assign-directive> <number-value> <.to-preposition> <.the-determiner>? <rate-spec> |
        <.set-directive> <rate-spec> <.to-preposition> <.be-verb>? <number-value> }

    # Simulate
    rule simulate-command { <simulate-over-time-range> | <simulate-simple-spec> }
    rule simulate-simple-spec { <.simulate-directive> }
    rule simulate-over-time-range { <.simulate-directive> <time-range-spec-command-part> }

    rule time-range-spec-command-part { [ <.over-preposition> | <.for-preposition> ] <.the-determiner>? <.time-range-phrase>? <time-range-spec> }

    rule time-range-spec { <max-time> | <time-range-simple-spec> | <time-range-element-list> }

    rule time-range-simple-spec { <number-value> [ <day> | <days> ] }

    rule time-range-phrase-ext { <time-range-phrase> | <time> }
    rule time-range-element-list { <time-range-element>+ % <list-separator> }
    rule time-range-element { <time-range-min> | <time-range-max> | <time-range-step> }
    rule time-range-min { [ <.time-range-phrase> <.minimum> | <.minimum> <.of-preposition>? <.the-determiner>? <.time>? ] <number-value> }
    rule time-range-max { [ <.time-range-phrase> <.maximum> | <.maximum> <.of-preposition>? <.the-determiner>? <.time>? ] <number-value> }
    rule time-range-step { [ <.time-range-phrase> <.step-noun> | <.step-noun> <.of-preposition>? <.the-determiner>?  <.time>? ] <number-value> }

    rule max-time { <.maximum> <.time> <number-value> | <.time-range-phrase> <number-value> }

    # Batch simulate
    rule batch-simulate-command { <batch-simulate-over-parameters> }
    rule batch-simulate-preamble { [ <batch-noun> | <bulk-noun> ] <simulate-directive> }
    #    rule batch-simulate-over-parameters {
    #        <.batch-simulate-preamble> <.over-phrase>? <batch-simulation-parameters-spec> [ <.for-phrase>? <time-range-spec> ]? |
    #        <.batch-simulate-preamble> <.for-phrase>? <time-range-spec> <.over-phrase>? <batch-simulation-parameters-spec>
    #    }
    rule batch-simulate-over-parameters { <.batch-simulate-preamble> <.over-phrase>? <batch-simulation-parameters-spec> [ <.for-phrase>? <time-range-spec> ]? }
    rule over-phrase { <over-preposition> | <with-preposition> }
    rule for-phrase { <over-preposition> | <with-preposition> | <for-preposition> }

    # Batch simulation parameters
    rule batch-simulation-parameters-spec { <batch-parameters-data-frame-spec> | <batch-parameter-outer-form-spec> }
    rule batch-parameters-data-frame-spec { <dataset-name> }
    rule batch-parameter-outer-form-spec { <parameter-range-spec-list> }
    rule parameter-range-spec-list { <parameter-range-spec>+ % <list-separator> }
    rule parameter-spec { <stock-spec> | <rate-spec> }
    rule parameter-values { <range-spec> | <r-range-spec> | <wl-range-spec> | <number-value-list> | <r-numeric-list-spec> | <wl-numeric-list-spec> }
    rule parameter-range-spec { <parameter-spec> [ <.running-over-phrase> | <.is-verb>? <.in-preposition> | <.equal-symbol> ]? <parameter-values> }
    rule running-over-phrase { <that-pronoun>? <is-verb>? <run-verb>? <over-preposition> }

    # Sensitivity analysis command
    rule sensitivity-analysis-command { <sensitivity> <analysis> }

    # Calibration command
    rule calibrate-command { <calibration-spec> }
    rule calibrate-preamble { <calibrate-directive> }
    rule calibration-spec { <.calibrate-preamble> <calibration-arguments-list> }
    regex calibration-arguments-list { <calibration-argument>+ % [ <list-separator> | <ws> ]}
    regex calibration-argument { <calibration-target-spec> | <calibration-distance-function-spec> | <calibration-method-spec> | <calibration-stock-weights-spec> | <calibration-parameters-spec> }

    # Calibration target
    rule calibration-target-spec { <.for-phrase> <.the-determiner>? <.target-noun> <target-stock-spec> }
    rule target-stock-spec { <stock-spec> [ <.key-to-symbol> | <.equal-symbol> ] <variable-name> }

    # Calibration parameters
    rule calibration-parameters-spec { <.over-phrase> <.the-determiner>? <.parameters-noun> <parameter-span-spec-list> }
    rule parameter-span-spec-list { <parameter-span-spec>+ % <list-separator> }
    rule parameter-span-spec { <parameter-spec> [ <.running-over-phrase> | <.is-verb>? <.in-preposition> | <.equal-symbol> ]? <parameter-span> }
    rule parameter-span { <span-spec> | <r-span-spec> | <wl-span-spec> | <number-value-list> | <r-numeric-list-spec> | <wl-numeric-list-spec> }

    # Calibration distance function
    rule calibration-distance-function-spec { <.using-preposition>? <.the-determiner>? <.distance-function-phrase> <distance-function-spec> }
    rule distance-function-spec { <wl-expr> }

    # Calibration method
    rule calibration-method-spec { <.using-preposition>? <.the-determiner>? <.method-noun> <minimization-method-spec> }
    rule minimization-method-spec { <wl-expr> }

    # Calibration stock weights
    rule calibration-stock-weights-spec { <.using-preposition>? <.the-determiner>? <.scored-stocks-phrase> <scored-stocks-spec> }
    rule scored-stocks-spec { <scored-stocks-list> }

    # Plot command
    rule plot-command { <plot-solution-histograms> | <plot-solutions> | <plot-population-solutions> }
    rule plot-solutions { <.plot-directive> <.the-determiner>? <.simulation-results-phrase> <time-range-spec-command-part>? }
    rule plot-population-solutions { <.plot-directive> <.the-determiner>? [ <.population> | <.populations> ]  <.simulation-results-phrase> <time-range-spec-command-part>? }
    rule plot-solution-histograms { <.plot-directive> <.the-determiner>? <.simulation-results-phrase> <.histograms> <time-range-spec-command-part>? }

    # Extend single site model
    rule extend-single-site-model-command { <extend-by-matrix> | <extend-by-traveling-patterns-dataframe> | <extend-by-country-spec> }
    rule extend-single-site-model-by-preamble { <.extend-directive> <.the-determiner>? <.single-site-model-phrase>? [ <.by-preposition> | <.with-preposition> ] <.the-determiner>? }
    rule extend-by-matrix {
        <.extend-single-site-model-by-preamble> [ <.adjacency-matrix-phrase> | <.matrix-noun> ]
        <variable-name> <migrating-stocks-subcommand>? }
    rule extend-by-traveling-patterns-dataframe { <.extend-single-site-model-by-preamble> [ <.data-frame> | <.dataset> ] <dataset-name> }
    rule extend-by-country-spec {
      <.extend-single-site-model-by-preamble> <.traveling-patterns-phrase> <.of-preposition> <.the-determiner>? <country-spec> }
    rule country-spec { <.country>? <variable-name> }

    rule migrating-stocks-subcommand { [ <for-preposition> | <over-preposition> ] <.the-determiner>? [ <.migrating-stocks-phrase> | <.stocks-noun> | <.stock-noun> ] <stock-specs-list> }
    rule stock-specs-list { <stock-spec>+ % <.list-separator> }
}
