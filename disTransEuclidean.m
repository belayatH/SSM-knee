function outImg = disTransEuclidean( inImg )
%DISTRANSEUCLIDEAN この関数の概要をここに記述
%   詳細説明をここに記述

dim = size(inImg);
outImg = zeros(dim, 'int16');
imgM = zeros(dim, 'int8');

nei = [[-1 0 0]; [1 0 0]; [0 -1 0]; [0 1 0]; [0 0 -1]; [0 0 1]];
noNei = size(nei);
maxPt = 10000000;

stackX = zeros(2, maxPt, 'int16');
stackY = zeros(2, maxPt, 'int16');
stackZ = zeros(2, maxPt, 'int16');
noPt  = zeros(1, 2, 'int64');

for z = 1:dim(3)
    disp(z);
    for y = 1:dim(2)
        for x = 1:dim(1)
            if inImg(x, y, z) ~= 0
%                 fprintf('\t[%3d,%3d,%3d] %3d\n', x, y, z, inImg(x, y, z));
                for i = 1:noNei(1)
                    lx = x + nei(i, 1);
                    ly = y + nei(i, 2);
                    lz = z + nei(i, 3);
                    if lx >= 1 && lx <= dim(1) && ly >= 1 && ly <= dim(2) && lz >= 1 && lz <= dim(3)
%                         fprintf('\t\t%d [%3d,%3d,%3d] %3d\n', i, lx, ly, lz, inImg(lx, ly, lz));
                        if inImg(lx, ly, lz) == 0
                            % boundary
                            imgM(x, y, z) = 127;
                            noPt(1) = noPt(1) + 1;
                            stackX(1, noPt(1)) = x;
                            stackY(1, noPt(1)) = y;
                            stackZ(1, noPt(1)) = z;
                            break;
                        end
                    end
                end
            end
        end
    end
end

% img2D = (squeeze(imgM(:,:,10)))';
% imshow(img2D);  


turn = 1; 
nextTurn = 2; 
dis = 1;

while noPt(turn) ~= 0
    fprintf('turn = %1d %3d %8d\n', turn, dis, noPt(turn));
    img2D = (squeeze(outImg(:,:,5)))';
    imshow(img2D, 'DisplayRange',[-127 127]);  
    
    for turnNo = 1:noPt(turn)
        x = stackX(turn, turnNo);
        y = stackY(turn, turnNo);
        z = stackZ(turn, turnNo);
        for i = 1:noNei(1)
            lx = x + nei(i, 1);
            ly = y + nei(i, 2);
            lz = z + nei(i, 3);
            if lx >= 1 && lx <= dim(1) && ly >= 1 && ly <= dim(2) && lz >= 1 && lz <= dim(3)
                if imgM(lx, ly, lz) == 0
                    imgM(lx, ly, lz) = 1;
                    noPt(nextTurn) = noPt(nextTurn) + 1;
                    stackX(nextTurn, noPt(nextTurn)) = lx;
                    stackY(nextTurn, noPt(nextTurn)) = ly;
                    stackZ(nextTurn, noPt(nextTurn)) = lz;
                    if inImg(lx, ly, lz) == 0
                        outImg(lx, ly, lz) =  dis;
                    else
                        outImg(lx, ly, lz) = -dis;
                    end
                end
            end
        end
    end
    noPt(turn) = 0;
    
    if turn == 1
        turn = 2; nextTurn = 1;
    else
        turn = 1; nextTurn = 2;
    end
    dis = dis + 1;
end
end

