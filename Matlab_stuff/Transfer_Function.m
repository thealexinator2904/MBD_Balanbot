%Transfer Functions 
s = tf('s');
X_tf = tf([(J+m*(l^2)) 0 (m*l*g)], ... 
    [((M+m)*(J+m*l^2)-((m^2)*(l^2))) (b*(J+m*(l^2))) 
((M+m)*m*l*g) (b*m*l*g) 0])

PHI_tf = tf([(m*l) 0 0],... 
    [(((J+m*(l^2))*(M*m))-((m^2)*(l^2))) ((J+m*(l^2))*b) 
 ((M+m)*m*l*g) (m*l*g*b) 0])

SYSTEM_tf = [X_tf;PHI_tf];

inputs = {'F'}; 
outputs = {'X'; 'PHI'};

set(SYSTEM_tf,'InputName',inputs) 
set(SYSTEM_tf,'OutputName',outputs)

SYSTEM_tf