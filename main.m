clc;clear;
saliency_map_list = dir(strcat('E:\ALLSALIENCYMAP\','*.png'));  %模型生成显著图
fixtation_map_list = dir(strcat('E:\ALLFIXATIONMAPS\','*_fixMap.jpg'));% 获取真实显著图
gt_map_list = dir(strcat('E:\ALLFIXATIONMAPS\','*_fixPts.jpg'));%真实注视点
len = length(saliency_map_list);

AUC_Borji_sum = 0;
NSS_sum = 0;
CC_sum = 0;
KLDiv_sum = 0;
SIM_sum = 0;


for i = 1:len % 循环获取单张图片 计算指标
    saliency_map_name = saliency_map_list(i).name;
    fixtation_map_name = fixtation_map_list(i).name;
    gt_map_name = gt_map_list(i).name;
    saliency_map = imread(strcat('E:\ALLSALIENCYMAP\', saliency_map_name));
    fixtation_map = imread(strcat('E:\ALLFIXATIONMAPS\', fixtation_map_name));
    gt_map = imread(strcat('E:\ALLFIXATIONMAPS\', gt_map_name));



    AUC_Borji_sum = AUC_Borji_sum + AUC_Borji(saliency_map,fixtation_map, 100,0.1, 0);
    NSS_sum = NSS_sum + NSS(saliency_map,fixtation_map);
    CC_sum = CC_sum + CC(saliency_map, gt_map);
    KLDiv_sum = KLDiv_sum + KLdiv(saliency_map, fixtation_map);
    SIM_sum = SIM_sum + similarity(saliency_map, gt_map, 0);
end

AUC_Borji_avg = AUC_Borji_sum / len;
NSS_avg = NSS_sum / len;
CC_avg = CC_sum / len;
KLDiv_avg = KLDiv_sum / len;
SIM_avg = SIM_sum / len;





