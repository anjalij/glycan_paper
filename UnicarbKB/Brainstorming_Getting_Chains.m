%this is my brainstorming space for getting the chains. 
%Can make this more general, but right now does not extract all info, onl


Parent=Glycan.root.linkageChildren.child;
rootName=Parent.residueType.name;
First_Path={rootName;'protein'}
Paths=First_Path

currentChildren=Parent.linkageChildren;

