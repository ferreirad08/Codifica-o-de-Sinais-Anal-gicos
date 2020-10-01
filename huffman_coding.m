% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com

P = [1/2 1/4 1/8 1/16 1/32 1/64 1/64]; % probabilities

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
gamma = 1-eta % redundancy
