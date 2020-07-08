function task5(image,k)
  A = double(imread(image));
  m = size(A, 1);
  n = size(A, 2);

  figure(1);
  [A_k S] = task3(image, k);
  vec = diag(S);
  plot(vec);
  
  figure(2);
  suma = 0;
  suma2 = 0;
  k2 = size(vec);
  for i = 1 : min(m, n)
    suma += vec(i);
  endfor
  [Z_k S_k] = task3(image, k2);
  vec2 = diag(S_k);
  for i = 1 : k2
    suma2 += vec2(i);
    sig(i) = suma2 / suma;
  endfor
  plot([1:k2],sig);

 figure(3);
 rxc = prod(size(A));
   for p = 1 : k2
      [A_k2 S_k2] = task3(image,p);
      square = 0;
   for i = 1 : m
     for j = 1 : n
      square += (A(i, j) - A_k2(i, j)) * (A(i, j) - A_k2(i, j));
    endfor
  endfor
  sigma2(p) = square;
  endfor
  plot([1 : k2], sigma2 / rxc);
  
  figure(4);
  for i = 1 : k2
    mem_oc(i) = 2 * i + 1; 
  endfor
  plot([1:k2], mem_oc / n);
  
  
end