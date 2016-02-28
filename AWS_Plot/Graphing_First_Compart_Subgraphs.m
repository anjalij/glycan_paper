clear vars
close all
Gal_Data = dlmread('Gal_Data_2.txt','');
GlcNac_Data=dlmread('GlcNac_Data_2.txt','');



%figure for the scaling of number of structures with number of nodes
figure
Gal_Structures=[];
Gal_Structures=[Gal_Data(:,1),Gal_Data(:,2)]
Gal_Structures=unique(Gal_Structures,'rows')
Gal_Structures=[Gal_Structures,zeros(length(Gal_Structures(:,1)),1)]



for i=1:length(Gal_Structures)
    for j=1:length(Gal_Data(:,1))
        if Gal_Structures(i,1:2)==Gal_Data(j,1:2)
            Gal_Structures(i,3)=Gal_Structures(i,3)+1
        end
    end
end

A=9.*Gal_Structures(:,3)
GlcNac_Structures=[];
GlcNac_Structures=[GlcNac_Data(:,1),GlcNac_Data(:,2)]
GlcNac_Structures=unique(GlcNac_Structures,'rows')
GlcNac_Structures=[GlcNac_Structures,zeros(length(GlcNac_Structures(:,1)),1)]



for i=1:length(GlcNac_Structures)
    for j=1:length(GlcNac_Data(:,1))
        if GlcNac_Structures(i,1:2)==GlcNac_Data(j,1:2)
            GlcNac_Structures(i,3)=GlcNac_Structures(i,3)+1
        end
    end
end

B=9.*GlcNac_Structures(:,3)



scatter(Gal_Structures(:,1),Gal_Structures(:,2),A)

hold on
scatter(GlcNac_Structures(:,1),GlcNac_Structures(:,2),B,'r')

title('Scaling of Glycan Intermediates with Number of Enzymes');
xlabel('Number of Enzymes in Subset'); % x-axis label
ylabel('Number of Structural Intermediates'); % y-axis label
legend('Gal Subgraphs','GlcNac Subgraphs')


figure
scatter(Gal_Structures(:,1),log10(Gal_Structures(:,2)),A,'b')
hold on
scatter(GlcNac_Structures(:,1),log10(GlcNac_Structures(:,2)),B,'r')

%title('Scaling of Glycan Intermediates with Number of Enzymes');
xlabel('Number of Enzymes in Subset'); % x-axis label
ylabel('Log(Number of Structural Intermediates)'); % y-axis label
legend('Gal Subgraphs','GlcNac Subgraphs')

figure
xbins=[1:9];
hist(Gal_Data(:,1).',xbins)
title('Histogram of Size of Enzyme Subset');
xlabel('Number of Enzymes in Subset') % x-axis label
ylabel('Frequency') % y-axis label

Gal_Enz_Subsets=[[1:9]',zeros(9,1)]

for i=1:length(Gal_Enz_Subsets)
    for j=1:length(Gal_Data(:,1))
        if Gal_Enz_Subsets(i,1)==Gal_Data(j,1)
            Gal_Enz_Subsets(i,2)=Gal_Enz_Subsets(i,2)+1;
        end
    end
end
Gal_Subset_Mean=wmean(Gal_Enz_Subsets(:,1),Gal_Enz_Subsets(:,2));
Gal_Subset_Var=var(Gal_Enz_Subsets(:,1),Gal_Enz_Subsets(:,2))

figure
xbins=[1:9];
hist(GlcNac_Data(:,1).',xbins)
%title('Histogram of Size of Enzyme Subset');
xlabel('Number of Enzymes in Subset') % x-axis label
ylabel('Frequency') % y-axis label


GlcNac_Enz_Subsets=[[1:9]',zeros(9,1)]

for i=1:length(GlcNac_Enz_Subsets)
    for j=1:length(GlcNac_Data(:,1))
        if GlcNac_Enz_Subsets(i,1)==GlcNac_Data(j,1)
            GlcNac_Enz_Subsets(i,2)=GlcNac_Enz_Subsets(i,2)+1;
        end
    end
end
GlcNac_Subset_Mean=wmean(GlcNac_Enz_Subsets(:,1),GlcNac_Enz_Subsets(:,2))
GlcNac_Subset_Var=var(GlcNac_Enz_Subsets(:,1),GlcNac_Enz_Subsets(:,2))

figure

Gal_Max_Sizes=[Gal_Data(:,1),Gal_Data(:,4)]
Gal_Mac_Sizes=unique(Gal_Max_Sizes,'rows')
Gal_Max_Sizes=[Gal_Max_Sizes,zeros(length(Gal_Max_Sizes(:,1)),1)]



for i=1:length(Gal_Max_Sizes)
    for j=1:length(Gal_Data(:,1))
        if Gal_Max_Sizes(i,1:2)==Gal_Data(j,[1,4])
            Gal_Max_Sizes(i,3)=Gal_Max_Sizes(i,3)+1;
        end
    end
end

Gal_Scaling=9.*Gal_Max_Sizes(:,3)


GlcNac_Max_Sizes=[GlcNac_Data(:,1),GlcNac_Data(:,4)];
GlcNac_Mac_Sizes=unique(GlcNac_Max_Sizes,'rows');
GlcNac_Max_Sizes=[GlcNac_Max_Sizes,zeros(length(GlcNac_Max_Sizes(:,1)),1)];



for i=1:length(GlcNac_Max_Sizes)
    for j=1:length(GlcNac_Data(:,1))
        if GlcNac_Max_Sizes(i,1:2)==GlcNac_Data(j,[1,4])
            GlcNac_Max_Sizes(i,3)=GlcNac_Max_Sizes(i,3)+1;
        end
    end
end

GlcNac_Scaling=9.*GlcNac_Max_Sizes(:,3);

scatter(Gal_Max_Sizes(:,1),Gal_Max_Sizes(:,2),Gal_Scaling)

hold on

scatter(GlcNac_Max_Sizes(:,1),GlcNac_Max_Sizes(:,2),GlcNac_Scaling,'r')

%title('Scaling of Glycan Max Size with Number of Enzymes')
xlabel('Number of Enzymes in Subset') % x-axis label
ylabel('Maximum Glycan Size') % y-axis label
legend('Gal Subgraphs','GlcNac Subgraphs')

figure
plotmatrix(Gal_Data(:,1),Gal_Data(:,3))
%title('Scaling of Number of Reactions with Number of Enzymes')
xlabel('Number of Enzymes in Subset') % x-axis label
ylabel('Number of Reactions') % y-axis label
legend('Gal Subgraphs','GlcNac Subgraphs')

%stupidly getting binomial distribution
figure
ksubsets=[];
num_enzymes=9;
for i=1:num_enzymes
    ksubsets(i)=nchoosek(num_enzymes,i)
end
bar(ksubsets)

Binomial_Mean=wmean([1:9]',ksubsets')
Binomial_Var=var([1:9]',ksubsets')
length(Gal_Structures)

Variances=[Binomial_Var,GlcNac_Subset_Var,Gal_Subset_Var]
Means=[Binomial_Mean,GlcNac_Subset_Mean,Gal_Subset_Mean]