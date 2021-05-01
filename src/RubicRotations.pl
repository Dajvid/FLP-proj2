:- module(rubic_rotation, [rotate/2, solved/1]).

/* Clockwise and counter clockwise rotation of each face. */
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


/* Rotate top face clockwise. */
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


/* Rotate front face clockwise. */
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


/* Rotate right face clockwise. */
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


/* Rotate back face counter clockwise. */
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
        [D7, L2, L3, D8, L5, L6, D9, L8, L9],
        [D1, D2, D3, D4, D5, D6, R9, R6, R3]
    ]
).


/* Rotate left face counter clockwise. */
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


/* Rotate down face clockwise. */
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
