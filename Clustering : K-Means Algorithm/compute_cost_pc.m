function cost = compute_cost_pc(points, centroids)
	cost = 0;
  %am nevoie de vectorul in care au fost asignate punctele in clustere la pasul 2
  aux = zeros(1, size(points, 1));
    for j= 1 : size(points, 1)
        var_aux = 1;
        dist_min = norm(points(j,:) - centroids(1,:), 2)^2;
        for iter=1:size(centroids, 1)
        dist_eucl = norm(points(j,:) - centroids(iter,:), 2)^2;
        if(dist_min > dist_eucl)
          dist_min = dist_eucl;
        var_aux = iter;
        endif
   end
 aux(j)= var_aux;
end

%calculul distantei dintre puncte si centroidul grupului la care apartin
% folosind vectorul de asignare
for i = 1 : size(points,1)
  cost+= norm(points(i,:) - centroids(aux(i),:));
  endfor
  end

