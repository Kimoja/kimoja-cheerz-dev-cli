<gtags bash shell sh zsh basic>

<tags function fn create>

 ## Créer une fonction, juste un alias avec les arguments en param
```shell
dev2() {
  ruby /home/kimojasan/code/toolbox/boot.rb "$@"
}
export dev2
```

</tags>

<tags escape protect dollar arg args argument>

 ## Protect, escape arguments
```bash
count=`awk -F' ' '{print NF; exit}' file.txt`
for i in $(seq $count); do
  awk "{printf \"%s \", \$$i}" file.txt # ICI !! 
  echo ""
done
```

</tags>

<tags compress image quality>

 ## Protect, escape arguments
```bash
convert -quality 95% spec/fixtures/kustom_generation/gennevilliers/cards11x15_unit/page-001.jpg spec/fixtures/kustom_generation/gennevilliers/cards11x15_unit/page-001.jpg
```

</tags>

</gtags>

