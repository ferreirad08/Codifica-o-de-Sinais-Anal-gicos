P = [0.6 0.3 0.1]; % probabilities
S = [1 2 1]; % sequence of symbols

A = [0 cumsum(P)]; % zero and accumulated probabilities
intervals = A; % first intervals
for i = S % for each symbol
    low = intervals(i);
    high = intervals(i+1);
    middle = low+(high-low).*A(2:end-1); % new limits
    intervals = [low middle high]; % new intervals
end

interval = intervals([1 end]) % final interval

y = 100;
for number = interval(1):0.00001:interval(2)
    binary = [];
    while number > 0
        number = number*2;
        binary(end+1) = floor(number); % integer part
        number = number-floor(number); % decimal part
    end
    
    L = length(binary); % code length
    if L < y
        binStr = num2str(binary); % code in string
        y = L;
    end
end

binStr % final code
