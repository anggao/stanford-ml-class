function idx = findClosestCentroids(X, centroids)
%   FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% iterate over training example
for i = (1:size(X,1)),
  % ith training example
  x = X(i,:);
  centroids_j = centroids(1,:);

  % assume current closest centroid is 1th centroids
  mindis = sum((x-centroids_j).^2);
  minidx = 1;
  % iterate over centroids, update mindis and minidx
  for j = (2:K),
    centroids_j = centroids(j,:);
    dis = sum((x-centroids_j).^2);
    if dis < mindis,
      mindis = dis;
      minidx = j;
    end
  end

  idx(i) = minidx;
end

% =============================================================

end

