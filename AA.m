% Exercise: Aggregating Algorithm (AA)
% First: read readme.m

clear all;
load coin_data;

d = 5;
n = 213;

% compute adversary movez z_t
z_t = -log(r);

% compute strategy p_t (see slides)
L_T = zeros(1,d);
C_T = zeros(1,1);
for t=2:size(z_t,1)
    L_t = sum(z_t(1:t-1,:), 1);
    L_T = [L_T ; L_t];
    C_T = [C_T ; sum(exp(-L_t))];
end
p_t = exp(-L_T) ./ C_T;
p_t(1,:) = 1/d; % first round eq.distr portfolio

% compute loss of strategy p_t - mix loss
l_m  = -log(sum(p_t .* exp(-z_t), 2));

% compute losses of experts
l_e = sum(z_t,1);

% compute regret
R_e  = sum(l_m) - min(l_e);

% compute total gain of investing with strategy p_t
total_gain =sum(p_t(1,:) .* s0, 2)*abs(sum(l_m)) -  sum(p_t(1,:) .* s0, 2); 

%% plot of the strategy p and the coin data

% if you store the strategy in the matrix p (size n * d)
% this piece of code will visualize your strategy

for x=1:1

figure
subplot(1,2,1);
plot(p_t(:,[1,4]))
legend(symbols_str([1,4],:))
title('rebalancing strategy AA')
xlabel('date')
ylabel('confidence p_t in the experts')

subplot(1,2,2);
plot(s(:,[1,4]))
legend(symbols_str([1,4],:))
title('worth of coins')
xlabel('date')
ylabel('USD')

end
% for exercise 4 (m) it is not sufficient to show this plot, please show
% a zoomed in example where the behaviour occurs.


