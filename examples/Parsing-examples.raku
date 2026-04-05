# use lib <. lib>;
use DSL::English::EpidemiologyModelingWorkflows;
use DSL::English::EpidemiologyModelingWorkflows::Grammar;

# Shortcut
my $g = DSL::English::EpidemiologyModelingWorkflows::Grammar;

my @commands =
        'batch simulate using max time 240',
        'batch simulate using max time 240 over dfParameters',
        'calibrate for target DIP -> tsDeaths',
        'calibrate with TPt in from 100000 to 1000000 step 100000, lpcr = 0 for target DIP -> tsDeaths',
        'simulate up to 365 days',
        ;
for @commands {
    say '-' x 60;
    say ($_);
    say $g.parse($_);
}