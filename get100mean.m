function meanValueOf100by100 = get100mean(filePath,imageCount,blurKernel)
    i0=zeros([1024 1224]); i45=i0; i90=i0; i135=i0;
    for idx=1:imageCount
        i0=i0+im2double(imread(fullfile(filePath,[num2str(idx) '_0deg_' num2str(blurKernel) '.png'])));
        i45=i45+im2double(imread(fullfile(filePath,[num2str(idx) '_45deg_' num2str(blurKernel) '.png'])));
        i90=i90+im2double(imread(fullfile(filePath,[num2str(idx) '_90deg_' num2str(blurKernel) '.png'])));
        i135=i135+im2double(imread(fullfile(filePath,[num2str(idx) '_135deg_' num2str(blurKernel) '.png'])));
    end

    i0=i0./imageCount;
    i45=i45./imageCount;
    i90=i90./imageCount;
    i135=i135./imageCount;

    phase = atan2((i0-i90),(i45-i135));

    figure("Name",filePath)
    m=mesh(phase);
    view(2)
    datatip(m,612,512);
    axis([0 1224 0 1024 min(phase,[],"all") max(phase,[],"all")])
    degreefound=regexp(filePath,"\d+deg","match");
    titleText = ['The phase of ' degreefound ' in radian'];
    title(sprintf('%s%s%s',titleText(1),titleText(2),titleText(3)))
    colorbar

    centerArea=centerCropWindow2d(size(phase),[100 100]);
    cropped100by100=imcrop(phase,centerArea);
    meanValueOf100by100=mean(cropped100by100,"all");
    disp(filePath)
    messages=[degreefound '中心100*100的平均相位為' num2str(meanValueOf100by100)];
    fprintf('%s%s%s\n',messages(1),messages(2),messages(3))
end

