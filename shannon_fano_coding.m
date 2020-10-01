P = [0.5 0.25 0.125 0.125]
C = cell(1,numel(P));

diff = [];
for i = 1:numel(P)-1
    diff(end+1) = sum(P(1:i))-sum(P(i+1:end));
end

[~,i] = min(diff);
for j = 1:i
    C{j} = strcat(C{j},'0');
end

for j = i+1:numel(P)
    C{j} = strcat(C{j},'1');
end

while numel(unique(C)) ~= numel(P)
for i = unique(C)
    idx = find(strcmp(C,i));
    n = numel(idx);
    if n > 1
        diff = [];
        Pt = P(idx);
        for i = 1:n-1
            diff(end+1) = sum(Pt(1:i))-sum(Pt(i+1:end));
        end

        [~,i] = min(diff);
        for j = idx(1:i)
            C{j} = strcat(C{j},'0');
        end

        for j = idx(i+1:n)
            C{j} = strcat(C{j},'1');
        end
    end
end
end

C
