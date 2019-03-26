[IR1, fsIR1] = audioread('LargeHall.wav');
[IR2, fsIR2] = audioread('SmallVoxRoom.wav');
[IR3, fsIR3] = audioread('StudioK.wav');

[Fem, fsFem] = audioread('HarvardFemale.wav');
[M, fsM] = audioread('mo_all.wav');
IR1 = IR1(:, 1);
IR2 = IR2(:, 1);
IR3 = IR3(:, 1);
Fem = Fem(:, 1);
% player = audioplayer(M, fsM);
% play(player);

%reverbed = conv(IR1, Fem(1:300000));
%reverbed = conv(IR2, Fem(1:300000));
% reverbed = conv(IR3, Fem(1:300000));

% reverbed = conv(IR1, M(1:1000000));
% reverbed = conv(IR2, M(1:1000000));
% reverbed = conv(IR3, M(1:1000000));

player = audioplayer(reverbed, fsFem, 24);
play(player);
