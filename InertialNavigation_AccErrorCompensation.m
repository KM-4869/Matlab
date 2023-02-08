f1=f_xup*acc_scale*100;
f2=f_xdown*acc_scale*100;
f3=f_yup*acc_scale*100*(-1);
f4=f_ydown*acc_scale*100*(-1);
f5=f_zup*acc_scale*100;
f6=f_zdown*acc_scale*100;
F={f1,f2,f3,f4,f5,f6};
MC=cell(1,6);
for i=1:1:6
    for j=1:1:size(f{i},1)
        m=[f{i}(j,3);f{i}(j,2);f{i}(j,1)];
        mc=M\(m-b);
        MC{i}(j,1)=mc(3,1);
        MC{i}(j,2)=mc(2,1);
        MC{i}(j,3)=mc(1,1);
    end
end

  figure;
subplot(3,1,1);
plot(MC{1}(:,1),'r');
title('acc-x-up:Z axis');
subplot(3,1,2);
plot(MC{1}(:,2),'b');
title('acc-x-up:Y axis');
subplot(3,1,3);
plot(MC{1}(:,3),'g');
title('acc-x-up:X axis');



