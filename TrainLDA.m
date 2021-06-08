%Training LDA

function [w,meanY1, meanY2] = TrainLDA(X1, X2)
   %Calculate mean for each class
   

    meanX1 =(mean(X1'))';% for the first class
    meanX2 =(mean(X2'))';% for the second class


    %Covariance matrix SX1 и SX2 
    tmp1 = zeros(size(X1));
    for ii = 1:size(X1,2)
        tmp1(:,ii) = X1(:,ii) - meanX1;
    end
    SX1 = tmp1*tmp1';

    tmp2 = zeros(size(X2));
    for ii = 1:size(X2,2)
        tmp2(:,ii) = X2(:,ii) - meanX2;
    end
    SX2 = tmp2*tmp2';
 
 
   

    %Calculate scatter matrix 
    Sw = SX1 + SX2;

    %Calculate reverse matrix
    SwP = inv(Sw);


    %Calculate vector, determining the optimal projection direction.
    w = SwP * (meanX1 - meanX2);
    
    %Calculate the values of the projection direction for the first and 
    %second class of the training sample
 
    Y1 = w' * X1;% for the first class
    Y2 = w' * X2;% for the second class
    
    %Calculate the average of the projection of the first and second class. 
    meanY1 = mean(Y1);%For projection first class
    meanY2 = mean(Y2);% For projection second class

end