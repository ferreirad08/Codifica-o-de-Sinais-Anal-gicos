% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Px = [1/3 2/3] % probabilidades dos símbolos da fonte
Pyx = [2/3 1/3; 1/10 9/10] % matriz de canal

Hx = -sum(Px.*log2(Px)) % entropia de x

Py = sum(Pyx.*repmat(Px',1,2))

Pxy = (Pyx.*repmat(Px',1,2))./repmat(Py,2,1) % probabilidades condicionais a posteriori

Hxy = repmat(Py,2,1).*Pxy.*log2(1./Pxy);
Hxy = sum(Hxy(:)) % entropia condicional de x dado y

Hy = -sum(Py.*log2(Py)) % entropia de y

Ixy = Hx - Hxy % informação mútua de x e y

Hyx = Hy - Ixy % entropia condicional de y dado x
