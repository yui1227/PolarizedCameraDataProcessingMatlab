clear;clc;

folderPath=uigetdir;
imageCount=10;
blurKernel=0;

disp(['選擇的資料夾位置' folderPath])
foldersStruct=dir(sprintf("%s/*deg*",folderPath));
x=(0:10:180);
expdata=zeros([1 length(x)]);

for idx=1:length(foldersStruct)
    folderName(idx)=sprintf("%s",foldersStruct(idx).name);
    degreeFound=str2num(regexp(folderName(idx),"^\d+","match"));
    expdata(find(x==degreeFound,1))=get100mean(fullfile(folderPath,folderName(idx)),imageCount,blurKernel);
end
disp([x;expdata]')