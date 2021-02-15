clc
clear all
format short eng
format compact
close all

m = 0.1756;
M = 0.7160;
g = 9.810;
J = 0.001;
l = 0.11;
b = 0.1;

%simulate with theta = 0 degrees
F=0;
Theta_0=0;
struct_res = sim('master', 60);
hgexport(plot_non_linear(struct_res),'..\Lab_report\pics\plots\non_linearized_results_theta_0.eps');

%simulate with theta = 5 degrees
F=0;
Theta_0=5;
struct_res = sim('master', 60);
hgexport(plot_non_linear(struct_res),'..\Lab_report\pics\plots\non_linearized_results_theta_5.eps');

%simulate with theta = 5 degrees and increased friction
F=0;
Theta_0=5;
b=0.6;
struct_res = sim('master', 60);
hgexport(plot_non_linear(struct_res),'..\Lab_report\pics\plots\non_linearized_results_inc_friction.eps');
b=0.1;

%plot sine / cosine
t = [0 : 0.00001: 2*pi];
fig_cos_sin = figure
plot(t.*180./pi, sin(t), 'b')
hold on
plot(t.*180./pi, cos(t), 'r')
legend('sine', 'cosine')
grid on
xlabel('angle in deg')
hgexport(fig_cos_sin,'..\Lab_report\pics\plots\sin_cos.eps');

function [fig] = plot_non_linear(struct)
    fig = figure('Name', 'non Linear Model simulation results');
    subplot(2,1,1)
    plot(struct.logsout{1}.Values.Time, struct.logsout{1}.Values.Data);
    xlabel('time in s')
    ylabel('theta in rad')
    grid on
    
    subplot(2,1,2)
    plot(struct.logsout{2}.Values.Time, struct.logsout{2}.Values.Data);
    ylabel('x in m')
    xlabel('time in s')
    grid on
end
