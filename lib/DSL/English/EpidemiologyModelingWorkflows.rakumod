=begin pod

=head1 DSL::English::EpidemiologyModelingWorkflows

C<DSL::English::EpidemiologyModelingWorkflows> package has grammar classes and action classes for the parsing and
interpretation of English natural speech commands that specify epidemiology modeling workflows.

=head1 Synopsis

    use DSL::English::EpidemiologyModelingWorkflows;
    my $gcode = ToEpidemiologyModelingWorkflowCode("create with SEI2R; simulate for 240 days; plot results")
    my $wlcode = to_ECMMon_WL("create with SEI2R; simulate for 240 days; plot results");

=end pod

unit module DSL::English::EpidemiologyModelingWorkflows;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::English::EpidemiologyModelingWorkflows::Grammar;
use DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon;
use DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon;
use DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon;

my %targetToAction{Str} =
    "Python"           => DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon,
    "Python-ECMMon"    => DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon,
    "R"                => DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon,
    "R-ECMMon"         => DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon,
    "Mathematica"      => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon,
    "WL"               => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon,
    "WL-ECMMon"        => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon;

my Str %targetToSeparator{Str} =
    "R"                => " %>%\n",
    "R-ECMMon"         => " %>%\n",
    "Mathematica"      => " \\[DoubleLongRightArrow]\n",
    "Python"           => "\n",
    "Python-ECMMon"    => "\n",
    "WL"               => " \\[DoubleLongRightArrow]\n",
    "WL-ECMMon"        => " \\[DoubleLongRightArrow]\n",
    "WL::ECMMon"       => " \\[DoubleLongRightArrow]\n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToEpidemiologyModelingWorkflowCode(Str $command, Str $target = "R-ECMMon", | ) is export {*}

multi ToEpidemiologyModelingWorkflowCode ( Str $command, Str $target = "R-ECMMon", *%args ) {

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => DSL::English::EpidemiologyModelingWorkflows::Grammar,
                                                               :%targetToAction,
                                                               :%targetToSeparator,
                                                               :$target,
                                                               |%args )

}

#-----------------------------------------------------------
proto to_ECMMon_Python($) is export {*}

multi to_ECMMon_Python ( Str $command ) {
    return ToEpidemiologyModelingWorkflowCode( $command, 'Python-ECMMon' );
}

#-----------------------------------------------------------
proto to_ECMMon_R($) is export {*}

multi to_ECMMon_R ( Str $command ) {
    return ToEpidemiologyModelingWorkflowCode( $command, 'R-ECMMon' );
}

#-----------------------------------------------------------
proto to_ECMMon_WL($) is export {*}

multi to_ECMMon_WL ( Str $command ) {
    return ToEpidemiologyModelingWorkflowCode( $command, 'WL-ECMMon' );
}
