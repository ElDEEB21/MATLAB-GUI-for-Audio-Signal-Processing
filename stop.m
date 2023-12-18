function stop(~, ~)

    % Display a warning dialog
    choice = questdlg('Are you sure you want to stop the audio?', ...
        'Confirm Stop', 'Yes', 'No', 'No');
    
    % Process the user's choice
    switch choice
        case 'Yes'
            % Stop the audio playback
            clear sound;
        case 'No'
            % Do nothing if the user chooses not to stop
    end
    
end