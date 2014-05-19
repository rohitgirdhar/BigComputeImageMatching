function [f1, d1] = readSifts(img_fpath, SIFTS_STOR_DIR)
[~, name, ~] = fileparts(img_fpath);
sift_path = fullfile(SIFTS_STOR_DIR, [name, '_sift.mat']);
if exist(sift_path, 'file') == 2
    load(sift_path, 'f1', 'd1');
else
    I = imread(img_fpath);
    [f1,d1] = vl_sift(single(rgb2gray(I)));
    save(sift_path, 'f1', 'd1');
end