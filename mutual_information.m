% Author: Prof. M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: October 2020

Px = [1/4 1/4 1/2] % symbol/message probabilities
Pzx = [1 0 0;
       1 0 0;
       0 1 0] % channel transition matrix

Hx = -sum(Px.*log2(Px)) % entropy of the transmitter (source)

[m,n] = size(Pzx) % number of inputs and outputs

Pz = sum(Pzx.*repmat(Px',1,n))
Pxz = (Pzx.*repmat(Px',1,n))./repmat(Pz,m,1)

Hz = -sum(Pz.*log2(Pz),'omitnan') % entropy of the receiver

Hxz = sum(sum(repmat(Pz,m,1).*Pxz.*log2(1./Pxz),'omitnan')) % conditional entropy of x given z

Ixz = Hx - Hxz % mutual information of x and z
