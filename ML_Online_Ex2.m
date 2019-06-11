% EXER-2 simulate scenarios for regret and p_t, z_t

%1
% given
n=1;
d=2;
min_z=0;
%a=0.5;

l_m = 0;

p_t= rand(1,d); % [a, 1-a] (for a,b);
p_t=p_t/sum(p_t);

p_2= rand(1,d); % [a, 1-a];
p_2=p_2/sum(p_2);

p_t = [p_t ; p_2];

z=[100 100 100 100 ;
   100 100 100 100 ]; % vary z to fit optimal

for t=1:n
    %mix loss calc
    l_m = - log(sum(p_t(1,:) .* exp(-z(1,:))));
    
    min_z = min_z + min(z(1,:));
end

%regret 
R_n = l_m - min_z;

disp('Regret - expert move - adversary')
disp(R_n)
disp(p_t)
