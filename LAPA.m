%PA 4 - Joanna Abalos 100962263
clear
clc
maxX = 100;
maxY = 100;
V = zeros(maxX,maxY);
iter = 0;
maxiter = 100000;

while iter < maxiter
    V(1,:) = 0;
    V(maxX,:) = 1;

    for m = 2:maxX-1
        for n = 1:maxY
            if n == 1
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1)) * 1/3; %iterate nodes above boundary
            elseif n == maxY
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n-1)) * 1/3; %iterate nodes below boundary
            else
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1)) * 1/4; %iterate all nodes
            end
        end
    end
%     figure (1)
%     E = -1*gradient(V);
%     surf(V.')
    
%     figure (2)
%     quiver(V,E)

    %TAKE 2
    figure(3)
    take2 = imboxfilt(V);
    surf(take2)


    iter = iter + 1;
end



