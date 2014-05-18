function runMatchingCompute(img_fpath) % will read the images directory from that
run('~/vision/vlfeat/toolbox/vl_setup.m')
run('~/vision/vlg/toolbox/vlg_setup.m')

[pathstr, img_name, ext] = fileparts(img_fpath);
OUTPUT_DIR = fullfile('results', img_name);
mkdir(OUTPUT_DIR);
IMAGES_DIR = pathstr;
I = imread(img_fpath);
for qimg = dir(fullfile(IMAGES_DIR, ['*', ext]))'
    [~, qimg_name, ~] = fileparts(qimg.name);
	P = imread(fullfile(IMAGES_DIR, qimg.name));
	[matches, match_pts] = computeMatching(I, P);

    OUTF = fullfile(OUTPUT_DIR, ['matches_', qimg_name, '.txt']);
    dlmwrite(OUTF, matches');

    OUTF = fullfile(OUTPUT_DIR, ['match_pts_', qimg_name, '.txt']);
    dlmwrite(OUTF, match_pts);

	disp(sprintf('Done for %s -> %s', img_name, qimg_name));
end

