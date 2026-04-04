# use lib <. lib>;
use DSL::English::EpidemiologyModelingWorkflows;
use DSL::English::EpidemiologyModelingWorkflows::Grammar;

# Shortcut
my $g = DSL::English::EpidemiologyModelingWorkflows::Grammar;

my @commands =
#        'batch simulate using max time 240',
#        'batch simulate using max time 240 over dfParameters',
#        'batch simulate with TPt in from 100000 to 1000000 step 100000, lpcr = 0 for max time 365',
#        'batch simulate with TPt in min 10^4 max 10^5 step 500, lpcr = 0 for max time 365',
#        'calibrate for target DIP -> tsDeaths',
#        'calibrate for target DIP=tsDeaths',
#        'calibrate over dfParameters for target DIP -> tsDeaths',
#        'calibrate over parameters dfParameters for target DIP -> tsDeaths',
#        'calibrate with aip = seq(20, 40, 10), aincp = seq(6, 18, 6) and lpcr = 0 for the target DIP -> tsDeaths'
#         'calibrate with TPt in from 100000 to 1000000 step 100000',
#         'calibrate with TPt in from 100000 to 1000000 step 100000, lpcr = 0 for target DIP -> tsDeaths',
         'calibrate for the target DIP -> tsDeaths over TPt in from 10^4 to 10^5 step 500',
         'calibrate over TPt in from 10^4 to 10^5 step 500, for the target DIP -> tsDeaths',
         'calibrate with TPt in min 10^4 max 10^5 step 500, lpcr = 0 for the targets DIP -> tsDeaths and ISSP -> tsCases'
        ;
for @commands {
    say '-' x 60;
    say ($_);
    say $g.subparse($_);
}