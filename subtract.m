function subtract(~, ~)

    % Create a window to get start point, end point, and the amplitude of
    % the first signal
    windowMessages = {'Start point of the first signal range', ...
                      'End point of the first signal range', ...
                      'Amplitude Values'};
    
    % Opening the input window
    firstSignal = inputdlg(windowMessages, 'First Signal Input', [1, 50]);
    
    % check if the user has clicked the cancel button
    if isempty(firstSignal)
        return;
    end
    
    % extracting values from the cell array [firstSignal]
    Begin = str2double(firstSignal{1});
    End = str2double(firstSignal{2});

    % generating time and amplitude vectors for the first signal
    x1 = Begin:End;
    y1 = str2double(strsplit(firstSignal{3}));
    
    % Create a window to get start point, end point, and the amplitude of
    % the second signal
    windowMessages = {'Start point of the second signal range', ...
                      'End point of the second signal range', ...
                      'Amplitude Values'};
    
    % Opening the input window
    secondSignal = inputdlg(windowMessages, 'Second Signal Input', [1, 50]);
    
    % check if the user has clicked the cancel button
    if isempty(secondSignal)
        return;
    end
    
    % extracting values from the cell array [firstSignal]
    Begin = str2double(secondSignal{1});
    End = str2double(secondSignal{2});

    % generating time and amplitude vectors for the first signal
    x2 = Begin:End;
    y2 = str2double(strsplit(secondSignal{3}));
    
    % Creating new window for plotting
    figure('Name', 'Signal Subtraction');
    
    % Plotting the first signal
    subplot(2, 2, 1);
    stem(x1, y1);
    title('The First Signal');
    
    % Plotting the second signal
    subplot(2, 2, 2);
    stem(x2, y2);
    title('The Second Signal');
    
    % Generating time vector for the mulplication signal
    x = min(min(x1), min(x2)):max(max(x1), max(x2));
    
    % aligning the amplitude vectors from the beginning
    if x1(1) < x2(1)
        y2 = [zeros(1, abs(x1(1) - x2(1))), y2];
    elseif x1(1) > x2(1)
        y1 = [zeros(1, abs(x1(1) - x2(1))), y1];
    end
    
    % aligning the amplitude vectors from the beginning
    if x1(end) < x2(end)
        y1 = [y1, zeros(1, abs(x1(end) - x2(end)))];
    elseif x1(end) > x2(end)
        y2 = [y2, zeros(1, abs(x1(end) - x2(end)))];
    end
    
    % Subtraction Result vector
    y = y1-y2;
    
    % Plotting the subtraction result
    subplot(2, 2, [3, 4]);
    stem(x, y);
    title('Subtraction Result');
    
end