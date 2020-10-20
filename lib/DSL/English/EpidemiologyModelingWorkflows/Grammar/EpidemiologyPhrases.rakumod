use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

# Epidemiology specific phrases
role DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases
        does DSL::Shared::Roles::English::PipelineCommand {
    token word-spec { \w+ }

    # Proto tokens

    # Epidemiology modeling specific
    # (All unique words of stocks and rates of SEI2HREcon.)
    token analysis { 'analysis' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'analysis') }> }
    token average { 'average' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'average') }> }
    token batch-noun { 'batch' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'batch') }> }
    token bed { 'bed' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'bed') }> }
    token beds { 'beds' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'beds') }> }
    token bulk-noun { 'bulk' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'bulk') }> }
    token calibrate-directive { 'calibrate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'calibrate') }> }
    token capacity { 'capacity' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'capacity') }> }
    token change { 'change' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'change') }> }
    token consumption { 'consumption' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consumption') }> }
    token contact { 'contact' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'contact') }> }
    token cost { 'cost' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cost') }> }
    token country { 'country' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'country') }> }
    token day { 'day' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'day') }> }
    token days { 'days' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'days') }> }
    token death { 'death' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'death') }> }
    token deceased { 'deceased' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'deceased') }> }
    token delay { 'delay' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'delay') }> }
    token delivery { 'delivery' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'delivery') }> }
    token demand { 'demand' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'demand') }> }
    token economic { 'economic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'economic') }> }
    token economics { 'economics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'economics') }> }
    token exposed { 'exposed' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'exposed') }> }
    token factor { 'factor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'factor') }> }
    token fraction { 'fraction' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'fraction') }> }
    token hospital { 'hospital' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'hospital') }> }
    token hospitalized { 'hospitalized' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'hospitalized') }> }
    token incubation { 'incubation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'incubation') }> }
    token infected { 'infected' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'infected') }> }
    token infectious { 'infectious' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'infectious') }> }
    token lost { 'lost' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lost') }> }
    token medical { 'medical' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'medical') }> }
    token migrating-adjective { 'migrating' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'migrating') }> }
    token migration-noun { 'migration' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'migration') }> }
    token money { 'money' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'money') }> }
    token normally { 'normally' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'normally') }> }
    token number { 'number' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'number') }> }
    token pattern-noun { 'pattern' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'pattern') }> }
    token patterns-noun { 'patterns' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'patterns') }> }
    token pay { 'pay' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'pay') }> }
    token period { 'period' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'period') }> }
    token person { 'person' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'person') }> }
    token population { 'population' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'population') }> }
    token populations { 'populations' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'populations') }> }
    token produced { 'produced' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'produced') }> }
    token production { 'production' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'production') }> }
    token productivity { 'productivity' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'productivity') }> }
    token range { 'range' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'range') }> }
    token rate { 'rate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'rate') }> }
    token recovered { 'recovered' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recovered') }> }
    token result { 'result' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'result') }> }
    token results { 'results' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'results') }> }
    token sensitivity { 'sensitivity' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sensitivity') }> }
    token services { 'services' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'services') }> }
    token severely { 'severely' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'severely') }> }
    token simulation { 'simulation' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'simulation') }> }
    token solution { 'solution' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'solution') }> }
    token solutions { 'solutions' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'solutions') }> }
    token span { 'span' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'span') }> }
    token spec { 'spec' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'spec') }> }
    token stock-noun { 'stock' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'stock') }> }
    token stocks-noun { 'stocks' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'stocks') }> }
    token store { 'store' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'store') }> }
    token supplies { 'supplies' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'supplies') }> }
    token susceptible { 'susceptible' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'susceptible') }> }
    token symptomatic { 'symptomatic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'symptomatic') }> }
    token target-noun { 'target' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'target') }> }
    token time { 'time' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'time') }> }
    token total { 'total' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'total') }> }
    token transport { 'transport' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'transport') }> }
    token traveling-adjective { 'traveling' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'traveling') }> }
    token un-hospitalized { 'un-hospitalized' }
    token unit { 'unit' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'unit') }> }
    token units { 'units' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'units') }> }

    # Rules
    rule simulation-object-phrase { <simulation> <object-noun> }
    rule time-range-phrase { <time> [ <range> | <span> ] }
    rule traveling-patterns-phrase { <traveling-adjective> [ <pattern-noun> | <patterns-noun> ] }
    rule simulation-results-phrase { <simulation>? <results> | <solution> | <solutions> }
    rule single-site-model-phrase { <single-adjective> <site-noun> <model> }
    rule migrating-stocks-phrase { [ <migrating-adjective> | <migration-noun> ] [ <stocks-noun> | <stock-noun> ]}
    rule scored-stocks-phrase { [ 'scored' | 'weighed' ] 'stocks' | [ 'stock' | 'stocks' ] [ 'weights' | 'scores' ] }
}
