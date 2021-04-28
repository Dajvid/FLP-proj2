main() :-
    read_lines2(L, 9),
    transform_input(L, Cube),
    rotate_3_right(Cube, RotatedCube),
    writeln(RotatedCube).

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

/* Rotations are taken from look at top side */
% Rotate up first column 
rotate_1_up(
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
        [T1, B2, B3, T4, B5, B6, T7, B8, B9],
        [L3, L6, L9, L2, L5, L8, L1, L4, L7],
        [B1, D2, D3, B4, D5, D6, B7, D8, D9]
    ]
).

% Rotate down first column
rotate_1_down(Cube, RotatedCube) :- rotate_1_up(RotatedCube, Cube).

% Rotate up second column
rotate_2_up(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T1, F2, T3, T4, F5, T6, T7, F8, T9],
        [F1, D2, F3, F4, D5, F6, F7, D8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, T2, B3, B4, T5, B6, B7, T8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, B2, D3, D4, B5, D6, D7, B8, D9]
    ]
).

% Rotate down second column 
rotate_2_down(Cube, RotatedCube) :- rotate_2_up(RotatedCube, Cube).

% Rotate up third column 
rotate_3_up(
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
        [B1, B2, T3, B4, B5, T6, B7, B8, T9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, B3, D4, D5, B6, D7, D8, B9]
    ]
).

% Rotate down third column 
rotate_3_down(Cube, RotatedCube) :- rotate_3_up(RotatedCube, Cube).

% Rotate first second column 
rotate_1_right(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [L1, L2, L3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [T1, T2, T3, R4, R5, R6, R7, R8, R9],
        [B3, B6, B9, B2, B5, B8, B1, B4, B7],
        [D1, D2, D3, L4, L5, L6, L7, L8, L9],
        [R1, R2, R3, D4, D5, D6, D7, D8, D9]
    ]
).

% Rotate left first column 
rotate_1_left(Cube, RotatedCube) :- rotate_1_right(RotatedCube, Cube).

% Rotate right second column 
rotate_2_right(
    [
        [T1, T2, T3, T4, T5, T6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    [
        [T1, T2, T3, L4, L5, L6, T7, T8, T9],
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, T4, T5, T6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, D4, D5, D6, L7, L8, L9],
        [D1, D2, D3, R4, R5, R6, D7, D8, D9]
    ]
).

% Rotate left second column 
rotate_2_left(Cube, RotatedCube) :- rotate_2_right(RotatedCube, Cube).

% Rotate right third column 
rotate_3_right(
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

% Rotate left third column 
rotate_3_left(Cube, RotatedCube) :- rotate_3_right(RotatedCube, Cube).
