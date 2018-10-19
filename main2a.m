clc; clear all; close all;
x=VideoReader('ggk.mp4');
frames= x.NumberOfFrames;
n=frames;
c=cell(1,ceil(n/2));
disp('Please wait while the program executes');
disp('. ');

cmap=gray(256);

outputVideo=VideoWriter('yyy44.mp4');
 outputVideo.FrameRate=10;
 open(outputVideo)

for i=1:10:n
    frames=read(x,i);
    a=i;
    imwrite(frames,['img' int2str(a), '.JPG']);
    c{a}=imread(sprintf('img%d.JPG',a)); 
    c{a}=im2double(c{a});
    [r1,c1]=size(c{a});
% figure;
%imshow(c{a},[]);

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
     [row,col]=size(aish{i}) ;                                                                                    
%      figure;
%      imshow(aish{i},[],'initialmagnification','fit');title('filter');
end

for i=11:10:n
   if aish{i}==0
   break;
   else DD = my_centroid(aish{i});

xpoint(i)=DD(:,1);
ypoint(i)=DD(:,2);
   end
end
 disp('done')
for i=11:10:n
    y{i}=im2double(y{i});
end

 connect=[];
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
     plus{i}=im2double(plus{i});
     
     % figure,imshow(plus{i},[]);
     %plus{i}=bwareaopen(plus{i},10);
     
 figure,imshow(plus{i},[]);title('aa');
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

    %F(xx)=im2frame(u,cmap);
 
 end
 
%  stats=[];
%  for i=11:10:n
%   stats{i} = regionprops('table',plus{i},'Centroid','area','perimeter');
% 
%  end
% 
%  
% kkl=[];g=[]; 
%  for i=11:10:n
%  xyz{i}=cat(3,plus{i},plus{i},plus{i});    
%  g{i}=c{i};   
%   %kkl{i}=cat(2,g{i},plus{i});
% %kkl{i}=im2double(kkl{i});
% 
%   xx=ceil((i-1)/10);
%    kkl{xx}=xyz{i};
%    g{xx}=g{i};
%    
%    kkll{xx}=cat(2,g{xx},kkl{xx});
%    
%     kkd{xx}=double(kkll{xx});
%    
%    writeVideo(outputVideo,kkd{xx})
%   
% 
%  end
% 
%   
% disp('Endfinal');
% %implay(F)
%  close(outputVideo)
% % implay('vidout.avi')
% 
% 
