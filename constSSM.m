function [ pcaResult ] = constSSM(imgs)
%CONSTSSM

% http://jp.mathworks.com/help/stats/pca.html#bti6r20-1
% coef  ....   Eigen vectors
%              raw ... feature vector of each eigen vector
% score ....   PCA scores
%              raw ... scores of each subject
% latent ....  Variance of eigenvecot
% tsquared ... T squared value of each subjects
% explained ... contribution ratio of each eigenvector
% mu    ....   mean vector
dim = size(imgs);
disp(dim);

F = reshape(imgs, [dim(1) * dim(2) * dim(3), dim(4)])';
[coeff,score,latent,tsquared,explained,mu] = pca(F);

pcaResult = struct('coeff', coeff, 'score', score, 'latent', latent, 'tsquared', tsquared, 'explained', explained, 'mu', mu, 'dim', dim);

end
