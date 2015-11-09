%% References
%% [1] http://practicalcryptography.com/miscellaneous/machine-learning/guide-mel-frequency-cepstral-coefficients-mfccs/
%% [2] http://arxiv.org/pdf/1003.4083.pdf

function mfcc(signal, fm)

	frame_step = 0.010;
	M = fm*frame_step; % 80 frames total	
	N = round(length(signal)/M); % frame length	(different for every signal)

	%0: Pre–emphasis filter. Reference [2]

	%1: Framing
	frames = framing(signal,N, M);

	%2: Windowing (from [2])
	hamming_window = 0.54 - 0.46 * cos(2 * pi * [0 : N - 1].'/(N - 1));
	
	%3: FFT
	
	%4: Mel-frequency Wrapping 
	
	%5: Cepstrum
end


% Devuelve M frames, con N samples por frame
% En la matriz frames, 1 frame por columna
% http://in.mathworks.com/matlabcentral/answers/24455-divide-audio-signal-into-frames
function frames=framing(signal, N, M)
	frames=zeros(N,M); 
	for k=0:M-1
	    frames(:,k+1)=signal(1+N*k:N*(k+1));
	end
end