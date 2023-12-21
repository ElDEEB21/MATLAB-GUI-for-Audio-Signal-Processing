function addEcho(~, ~)
    % Declare recordingDuration before the switch statement
    recordingDuration = 0;

    % Ask the user if they want to record or select a file
    options = {'Record audio', 'Select a file', 'Cancel'};
    choice = questdlg('Do you want to record audio or select a file?', 'Audio Input', options{:}, 'Record');

    switch choice
        case 'Record audio'
            % Ask the user for the duration of the recording
            recordingDuration = inputdlg('Enter the duration for the recording (in seconds)');
            recordingDuration = str2double(recordingDuration{1});

            % Check if the user clicked the cancel button
            if isnan(recordingDuration) || recordingDuration <= 0
                return;
            end

            % Record the audio
            fs = 44100;
            recorder = audiorecorder(fs, 16, 1);
            record(recorder);

            waitBar = waitbar(0, 'Recording Audio...');

            % Update waitbar while recording
            for t = 1:recordingDuration
                waitbar(t/recordingDuration, waitBar, sprintf('Recording Audio... %d seconds', t));
                pause(1);
            end

            stop(recorder);

            audioData = getaudiodata(recorder);

            close(waitBar);
        case 'Select a file'
            % If the user chooses to select a file, prompt them to choose a file
            [fileName, filePath] = uigetfile({'*.wav;*.mp3', 'Audio Files (*.wav, *.mp3)'}, 'Select an audio file');
            if isequal(fileName, 0)
                return; % User clicked Cancel
            end

            % Read audio from the selected file
            [audioData, fs] = audioread(fullfile(filePath, fileName));

            % Set recording duration to the length of the audio file
            recordingDuration = numel(audioData) / fs;
        case 'Cancel'
            return; % User clicked Cancel
        otherwise
            return;
    end

    % Add an echo effect using convolution
    echoDelay = 0.5; % Echo delay in seconds
    echoGain = 0.5; % Echo gain (adjust as needed)

    % Create an echo impulse response
    echoImpulse = [1; zeros(round(fs * echoDelay), 1); echoGain];

    % Convolve the original audio with the echo impulse response
    echoedAudio = conv(audioData, echoImpulse);

    % Normalize the audio to prevent clipping
    echoedAudio = echoedAudio / max(abs(echoedAudio));

    % Play the original audio
    sound(audioData, fs);

    % Pause for the original audio duration
    pause(recordingDuration + 1); % Adding 1 second to ensure playback completion

    % Play the echoed audio
    sound(echoedAudio, fs);
end
