use v6;
use lib 'lib';
use DSL::English::EpidemiologyModelingWorkflows::Grammar;
use Test;

plan 7;

# Shortcut
my $pECMMONCOMMAND = DSL::English::EpidemiologyModelingWorkflows::Grammar::WorkflowCommand;

#-----------------------------------------------------------
# Calibration commands
#-----------------------------------------------------------

ok $pECMMONCOMMAND.parse('calibrate for target DIP -> tsDeaths'),
        'calibrate for target DIP -> tsDeaths';

ok $pECMMONCOMMAND.parse('calibrate over dfParameters for target DIP -> tsDeaths'),
        'calibrate over dfParameters for target DIP -> tsDeaths';

ok $pECMMONCOMMAND.parse('calibrate for target DIP -> tsDeaths over dfParameters'),
        'calibrate for target DIP -> tsDeaths over dfParameters';

ok $pECMMONCOMMAND.parse('calibrate for the target DIP -> tsDeaths with aip in c(10, 40, 60)'),
        'calibrate for the target DIP -> tsDeaths with aip in c(10, 40, 60)';

ok $pECMMONCOMMAND.parse('calibrate with aip = seq(20, 40, 10), aincp = seq(6, 18, 6) and lpcr = 0 for the target DIP -> tsDeaths'),
        'calibrate with aip = seq(20, 40, 10), aincp = seq(6, 18, 6) and lpcr = 0 for the target DIP -> tsDeaths';

ok $pECMMONCOMMAND.parse('calibrate with TPt in from 100000 to 1000000 step 100000, lpcr = 0 for target DIP -> tsDeaths'),
        'calibrate with TPt in from 100000 to 1000000 step 100000, lpcr = 0 for target DIP -> tsDeaths';

ok $pECMMONCOMMAND.parse('calibrate with TPt in min 10^4 max 10^5 step 500, lpcr = 0 for the targets DIP -> tsDeaths and ISSP -> tsCases'),
        'calibrate with TPt in min 10^4 max 10^5 step 500, lpcr = 0 for the targets DIP -> tsDeaths and ISSP -> tsCases';

done-testing;