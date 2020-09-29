P = [0.5 0.25 0.125 0.125]

diff = []
for i = 1:numel(P)-1
    diff = [diff sum(P(1:i))-sum(P(i+1:end))];
end

[~,i] = min(diff);
P(1:i)
P(i+1:end)
