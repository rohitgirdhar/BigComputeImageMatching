function runMatchingComputeOxbuild(img_fpath)
% code specific to Oxbuild dataset. Use only top N images from the 
% instance retrieval output
run('~/vision/vlfeat/toolbox/vl_setup.m')
SIFTS_STOR_DIR = 'sifts/';
IR_OUTPUT_DIR = 'closest_matches/';
N = 200; % num of images to consider to find matching
mkdir(SIFTS_STOR_DIR);

[pathstr, img_name, ext] = fileparts(img_fpath);
OUTPUT_DIR = fullfile('results', img_name);
mkdir(OUTPUT_DIR);
IMAGES_DIR = pathstr;
I_path = img_fpath;

file = fopen(fullfile(IR_OUTPUT_DIR, [img_name, '.out']));
imgs_list = textscan(file, '%s', N);
imgs_list = strcat('oxc1_', imgs_list{1}, '.jpg');
fclose(file);

for qimg = imgs_list'
    [~, qimg_name, ~] = fileparts(qimg{:});
	P_path = fullfile(IMAGES_DIR, qimg{:});
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

