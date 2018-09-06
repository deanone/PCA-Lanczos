k = 256;
use_Lanczos = 1;
if (k > 0  && k <= 256)
    tic;
    X = imread('lena_std.tif');
    r = X(:, :, 1);
    g = X(:, :, 2);
    b = X(:, :, 3);

    r = double(r);
    g = double(g);
    b = double(b);
    
    if (use_Lanczos == 1)
        Pr = PCA_Lanczos(r, k);
        Pg = PCA_Lanczos(g, k);
        Pb = PCA_Lanczos(b, k);
    else
        Pr = PCA_matlab(r, k);
        Pg = PCA_matlab(g, k);
        Pb = PCA_matlab(b, k);
    end
    
    rN = r * Pr;
    rN = rN * Pr';
    rN = uint8(rN);
    
    gN = g * Pg;
    gN = gN * Pg';
    gN = uint8(gN);
    
    bN = b * Pb;
    bN = bN * Pb';
    bN = uint8(bN);

    XN(:, :, 1) = rN;
    XN(:, :, 2) = gN;
    XN(:, :, 3) = bN;
    figure('Name', 'Initial Image')
    imshow(X)
    figure('Name', 'Reconstructed Image');
    imshow(XN)
    toc;
else
    fprintf('The number of principal components should be positive and (for this test case) lower than or equal to 256.\n');
end