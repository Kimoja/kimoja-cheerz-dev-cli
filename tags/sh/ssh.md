<gtags shell bash ssh>

<tags kill tunnel tunnels port>

 ## Kill les tunnels par ports

```bash
ps -lef | grep ssh | grep "5435" | awk "{print \$2}" | xargs kill
```

</tags>

</gtags>

