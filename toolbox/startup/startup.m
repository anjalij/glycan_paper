% Please note here that the user should replace '<GNATInstallationDir>' in 
% line 10 by absolute GNAT installation directory.
function startup
% startup add Java class path to MATLAB java path
% in the system when MATLAB starts

% Author: Gang Liu
% CopyRight 2012 Neelamegham Lab

gnatpath='/home/anjali/Applications/MATLAB/R2014a/toolbox/GNAT';
addJavaJARPath(gnatpath);
end

%load GNAT java class path
function addJavaJARPath(gnatpath)
if(ispc)
    jalibpath = [gnatpath '/toolbox/javalibs'];
    jarFiles = dir([jalibpath '/*.jar']);
else
    jalibpath = [gnatpath '/toolbox/javalibs'];
    jarFiles = dir([jalibpath '/*.jar']);
end

for i=1: length(jarFiles)
    fileName = jarFiles(i).name;
    fullFileName = which(fileName);
    if(~existnJavaClassPath(fileName))
        javaaddpath(fullFileName);
    end
end
end

function existFile = existnJavaClassPath(fileName)
spath = javaclasspath('-all');
[pathstr,name,ext]=fileparts(fileName);
partFileName = [name ext];

for i=1: length(spath)
    [pathstr,name,ext]=fileparts(char(spath(i)));
    sfileName = [name ext];
    if(strcmp(partFileName,sfileName))
        existFile = true;
        return
    end
end
existFile = false;
end
