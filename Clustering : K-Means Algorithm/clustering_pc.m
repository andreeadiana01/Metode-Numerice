% computes the NC centroids corresponding to the given points using K-Means

function centroids = clustering_pc(points, NC)
	centroids = [];
  %numarul de coloane
  col_number = size(points, 2);
  %numarul de randuri
  rows_number = size(points, 1);
  %se initializeaza matricea de centroizi cu 0 
  %matricea va avea atatea linii cati centroizi
  %si atatea coloane cat matricea de puncte(3)
  centroids = zeros(NC, col_number);
  %se aleg random puncte
  rows = randperm(rows_number);
  %se selecteaza doar atatea puncte cate clustere exista
  r = rows(1:NC);
  %s-a creat matricea de centroizi
  centroids = points(r, :);
 
  %vector care va asigna punctele unui cluster
  aux = zeros(1,rows_number);
  %am nevoie de un numar mai mare de iteratii
  for i= 1 : 35
     cluster_total = zeros(NC, col_number);
     cluster_size = zeros(NC, 1);
    for j= 1 : rows_number
        var_aux = 1;
        %calculul distantei de la primul punct la primul centroid
        dist_min = norm(points(j,:) - centroids(1,:), 2)^2;
        for iter=2:NC
        %calculul distantei de la un punct la un centroid
        dist_eucl = norm(points(j,:) - centroids(iter,:), 2)^2;
        if(dist_min > dist_eucl)
          dist_min = dist_eucl;
          %asignarea punctelor in clustere
        var_aux = iter;
        endif
   end
 aux(j)= var_aux;
 %se pastreaza in cluster_size indecsii centroizilor
 cluster_size(var_aux) = cluster_size(var_aux) + 1;
 %se pastreaza in cluster_total suma coordonatelor punctelor dintr-un cluster
 cluster_total(var_aux, :) = points(j, :) + cluster_total(var_aux, :);
end

new_centroids = zeros(NC, col_number);
for i=1:NC
  %calcularea pozitiilor considerand centroizii ca fiind centre de masa ale punctelor din cluster
  new_centroids(i, :) = cluster_total(i,:) / cluster_size(i) ;
end
     mod = abs(new_centroids - centroids);
     %centrele se suprapun daca diferenta dintre cele vechi si cele noi este mai mica decat epsilon
     %adica este foarte mica
  if sum(sum(mod)) < eps
    %daca centrele se suprapun, se termina programul
    break;
  endif
  centroids = new_centroids;
 end