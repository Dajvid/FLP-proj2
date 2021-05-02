/**
 * Rubik's cube solver, FLP logical project.
 * author: David Sedlák <xsedla1d@stud.fit.vutbr.cz>
 * login: xsedla1d
 * year: 2021
 */

:- module(k_ids, [solve_IDS/2]).
:- use_module('RubikRotations.pl').


counter(1).
counter(X) :- counter(N), X is N + 1.


solve_IDS(Cube, [Cube], _, _, _) :- solved(Cube).
solve_IDS(Cube, [Cube | Path], DepthCounter, Depth, Parent) :- DepthCounter =< Depth,
                                                               rotate(Cube, RotatedCube),
                                                               Parent \= RotatedCube,
                                                               solve_IDS(RotatedCube, Path, DepthCounter + 1, Depth, Cube).

solve_IDS(Cube, Path) :- counter(Depth), solve_IDS(Cube, Path, 0, Depth, none).
