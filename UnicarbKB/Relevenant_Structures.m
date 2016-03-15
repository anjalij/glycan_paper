%this will create a table with the structures that contain the correct
%residues for comparison.
maxUCstruct=7338;
Irrelevant_Structures={};
Relevant_Structures={};
UnicarbStructDB={};
load('Residues_Used.mat');



for i=1:maxUCstruct
    filename=['Structure_',num2str(i),'.glycoct_xml']
    if exist(filename)
        Glycan=glycanMLread(filename,'glycoct_xml')
        [isMatch,extraEnz]=Special_Residues(Residues,Glycan)
        if isempty(extraEnz)
            Data={i,isMatch,[],[]}
            UnicarbStructDB=[UnicarbStructDB;Data]
            Data2={i,isMatch}
            Relevant_Structures=[Relevant_Structures, Data2]
        else
            Data={i,isMatch,extraEnz(:,1:4),extraEnz(:,5)}
            UnicarbStructDB=[UnicarbStructDB;Data]
            Irrelevant_Structures=[Irrelevant_Structures;Data]
        end
    end
end
