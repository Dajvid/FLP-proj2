/**
 * Rubik's cube solver, FLP logical project.
 * author: David Sedlák <xsedla1d@stud.fit.vutbr.cz>
 * login: xsedla1d
 * year: 2021
 */

:- use_module('RubikIO.pl').
:- use_module('RubikIDS.pl').
:- use_module('RubikBFS.pl').


main :-
    prompt(_, ''),
    parse_cube(Cube),
    solve_IDS(Cube, Path),
    %solve_BFS(Cube, none, Path),
    print_path(Path),
    halt.
