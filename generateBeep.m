function generateBeep(~, ~)
    Fs = 44100;
    
    % ask the user for the duration of the beep sound
    beep_duration = inputdlg('Enter beep duration in seconds:', 'Beep Generation', [1 50]);
    
    if isempty(beep_duration)
        return;  % Cancel button clicked, do nothing
    end
    
    % Convert string input to a numeric value
    beep_duration = str2num(beep_duration{1});
    
    % Generate time vector
    x = 0:1/Fs:beep_duration;
    
    % Generate amplitude vector
    y = sin(2 * pi * 2000 * x);
    
    % playing the beep sound
    sound(y, Fs);
end
