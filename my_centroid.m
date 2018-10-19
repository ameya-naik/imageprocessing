function C = my_centroid(r)
s=regionprops(r,'centroid');
centroids=cat(1,s.Centroid);
%imshow(I)
%hold(imgca,'on')
 %plot(imgca,centroids(:,1), centroids(:,2), 'r*')
% %hold(imgca,'off')

 mx=centroids(:,1); mx=round(mx);
 my=centroids(:,2);my=round(my);

C=[mx,my];
end
