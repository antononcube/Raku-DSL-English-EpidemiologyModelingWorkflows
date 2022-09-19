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
#   ʇǝu˙oǝʇsod@ǝqnɔuouoʇuɐ,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku Perl6 see https://raku.org/ (https://perl6.org/) .
#
#==============================================================================
=end comment

use v6.d;

use DSL::Shared::Roles::ErrorHandling;
use DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases;
use DSL::English::EpidemiologyModelingWorkflows::Grammarish;

grammar DSL::English::EpidemiologyModelingWorkflows::Grammar
        does DSL::English::EpidemiologyModelingWorkflows::Grammarish
        does DSL::English::EpidemiologyModelingWorkflows::Grammar::EpidemiologyPhrases
        does DSL::Shared::Roles::ErrorHandling {

}
