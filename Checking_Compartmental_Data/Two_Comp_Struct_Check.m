function [ wrongly_labeled ] = Two_Comp_Struct_Check( Data )
% Checks to make sure that for two
wrongly_labeled={}

% So many for loops very inefficient checking. Can I do this better?


for i=1:size(Data,1)
    Subs=Data{i,2};
    noSub=size(Subs,1);
    for j=1:noSub
        Structs=Subs{j,3};
        noStruct=size(Structs,1);
        for k=1:noStruct
            structnum=Structs{k,1};
            filename=[num2str(structnum),'.mat'];
            load(filename);
            Glycan=glycanStrread(String);
            GlycanName=Glycan.getName;
            if isequal(GlycanName,Structs{k,2})
            else
                wrongly_labeled=[wrongly_labeled;[i,j,k]];
            end
        end
    end
end

end

