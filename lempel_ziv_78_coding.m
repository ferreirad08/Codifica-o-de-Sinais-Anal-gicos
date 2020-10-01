% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com

S = {'s','i','r','_',...
    's','i','d','_',...
    'e','a','s','t','m','a','n','_',...
    'e','a','s','i','l','y','_',...
    't','e','a','s','e','s','_',...
    's','e','a','_',...
    's','i','c','k','_',...
    's','e','a','l','s'};

dict = S(1);
for item = S(2:end)
    if ismember(dict(end),dict(1:end-1))
        dict(end) = strcat(dict(end),item);
    else
        dict(end+1) = item;
    end
end

dict'

for i = 1:length(dict)
    item = dict{i};
    idx = find(strcmp({item(1:end-1)},dict),1);
    token(i) = {strcat(num2str(idx),item(end))};
    
    if length(item) < 2
        token(i) = {strcat('0',item)};
    end
end

token'

% lempel_ziv_78_coding
% 
% ans = 
% 
%     's'
%     'i'
%     'r'
%     '_'
%     'si'
%     'd'
%     '_e'
%     'a'
%     'st'
%     'm'
%     'an'
%     '_ea'
%     'sil'
%     'y'
%     '_t'
%     'e'
%     'as'
%     'es'
%     '_s'
%     'ea'
%     '_si'
%     'c'
%     'k'
%     '_se'
%     'al'
%     's'
% 
% 
% ans = 
% 
%     '0s'
%     '0i'
%     '0r'
%     '0_'
%     '1i'
%     '0d'
%     '4e'
%     '0a'
%     '1t'
%     '0m'
%     '8n'
%     '7a'
%     '5l'
%     '0y'
%     '4t'
%     '0e'
%     '8s'
%     '16s'
%     '4s'
%     '16a'
%     '19i'
%     '0c'
%     '0k'
%     '19e'
%     '8l'
%     '0s'
