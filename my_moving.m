function Q=my_moving(P,R)

        h=imsubtract(P,R);
    
   
    u=h(:,:,1);
    l=graythresh(u);
    p1=im2bw(u,l);
    
%     figure;
%     imshow(p1,[],'initialmagnification','fit');title('moving');
    %I=c{i};
    Q=p1;
    
end