clc; clear all; close all;
x=VideoReader('f6.mp4');
frames= x.NumberOfFrames;
n=frames;
c=cell(1,ceil(n/2));
disp('Please wait while the program executes');
disp('. ');

cmap=gray(256);

for i=1:50:n
    frames=read(x,i);
    a=i;
    imwrite(frames,['img' int2str(a), '.JPG']);
    c{a}=imread(sprintf('img%d.JPG',a)); 
    c{a}=im2double(c{a});
    I{i}=c{a};
figure;
imshow(c{a},[]);

end
disp('end1')
warning off;
% 
y=[];
for i=1:50:n
    %figure;
    %imshow(c{i},[])
    M = my_chroma(c{i});
    y{i}=M;
    
end
 z=[];
 for i=51:50:n    
    Q=my_moving(c{i},c{i-50});
    z{i}=Q;
 
end    
amya=[];
 for i=51:50:n
     amya{i}=and(y{i},z{i});
     figure;
     imshow(amya{i},[],'initialmagnification','fit');title('opertator');
end 
aish=[];
for i=51:50:n
     aish{i}=bwareafilt(amya{i},1);
     figure;
     imshow(aish{i},[],'initialmagnification','fit');title('filter');
end
for i=51:50:n

 s=regionprops(aish{i},'centroid');
 centroids{i}=cat(1,s.Centroid);
     
 end
 disp('done')
% x=510;y=487;
% for i=1:20:n    
%     J=regiongrowing(I{i},x,y,0.2);
%     z{i}=J;
%     figure;
%     imshow(z{i},[]);
%  
% end    
% disp('done')