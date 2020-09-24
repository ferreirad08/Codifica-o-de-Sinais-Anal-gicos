P = [0.6 0.4]; % probabilities

Psort = sort(P,'descend'); % ordered probabilities
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

Psort = sort(P,'descend') % ordered probabilities
H = -sum(P.*log2(P)) % entropy
L = sum(Psort.*cellfun('length',code)) % length
eta = H/L % efficiency
gama = 1-eta % redundancy
