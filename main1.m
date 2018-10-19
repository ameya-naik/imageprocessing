clc; clear all; close all;
x=VideoReader('video 5.mp4');
%965beta
frames= x.NumberOfFrames;
n=frames;
c=cell(1,ceil(n/2));
disp('Please wait while the program executes');
disp('. ');

cmap=gray(256);

outputVideo=VideoWriter('gg2.avi');
outputVideo.FrameRate=10;
open(outputVideo)

for i=1:10:n
    frames=read(x,i);
    a=i;
    imwrite(frames,['img' int2str(a), '.JPG']);
    c{a}=imread(sprintf('img%d.JPG',a)); 
    c{a}=im2double(c{a});
    [r1,c1]=size(c{a});
figure;
imshow(c{a},[]);

end
disp('end1')
warning off;

y=[];
for i=1:10:n
%     figure;
%     imshow(c{i},[])
    M = my_chroma(c{i});
    y{i}=M;
%     a=i;
%     imwrite(M,['img' int2str(a), '.JPG']);
%     e{a}=imread(sprintf('img%d.JPG',a)); 
%     figure;
% imshow(e{a},[]);
% [B,L,N] = bwboundaries(e{a});
% hold on;
% for k=1:length(B)
%     ed = B{k};
%     if(k < N)
%         
%         plot(ed(:,2),ed(:,1),'r','LineWidth',2);
%     
%     end
% 
% 
% end
end
ef=[];
for i=1:10:n    
    N=my_color(c{i});
    ef{i}=N;
 
end    
 z=[];
 for i=11:10:n    
    Q=my_moving(c{i},c{i-10});
    z{i}=Q;
 
end    
amya=[];
 for i=11:10:n
     amya{i}=and(y{i},z{i});
      [r1,c1]=size(c{a});
%       figure;imshow(amya{i},[]);title('and');
end 
aish=[];
for i=11:10:n
     aish{i}=bwareafilt(amya{i},1);
     [r,c]=size(aish{i}) ;                                                                                    
%      figure;
%      imshow(aish{i},[],'initialmagnification','fit');title('filter');
end

for i=11:10:n
   if aish{i}==0
   break;
   else C = my_centroid(aish{i});

xpoint(i)=C(:,1);
ypoint(i)=C(:,2);
   end
end
 disp('done')
for i=11:10:n
    y{i}=im2double(y{i});
end

 connct=[];
 for i=11:10:n
     if aish{i}==0
         break;
         
     else    
     BW3 = grayconnected(y{i},ypoint(i),xpoint(i),0.3);
%  figure,imshow(BW3,[]);title('fire');
 connect{i}=BW3;
     end
 end
  plus=[];
 for i=11:10:n
     plus{i}=connect{i}+ amya{i};
     plus{i}=plus{i}>0.1;
 figure,imshow(plus{i},[]);title('final');
%  a=i;
%     imwrite( plus{i},['img' int2str(a), '.JPG']);
%     e{a}=imread(sprintf('img%d.JPG',a)); 
%     figure;
% imshow(e{a},[]);
% [B,L,N] = bwboundaries(e{a});
% hold on;
% for k=1:length(B)
%     ed = B{k};
%     if(k < N)
%         
%         plot(ed(:,2),ed(:,1),'r','LineWidth',2);
%     
%     end
% 
% 
% end
xx=ceil((i-1)/10);
plus{xx}=plus{i};
   u=im2uint8(plus{xx});
   
 writeVideo(outputVideo,u)
      
    %F(xx)=im2frame(u,cmap);
 
 end
close all
 
disp('Endfinal');
%implay(F)
close(outputVideo)
%implay('f9.1.avi')
