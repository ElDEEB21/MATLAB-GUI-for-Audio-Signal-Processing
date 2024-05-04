# MATLAB Audio Processing Project

This repository contains several MATLAB scripts designed for various audio processing tasks, including effects like echo, noise generation, and speed adjustment. Each script is tailored for specific operations which can be executed in the MATLAB environment.

## Repository Structure

Below is a description of each MATLAB script in the repository, with links to view each file.

### Audio Effects and Utilities

- **[addEcho.m](./addEcho.m)** - Adds an echo effect to an audio signal. Users can either record their own audio or select an existing file.
- **[addNoiseToFile.m](./addNoiseToFile.m)** - Adds white noise to an existing audio file and saves the noisy audio.
- **[adjustSpeed.m](./adjustSpeed.m)** - Adjusts the playback speed of an audio file or a recording.
- **[adjustVolume.m](./adjustVolume.m)** - Adjusts the volume of an audio recording, either up or down, and saves the adjusted audio.
- **[audioTrim.m](./audioTrim.m)** - Allows users to trim a part of an audio file by specifying start and end times.
- **[generateBeep.m](./generateBeep.m)** - Generates a simple beep sound for a specified duration.
- **[generateNoise.m](./generateNoise.m)** - Generates a random noise sound for a given duration.
- **[multiply.m](./multiply.m)** - Multiplies two signals within specified ranges and plots the result.
- **[myConv.m](./myConv.m)** - Performs convolution between two signals manually, illustrating the computational steps.
- **[playAudioFile.m](./playAudioFile.m)** - Plays an audio file selected by the user.
- **[plotSignal.m](./plotSignal.m)** - Provides options to either plot a signal from user input or plot a signal from a selected audio file.
- **[recordAndSave.m](./recordAndSave.m)** - Records audio from the microphone and saves it to a file.
- **[removeNoise.m](./removeNoise.m)** - Applies a low pass filter to an audio file to remove high-frequency noise.
- **[startProgram.m](./startProgram.m)** - Initializes a graphical user interface (GUI) with buttons for each function, enhancing user interaction.
- **[stop.m](./stop.m)** - Stops audio playback and can be triggered from the GUI.
- **[subtract.m](./subtract.m)** - Subtracts two signals within specified ranges and plots the result.

## Usage

Each script can be run in MATLAB by navigating to the script’s directory and executing it in the MATLAB command window. For GUI-based scripts like `startProgram.m`, simply run the script, and a user interface will guide you through the operations.

## Contribution

Contributions are welcome! If you'd like to improve or add new features to the project, please feel free to fork the repository, make your changes, and submit a pull request.


---

Enjoy exploring and enhancing your audio processing skills with these MATLAB scripts!
