%PA 4 - Joanna Abalos 100962263
clear
clc
maxX = 10;
maxY = 10;
V = zeros(maxX,maxY);
V2 = zeros(maxX,maxY);
iter = 0;
maxiter = 1000;

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
    figure (1)
    [Ex, Ey] = gradient(V);
    surf(V.')
    
    figure (2)
    quiver(-Ex,-Ey)



    V2(1,:) = 1;
    V2(maxX,:) = 1;
    V2(:,1) = 0;
    V2(:,maxY) = 0;
    
    %TAKE 2
    figure(3)
    V2 = imboxfilt(V2);
    surf(V2)

    iter = iter + 1;
    pause(0.1)
end


