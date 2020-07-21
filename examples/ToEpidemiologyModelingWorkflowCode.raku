#!/usr/bin/env perl6
use DSL::English::EpidemiologyModelingWorkflows;

sub MAIN( Str $commands ) {
    put ToEpidemiologyModelingWorkflowCode( $commands );
}

