function [ P ] = PCA_matlab( X, k )
% tic;
X = X - ones(size(X, 1), 1) * mean(X);
P = pca(X);
P = P(:, 1 : k);
% toc;
end