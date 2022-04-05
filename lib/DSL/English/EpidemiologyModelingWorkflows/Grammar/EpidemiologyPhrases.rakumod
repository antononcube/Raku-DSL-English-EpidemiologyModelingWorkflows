use v6.d;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

# Epidemiology specific phrases
role DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases
        does DSL::Shared::Roles::English::PipelineCommand {
    token word-spec { \w+ }

    # Epidemiology modeling specific
    # (All unique words of stocks and rates of SEI2HREcon.)

    proto token analysis-noun {*}
    token analysis-noun:sym<English> { :i 'analysis' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'analysis', 2) }> }

    proto token average-adjective {*}
    token average-adjective:sym<English> { :i 'average' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'average', 2) }> }

    proto token batch-noun {*}
    token batch-noun:sym<English> { :i 'batch' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'batch', 2) }> }

    proto token bed-noun {*}
    token bed-noun:sym<English> { :i 'bed' | ([\w]+) <?{ $0.Str ne 'beds' and is-fuzzy-match($0.Str, 'bed', 1) }> }

    proto token beds-noun {*}
    token beds-noun:sym<English> { :i 'beds' | ([\w]+) <?{ $0.Str ne 'bed' and is-fuzzy-match($0.Str, 'beds', 2) }> }

    proto token bulk-noun {*}
    token bulk-noun:sym<English> { :i 'bulk' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'bulk', 2) }> }

    proto token calibrate-directive {*}
    token calibrate-directive:sym<English> { :i 'calibrate' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'calibrate', 2) }> }

    proto token capacity-noun {*}
    token capacity-noun:sym<English> { :i 'capacity' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'capacity', 2) }> }

    proto token change-noun {*}
    token change-noun:sym<English> { :i 'change' | ([\w]+) <?{ $0.Str ne 'range' and is-fuzzy-match($0.Str, 'change', 2) }> }

    proto token consumption-noun {*}
    token consumption-noun:sym<English> { :i 'consumption' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'consumption', 2) }> }

    proto token contact-noun {*}
    token contact-noun:sym<English> { :i 'contact' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'contact', 2) }> }

    proto token cost-noun {*}
    token cost-noun:sym<English> { :i 'cost' | ([\w]+) <?{ $0.Str ne 'lost' and is-fuzzy-match($0.Str, 'cost', 2) }> }

    proto token country-noun {*}
    token country-noun:sym<English> { :i 'country' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'country', 2) }> }

    proto token day-noun {*}
    token day-noun:sym<English> { :i 'day' | ([\w]+) <?{ $0.Str !(elem) <days delay pay> and is-fuzzy-match($0.Str, 'day', 1) }> }

    proto token days-noun {*}
    token days-noun:sym<English> { :i 'days' | ([\w]+) <?{ $0.Str !(elem) <day pay> and is-fuzzy-match($0.Str, 'days', 2) }> }

    proto token death-noun {*}
    token death-noun:sym<English> { :i 'death' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'death', 2) }> }

    proto token deceased-noun {*}
    token deceased-noun:sym<English> { :i 'deceased' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'deceased', 2) }> }

    proto token delay-noun {*}
    token delay-noun:sym<English> { :i 'delay' | ([\w]+) <?{ $0.Str ne 'day' and is-fuzzy-match($0.Str, 'delay', 2) }> }

    proto token delivery-noun {*}
    token delivery-noun:sym<English> { :i 'delivery' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'delivery', 2) }> }

    proto token demand-noun {*}
    token demand-noun:sym<English> { :i 'demand' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'demand', 2) }> }

    proto token economic-noun {*}
    token economic-noun:sym<English> { :i 'economic' | ([\w]+) <?{ $0.Str ne 'economics' and is-fuzzy-match($0.Str, 'economic', 2) }> }

    proto token economics-noun {*}
    token economics-noun:sym<English> { :i 'economics' | ([\w]+) <?{ $0.Str ne 'economic' and is-fuzzy-match($0.Str, 'economics', 2) }> }

    proto token exposed-adjective {*}
    token exposed-adjective:sym<English> { :i 'exposed' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'exposed', 2) }> }

    proto token factor-noun {*}
    token factor-noun:sym<English> { :i 'factor' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'factor', 2) }> }

    proto token fraction-noun {*}
    token fraction-noun:sym<English> { :i 'fraction' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'fraction', 2) }> }

    proto token hospital-noun {*}
    token hospital-noun:sym<English> { :i 'hospital' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'hospital', 2) }> }

    proto token hospitalized-adjective {*}
    token hospitalized-adjective:sym<English> { :i 'hospitalized' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'hospitalized', 2) }> }

    proto token incubation-adjective {*}
    token incubation-adjective:sym<English> { :i 'incubation' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'incubation', 2) }> }

    proto token infected-adjective {*}
    token infected-adjective:sym<English> { :i 'infected' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'infected', 2) }> }

    proto token infectious-adjective {*}
    token infectious-adjective:sym<English> { :i 'infectious' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'infectious', 2) }> }

    proto token lost-adjective {*}
    token lost-adjective:sym<English> { :i 'lost' | ([\w]+) <?{ $0.Str ne 'cost' and is-fuzzy-match($0.Str, 'lost', 2) }> }

    proto token medical-adjective {*}
    token medical-adjective:sym<English> { :i 'medical' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'medical', 2) }> }

    proto token migrating-adjective {*}
    token migrating-adjective:sym<English> { :i 'migrating' | ([\w]+) <?{ $0.Str ne 'migration' and is-fuzzy-match($0.Str, 'migrating', 2) }> }

    proto token migration-noun {*}
    token migration-noun:sym<English> { :i 'migration' | ([\w]+) <?{ $0.Str ne 'migrating' and is-fuzzy-match($0.Str, 'migration', 2) }> }

    proto token money-noun {*}
    token money-noun:sym<English> { :i 'money' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'money', 2) }> }

    proto token normally-adverb {*}
    token normally-adverb:sym<English> { :i 'normally' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'normally', 2) }> }

    proto token number-noun {*}
    token number-noun:sym<English> { :i 'number' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'number', 2) }> }

    proto token pattern-noun {*}
    token pattern-noun:sym<English> { :i 'pattern' | ([\w]+) <?{ $0.Str ne 'patterns' and is-fuzzy-match($0.Str, 'pattern', 2) }> }

    proto token patterns-noun {*}
    token patterns-noun:sym<English> { :i 'patterns' | ([\w]+) <?{ $0.Str ne 'pattern' and is-fuzzy-match($0.Str, 'patterns', 2) }> }

    proto token pay-noun {*}
    token pay-noun:sym<English> { :i 'pay' | ([\w]+) <?{ $0.Str !(elem) <day days span> and is-fuzzy-match($0.Str, 'pay', 1) }> }

    proto token period-noun {*}
    token period-noun:sym<English> { :i 'period' | ([\w]+) <?{ $0.Str ne 'person' and is-fuzzy-match($0.Str, 'period', 2) }> }

    proto token person-noun {*}
    token person-noun:sym<English> { :i 'person' | ([\w]+) <?{ $0.Str ne 'period' and is-fuzzy-match($0.Str, 'person', 2) }> }

    proto token population-noun {*}
    token population-noun:sym<English> { :i 'population' | ([\w]+) <?{ $0.Str ne 'populations' and is-fuzzy-match($0.Str, 'population', 2) }> }

    proto token populations-noun {*}
    token populations-noun:sym<English> { :i 'populations' | ([\w]+) <?{ $0.Str ne 'population' and is-fuzzy-match($0.Str, 'populations', 2) }> }

    proto token produced-noun {*}
    token produced-noun:sym<English> { :i 'produced' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'produced', 2) }> }

    proto token production-noun {*}
    token production-noun:sym<English> { :i 'production' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'production', 2) }> }

    proto token productivity-noun {*}
    token productivity-noun:sym<English> { :i 'productivity' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'productivity', 2) }> }

    proto token range-noun {*}
    token range-noun:sym<English> { :i 'range' | ([\w]+) <?{ $0.Str !(elem) <change rate> and is-fuzzy-match($0.Str, 'range', 2) }> }

    proto token rate-noun {*}
    token rate-noun:sym<English> { :i 'rate' | ([\w]+) <?{ $0.Str ne 'range' and is-fuzzy-match($0.Str, 'rate', 2) }> }

    proto token recovered-adjective {*}
    token recovered-adjective:sym<English> { :i 'recovered' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'recovered', 2) }> }

    proto token result-noun {*}
    token result-noun:sym<English> { :i 'result' | ([\w]+) <?{ $0.Str ne 'results' and is-fuzzy-match($0.Str, 'result', 2) }> }

    proto token results-noun {*}
    token results-noun:sym<English> { :i 'results' | ([\w]+) <?{ $0.Str ne 'result' and is-fuzzy-match($0.Str, 'results', 2) }> }

    proto token score-noun {*}
    token score-noun:sym<English> { :i 'score' | ([\w]+) <?{ $0.Str !(elem) <scores scored store> and is-fuzzy-match($0.Str, 'score', 2) }> }

    proto token scores-noun {*}
    token scores-noun:sym<English> { :i 'scores' | ([\w]+) <?{ $0.Str !(elem) <score scored store> and is-fuzzy-match($0.Str, 'scores', 2) }> }

    proto token scored-adjective {*}
    token scored-adjective:sym<English> { :i 'scored' | ([\w]+) <?{ $0.Str !(elem) <score scores store> and is-fuzzy-match($0.Str, 'scored', 2) }> }

    proto token sensitivity-noun {*}
    token sensitivity-noun:sym<English> { :i 'sensitivity' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'sensitivity', 2) }> }

    proto token services-noun {*}
    token services-noun:sym<English> { :i 'services' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'services', 2) }> }

    proto token severely-noun {*}
    token severely-noun:sym<English> { :i 'severely' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'severely', 2) }> }

    proto token simulation-noun {*}
    token simulation-noun:sym<English> { :i 'simulation' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'simulation', 2) }> }

    proto token solution-noun {*}
    token solution-noun:sym<English> { :i 'solution' | ([\w]+) <?{ $0.Str ne 'solutions' and is-fuzzy-match($0.Str, 'solution', 2) }> }

    proto token solutions-noun {*}
    token solutions-noun:sym<English> { :i 'solutions' | ([\w]+) <?{ $0.Str ne 'solution' and is-fuzzy-match($0.Str, 'solutions', 2) }> }

    proto token span-noun {*}
    token span-noun:sym<English> { :i 'span' | ([\w]+) <?{ $0.Str !(elem) <pay spec> and is-fuzzy-match($0.Str, 'span', 2) }> }

    proto token spec-noun {*}
    token spec-noun:sym<English> { :i 'spec' | ([\w]+) <?{ $0.Str ne 'span' and is-fuzzy-match($0.Str, 'spec', 2) }> }

    proto token stock-noun {*}
    token stock-noun:sym<English> { :i 'stock' | ([\w]+) <?{ $0.Str !(elem) <stocks store> and is-fuzzy-match($0.Str, 'stock', 2) }> }

    proto token stocks-noun {*}
    token stocks-noun:sym<English> { :i 'stocks' | ([\w]+) <?{ $0.Str ne 'stock' and is-fuzzy-match($0.Str, 'stocks', 2) }> }

    proto token store-noun {*}
    token store-noun:sym<English> { :i 'store' | ([\w]+) <?{ $0.Str !(elem) <score scores scored stock> and is-fuzzy-match($0.Str, 'store', 2) }> }

    proto token supplies-noun {*}
    token supplies-noun:sym<English> { :i 'supplies' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'supplies', 2) }> }

    proto token susceptible-adjective {*}
    token susceptible-adjective:sym<English> { :i 'susceptible' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'susceptible', 2) }> }

    proto token symptomatic-adjective {*}
    token symptomatic-adjective:sym<English> { :i 'symptomatic' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'symptomatic', 2) }> }

    proto token target-noun {*}
    token target-noun:sym<English> { :i 'target' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'target', 2) }> }

    proto token time-noun {*}
    token time-noun:sym<English> { :i 'time' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'time', 2) }> }

    proto token total-noun {*}
    token total-noun:sym<English> { :i 'total' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'total', 2) }> }

    proto token transport-noun {*}
    token transport-noun:sym<English> { :i 'transport' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'transport', 2) }> }

    proto token traveling-adjective {*}
    token traveling-adjective:sym<English> { :i 'traveling' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'traveling', 2) }> }

    proto token un-hospitalized-adjective {*}
    token un-hospitalized-adjective:sym<English> { :i 'un-hospitalized' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'un-hospitalized', 2) }> }

    proto token unit-noun {*}
    token unit-noun:sym<English> { :i 'unit' | ([\w]+) <?{ $0.Str ne 'units' and is-fuzzy-match($0.Str, 'unit', 2) }> }

    proto token units-noun {*}
    token units-noun:sym<English> { :i 'units' | ([\w]+) <?{ $0.Str ne 'unit' and is-fuzzy-match($0.Str, 'units', 2) }> }

    proto token weighed-adjective {*}
    token weighed-adjective:sym<English> { :i 'weighed' | ([\w]+) <?{ is-fuzzy-match($0.Str, 'weighed', 2) }> }

    # Rules

    proto rule simulation-object-phrase {*}
    rule simulation-object-phrase:sym<English> {  <simulation-noun> <object-noun>  }

    proto rule time-range-phrase {*}
    rule time-range-phrase:sym<English> {  <time-noun> [ <range-noun> | <span-noun> ]  }

    proto rule traveling-patterns-phrase {*}
    rule traveling-patterns-phrase:sym<English> {  <traveling-adjective> [ <pattern-noun> | <patterns-noun> ]  }

    proto rule simulation-results-phrase {*}
    rule simulation-results-phrase:sym<English> {  <simulation-noun>? <results> | <solution-noun> | <solutions-noun>  }

    proto rule single-site-model-phrase {*}
    rule single-site-model-phrase:sym<English> {  <single-adjective> <site-noun> <model-noun>  }

    proto rule migrating-stocks-phrase {*}
    rule migrating-stocks-phrase:sym<English> {  [ <migrating-adjective> | <migration-noun> ] [ <stocks-noun> | <stock-noun> ] }

    proto rule scored-stocks-phrase {*}
    rule scored-stocks-phrase:sym<English> {  [ <scored-adjective> | <weighed-adjective> ] <stocks-noun> | [ <stock-noun> | <stocks-noun> ] [ <weights-noun> | <scores-noun> ]  }
}

