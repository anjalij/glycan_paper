clear vars
close all
Gal_Data = dlmread('Gal_Data_2.txt','');
GlcNac_Data=dlmread('GlcNac_Data_2.txt','');


%figure for maximum size with number of structures
figure
Gal_Structures=[Gal_Data(:,2),Gal_Data(:,4)]
Gal_Structures=unique(Gal_Structures,'rows')
Gal_Structures=[Gal_Structures,zeros(length(Gal_Structures(:,1)),1)];



for i=1:length(Gal_Structures)
    for j=1:length(Gal_Data(:,1))
        if Gal_Structures(i,2)==Gal_Data(j,4)
            if Gal_Structures(i,1)==Gal_Data(j,2)
               Gal_Structures(i,3)=Gal_Structures(i,3)+1;
            end
        end
    end
end

A=9.*Gal_Structures(:,3);

GlcNac_Structures=[GlcNac_Data(:,2),GlcNac_Data(:,4)];
GlcNac_Structures=unique(GlcNac_Structures,'rows');
GlcNac_Structures=[GlcNac_Structures,zeros(length(GlcNac_Structures(:,1)),1)];



for i=1:length(GlcNac_Structures)
    for j=1:length(GlcNac_Data(:,1))
        if GlcNac_Structures(i,2)==GlcNac_Data(j,4)
            if GlcNac_Structures(i,1)==GlcNac_Data(j,2)
                GlcNac_Structures(i,3)=GlcNac_Structures(i,3)+1
            end
        end
    end
end

B=9.*GlcNac_Structures(:,3)

scatter(Gal_Structures(:,2),log10(Gal_Structures(:,1)),A)

hold on
scatter(GlcNac_Structures(:,2),log10(GlcNac_Structures(:,1)),B)
title('Num of Structures with Max Size')
xlabel('Max Size') % x-axis label
ylabel('Log10(Number of Structures)') % y-axis label
legend('Gal Subgraphs','GlcNac Subgraphs')

