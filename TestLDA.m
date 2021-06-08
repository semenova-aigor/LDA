%Testing LDA

function predicted_label = TestLDA(meanY1, meanY2, w, X)
    predicted_label = [];
    
    %Setting the cycle by the number of test points
    for ii = 1:length(X)
        %On this guide, find the projections for the first
        %and second class of the test point
        yq = w' * X(:,ii);
        %Сalculate the distances to the first and second class to
        %determine which class the test point belongs to
        qD1 = abs(yq-meanY1);%Distance to the first class
     
        qD2 = abs(yq-meanY2);%Distance to the second class 
        
        %Compare the distances to the first and second class. 
        %The distance that will be the smallest to the 1st or 2nd class,
        %that class will be.
        if qD1 < qD2
            class =  1;
        else
            class = 2;
        end
        predicted_label = [predicted_label; class];
    end
end
