function [A_k S] = task4(image, k)
  [A n miu] = compute_matrix(image);
  Z = A * (A' / (n-1));
 [V S] = eig(Z);
 [A_k] = compute_aprox(k, V, A, miu);
endfunction