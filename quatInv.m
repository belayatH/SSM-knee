function qOut = quatInv( qIn )
%QUATCONJ calc conjugate of quternion q
%   �ڍא����������ɋL�q

qOut = qIn;
qOut(1) = -qOut(1);

end

