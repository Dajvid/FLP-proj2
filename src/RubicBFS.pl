:- module(rubic_bfs, [solve_BFS/3]).
:- use_module('RubicRotations.pl').
:- dynamic closed/2, open/2.


/* Save new states into database.*/
save_states(_, []).
save_states(Parent, [Configuration|T]) :- closed(Configuration, _), save_states(Parent, T).
save_states(Parent, [Configuration|T]) :- open(Configuration, _), save_states(Parent, T).
save_states(Parent, [Configuration|T]) :- assertz(open(Parent, Configuration)), save_states(Parent, T).


/* Build shortest path from initial state to solved state from closed. */
build_path([CurrentChild], CurrentChild) :- solved(CurrentChild), closed(CurrentChild, none).
build_path([CurrentChild, Parent | Path], CurrentChild) :- solved(CurrentChild), closed(CurrentChild, Parent), build_path(Path, Parent).
build_path([], CurrentChild) :- closed(CurrentChild, none).
build_path([Parent | Path], CurrentChild) :- closed(CurrentChild, Parent), build_path(Path, Parent).

/* Solve rubics cube using BFS. */
solve_BFS(Cube, Parent, Path) :- solved(Cube),
                                 assert(closed(Cube, Parent)),
                                 build_path(TmpPath, Cube),
                                 reverse(TmpPath, Path).

solve_BFS(Cube, Parent, Path) :- assert(closed(Cube, Parent)),
                                 findall(RotatedCube, rotate(Cube, RotatedCube), Rotated),
                                 save_states(Cube, Rotated),
                                 open(NextParent, Next),
                                 retract(open(NextParent, Next)),
                                 solve_BFS(Next, NextParent, Path).

