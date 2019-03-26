clear;

function yD = my_function(y, x)
  yD = 5 * x^2 - 99 + x - y;
endfunction


function [x, y] = RungeKuttaMethod(f,X,x0,y0,steps)
% Runge Kutta's Method  
% f is a given function
% x0 is an initial value of x 
% y0 is an initial value of y 
% steps is a number of steps
  delta = (X-x0)/steps;
  x = x0:delta:X; 
  y(1) = y0;
  for i=1:(length(x)-1) 
    m1 = f(y(i),x(i)); 
    m2 = f(y(i)+0.5*delta*m1, x(i)+0.5*delta); 
    m3 = f((y(i)+0.5*delta*m2), (x(i)+0.5*delta)); 
    m4 = f((y(i)+m3*delta), (x(i)+delta)); 
    y(i+1) = y(i) + (1/6)*(m1+2*m2+2*m3+m4)*delta;
  end;
endfunction

function [x, y] = BaselineSolution(h,x0,X,y0)
% Baseline exact solution 
% X is an end of the interval
% x0 is an initial value of x 
% y0 is an initial value of y 
% h is number of steps
  delta=(X-x0)/h;
  c = (y0 -5*x0^2 + 9 * x0 + 90) / exp(-x0)
  x(1)=x0;
  y(1)=y0;
  for i=1:h
    x(i+1)=x(i)+delta;
    y(i+1)=c * exp(-(x(i+1))) +5*x(i+1)^2 - 9*x(i+1)-90;
end;
end

function [x, y]=EulersMethod(f, X,x0,y0, h)
% Eulers Method  
% f is a given function
% X is an end of the interval
% x0 is an initial value of x 
% y0 is an initial value of y 
% h is number of steps
  delta=(X-x0)/h;
  x(1)=x0;
  y(1)=y0;
  for i=1:h
    x(i+1)=x(i)+delta;
    y(i+1)=y(i)+delta*f(y(i),x(i));
end;
end

function [x, errors] =Error(baseline, method, steps, x0, X, y0)
% Error calcaulation depending on a step size 
% method is a given function
% X is an end of the interval
% x0 is an initial value of x 
% y0 is an initial value of y 
% steps is a maximal number of steps
  errors(1) = 0
  delta = 0.2;
  x = 1:0.2:steps; 
  for i=1:(length(x))
    [xB, yB]=baseline(i,x0,X,y0);
    [xM,yM]=method(@my_function,X,x0,y0,i)
    current_error = abs(yM-yB)
    errors(i) = sum(current_error)
  end
end
   

function main()
    x0 = 0;
    y0=1;
    X = 4;
    steps = 5;
     
    xS = linspace(x0, X, steps)
    yS = lsode('my_function', y0, xS);
    [xE,yE]=EulersMethod(@my_function,X,x0,y0,steps)
    [xR,yR]=RungeKuttaMethod(@my_function,X,x0,y0,steps)
    [xB, yB]=BaselineSolution(steps,x0,X,y0);
    plot(xB, yB, '-*', xR, yR, '-', xE, yE, '-^', xS, yS, '-')
    legend("Baseline solution", "Runge-kutta method", "Euler’s method",  "LSODE")
    title("Numerical methods for ODE solution")
    
    %Plotting the errors depending on a step sizeq
    %[stepsErrors, E] = Error(@BaselineSolution, @RungeKuttaMethod, 5, x0, X, y0)
    %[stepsErrorsEulers, ErrorEuler] = Error(@BaselineSolution, @EulersMethod, 5, x0, X, y0)
    %plot(stepsErrors, E, '-*', stepsErrorsEulers, ErrorEuler, '-')
    %title("Errors for Runge-Kutta's adn Euler's methods for ODE solution depending on step size")
    
end

main