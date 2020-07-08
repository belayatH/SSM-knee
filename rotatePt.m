function pOut = rotatePt( pIn, q)
%ROTATEPT rotate 3D point (pIn) using quaternion (q)
%   

qC  = [q(1), -q(2), -q(3), -q(4)];
qIn = [0, pIn(1), pIn(2), pIn(3)];
qOut = quatMulti(quatMulti(q,qIn),qC);
pOut = [qOut(2), qOut(3), qOut(4)];

end