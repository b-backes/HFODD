cp $1$2$4.dat $1$3$4.dat
cp $1$2$4.job $1$3$4.job
echo 1,'$'g/$1$2/.s/$1$2/$1$3/g >next.$1$3$4.ex
echo wq >>next.$1$3$4.ex
ex $1$3$4.dat <next.$1$3$4.ex
ex $1$3$4.job <next.$1$3$4.ex
rm -f next.$1$3$4.ex
