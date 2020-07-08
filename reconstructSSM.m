function F = reconstructSSM(score, pcaResult)
%UNTITLED ‚±‚ÌŠÖ?”‚ÌŠT—v‚ð‚±‚±‚É‹L?q
%   ?Ú?×?à–¾‚ð‚±‚±‚É‹L?q

F = score * coeff + latent.';
F = reshape(F, [512, 512, 512]);
end
