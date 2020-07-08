% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% am nevoie de vectorul in care am asignat punctele la pasul 2
  for i= 1 : 35
    for j= 1 : size(points, 1)
        var_aux = 1;
        dist_min = norm(points(j,:) - centroids(1,:), 2)^2;
        for iter=2:size(centroids, 1)
        dist_eucl = norm(points(j,:) - centroids(iter,:), 2)^2;
        if(dist_min > dist_eucl)
          dist_min = dist_eucl;
        var_aux = iter;
        endif
   end
 aux(j)= var_aux;
endfor
%apelez scatter3 care va genera pentru fiecare cluster alta culoare
scatter3(points(:,1),points(:,2),points(:,3),[],aux);
end

