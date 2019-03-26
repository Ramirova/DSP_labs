[rec, fsC] = audioread('record.wav');
[original, fsO] = audioread('bang.wav');

rec = rec(:, 1);
original = original(:, 1);
o_reversed = fliplr(original);

IR = conv(rec(1:100000), o_reversed(1:100000));

result = conv(IR, original(1:100000));

player = audioplayer(result, fsC, 24);
play(player);
