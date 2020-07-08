function [A n miu] = compute_matrix(image)
  A = double(imread(image));
  m = size(A, 1);
  n = size(A, 2);
  miu = zeros(m, 1);
  for i = 1 : m
    miu(i) = mean(A(i,:));
    A(i,:) -= miu(i); 
  endfor
endfunction
