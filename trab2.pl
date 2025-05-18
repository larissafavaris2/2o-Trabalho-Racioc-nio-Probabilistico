% Implementação em ProbLog do Problema do Farol de Bicicleta

% Definindo as variáveis e suas probabilidades

% P(Str) - Condição da rua
0.5::str(dry); 0.3::str(wet); 0.2::str(snow_covered).

% P(Flw) - Volante do dínamo desgastado
0.2::flw(true); 0.8::flw(false).

% P(B) - Lâmpada ok
0.9::b(true); 0.1::b(false).

% P(K) - Cabo ok
0.95::k(true); 0.05::k(false).

% P(R|Str,Flw) - Probabilidade do dínamo deslizar
0.3::r(true) :- str(dry), flw(true).
0.1::r(true) :- str(dry), flw(false).
0.7::r(true) :- str(wet), flw(true).
0.4::r(true) :- str(wet), flw(false).
0.9::r(true) :- str(snow_covered), flw(true).
0.8::r(true) :- str(snow_covered), flw(false).
r(false) :- not r(true).

% P(V|R) - Probabilidade do dínamo mostrar tensão
0.95::v(true) :- r(true).
0.2::v(true) :- r(false).
v(false) :- not v(true).

% P(Li|V,B,K) - Probabilidade da luz estar ligada
0.99::li(true) :- v(true), b(true), k(true).
0.01::li(true) :- v(true), b(true), k(false).
0.01::li(true) :- v(true), b(false), k(true).
0.001::li(true) :- v(true), b(false), k(false).
0.3::li(true) :- v(false), b(true), k(true).
0.005::li(true) :- v(false), b(true), k(false).
0.005::li(true) :- v(false), b(false), k(true).
0.0::li(true) :- v(false), b(false), k(false).
li(false) :- not li(true).

% Consulta 1(e): P(Li=true|Str=snow_covered)
evidence(str(snow_covered)).
query(v(true)).
