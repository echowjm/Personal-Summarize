%图片加框�?��放大显示主函�?
clear all; clc;
for TestImgIndex=1:1
strh1=strcat('F:\�о���\ME\����\���ڶ�߶Ȳв���������������ͼ�񳬷ֱ���\lapsrn-c\7.png');
I = imread(strh1);  
I1 = ShowEnlargedRectangle(I,[170,86],[298,194],3,4,1,1);   %输入参数(img,[x,y][m,n],3,2,2),必要条件m-x=n-y,根据n,m,x,y调整框的大小
I1 = ShowEnlargedRectangle(I,[165,228],[235,280],3,4,1,1);
I1 = ShowEnlargedRectangle(I,[252,253],[279,278],3,4,1,1);
figure;imshow(I1);  
% strw = strcat(num2str(TestImgIndex),'_labeled.png');
% imwrite(I1,strw,'png');

end
