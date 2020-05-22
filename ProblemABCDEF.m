clc;
clear;

% Problem A
exp_func = @(x,y) exp(x+y*1i);
visualize_cartesian(exp_func,0,20,0,20,0.2,'e^{z}');

% Problem B
log_func = @(r,phi) log(r)+1i*phi;
visualize_cylindrical(log_func,0,10,0,9*pi,0.2,pi/20,'log(z)');

% Problem C
sin_func = @(x,y) sin(x+y*1i);
visualize_cartesian(sin_func,0,20,0,20,0.2,'sin(z)');

% Problem D
cos_func = @(x,y) cos(x+y*1i);
visualize_cartesian(cos_func,0,20,0,20,0.2,'cos(z)');

% Problem E
sin_abs_func = @(x,y) abs(sin(x+y*1i));
visualize_cartesian(sin_abs_func,-2*pi,2*pi,-2*pi,2*pi,0.2,'|sin(z)|');

% Problem F
power_func = @(x,y) (x+y*1i).^(1/3);
visualize_cartesian(power_func,0,20,0,20,0.2,'z^{1/3}');

function visualize_cartesian(target_func,x_min,x_max,y_min,y_max,step,func_name)
    figure;
    [X,Y] = meshgrid(x_min:step:x_max,y_min:step:y_max);
    Z = target_func(X,Y);
    surf(X,Y,real(Z),imag(Z));
    xlabel('real');
    ylabel('imag');
    title(func_name);
    colorbar;
end

function visualize_cylindrical(target_func,r_min,r_max,phi_min,phi_max,r_step,phi_step,func_name)
    figure;
    [R,PHI] = meshgrid(r_min:r_step:r_max,phi_min:phi_step:phi_max);
    Z = target_func(R,PHI);
    surf(R.*cos(PHI), R.*sin(PHI), imag(Z), real(Z));
    xlabel('real');
    ylabel('imag');
    title(func_name);
    colorbar;
end