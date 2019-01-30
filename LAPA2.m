%PA 4 - Joanna Abalos 100962263
clear
clc
maxX = 10;
maxY = 10;
V = zeros(maxX,maxY);
iter = 0;
maxiter = 100000;

while iter < maxiter
    V(1,:) = 1;
    V(maxX,:) = 1;
    V(:,1) = 0;
    V(:,maxY) = 0;


    for m = 2:maxX-1
        for n = 2:maxY-1
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1)) * 1/4; %iterate all nodes
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



