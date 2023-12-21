function playAudioFile(~, ~)
    
    % ask the user to select the file
    [fileName, filePath] = uigetfile('*.wav', 'Select Audio File');
    
    % checking if the user has selected a file
    if ~isequal(fileName, 0)
        % getting audio data from the file and playing it
        [y, fs] = audioread(fullfile(filePath, fileName));
        sound(y, fs);
    end

end