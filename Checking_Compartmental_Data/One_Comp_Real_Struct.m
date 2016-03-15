function [ wrongly_labeled ] = One_Comp_Real_Struct( Data )
%This checks that the structures saved as XML files are matched with the
%numbers. 
wrongly_labeled={}
for i=1:size(Data,1)
    for j=1:size(Data{i,6},1)
        structnum=Data{i,6}{j,1};
        filename=[num2str(structnum),'.mat'];
        load(filename);
        Glycan=glycanStrread(String);
        GlycanName=Glycan.getName;
        if isequal(GlycanName,Data{i,6}{j,2})
        else
            wrongly_labeled=[wrongly_labeled;[i,j]]
        end
            
    end
end

end

