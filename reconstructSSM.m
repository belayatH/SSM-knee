function F = reconstructSSM(score, pcaResult)
%UNTITLED ���̊�?��̊T�v�������ɋL?q
%   ?�?�?����������ɋL?q

F = score * coeff + latent.';
F = reshape(F, [512, 512, 512]);
end
