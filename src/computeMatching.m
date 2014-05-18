function [matches, matching_pts] = computeMatching(I, P)

[f1,d1] = vl_sift(single(rgb2gray(I)));
[f2,d2] = vl_sift(single(rgb2gray(P)));
[matches, scores] = vl_ubcmatch(d1, d2);

pts1 = zeros(2, size(matches,2));
pts2 = zeros(2, size(matches,2));

for i = 1 : size(matches, 2)
	pts1(:, i) = f1( 1:2,  matches(1, i) );
	pts2(:, i) = f2( 1:2,  matches(2, i) );
end

[~, inliers] = estimateFundamentalMatrix(pts1', pts2');

matches = matches(:, inliers);
matching_pts = [pts1(:, inliers')' pts2(:, inliers')'];
