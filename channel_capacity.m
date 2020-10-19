% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Pyx = [.3 .2 .5;
       .5 .3 .2;
       .2 .5 .3] % channel transition matrix

[m,n] = size(Pyx) % number of inputs and outputs

Px = ones(1,m)/m % uniform probability distribution

Hx = log2(m) % entropy of the transmitter (source)

Py = sum(Pyx.*repmat(Px',1,n))
Pxy = (Pyx.*repmat(Px',1,n))./repmat(Py,m,1)

Hxy = sum(sum(repmat(Py,m,1).*Pxy.*log2(1./Pxy),'omitnan')) % conditional entropy of x given y

C = Hx - Hxy % channel capacity

Hrow = -sum(Pyx(1,:).*log2(Pyx(1,:))) % arbitrary row of the channel transition matrix
C = log2(n) - Hrow % symmetric channel capacity

