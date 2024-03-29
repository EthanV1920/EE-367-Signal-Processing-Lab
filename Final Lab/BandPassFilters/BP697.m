function y = BP697(x)
%DOFILTER Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 23.2 and DSP System Toolbox 23.2.
% Generated on: 05-Mar-2024 13:08:57

%#codegen

% To generate C/C++ code from this function use the codegen command.
% Type 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    %
    % Fstop1 = 620;   % First Stopband Frequency
    % Fpass1 = 680;   % First Passband Frequency
    % Fpass2 = 710;   % Second Passband Frequency
    % Fstop2 = 780;   % Second Stopband Frequency
    % Astop1 = 6;     % First Stopband Attenuation (dB)
    % Apass  = 1;     % Passband Ripple (dB)
    % Astop2 = 6;     % Second Stopband Attenuation (dB)
    % Fs     = 4000;  % Sampling Frequency
    %
    % h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
    %                      Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);
    %
    % Hd = design(h, 'butter', ...
    %     'MatchExactly', 'passband', ...
    %     'SystemObject', true,...
    %      UseLegacyBiquadFilter=true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 0 -1 1 -0.881385021996587 0.911473662795519], ...
        'ScaleValues', [0.0442631686022406; 1]);
end

s = double(x);
y = step(Hd,s);

