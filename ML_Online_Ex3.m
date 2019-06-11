% Tight Bounds - Exp Strat A,B

n=2;
d=2;

learn_rate_A = sqrt(4*log(d));
learn_rate_B = sqrt(2*log(d));

C_A = n*(learn_rate_A/8) + log(d)/learn_rate_A;
C_B = n*(learn_rate_B/8) + log(d)/learn_rate_B;








