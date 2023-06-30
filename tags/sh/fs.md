<gtags shell bash fs>

<tags file write push>

 ## Ecrire une ligne à la fin d'un fichier
```bash
echo "text" >> mon_fichier.text
```

</tags>

<tags dir create mkdir>

 ## Créer un dossier, sans erreur si existant (-p)
```bash
mkdir -p mon_fichier
```

</tags>

<tags dir file move displace>

 ## Déplacer un fichier/dosser
```bash
mv -f ancien_nom.txt nouveau_dossier/nouveau_nom.txt
```

</tags>

<tags exec executable chmod>

 ## Rend un script executable
```shell 
chmod +x MON_FICHIER
```

</tags>

<tags search ligne line regexp>

 ## Rechercher par regexp dans un fichier
```bash
sed -nE '/^([0-9]{3}-|\\([0-9]{3}\\) )[0-9]{3}-[0-9]{3}\n?/p' file.txt
```

</tags>

<tags symlink symbolic link>

 ## Créé un lien symolique
```bash
ln -s source/path destination/path
```

</tags>

</gtags>