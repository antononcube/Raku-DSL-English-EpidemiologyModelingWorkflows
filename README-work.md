# Epidemiology Modeling Workflows

## In brief

This Raku package has grammar classes and action classes for the parsing and
interpretation of natural language commands that specify epidemiological modeling workflows.

It is envisioned that the interpreters (actions) are going to target different
programming languages: R, WL, Python, etc.

In the first version(s) the workflows targeted are
Epidemiology Compartmental Modeling workflows, \[AAr1, AAr2\].

-----

## Installation

From [Zef Ecosystem](https://raku.land):

```
zef install DSL::English::EpidemiologyModelingWorkflows
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-English-EpidemiologyModelingWorkflows.git
```

-----

## Examples

Here an epidemiology model simulation workflow is specified and translated to R code with the package `ECMMon-R`, \[AAr2\] :

```raku
use DSL::English::EpidemiologyModelingWorkflows;

say ToEpidemiologyModelingWorkflowCode('
     create with SEI2HR;
     assign 100000 to total population;
     set infected normally symptomatic population to be 0;
     set infected severely symptomatic population to be 1;
     assign 0.56 to contact rate of infected normally symptomatic population;
     assign 0.58 to contact rate of infected severely symptomatic population;
     assign 0.1 to contact rate of the hospitalized population;
     simulate for 240 days;
     plot results;
', 'R-ECMMon');
```

-----

## Versions

The original version of this Raku package was developed/hosted at 
\[ [AA3](https://github.com/antononcube/ConversationalAgents/tree/master/Packages/Perl6/EpidemiologyModelingWorkflows) \].

A dedicated GitHub repository was made in order to make the installation with Raku's `zef` more direct. 
(As shown above.)

-----

## References 

\[AAr1\] Anton Antonov, 
[Coronavirus-propagation-dynamics](https://github.com/antononcube/SystemModeling/tree/master/Projects/Coronavirus-propagation-dynamics), 
(2020),
[SystemModeling at GitHub](https://github.com/antononcube/SystemModeling).
 
\[AAr2\] Anton Antonov, 
[Epidemiology Compartmental Modeling Monad in R](https://github.com/antononcube/ECMMon-R), 
(2020),
[ECMMon-R at GitHub](https://github.com/antononcube/ECMMon-R). 

\[AA3\] Anton Antonov, 
[Epidemiology Modeling Workflows Raku Package](https://github.com/antononcube/ConversationalAgents/tree/master/Packages/Perl6/EpidemiologyModelingWorkflows), 
(2020),
[ConversationalAgents at GitHub](https://github.com/antononcube/ConversationalAgents).
 