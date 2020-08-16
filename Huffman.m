P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend')

h = [];
while numel(P) > 2
    P(end-1) = P(end-1) + P(end);
    P(end) = [];
    [P,I] = sort(P,'descend');
    [~,I] = max(I);
    h(end+1) = I;                  % Historic
end

code = {'0','1'};
for i = flip(h)
    code(end+1) = strcat(code(i),'0');
    code(end+1) = strcat(code(i),'1');
    code(i) = [];
end

code

P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10];
P = sort(P,'descend');

H = sum(P.*log2(1./P))             % Entropy
L = sum(P.*cellfun('length',code)) % Length
eta = H/L                          % Efficiency
gama = 1 - eta                     % Redundancy
