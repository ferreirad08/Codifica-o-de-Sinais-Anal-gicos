P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend');

p = [];
while numel(P) > 2
    P(end-1) = P(end-1) + P(end);
    P(end) = [];
    [P,I] = sort(P,'descend');
    [~,I] = max(I);
    p(end+1) = I;
end

code = {'0','1'};
for i = flip(p)
    code(end+1) = strcat(code(i),'0');
    code(end+1) = strcat(code(i),'1');
    code(i) = [];
end

code

P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend');

L = sum(P.*cellfun('length',code)) % Length
H = sum(P.*log2(1./P)) % Entropy
eta = H/L % Efficiency
gama = 1 - eta % Redudance
