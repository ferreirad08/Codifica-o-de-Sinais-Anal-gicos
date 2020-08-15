clear, clc

P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend');

while numel(P) > 2
    P(end-1) = P(end-1) + P(end);
    P(end) = [];
    P = sort(P,'descend')
end
