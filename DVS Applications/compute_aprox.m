function [A_k] = compute_aprox(k, V, A, miu)
  for i = 1 : k
    W(:,i) = V(:,i);
   endfor
  Y = W' * A;
  A_k = W * Y + miu;
endfunction
