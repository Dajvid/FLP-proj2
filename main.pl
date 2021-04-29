:- dynamic closed/1, open/1.

main() :-
    read_lines2(L, 9),
    transform_input(L, Cube),
    % print_cube(Cube),
    % writeln("======"),

    % rotate_top_cwise(RotatedCube, Cube),
    % print_cube(RotatedCube),
    % writeln("======"),

    % rotate_right_cwise(AgainRotatedCube, RotatedCube),
    % print_cube(AgainRotatedCube).
    solve(Cube).

read_lines2([],0).
read_lines2(Ls,N) :-
	N > 0,
	read_line(L,_),
	N1 is N-1,
	read_lines2(LLs, N1),
	Ls = [L|LLs].

isEOFEOL(C) :-
	C == end_of_file;
	(char_code(C,Code), Code==10).

isWhitespace(C) :-
    (char_code(C,Code), Code==32);
    (char_code(C,Code), Code==9).

read_line(L,C) :-
	get_char(C),
	(
        isEOFEOL(C), L = [], !;
        isWhitespace(C), read_line(LL,_), LL = L;
        read_line(LL,_), [C|LL] = L
    ).

print_cube(Cube) :- writeln(Cube).

is_solved_cube(
    [
        [T, T, T, T, T, T, T, T, T],
        [F, F, F, F, F, F, F, F, F],
        [R, R, R, R, R, R, R, R, R],
        [B, B, B, B, B, B, B, B, B],
        [L, L, L, L, L, L, L, L, L],
        [D, D, D, D, D, D, D, D, D]
    ]
).

transform_input(
    [
        [T1, T2, T3],
        [T4, T5, T6],
        [T7, T8, T9],
        [F1, F2, F3, R1, R2, R3, B1, B2, B3, L1, L2, L3],
        [F4, F5, F6, R4, R5, R6, B4, B5, B6, L4, L5, L6],
        [F7, F8, F9, R7, R8, R9, B7, B8, B9, L7, L8, L9],
        [D1, D2, D3],
        [D4, D5, D6],
        [D7, D8, D9]
    ],
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ]
).


enqueue_states([]).
enqueue_states([Configuration|T]) :- closed(Configuration), enqueue_states(T).
enqueue_states([Configuration|T]) :- assertz(open(Configuration)), enqueue_states(T).


solve(Cube) :- is_solved_cube(Cube), print_cube(Cube).
solve(Cube) :- assert(closed(Cube)), findall(RotatedCube, rotate(Cube, RotatedCube), Rotated), enqueue_states(Rotated), open(Next), retract(open(Next)), solve(Next), print_cube(Next).


rotate(Cube, RotatedCube) :- rotate_top_cwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_front_cwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_right_cwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_back_ccwise(RotatedCube, Cube).
rotate(Cube, RotatedCube) :- rotate_left_ccwise(RotatedCube, Cube).
rotate(Cube, RotatedCube) :- rotate_down_cwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_top_cwise(RotatedCube, Cube).
rotate(Cube, RotatedCube) :- rotate_front_cwise(RotatedCube, Cube).
rotate(Cube, RotatedCube) :- rotate_right_cwise(RotatedCube, Cube).
rotate(Cube, RotatedCube) :- rotate_back_ccwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_left_ccwise(Cube, RotatedCube).
rotate(Cube, RotatedCube) :- rotate_down_cwise(RotatedCube, Cube).

rotate_top_cwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T7, T4, T1, T8, T5, T2, T9, T6, T3],
        [R1, R2, R3, F4, F5, F6, F7, F8, F9],
        [B1, B2, B3, R4, R5, R6, R7, R8, R9],
        [L1, L2, L3, B4, B5, B6, B7, B8, B9],
        [F1, F2, F3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ]
).

% Rotate right third column 
rotate_front_cwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T1, T2, T3, T4, T5, T6, L9, L6, L3],
        [F7, F4, F1, F8, F5, F2, F9, F6, F3],
        [T7, R2, R3, T8, R5, R6, T9, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, D1, L4, L5, D2, L7, L8, D3],
        [R7, R4, R1, D4, D5, D6, D7, D8, D9]
    ]
).

% Rotate right face clockwise
rotate_right_cwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T1, T2, F3, T4, T5, F6, T7, T8, F9],
        [F1, F2, D3, F4, F5, D6, F7, F8, D9],
        [R7, R4, R1, R8, R5, R2, R9, R6, R3],
        [T9, B2, B3, T6, B5, B6, T3, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, B7, D4, D5, B4, D7, D8, B1]
    ]
).

% Rotate back face counter clockwise 
rotate_back_ccwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [L7, L4, L1, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, T1, R4, R5, T2, R7, R8, T3],
        [B3, B6, B9, B2, B5, B8, B1, B4, B7],
        [D9, L2, L3, D8, L5, L6, D7, L8, L9],
        [D1, D2, D3, D4, D5, D6, R9, R6, R3]
    ]
).

% Rotate left face counter clockwise
rotate_left_ccwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [F1, T2, T3, F4, T5, T6, F7, T8, T9],
        [D1, F2, F3, D4, F5, F6, D7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, T7, B4, B5, T4, B7, B8, T1],
        [L3, L6, L9, L2, L5, L8, L1, L4, L7],
        [B9, D2, D3, B6, D5, D6, B3, D8, D9]
    ]
).

rotate_down_cwise(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, L7, L8, L9],
        [R1, R2, R3, R4, R5, R6, F7, F8, F9],
        [B1, B2, B3, B4, B5, B6, R7, R8, R9],
        [L1, L2, L3, L4, L5, L6, B7, B8, B9],
        [D7, D4, D1, D8, D5, D2, D9, D6, D3]
    ]
).
