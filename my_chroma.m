function M = my_chroma(I)

%figure
%imshow(I,[],'initialmagnification','fit');
%title('input');
%color
g=rgb2gray(I);
% figure;
 %imshow(g,[]);title('gray');
a=I(:,:,1);

 %figure;
 %imshow(a,[]);title('fire');
l=graythresh(a);
j1=im2bw(a,l);
 %figure;
 %imshow(j1,[]);
 %title('fire white');
f=imsubtract(a,g);
 %figure;
 %imshow(f,[]);
 %title('fire white');
nm=max(f);
nm=nm';
op=max(nm);
mn=min(f);
mn=mn';
po=min(mn);
op=(op+po)/2;
xy=im2bw(f,op);
% figure;
% imshow(xy,[],'initialmagnification','fit');
% title('chroma');

[B,L,N] = bwboundaries(xy);
hold on;
for k=1:length(B),
    ed = B{k};
    if(k < N)
        
        plot(ed(:,2),ed(:,1),'r','LineWidth',2);
    
    end
end
M=xy;
end