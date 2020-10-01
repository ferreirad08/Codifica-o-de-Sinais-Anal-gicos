P = [1/2 1/4 1/8 1/16 1/32 1/64 1/64]
C = {'','','','','','',''};

while numel(unique(C)) < numel(P)
    for i = unique(C)
        idx = find(strcmp(C,i));
        n = numel(idx);
        if n > 1
            diff = [];
            Pt = P(idx);
            for i = 1:n-1
                diff(end+1) = abs(sum(Pt(1:i))-sum(Pt(i+1:end)));
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
