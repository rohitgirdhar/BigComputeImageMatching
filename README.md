
Usage
-----
1. Set the paths to VLFeat in `runMatchingCompute.m`
2. Set directory paths in `runMatchingCompute.m`
3. Set the images folder in `run_jobs.sh` and `submit_jobs.sh`.
4. Now, to run jobs locally
```bash
$ bash run_jobs.sh
```
Or submit jobs to OpenGrid cluster
```bash
$ bash submit_jobs.sh
```

The final output is in `results/` (or whatever path you gave in `runMatchingCompute.m`)

It has the following directory tree:
```bash
results/
 |
 +--img1
     |
     +-- matches_img2.txt // This file has each row <id1>,<id2>. Where id1 is kpt id in img1, and id2 is in img2 (as found by VLFeat SIFT)
```

Assumption
----------
`vl_sift` always gives the same keypoints in same order, hence we're storing only the indices in match files
