function untitled
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
end