function drawLine(p1, p2, varargin)
%DRAWLINE Deseneaza o linie de la punctul p1 la punctul p2
%   DRAWLINE(p1, p2) - deseneaza o linie de la punctul p1 la punctul p2 si
%   retine figura curenta

plot([p1(1) p2(1)], [p1(2) p2(2)], varargin{:});

end
