function A_k = task1(image, k)
  A = double(imread(image));
  [U, S, V] = svd(A);
  m = size(A, 1);
  n = size(A, 2);
  U_k = resize(U, m, k);
  S_k = resize(S, k, k);
  V_k = resize(V, n, k);
  A_k = U_k * S_k * V_k';
end