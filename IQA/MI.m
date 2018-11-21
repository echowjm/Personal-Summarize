%Mutual Information 
%��һ������Ϣ���㺯��
function [mi_sum,mi_joint,mi_max,mi_min,mi_sqrt] = MI(a,b)
% ulate MI of a and b in the region of the overlap part

%�����ص�����
[Ma,Na] = size(a);
[Mb,Nb] = size(b);
M=min(Ma,Mb);
N=min(Na,Nb);

%��ʼ��ֱ��ͼ����
hab = zeros(256,256);
ha = zeros(1,256);
hb = zeros(1,256);

%��һ��
if max(max(a))~=min(min(a))
    a = (a-min(min(a)))/(max(max(a))-min(min(a)));
else
    a = zeros(M,N);
end

if max(max(b))-min(min(b))
    b = (b-min(min(b)))/(max(max(b))-min(min(b)));
else
    b = zeros(M,N);
end

a = double(int16(a*255))+1;
b = double(int16(b*255))+1;

%ͳ��ֱ��ͼ
for i=1:M
    for j=1:N
       indexx =  a(i,j);
       indexy = b(i,j) ;
       hab(indexx,indexy) = hab(indexx,indexy)+1;%����ֱ��ͼ
       ha(indexx) = ha(indexx)+1;%aͼֱ��ͼ
       hb(indexy) = hb(indexy)+1;%bͼֱ��ͼ
   end
end

%����������Ϣ��
hsum = sum(sum(hab));
index = find(hab~=0);
p = hab/hsum;
Hab = sum(sum(-p(index).*log(p(index))));

%����aͼ��Ϣ��
hsum = sum(sum(ha));
index = find(ha~=0);
p = ha/hsum;
Ha = sum(sum(-p(index).*log(p(index))));

%����bͼ��Ϣ��
hsum = sum(sum(hb));
index = find(hb~=0);
p = hb/hsum;
Hb = sum(sum(-p(index).*log(p(index))));

%����a��b�Ļ���Ϣ
mi = Ha+Hb-Hab;

%����a��b�Ĺ�һ������Ϣ
mi_sum =2* mi/(Ha+Hb);
mi_joint=mi/Hab;
mi_max= mi/max(Ha,Hb);
mi_sqrt= mi/sqrt(Ha*Hb);
mi_min= mi/min(Ha,Hb);