% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Px = [1/3 2/3] % symbol probabilities
Pyx = [2/3 1/3; 1/10 9/10] % channel matrix

Hx = -sum(Px.*log2(Px)) % entropy of the source

Py = sum(Pyx.*repmat(Px',1,2))
Pxy = (Pyx.*repmat(Px',1,2))./repmat(Py,2,1) % probabilidades condicionais a posteriori

Hy = -sum(Py.*log2(Py)) % entropy of y

Hxy = sum(sum(repmat(Py,2,1).*Pxy.*log2(1./Pxy))) % conditional entropy of x given y

Ixy = Hx - Hxy % mutual information of x and y

Hyx = Hy - Ixy % conditional entropy of y given x
