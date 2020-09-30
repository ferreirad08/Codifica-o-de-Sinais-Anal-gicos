P = [0.5, 0.1, 0.2, 0.1, 0.1]; % probabilities
M = {'S', 'W', 'I', 'M', '_'}; % respective symbols
S = {'S', 'W', 'I', 'S', 'S', '_', 'M', 'I', 'S', 'S'}; % sequence of symbols

[P,I] = sort(P,'descend');
M = M(I);
[~,S] = ismember(S,M);

A = [0 cumsum(P)]; % zero and accumulated probabilities
intervals = A; % first intervals
for i = S % for each symbol
    low = intervals(i);
    high = intervals(i+1);
    intervals = low+(high-low).*A; % new intervals
end

format long % show more decimal places
final_interval = intervals([1 end]) % final interval

shorterL = length(S)*8; % 8 bits (1 byte) per symbol
for number = final_interval(1):1e-13:final_interval(2)
    binary = [];
    while number > 0
        number = number*2;
        binary(end+1) = floor(number); % integer part
        number = number-floor(number); % decimal part
    end
    
    L = length(binary); % code length
    if L < shorterL
        binStr = num2str(binary); % code in string
        shorterL = L;
    end
end

binStr % final code
