clearvars
%this takes in a table in which the 

Ref_Mass_Data=tdfread('ref_mass_data.txt','\t')

References=unique(Ref_Mass_Data.Ref);
A=zeros(length(References),1);
References=[References,A];
References=num2cell(References)
current_ref=1;
current_structures=[];
for i=1:length(References)
    structures=[];
    for j=1:length(Ref_Mass_Data.Ref)
        B=Ref_Mass_Data.Ref(j);
        C=Ref_Mass_Data.St(j);
        if B==References{i,1}
            structures=[structures,C];
        end
    end
    References{i,2}=structures
end
