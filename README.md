# PCA-Lanczos
Principal Components Analysis based on the Lanczos algorithm.

This is an implementation of the Principal Components Analysis method (https://en.wikipedia.org/wiki/Principal_component_analysis)
using the Lanczos algorithm (https://en.wikipedia.org/wiki/Lanczos_algorithm).

The implementation can be tested using the test.m file and infamous Lena (https://en.wikipedia.org/wiki/Lenna) image. In particular,
the user chooses the number of principal components (k), implements the Lanczos-based PCA on the Lena image and then reconstructs the
image. As expected, the larger the number of the princpal components, the better the reconstruction.

Finally, the user can evaluate the processing times and see that the Lanczos-based PCA implementation, in this particular use case, is
slightly faster than the MATLAB's pca.
