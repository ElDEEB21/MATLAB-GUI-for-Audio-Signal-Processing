function generateBeep(~, ~)
	Fs = 44100;
    Ft = 2000;
    
	%Generating time vector
	x = 0:1/Fs:1;

	%Genarating Amplitude Vector
	y = sin(2 * pi * Ft * x);
	
    sound(y, Fs);
end