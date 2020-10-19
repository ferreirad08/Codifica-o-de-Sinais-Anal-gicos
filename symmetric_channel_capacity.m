% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Pyx = [.3 .2 .5;
       .5 .3 .2;
       .2 .5 .3] % channel transition matrix

row = Pyx(1,:) % arbitrary row of the channel transition matrix

Hrow = -sum(row.*log2(row),'omitnan') % entropy of the row

[~,n] = size(Pyx) % number of outputs

C = log2(n) - Hrow % symmetric channel capacity
