% 波片造成的相位延遲量理論模擬
clear;clc;
% P光
light_source=[1;0];
% pi為半波片 pi/2為四分之一波片
phaseDelay=pi/2;
L=1000;
retarderRotateAngle=linspace(0,pi,L);
ef0=zeros([L 2]); ef45=ef0; ef90=ef0; ef135=ef0;

%exp_file = uigetfile;
%[path,filename,ext]=fileparts(exp_file);
%disp(['選擇了檔案 ' exp_file])
%load(exp_file);

% 把算出來的水平方向和垂直方向的電場放到結果裡
% 算出來會是column vector分別代表x y的電場分量，放到matrix裡
for idx=1:length(retarderRotateAngle)
        ef0(idx,:)=Polarizer(0)*Retarder(retarderRotateAngle(idx),phaseDelay)*light_source;
        ef45(idx,:)=Polarizer(pi/4)*Retarder(retarderRotateAngle(idx),phaseDelay)*light_source;
        ef90(idx,:)=Polarizer(pi/2)*Retarder(retarderRotateAngle(idx),phaseDelay)*light_source;
        ef135(idx,:)=Polarizer(pi/4*3)*Retarder(retarderRotateAngle(idx),phaseDelay)*light_source;
end

ef0=abs(ef0);
ef45=abs(ef45);
ef90=abs(ef90);
ef135=abs(ef135);

% 把水平垂直方向合成
i0=sqrt(ef0(:,1).^2+ef0(:,2).^2).^2;
i45=sqrt(ef45(:,1).^2+ef45(:,2).^2).^2;
i90=sqrt(ef90(:,1).^2+ef90(:,2).^2).^2;
i135=sqrt(ef135(:,1).^2+ef135(:,2).^2).^2;

delta=atan2((i0-i90),(i45-i135));
retarderRotateAngle_diff=rad2deg(retarderRotateAngle(2:length(retarderRotateAngle)))-rad2deg(retarderRotateAngle(1:length(retarderRotateAngle)-1));
delta_diff=delta(2:length(delta))-delta(1:length(delta)-1);

figure,plot( ...
        rad2deg(retarderRotateAngle_diff),delta_diff,...
        "LineWidth",2)
xlabel('Retarder Rotate Angle Difference \theta_{n}-\theta_{n-1} (Degree)',FontSize=15);
ylabel("Phase Delay Difference \delta_{\theta_{n}}-\delta_{\theta_{n-1}} (Radian)",FontSize=15);
legend('理論')