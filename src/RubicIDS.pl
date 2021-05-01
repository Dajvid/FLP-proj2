:- module(rubic_ids, [solve_IDS/2]).
:- use_module('RubicRotations.pl').

counter(1).
counter(X) :- counter(N), X is N + 1.

solve_IDS(Cube, [Cube], _, _) :- solved(Cube).

solve_IDS(Cube, [Cube | Path], DepthCounter, Depth) :- DepthCounter =< Depth,
                                                       rotate(Cube, RotatedCube),
                                                       solve_IDS(RotatedCube,Path, DepthCounter + 1, Depth).

solve_IDS(Cube, Path) :- counter(Depth), solve_IDS(Cube, Path, 0, Depth).
