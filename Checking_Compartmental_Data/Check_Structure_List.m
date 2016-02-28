function [ wrongly_labeled ] = Check_Structure_List( Structures_List )
%Checks that the XML numbering matches with the structure list numbers. 
wrongly_labeled=[]
for i=3:length(Structures_List)
    filename=[num2str(i),'.mat'];
    load(filename);
    Glycan=glycanStrread(String);
    GlycanName=Glycan.getName;
    if isequal(GlycanName,Structures_List{i,2})
    else
        a='no'
        i
        wrongly_labeled=[wrongly_labeled,i];
    end
end

