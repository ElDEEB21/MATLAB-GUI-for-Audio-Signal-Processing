function playAudioFile(~, ~)
    [filename, filepath] = uigetfile('*.wav', 'Select Audio File');
    
    %checking if the user has selected a file
    if ~isequal(filename, 0)
        %getting audio data from the file and playing it
        [y, fs] = audioread(fullfile(filepath, filename));
        sound(y, fs);
    end
end