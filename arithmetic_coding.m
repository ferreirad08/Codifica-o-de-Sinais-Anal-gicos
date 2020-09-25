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
    middle = low+(high-low).*A(2:end-1); % new limits
    intervals = [low middle high]; % new intervals
end

interval = intervals([1 end]) % final interval

shorterL = 100;
for number = interval(1):0.00001:interval(2)
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
