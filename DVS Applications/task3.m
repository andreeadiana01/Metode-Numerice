function [A_k S] = task3(image, k)
 [A n miu] = compute_matrix(image);
  Z = A'/sqrt(n - 1);
  [U S V] = svd(Z);
 [A_k] = compute_aprox(k, V, A, miu);
endfunction