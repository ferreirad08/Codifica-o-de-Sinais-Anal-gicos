S = {'A', 'R', 'A', 'R', 'A', 'S'}; % sequence of symbols
M = {'A', 'R', 'S'}; % symbols
P = [3/6, 2/6, 1/6]; % respective probabilities

n_symb = numel(M) % number of symbols
n_bits = ceil(log2(n_sym)) % number of bits per symbol

code = {'00', '01', '10'}; % final code

H = -sum(P.*log2(P)) % entropy
L = sum(P.*cellfun('length',code)) % length
eta = H/L % efficiency
gamma = 1 - eta % redundancy
