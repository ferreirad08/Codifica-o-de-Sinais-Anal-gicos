S = {'a','a','a','b','a','b','b','b','a','a','a','b','a','a','a','a','a','a','a','b','a','a','b','b'};

dict = S(1);
for i = S(2:end)
    if ismember(dict(end),dict(1:end-1))
        dict(end) = strcat(dict(end),i);
    else
        dict(end+1) = i;
    end
end

dict
