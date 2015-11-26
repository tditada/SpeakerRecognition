%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* fr = un frame en particular de la señal
%* frsize = tamaño del frame
%
%Parámetros de salida:
%* en = coeficiente número 13 del mfcc
% Reference: An efficient extraction method in speech recognition 

function en = logen(fr, frsize)
	en = 0;
	for n = 1 : frsize
		en += fr(n) ** 2;
	endfor
	if(en!=0)
		en = log(en);
	end
endfunction


