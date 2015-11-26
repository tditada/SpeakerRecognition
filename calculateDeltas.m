%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* totalFrames = cantidad total de frames
%* mfcc = coeficientes
%* totalMfcc = cantidad total de coeficientes
%Parámetros de salida:
%* mfcc = mfcc con deltas incorporados
% La función calcula los deltas correspondientes y los guarda en mfcc para su posterior uso.
function delta = calculateDeltas(totalFrames, mfcc, totalMfcc)
	for frame = 1:totalFrames
		delta = mfcc';
		delta(1,:) = (2*(mfcc(:,3)-mfcc(:,1)) + (mfcc(:,2)-mfcc(:,1)))/10;
		delta(2,:) = (2*(mfcc(:,4)-mfcc(:,1)) + (mfcc(:,3) - mfcc(:,1)))/10;
		for deltaFrame = 3 : (totalFrames-2)
		    delta(deltaFrame,:) = (2*(mfcc(:,deltaFrame+2) - mfcc(:,deltaFrame-2)) + (mfcc(:,deltaFrame+1) - mfcc(:,deltaFrame-1)))/10;
		end
		delta(totalFrames-1,:) = (2*(mfcc(:,totalFrames)-mfcc(:,totalFrames-3)) + (mfcc(:,totalFrames) - mfcc(:,totalFrames-2)))/10;
		delta(totalFrames,:) = (2*(mfcc(:,totalFrames)-mfcc(:,totalFrames-2)) + (mfcc(:,totalFrames)-mfcc(:,totalFrames-1)))/10;
		for coef = 1:totalMfcc
			mfcc(totalMfcc+coef,frame) = delta(frame,coef);
		endfor
	endfor
endfunction
