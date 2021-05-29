cd ~/Desktop/darkriscv_in_openlane
export PDK_ROOT=~/Desktop/darkriscv_in_openlane/PDK_ROOT
export OPENLANE_ROOT=~/Desktop/darkriscv_in_openlane/OPENLANE_ROOT
export CARAVEL_LITE=0
sudo chmod 666 /var/run/docker.sock
make user_project_wrapper
