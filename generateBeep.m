function generateBeep(~, ~)
    Fs = 44100;
    
    % ask the user for the duration of the beep sound
    beepDuration = inputdlg('Enter beep duration in seconds:', 'Beep Generation', [1 50]);
    
    if isempty(beepDuration)
        return;  % Cancel button clicked, do nothing
    end
    
    % Convert string input to a numeric value
    beepDuration = str2num(beepDuration{1});
    
    % Generate time vector
    x = 0:1/Fs:beepDuration;
    
    % Generate amplitude vector
    y = sin(2 * pi * 2000 * x);
    
    % playing the beep sound
    sound(y, Fs);
end