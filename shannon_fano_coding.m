% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com

P = [1/2 1/4 1/8 1/16 1/32 1/64 1/64]; % probabilities

Psort = sort(P,'descend') % ordered probabilities
code = {'','','','','','',''};

while numel(unique(code)) < numel(Psort)
    for i = unique(code)
        idx = find(strcmp(code,i));
        n = numel(idx);
        if n > 1
            diff = [];
            Pt = Psort(idx);
            for i = 1:n-1
                diff(end+1) = abs(sum(Pt(1:i))...
                    -sum(Pt(i+1:end)));
            end
        
            [~,i] = min(diff);
        
            for j = idx(1:i)
                code{j} = strcat(code{j},'0');
            end

            for j = idx(i+1:n)
                code{j} = strcat(code{j},'1');
            end
        end
    end
end

code % final code

H = -sum(P.*log2(P)) % entropy
L = sum(Psort.*cellfun('length',code)) % length
eta = H/L % efficiency
gama = 1-eta % redundancy
