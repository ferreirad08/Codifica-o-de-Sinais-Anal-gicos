% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Pyx = [1 0 0; 0 1 0; 1/2 1/2 0] % channel transition matrix

[m,n] = size(Pyx) % number of inputs and outputs

Px = ones(1,m)/m % uniform probability distribution

Py = sum(Pyx.*repmat(Px',1,n))
Pxy = (Pyx.*repmat(Px',1,n))./repmat(Py,m,1)

Hxy = sum(sum(repmat(Py,m,1).*Pxy.*log2(1./Pxy),'omitnan')) % conditional entropy of x given y

Hx = log2(m) % entropy of the transmitter (source)

C = Hx - Hxy % channel capacity

Hrow = -sum(Px.*log2(Px))
C = log2(n) - Hrow % symmetric channel capacity

