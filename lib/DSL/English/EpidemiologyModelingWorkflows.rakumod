=begin pod

=head1 DSL::English::EpidemiologyModelingWorkflows

C<DSL::English::EpidemiologyModelingWorkflows> package has grammar classes and action classes for the parsing and
interpretation of English natural speech commands that specify epidemiology modeling workflows.

=head1 Synopsis

    use DSL::English::EpidemiologyModelingWorkflows;
    my $rcode = to_ECMMon_R("create with SEI2R; simulate for 240 days; plot results")
    my $wlcode = to_ECMMon_WL("create with SEI2R; simulate for 240 days; plot results");

=end pod

unit module DSL::English::EpidemiologyModelingWorkflows;

use DSL::Shared::Utilities::MetaSpecifications;

use DSL::English::EpidemiologyModelingWorkflows::Grammar;
use DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon;
use DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon;
use DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon;

my %targetToAction =
    "Python"           => DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon,
    "Python-ECMMon"    => DSL::English::EpidemiologyModelingWorkflows::Actions::Python::ECMMon,
    "R"                => DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon,
    "R-ECMMon"         => DSL::English::EpidemiologyModelingWorkflows::Actions::R::ECMMon,
    "Mathematica"      => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon,
    "WL"               => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon,
    "WL-ECMMon"        => DSL::English::EpidemiologyModelingWorkflows::Actions::WL::ECMMon;

my %targetToSeparator{Str} =
    "R"                => " %>%\n",
    "R-ECMMon"         => " %>%\n",
    "Mathematica"      => " ==>\n",
    "Python"           => "\n",
    "Python-ECMMon"    => "\n",
    "WL"               => " ==>\n",
    "WL-ECMMon"        => " ==>\n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToEpidemiologyModelingWorkflowCode(Str $command, Str $target = "R-ECMMon" ) is export {*}

multi ToEpidemiologyModelingWorkflowCode ( Str $command where not has-semicolon($command), Str $target = "R-ECMMon" ) {

    die 'Unknown target.' unless %targetToAction{$target}:exists;

    my $match = DSL::English::EpidemiologyModelingWorkflows::Grammar.parse($command, actions => %targetToAction{$target} );
    die 'Cannot parse the given command.' unless $match;
    return $match.made;
}

multi ToEpidemiologyModelingWorkflowCode ( Str $command where has-semicolon($command), Str $target = 'R-ECMMon' ) {

    my $specTarget = get-dsl-spec( $command, 'target');

    $specTarget = !$specTarget ?? $target !! $specTarget.value;

    die 'Unknown target.' unless %targetToAction{$specTarget}:exists;

    my @commandLines = $command.trim.split(/ ';' \s* /);

    @commandLines = grep { $_.Str.chars > 0 }, @commandLines;

    my @cmdLines = map { ToEpidemiologyModelingWorkflowCode($_, $specTarget) }, @commandLines;

    @cmdLines = grep { $_.^name eq 'Str' }, @cmdLines;

    return @cmdLines.join( %targetToSeparator{$specTarget} ).trim;
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
