%Declare given:
d = 3;
advers_moves = [0  0.1  0.2 ;
                0  0    0.1 ;
                1  0    0   ;
                0  0.9  0
                ];

strategy = 'A';
            
p_t = [];

% Init Pt -
p_i_t = zeros(1,d) + (1/d);

% total mix loss
l_m = 0;
min_i=0;

% For Strat - B
L_t = zeros(1,d);
C_t = d;

for i=1:4
   
    if strategy == 'A'
        % Strategy - A
        if i ~= 1
            [val, b_t] = min(advers_moves(i-1,:));%min loss for b(t)
            %choose action
            p_i_t = zeros(1,d);
            p_i_t(b_t) = p_i_t(b_t) + 1;
        end
        %min_i =  min_i + (p_i_t *  advers_moves(i,:)');
    else
        % Strategy - B -> AA algo
        %choice of chances 
        p_i_t = exp(-L_t) / C_t; p_i_t = p_i_t/sum(p_i_t);
        C_t = sum(exp(-L_t));
     
        %min_i =  min_i + (advers_moves(i,:));
    end
    min_i =  min_i + (advers_moves(i,:));

    %add t-1 action into action history
    p_t = [p_t;p_i_t];
    
    %mix loss calc
    l_m = l_m + (- log(sum(p_i_t .* exp(-advers_moves(i,:)))));
    
    % cum loss of e till time t
    L_t = L_t + advers_moves(i,:);
    
end

% minimum of adversary loss across t=1...4
min_i = min(min_i);
% Calculate Regret
R_e = l_m - min_i;

%Round off, transpose for table
p_t = round(p_t,2)';

disp('STRATEGY & P_t')
disp(strategy)
disp(p_t)

disp('Total Mix Loss')
disp(l_m)
disp('Regret')
disp(R_e)

% AA upper bound - ques - (d)
min_L = min(min(advers_moves));
upper_bound = log(d) + min_L;
disp('AA upper bound')
disp(upper_bound)


