function playAudioFile(~, ~)

    [fileName, filepath] = uigetfile('*.wav', 'Select Audio File');
    
    % checking if the user has selected a file
    if ~isequal(fileName, 0)
        % getting audio data from the file and playing it
        [y, fs] = audioread(fullfile(filepath, fileName));
        sound(y, fs);
    end

end