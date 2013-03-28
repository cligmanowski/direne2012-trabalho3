

jogada([A1,A2,A3,A4],[B1,B2,B3,B4],[C1,C2,C3,C4],[D1,D2,D3,D4],H) :-

	A1 is 0,
	A2 is 0,
	A3 is 0,
	A4 is 0,
	C1 is A1,
	C2 is A2,
	C3 is A3,
	C4 is A4,
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;


	Z is A1,
	Z is 1,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is A3,
	C4 is A4,
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A1,
	Z is 2,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is A4,
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A1,
	Z is 3,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A1,
	Z is 4,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A1,
	Z is 5,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	D3 is B3,
	D4 is B4;

	Z is A1,
	Z is 6,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	D4 is B4;

	Z is A1,
	Z is 7,
	C1 is 0,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A1,
	Z is 8,
	C1 is 1,
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A1,
	Z is 9,
	C1 is 1,
	((A2 is 0, C2 is 0); (A2 is 1, C2 is 1); (not(A2 is 0), not(A2 is 1),  C2 is A2 + 2)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A1,
	Z is 10,
	C1 is 1,
	((A2 is 0, C2 is 0); (A2 is 1, C2 is 1); (not(A2 is 0), not(A2 is 1),  C2 is A2 + 2)),
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A1,
	Z is 11,
	C1 is 1,
	((A2 is 0, C2 is 0); (A2 is 1, C2 is 1); (not(A2 is 0), not(A2 is 1),  C2 is A2 + 2)),
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A1,
	Z is 12,
	C1 is 1,
	((A2 is 0, C2 is 0); (A2 is 1, C2 is 1); (not(A2 is 0), not(A2 is 1),  C2 is A2 + 2)),
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));





	Z is A2,
	Z is 1,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is A4,
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A2,
	Z is 2,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A2,
	Z is 3,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A2,
	Z is 4,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	D3 is B3,
	D4 is B4;

	Z is A2,
	Z is 5,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	D4 is B4;

	Z is A2,
	Z is 6,
	C1 is A1,
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 7,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 0,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 8,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 1,
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 9,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 1,
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 10,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 1,
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 11,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 1,
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A2,
	Z is 12,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is 1,
	((A3 is 0, C3 is 0); (A3 is 1, C3 is 1); (not(A3 is 0), not(A3 is 1),  C3 is A3 + 2)),
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));





	Z is A3,
	Z is 1,
	C1 is A1,
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	D1 is B1,
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A3,
	Z is 2,
	C1 is A1,
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A3,
	Z is 3,
	C1 is A1,
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	D3 is B3,
	D4 is B4;

	Z is A3,
	Z is 4,
	C1 is A1,
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	D4 is B4;

	Z is A3,
	Z is 5,
	C1 is A1,
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 6,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is A2,
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 7,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 0,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 8,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 1,
	((A4 is 1, C4 is 0); (not(A4 is 1), C4 is A4 + 1)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 9,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 1,
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 10,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 1,
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 11,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 1,
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A3,
	Z is 12,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is 1,
	((A4 is 0, C4 is 0); (A4 is 1, C4 is 1); (not(A4 is 0), not(A4 is 1),  C4 is A4 + 2)),
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 0, D3 is 0); (B3 is 1, D3 is 1); (not(B3 is 0), not(B3 is 1),  D2 is B3 + 2)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));





	Z is A4,
	Z is 1,
	C1 is A1,
	C2 is A2,
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	D2 is B2,
	D3 is B3,
	D4 is B4;

	Z is A4,
	Z is 2,
	C1 is A1,
	C2 is A2,
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	D3 is B3,
	D4 is B4;

	Z is A4,
	Z is 3,
	C1 is A1,
	C2 is A2,
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	D4 is B4;

	Z is A4,
	Z is 4,
	C1 is A1,
	C2 is A2,
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 5,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	C2 is A2,
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 6,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	C3 is A3,
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 7,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 0,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 8,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 1,
	((B1 is 1, D1 is 0); (not(B1 is 1), D1 is B1 + 1)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 9,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 1,
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 1, D2 is 0); (not(B2 is 1), D2 is B2 + 1)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 10,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 1,
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 1, D3 is 0); (not(B3 is 1), D3 is B3 + 1)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 11,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 1,
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 0, D3 is 0); (B3 is 1, D3 is 1); (not(B3 is 0), not(B3 is 1),  D3 is B3 + 2)),
	((B4 is 1, D4 is 0); (not(B4 is 1), D4 is B4 + 1));

	Z is A4,
	Z is 12,
	((A1 is 1, C1 is 0); (not(A1 is 1), C1 is A1 + 1)),
	((A2 is 1, C2 is 0); (not(A2 is 1), C2 is A2 + 1)),
	((A3 is 1, C3 is 0); (not(A3 is 1), C3 is A3 + 1)),
	C4 is 1,
	((B1 is 0, D1 is 0); (B1 is 1, D1 is 1); (not(B1 is 0), not(B1 is 1),  D1 is B1 + 2)),
	((B2 is 0, D2 is 0); (B2 is 1, D2 is 1); (not(B2 is 0), not(B2 is 1),  D2 is B2 + 2)),
	((B3 is 0, D3 is 0); (B3 is 1, D3 is 1); (not(B3 is 0), not(B3 is 1),  D3 is B3 + 2)),
	((B4 is 0, D4 is 0); (B4 is 1, D4 is 1); (not(B4 is 0), not(B4 is 1),  D4 is B4 + 2)).


plausivel([[PA],[CA1,CA2,CA3,CA4],[CB1,CB2,CB3,CB4],[PB]],J,H,[[PAD],[CA5,CA6,CA7,CA8],[CB5,CB6,CB7,CB8],[PBD]]) :-
	(J == a,
	jogada([CA1,CA2,CA3,CA4],[CB1,CB2,CB3,CB4],[CA5,CA6,CA7,CA8],[CB5,CB6,CB7,CB8],H),
	PAD is PA + ((CA1 + CA2 + CA3 + CA4 + CB1 + CB2 + CB3 + CB4) - (CA5 + CA6 + CA7 + CA8 + CB5 + CB6 + CB7 + CB8)),
	PBD is PB,
	!);

	(J == b,
	jogada([CB1,CB2,CB3,CB4],[CA1,CA2,CA3,CA4],[CB5,CB6,CB7,CB8],[CA5,CA6,CA7,CA8],H),
	PBD is PB + ((CA1 + CA2 + CA3 + CA4 + CB1 + CB2 + CB3 + CB4) - (CA5 + CA6 + CA7 + CA8 + CB5 + CB6 + CB7 + CB8)),
	PAD is PA,
	!).









