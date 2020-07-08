function q = calcQuatFromAtoB(a, b)
%CALCQUATFROMATOB 

cosTheta = dot(a,b);

if abs(cosTheta) > 0.999
    u = cross([0, 0, 1], a);
    theta = acos(cosTheta) / 2;
    s = sin(theta);
    if cosTheta < 0
        q(1) = cos(theta);
        q(2) = u(1) * s;
        q(3) = u(2) * s;
        q(4) = u(3) * s;
    else
        q(1) = cos(theta);
        q(2) = u(1) * s;
        q(3) = u(2) * s;
        q(4) = u(3) * s;
    end
else
    u = cross(a, b); 
    u = u / norm(u);   
    
    s = sqrt((1 + cosTheta) * 2);
    invs = 1 / s;

%     q(1) = s * 0.5;
%     q(2) = u(1) * invs;
%     q(3) = u(2) * invs;
%     q(4) = u(3) * invs;  
    theta = acos(cosTheta) / 2;
    s = sin(theta);
    q(1) = cos(theta);
    q(2) = u(1) * s;
    q(3) = u(2) * s;
    q(4) = u(3) * s;
end
end

