function task2(image)
   figure(1);
   A = double(imread(image));
   dvs = svd(A);
   plot(dvs);
   
   figure(2);
   m = size(A, 1);
   n = size(A, 2);
   k = size(dvs,1);
   sum1 = 0;
   sum2 = 0;
   minim = min(m, n);
   for i = 1 : minim
     sum1 += dvs(i);
   endfor
   A_k = task1(image, k);
   dvs2 = svd(A_k);
   for i = 1 : k
    sum2 += dvs2(i);
    sigma(i) = sum2 / sum1;
   endfor
   plot([1:k], sigma);
   
   figure(3);
   rxc = prod(size(A));
   for p = 1 : k
      A_k2 = task1(image,p);
      square = 0;
   for i = 1 : m
     for j = 1 : n
      square += (A(i, j) - A_k2(i, j)) * (A(i, j) - A_k2(i, j));
    endfor
  endfor
  sigma2(p) = square;
  endfor
  plot([1 : k], sigma2 / rxc);
  
  figure(4)
  for i = 1 : k
    mem_oc(i) = ((m * i) + (n * i) + i); 
  endfor
  plot([1:k], mem_oc / rxc);
end