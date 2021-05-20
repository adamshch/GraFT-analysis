setenv('PATH', [getenv('PATH') ':/usr/local/bin']);
setenv('DYLD_LIBRARY_PATH', '/usr/local/bin/');

d=which('rann32c.c');
[d,~,~]=fileparts(d);
cur_dir = pwd;
cd(d);


mex rann32c.c myprin.c rann_core.c rann_utils.c 

cd(cur_dir);