function view_cost_vs_nc(file_points)
  %citirea matricii de puncte
   points = dlmread(file_points, ' ', 5 , 0);
   cost = [];
   %apelarea functiilor de la pasii anteriori
   for i = 1:10
     centroids = clustering_pc(points,i);
     cost(i) = compute_cost_pc(points,centroids);
   endfor
   plot(1:10,cost(:));
end

