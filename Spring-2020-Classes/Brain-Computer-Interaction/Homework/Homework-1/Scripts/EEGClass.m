classdef EEGClass
    % Methods used for EEG signal plotting and filtering
    
    methods (Static)
        
        function color = setColor(stringColor)
            str = stringColor;
            color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
        end
        
        function clean_signal = b_filter(signal, N, low_f, high_f)
            [B, A] = butter(N, [low_f, high_f], 'bandpass');
            clean_signal = filter(B, A, signal);
        end
        
        function trial = setTrial(signal, t_low, t_high, arr_size)
            trial = ones(arr_size, 1);
            j = 1;
            for i=t_low:t_high
                trial(j) = signal(i);
                j = j+1;
            end
        end
        
    end % static methods
    
end % classdef

