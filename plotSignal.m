function plotSignal(~, ~)

    % Ask the user for choosing whether to provide a signal or to select a file
    choice = questdlg('Choose an option:', ...
                      'Signal Plotting Options', ...
                      'Provide a Signal', 'Choose a File', 'Cancel', 'Provide a Signal');

    % Handle the user's choice
    switch choice
        case 'Provide a Signal'
            % Create a window to get start point, end point, and the amplitude of the signal
            windowMessage = {'Start point of the time range', ...
                             'End point of the time range', ...
                             'Amplitude Values'};

            % Opening the input window
            signal = inputdlg(windowMessage, 'Signal Input', [1, 50]);
            
            % Extracting values from the cell array
            Begin = str2double(signal{1});
            End = str2double(signal{2});
            
            % generating time vector
            x = Begin:End;
            
            % extracting amlitude vector
            y = str2double(strsplit(signal{3}));
            
            % creating new window for plotting
            figure('Name', 'Signal Plotting');
            subplot(1, 1, 1);
            plot(x, y);
            title('Signal');
            xlabel('Time');
            ylabel('Amplitude');
        case 'Choose a File'
            % Ask the user to choose a file
            [fileName, filePath] = uigetfile('*.wav', 'Select Wav File');
            if ~isequal(fileName, 0)
                % Read audio data from the selected file
                signal = audioread(fullfile(filePath, fileName));
                
                %creating new window for plotting
                figure('Name', 'Signal Plotting');
                subplot(1, 1, 1);
                plot(signal);
                title(['Signal from', fileName]);
                xlabel('Time');
                ylabel('Amplitude');
            else
                return;
            end
        case 'Cancel'
            return;
    end
end