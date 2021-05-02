/**
 * Rubik's cube solver, FLP logical project.
 * author: David Sedlák <xsedla1d@stud.fit.vutbr.cz>
 * login: xsedla1d
 * year: 2021
 */

% swipl -q -g main -o scramble -c cubes/RubikScramble.pl
:- use_module('../src/RubikIO.pl').
:- use_module('../src/RubikRotations.pl').


cube(
    [
        ['1', '1', '1', '1', '1', '1', '1', '1', '1'],
        ['2', '2', '2', '2', '2', '2', '2', '2', '2'],
        ['3', '3', '3', '3', '3', '3', '3', '3', '3'],
        ['4', '4', '4', '4', '4', '4', '4', '4', '4'],
        ['5', '5', '5', '5', '5', '5', '5', '5', '5'],
        ['6', '6', '6', '6', '6', '6', '6', '6', '6']
    ]
).


scramble(Cube, Cube, 0).
scramble(Cube, Scrambled, N) :- findall(RotatedCube, rotate(Cube, RotatedCube), RotatedTmp),
                                delete(RotatedTmp, Cube, Rotated),
                                random_member(Move, Rotated),
                                Next is N - 1,
                                scramble(Move, Scrambled, Next).


scramble_multiple(0).
scramble_multiple(N) :- write("=== "), write(N), writeln(" ==="),
                        cube(Cube),
                        scramble(Cube, Scrambled, N),
                        print_cube(Scrambled),
                        Next is N - 1,
                        scramble_multiple(Next).


main:-
    prompt(_, ''),
    scramble_multiple(10),
    halt.