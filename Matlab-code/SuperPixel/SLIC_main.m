img = imread('C:\Users\wang\Desktop\6.jpeg');
img_size = size(img);   %����Ԫ�أ�ͼ��ĸߡ�ͼ��Ŀ�ͼ���ͨ����
%�趨�����ظ���
K = 2;
%�趨�����ؽ���ϵ��
m_compactness = 20;

%ת����LABɫ�ʿռ�
cform = makecform('srgb2lab');       %rgb�ռ�ת����lab�ռ� matlab�Դ����÷�
img_Lab = applycform(img, cform);    %rgbת����lab�ռ�
%img_Lab = RGB2Lab(img);  %�����ò�֪��Ϊʲô
imshow(img_Lab)
% %����Ե
% img_edge = DetectLabEdge(img_Lab);
% imshow(img_edge)
%�õ������ص�LABXY���ӵ���Ϣ
img_sz = img_size(1)*img_size(2);
superpixel_sz = img_sz/K;
STEP = uint32(sqrt(superpixel_sz));
xstrips = uint32(img_size(2)/STEP);
ystrips = uint32(img_size(1)/STEP);
xstrips_adderr = double(img_size(2))/double(xstrips);
ystrips_adderr = double(img_size(1))/double(ystrips);
numseeds = xstrips*ystrips;
%���ӵ�xy��Ϣ��ʼֵΪ������������������
%���ӵ�Lab��ɫ��ϢΪ��Ӧ����ӽ����ص����ɫͨ��ֵ
kseedsx = zeros(numseeds, 1);
kseedsy = zeros(numseeds, 1);
kseedsl = zeros(numseeds, 1);
kseedsa = zeros(numseeds, 1);
kseedsb = zeros(numseeds, 1);
n = 1;
for y = 1: ystrips
    for x = 1: xstrips 
        kseedsx(n, 1) = (double(x)-0.5)*xstrips_adderr;
        kseedsy(n, 1) = (double(y)-0.5)*ystrips_adderr;
        kseedsl(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 1);
        kseedsa(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 2);
        kseedsb(n, 1) = img_Lab(fix(kseedsy(n, 1)), fix(kseedsx(n, 1)), 3);
        n = n+1;
    end
end
n = 1;
%�������ӵ���㳬���ط���
klabels = PerformSuperpixelSLIC(img_Lab, kseedsl, kseedsa, kseedsb, kseedsx, kseedsy, STEP, m_compactness);
img_Contours = DrawContoursAroundSegments(img, klabels);
imshow(img_Contours)
%�ϲ�С�ķ���
nlabels = EnforceLabelConnectivity(img_Lab, klabels, K); 
%���ݵõ��ķ�����ǩ�ҵ��߽�
img_ContoursEX = DrawContoursAroundSegments_EX(img, nlabels);
imshow(img_ContoursEX)

        
        






