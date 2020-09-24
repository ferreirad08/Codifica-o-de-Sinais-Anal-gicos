P = [0.30, 0.25, 0.15, 0.12, 0.08, 0.10]; % probabilities

Psort = sort(P,'descend') % ordered probabilities
h = [];
while numel(Psort) > 2
    Psort(end-1) = Psort(end-1)+Psort(end);
    Psort(end) = [];
    [Psort,I] = sort(Psort,'descend');
    [~,I] = max(I);
    h(end+1) = I; % historic
end

code = {'0','1'}; % first code

for i = flip(h)
    code(end+1) = strcat(code(i),'0');
    code(end+1) = strcat(code(i),'1');
    code(i) = [];
end

code % final code

H = -sum(P.*log2(P))               % Entropy
L = sum(P.*cellfun('length',code)) % Length
eta = H/L                          % Efficiency
gama = 1 - eta                     % Redundancy
