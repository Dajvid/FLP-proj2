:- use_module("RubicIO.pl").
:- use_module("RubicRotations.pl").
:- dynamic closed/2, open/2.


/* Determines if cube is correctly solved or not. */
solved(
    [
        [T, T, T, T, T, T, T, T, T],
        [F, F, F, F, F, F, F, F, F],
        [R, R, R, R, R, R, R, R, R],
        [B, B, B, B, B, B, B, B, B],
        [L, L, L, L, L, L, L, L, L],
        [D, D, D, D, D, D, D, D, D]
    ]
).


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


/* Solve rubics cube. */
solve(Cube, Parent, Path) :- solved(Cube),
                             assert(closed(Cube, Parent)),
                             build_path(TmpPath, Cube),
                             reverse(TmpPath, Path).

solve(Cube, Parent, Path) :- assert(closed(Cube, Parent)),
                             findall(RotatedCube, rotate(Cube, RotatedCube), Rotated),
                             save_states(Cube, Rotated),

                             open(NextParent, Next),
                             retract(open(NextParent, Next)),
                             solve(Next, NextParent, Path).


main :-
    parse_cube(Cube),
    solve(Cube, none, Path),
    print_path(Path).
