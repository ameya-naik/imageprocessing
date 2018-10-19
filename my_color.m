function N=my_color(I)
% [R,C]=size(I);
a=I(:,:,1);
% figure;
% imshow(a);title('sas');
[R,C]=size(a);
ss=I(:,:,2);
sss=I(:,:,3);

for i=1:R
    for j=1:C
        if a(i,j)>0.8 
            a(i,j)=1;
        else
            a(i,j)=0;
        end
    end
end
%figure;
%imshow(a,[]);title('hhh');
N=a;
end