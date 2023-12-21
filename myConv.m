function y = myConv(s, k)

    signalLength = length(s);
    kernelLength = length(k);

    finalLength = signalLength + kernelLength - 1;
    
    % Generating the convolution result vector
    y = zeros(1, finalLength);
    
    for i = 1:finalLength
        for j = 1:kernelLength
            if ((i - j + 1) > 0) && ((i - j + 1) <= signalLength)
                y(i) = y(i) + s(i - j + 1) * k(j);
            end
        end
    end
end