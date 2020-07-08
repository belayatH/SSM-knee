function destImg = affineTransformation( srcImg, q, srcO, destO, srcRes, destRes, destDim)
%ROTATEPT rotate 3D point (pIn) using quaternion (q)
%   
srcDim = size(srcImg);
destImg = zeros(destDim, 'int8');
qI = quatInv(q);
destPt = zeros(1, 3, 'double');

for zDest = 1:destDim(3)
    destPt(3) = (zDest - destO(3)) * destRes(3);
    for yDest = 1:destDim(2)
        destPt(2) = (yDest - destO(2)) * destRes(2);
        for xDest = 1:destDim(1)
            destPt(1) = (xDest - destO(1)) * destRes(1);
            srcPt = floor(rotatePt(destPt, qI) ./ srcRes + srcO + .5);            
            if srcPt(1) >= 1 && srcPt(1) <= srcDim(1) && srcPt(2) >= 1 && srcPt(2) <= srcDim(2) && srcPt(3) >= 1 && srcPt(3) <= srcDim(3)
                destImg(xDest, yDest, zDest) = srcImg(srcPt(1), srcPt(2), srcPt(3));
            end
        end
    end
end
