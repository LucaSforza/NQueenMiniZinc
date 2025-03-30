int: n;

include "globals.mzn";

array[0..n-1] of var 0..n-1: Board;

constraint alldifferent([ Board[j] | j in 0..n-1]);
constraint alldifferent([ Board[j] + j | j in 0..n-1]);
constraint alldifferent([ Board[j] - j | j in 0..n-1]);

solve satisfy;

output [
    if fix(Board[i]) == j then "Q " else ". " endif ++
    if j == n-1 then "\n" else "" endif
    | i, j in 0..n-1
];