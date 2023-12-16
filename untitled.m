function untitled
    % Create a figure and axes
    figure('Name', 'Sound Processing GUI', 'NumberTitle', 'off', 'Position', [100, 100, 600, 400]);

    % Create buttons for each operation
    uicontrol('Style', 'pushbutton', 'String', 'Generate Beep', 'Position', [20, 350, 120, 30], 'Callback', @generateBeep, 'BackgroundColor', [0.7, 0.9, 0.7], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Generate Noise', 'Position', [160, 350, 120, 30], 'Callback', @generateNoise, 'BackgroundColor', [0.7, 0.7, 0.9], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Play Audio File', 'Position', [300, 350, 120, 30], 'Callback', @playAudioFile, 'BackgroundColor', [0.9, 0.7, 0.7], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Add Noise to File', 'Position', [440, 350, 120, 30], 'Callback', @addNoiseToFile, 'BackgroundColor', [0.9, 0.9, 0.6], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Record and Save', 'Position', [20, 300, 120, 30], 'Callback', @recordAndSave, 'BackgroundColor', [0.8, 0.8, 0.8], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Adjust Volume', 'Position', [160, 300, 120, 30], 'Callback', @adjustVolume, 'BackgroundColor', [0.7, 0.8, 0.9], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Adjust Speed', 'Position', [300, 300, 120, 30], 'Callback', @adjustSpeed, 'BackgroundColor', [0.9, 0.7, 0.8], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Add Echo', 'Position', [440, 300, 120, 30], 'Callback', @addEcho, 'BackgroundColor', [0.8, 0.9, 0.7], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Remove Noise', 'Position', [20, 250, 120, 30], 'Callback', @removeNoise, 'BackgroundColor', [0.7, 0.9, 0.8], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Subtract', 'Position', [160, 250, 120, 30], 'Callback', @subtract, 'BackgroundColor', [0.8, 0.7, 0.9], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Multiply', 'Position', [300, 250, 120, 30], 'Callback', @multiply, 'BackgroundColor', [0.9, 0.8, 0.7], 'FontWeight', 'bold');
    uicontrol('Style', 'pushbutton', 'String', 'Plot Signal', 'Position',  [440, 250, 120, 30], 'Callback', @plotSignal, 'BackgroundColor', [1.0, 0.9, 0.8], 'FontWeight', 'bold');

    function generateBeep(~, ~)
        fs = 44100;
        duration = 1;
        frequency = 1000;
        t = 0:1/fs:duration;
        y = sin(2*pi*frequency*t);
        sound(y, fs);
    end

    function generateNoise(~, ~)
        fs = 44100;
        duration = 1;
        noise = randn(1, fs * duration);
        sound(noise, fs);
    end

    function playAudioFile(~, ~)
        [filename, filepath] = uigetfile('*.wav', 'Select Audio File');
        if ~isequal(filename, 0)
            [y, fs] = audioread(fullfile(filepath, filename));
            sound(y, fs);
        end
    end

    function addNoiseToFile(~, ~)
        name_file = 'Enter the name for the noisy audio file (without extension):';
        head = 'Input';
        defaultinput = 'noisy_audio';
        answer = inputdlg(name_file, head, 1, {defaultinput});

        if isempty(answer)
            return;
        end

        filename = answer{1};

        [originalFilename, filepath] = uigetfile('*.wav', 'Select Audio File');

        if ~isequal(originalFilename, 0)

            [y, fs] = audioread(fullfile(filepath, originalFilename));

            % Add noise to the audio
            noise = 0.1 * randn(size(y));
            y_noisy = y + noise;

            audiowrite([filename, '.wav'], y_noisy, fs);

            msgbox(['Noisy audio saved as "', filename, '.wav"']);
        end
    end

    function recordAndSave(~, ~)
        name_file = 'Enter the name for the recorded audio file (without extension):';
        head = 'Input';
        defaultinput = 'recorded_audio';
        answer = inputdlg(name_file, head, 1, {defaultinput});

        if isempty(answer)
            return;
        end

        filename = answer{1};

        fs = 44100;
        duration = 5;
        
        recorder = audiorecorder(fs, 16, 1);
        record(recorder);
        
        WaitBar = waitbar(0, 'Recording Audio...');
        
        % Update waitbar while recording
        for t = 1:duration
            waitbar(t/duration, WaitBar, sprintf('Recording Audio... %d seconds', t));
            pause(1);
        end

        stop(recorder);

        y = getaudiodata(recorder);

        close(WaitBar);

        audiowrite([filename, '.wav'], y, fs);
        
        msgbox(['Recorded audio saved as "', filename, '.wav"']);
    end

    function subtract(~, ~)
        [filename1, filepath1] = uigetfile('*.wav', 'Select Audio File 1');
        [filename2, filepath2] = uigetfile('*.wav', 'Select Audio File 2');
        if ~isequal(filename1, 0) && ~isequal(filename2, 0)
            [y1, fs1] = audioread(fullfile(filepath1, filename1));
            [y2, fs2] = audioread(fullfile(filepath2, filename2));
            
            result_subtract = y1 - y2;
            
            sound(result_subtract, max(fs1, fs2));
        end
    end

    function multiply(~, ~)
        [filename1, filepath1] = uigetfile('*.wav', 'Select Audio File 1');
        [filename2, filepath2] = uigetfile('*.wav', 'Select Audio File 2');
        if ~isequal(filename1, 0) && ~isequal(filename2, 0)
            [y1, fs1] = audioread(fullfile(filepath1, filename1));
            [y2, fs2] = audioread(fullfile(filepath2, filename2));

            result_multiply = y1 .* y2;
            
            sound(result_multiply, max(fs1, fs2));
        end
    end

end
