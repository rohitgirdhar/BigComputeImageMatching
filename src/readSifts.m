function [f1, d1] = readSifts(img_fpath, SIFTS_STOR_DIR)
[~, name, ~] = fileparts(img_fpath);
sift_path = fullfile(SIFTS_STOR_DIR, [name, '_sift.mat']);
try
    load(sift_path, 'f1', 'd1');
    if exist('f1', 'var') && exist('d1', 'var')
        fprintf('Successfully read SIFT from MAT files %s\n', name);
    end
catch
end
if (~exist('f1', 'var') || ~exist('d1', 'var'))
    I = imread(img_fpath);
    [f1,d1] = vl_sift(single(rgb2gray(I)));
    save(sift_path, 'f1', 'd1');
end