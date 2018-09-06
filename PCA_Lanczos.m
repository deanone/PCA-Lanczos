function [P] = PCA_Lanczos(X, k)
% tic;
X = X - ones(size(X, 1), 1) * mean(X);
C = cov(X);
[V, T] = LanczosAlgorithm(C, k);
[W, D] = eig(T);
P = V * W;
% toc;
end