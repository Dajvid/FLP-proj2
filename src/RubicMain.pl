:- use_module('RubicIO.pl').
:- use_module('RubicIDS.pl').
:- use_module('RubicBFS.pl').

main :-
    prompt(_, ''),
    parse_cube(Cube),
    solve_IDS(Cube, Path),
    %solve_BFS(Cube, none, Path),
    print_path(Path).
