%Transfer Functions 
s = tf('s');
Pos_tf = (s^2*(J+m*l^2) - m*g*l) / (s^4*((M+m)*(J+m*l^2) - m^2 * l^2) + ...
s^3*((J*b+m*l^2)*b) - s^2*(m*g*l*(M+m)) - s*(m*g*l*b));
Ang_tf = -(s^2*m*l) / (s^4*((J+m*l^2)*(M+m)-m^2*l^2) + s^3*(b*(J+m*l^2)) - ...
s^2*(m*g*l*(M+m)) - s*(b*m*g*l));

sys_tf = [Pos_tf ; Ang_tf];
inputs = {'u'};
outputs = {'x'; 'Theta'};
set(sys_tf,'InputName',inputs);
set(sys_tf,'OutputName',outputs);
sys_tf

pzmap(sys_tf)