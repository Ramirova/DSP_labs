clear;

filename = 'speech.ogg';
[y,fs] = audioread(filename);

[y1,fs1] = audioread('One.ogg');
[y2,fs2] = audioread('Two.ogg');
[y3,fs3] = audioread('Three.ogg');
[y4,fs4] = audioread('Four.ogg');
[y5,fs5] = audioread('Five.ogg');
[y6,fs6] = audioread('Rabbit.ogg');

words = {'one ', 'two ', 'three ', 'four ', 'five ', 'rabbit is walking '};

sound(y, fs)
pause(5)
%Calculate cross-correlation between original sound and distinct words
z1 = xcorr(y, y1);
z2 = xcorr(y, y2);
z3 = xcorr(y, y3);
z4 = xcorr(y, y4);
z5 = xcorr(y, y5);
z6 = xcorr(y, y6);

[M,I1] = (max(z1));
[M,I2] = (max(z2));
[M,I3] = (max(z3));
[M,I4] = (max(z4));
[M,I5] = (max(z5));
[M,I6] = (max(z6));

%Indecies of maximum correlation points
indecies = [I1, I2, I3, I4, I5, I6];
%Sorting indecies of maximum correlation points in ascending order and
%retrieing their original indecies
[B,I] = sort(indecies,'ascend');
result = strcat(words(I(1)), words(I(2)), words(I(3)), words(I(4)), words(I(5)), words(I(6)));
disp('Recognized sequence...')
disp(result)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing recognition of number four
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'fourTest.mp3';
[y,fs] = audioread(filename);
sound(y, fs)
%Calculate cross-correlation between original sound and distinct words
z1 = xcorr(y, y1);
z2 = xcorr(y, y2);
z3 = xcorr(y, y3);
z4 = xcorr(y, y4);
z5 = xcorr(y, y5);

[M1,I1] = (max(z1));
[M2,I2] = (max(z2));
[M3,I3] = (max(z3));
[M4,I4] = (max(z4));
[M5,I5] = (max(z5));

[m, i] = max([M1, M2, M2, M4, M5]);
disp('Spelled number is...')
disp(i)

