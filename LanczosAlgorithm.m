function [V, T] = LanczosAlgorithm(C, k)
[n, m] = size(C);
if (n == m)
	V = zeros(n, k);
    T = zeros(k);
	v = rand(n, 1);
	v = v / norm(v);
	w_ = C * v;
	a = v' * w_;
	w = w_ - (a * v);
	V(:, 1) = v;
    T(1, 1) = a;
	for (j = 2 : k)
		b = norm(w);
		if (b ~= 0)
			V(:, j) = w / b;
        else
			v = rand(n, 1);
            v = v / norm(v);
            sum = 0.0;
            for (l = 1 : (j - 1))
                sum = sum + (((v' * V(:, l)) / (norm(V(:, l) ^ 2))) * V(:, l));
            end
            V(:, j) = v - sum;
        end
		w_ = C * V(:, j);
		a = V(:, j)' * w_;
        %a = dot(V(:, j), w_);
        T(j, j) = a;
        T(j - 1, j) = b;
        T(j, j - 1) = b;
		w = w_ - (a * V(:, j)) - (b * V(:, j - 1));
    end
    [Q R] = qr(V,0);
    V = Q;
end
end