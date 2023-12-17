function startProgram

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
    
end