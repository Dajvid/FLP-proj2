:- module(rubic_io, [parse_cube/1, print_path/1]).

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
        read_line(LL,_), [C|LL] = L
    ).

print_line([]).
print_line([Last]) :- writeln(Last).
print_line([H|T]) :- write(H), print_line(T).

print_lines([]).
print_lines([H|T]) :- print_line(H), print_lines(T).

print_cube(Cube) :- transform_input(Output, Cube), print_lines(Output).

print_path([H|[]]) :- print_cube(H).

print_path([H|T]) :- print_cube(H), write("\n"), print_path(T).

transform_input(
    [
        [T1, T2, T3],
        [T4, T5, T6],
        [T7, T8, T9],
        [F1, F2, F3, ' ', R1, R2, R3, ' ', B1, B2, B3, ' ', L1, L2, L3],
        [F4, F5, F6, ' ', R4, R5, R6, ' ', B4, B5, B6, ' ', L4, L5, L6],
        [F7, F8, F9, ' ', R7, R8, R9, ' ', B7, B8, B9, ' ', L7, L8, L9],
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

parse_cube(Cube) :- 
    read_lines2(L, 9),
    transform_input(L, Cube).