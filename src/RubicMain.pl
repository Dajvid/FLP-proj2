/**
 * Rubic cube solver, FLP logical project.
 * author: David Sedlák <xsedla1d@stud.fit.vutbr.cz>
 * login: xsedla1d
 * year: 2021
 */

:- use_module('RubicIO.pl').
:- use_module('RubicIDS.pl').
:- use_module('RubicBFS.pl').


main :-
    prompt(_, ''),
    parse_cube(Cube),
    solve_IDS(Cube, Path),
    %solve_BFS(Cube, none, Path),
    print_path(Path),
    halt.
