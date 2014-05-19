function runMatchingCompute(img_fpath) % will read the images directory from that
run('~/vision/vlfeat/toolbox/vl_setup.m')
SIFTS_STOR_DIR = 'sifts/';
mkdir(SIFTS_STOR_DIR);

[pathstr, img_name, ext] = fileparts(img_fpath);
OUTPUT_DIR = fullfile('results', img_name);
mkdir(OUTPUT_DIR);
IMAGES_DIR = pathstr;
I_path = img_fpath;
for qimg = dir(fullfile(IMAGES_DIR, ['*', ext]))'
    [~, qimg_name, ~] = fileparts(qimg.name);
	P_path = fullfile(IMAGES_DIR, qimg.name);
    try
        matches = computeMatching(I_path, P_path, SIFTS_STOR_DIR);

        OUTF = fullfile(OUTPUT_DIR, ['matches_', qimg_name, '.txt']);
        dlmwrite(OUTF, matches');
    catch exception
        warning('Was not able to compute matches for %s -> %s', img_name, qimg_name);
        warning(getReport(exception));
    end
    
	fprintf('Done for %s -> %s', img_name, qimg_name);
end

