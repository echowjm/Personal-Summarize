%ͼƬ�ӿ�Ŵ���ʾ������
clear all; clc;
for TestImgIndex=1:1
strh1=strcat('C:\Users\wang\Desktop\1.png');
I = imread(strh1);  
%[1,1]��[91,91]�Ǿ��ε����ϽǺ����½ǵĵ�
%1�ǷŴ���
%4���߿�
%2����ͼ��������ľ���
%1�ǷŴ�ͼ����ʾ�����½ǻ������½� 
I1 = ShowEnlargedRectangle(I,[1,1],[91,91],1.5,4,1,0); 
figure;imshow(I1);  
strw = strcat(num2str(TestImgIndex),'_labeled.png');
imwrite(I1,strw,'png');

end
