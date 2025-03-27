int: n;

array[0..n-1] of var 0..n-1: Board;

constraint forall(i,j in 0..n-1 where j < i)(
    Board[i] != Board[j] /\ abs(Board[i] - Board[j]) != (i - j)
);

solve satisfy;

output [
    if fix(Board[i]) == j then "Q " else ". " endif ++
    if j == n-1 then "\n" else "" endif
    | i, j in 0..n-1
];