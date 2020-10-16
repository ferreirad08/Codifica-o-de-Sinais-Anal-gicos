% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Px = [1/4 1/4 1/2] % symbol/message probabilities
Pyx = [1 0 0; 0 1 0; 1/2 1/2 0] % channel matrix

Hx = -sum(Px.*log2(Px)) % entropy of the transmitter (source)

[m,n] = size(Pyx) % number of inputs and outputs

Py = sum(Pyx.*repmat(Px',1,n))
Pxy = (Pyx.*repmat(Px',1,n))./repmat(Py,m,1)

Hy = -sum(Py.*log2(Py),'omitnan') % entropy of the receiver

Hxy = sum(sum(repmat(Py,m,1).*Pxy.*log2(1./Pxy),'omitnan')) % conditional entropy of x given y

Ixy = Hx - Hxy % mutual information of x and y

