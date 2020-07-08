function Q = calcRotationQuaternion(a1, a2)

% a1, a2, a3 are fist, second and third dimension of femur coordiante system repectively 
% a1, a2, a3 are medial lateral axis, body axis , anterior poterior axis
% vector
%a3 = cross(a1,a2); % I am not sure about it, whether cross or outer product

% x, y, z are fist, second and third dimension of base space repectively 

% Base space
x = [1 0 0];  % medial lateral axis
y = [0 1 0];  % body axis
z = [0 0 1];  % anerior posterior axis

% Calculating Quternion to align a1 to x axis
Q1 = calcQuatFromAtoB(a1, x);   % Rotational axis and angle calculation for first dimension (a1)
Qa1R = rotatePt(a1, Q1);        % Rotate matrix according to rot. axis and angle

% Rotate a2 axis using the Quaternion, Q1
Qa2R = rotatePt(a2, Q1);
Qa2R = Qa2R / norm(Qa2R);

% rotate along X axis to align Qa2R to y axis 
cosTheta = dot(Qa2R, y);
theta = acos(cosTheta);
Q2 = getQuatFromRot(x, theta);

% Multiple Q1 and Q2
Q = quatMulti(Q2,Q1);


% check
out1 = rotatePt(a1, Q);
out2 = rotatePt(a2, Q);

end
