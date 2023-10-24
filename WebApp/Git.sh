# If we find a /.git/ directory on a WebApp, we must download it

wget -r http://<ip>/.git

# and check his commits in the directory:

git log # To get the commits historial.
git diff <commit1> <commit2> # To check the changes between the commits.
