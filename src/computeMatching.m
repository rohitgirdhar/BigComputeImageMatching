function [matches] = computeMatching(I_path, P_path, SIFTS_STOR_DIR)

[f1,d1] = readSifts(I_path, SIFTS_STOR_DIR);
[f2,d2] = readSifts(P_path, SIFTS_STOR_DIR);
[matches, ~] = vl_ubcmatch(d1, d2);

pts1 = zeros(2, size(matches,2));
pts2 = zeros(2, size(matches,2));

for i = 1 : size(matches, 2)
	pts1(:, i) = f1( 1:2,  matches(1, i) );
	pts2(:, i) = f2( 1:2,  matches(2, i) );
end
if size(pts1,2) > 10
    [~, inliers] = estimateFundamentalMatrix(pts1', pts2');
    matches = matches(:, inliers);
else
    matches = [];
end

