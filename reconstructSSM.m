function F = reconstructSSM(score, pcaResult)


F = score * coeff + latent.';
F = reshape(F, [512, 512, 512]);
end
