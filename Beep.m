function [y] = Beep(time, FT)
FS = 44100;

%Generating time vector
x = 0:1/FS:time;

%Genarating the Beep Signal
y = sin(2 * pi * FT * x);
end

