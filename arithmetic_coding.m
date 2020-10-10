% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: September 2020

P = [0.5, 0.1, 0.2, 0.1, 0.1]; % probabilities
M = {'S', 'W', 'I', 'M', '_'}; % respective symbols
S = {'S', 'W', 'I', 'S', 'S', '_', 'M', 'I', 'S', 'S'}; % sequence of symbols

[P,I] = sort(P,'descend');
M = M(I);
[~,S] = ismember(S,M);

format long % show more decimal places

A = [0 cumsum(P)]'; % zero and accumulated probabilities
intervals = A % first intervals
for i = S % for each symbol
    low = intervals(i);
    high = intervals(i+1);
    intervals(:) = low+(high-low).*A % new intervals
end

shorterL = length(S)*8; % 8 bits (1 byte) per symbol
for number = intervals(1):1e-13:intervals(end)
    frac = number;
    binary = [];
    while frac > 0
        frac = frac*2; % double
        binary(end+1) = floor(frac); % integer part
        frac = frac-floor(frac); % decimal part
    end
    
    L = length(binary); % code length
    if L < shorterL
        binStr = num2str(binary); % code in string
        shorterL = L; % shortest length
        C = number; % decimal number
    end
end

binStr % final code
shorterL
C
