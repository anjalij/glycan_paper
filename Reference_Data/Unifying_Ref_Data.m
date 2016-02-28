clearvars
load('Papers_by_Reference.mat')
[num,other]=xlsread('Taruns_Data.xlsx')

for i=1:length(References)
    for j=1:length(num)
        if References{i,1}==num(j)
            other{j,8}=num2str(num(j));
            other{j,9}=References{i,2};
        end
    end
end
