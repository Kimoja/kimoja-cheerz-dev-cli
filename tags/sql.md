<gtags sql psql postgresql>

<tags row rows number info>

 ## Infos sur les tables et le nombre de lignes
```sql
SELECT relname, n_live_tup, n_dead_tup
FROM pg_stat_user_tables
GROUP BY 1, 2, 3
GROUP BY 2, 3 DESC;

SELECT schemaname,relname,n_live_tup
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;
```

</tags>

<tags versio>

 ##
```sql
SELECT version();
```

</tags>

<tags modules extensions extension ext exts>

 ## modules installés
```sql
SELECT *
FROM pg_extension;
```

</tags>

<tags analyze analyse scan scans seq>

 ## analyse des tables à indexer, benchamrker
https://kaleman.netlify.app/getting-query-performance-stats-with-pg
Cette vue vous montre des statistiques sur chaque table par schéma (il y a une ligne par table) et
vous donne des informations comme le nombre de scans séquentiels que PG a effectué dans la table,
le nombre d'opérations de sélection/insertion effectuées, etc.
À partir de cette vue, en dehors de toutes les informations utiles, nous pouvons répondre à une question vraiment intéressante :
quelles sont mes tables qui ont besoin d'un index ? Vous pouvez facilement répondre à cette question en interrogeant les colonnes seq_scan et seq_tup_read !
```sql
select
  schemaname,
  relname,
  seq_scan,
  seq_tup_read,
  seq_tup_read / seq_scan as avg,
  idx_scan
from pg_stat_user_tables
where seq_scan > 0
order by seq_tup_read desc;
```

</tags>

<tags analyze analyse scan scans seq cache hit hitrate>

 ## analyse des tables à indexer, benchamrker, cache hit rate
Bien qu'il n'y ait pas de réponse parfaite, si vous ne vous situez pas aux alentours de 99 % sur toute table de plus de 10 000 lignes, vous devriez envisager d'ajouter un index.
Pour déterminer où ajouter un index, vous devez examiner le type de requêtes que vous exécutez.
En général, vous voudrez ajouter des index lorsque vous effectuez des recherches par un autre identifiant ou sur des valeurs sur lesquelles vous filtrez souvent, comme les champs created_at.
Conseil de pro : si vous ajoutez un index sur une base de données de production, utilisez les éléments suivantsCREATE INDEX CONCURRENTLY pour que l'index soit construit en arrière-plan et que la table ne soit pas verrouillée.La limitation de la création simultanée d'index est qu'ils prennent généralement 2 à 3 fois plus de temps à créer et ne peuvent pas être exécutés dans transaction.Bien que pour tout site de production important, ces compromis valent la peine d'être pris en compte par les utilisateurs finaux.
```sql
SELECT
  relname,
  100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used,
  n_live_tup rows_in_table
FROM
  pg_stat_user_tables
WHERE
    100 * idx_scan / (seq_scan + idx_scan) < 99 AND
    seq_scan + idx_scan > 0
ORDER BY
  n_live_tup DESC;
```

</tags>

<tags index indexes size>

 ##  Lister taille indexes et leur usage
Si idx_scan = 0 alors pas du tout utilisé donc à shooter
```sql
select schemaname, relname, indexrelname, idx_scan,
pg_size_pretty(pg_relation_size(indexrelid)) as idx_size,
pg_size_pretty(sum(pg_relation_size(indexrelid))
over (order by idx_scan, indexrelid)) as total
from pg_stat_user_indexes
order by 6;
```

</tags>

<tags cache hit rate>

 ##  Cache hit rate global, Infos sur le hit des index
```sql
SELECT
  sum(idx_blks_read) as idx_read,
  sum(idx_blks_hit)  as idx_hit,
  (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit) as ratio
FROM
  pg_statio_user_indexes;
-- Ou 
SELECT sum(heap_blks_read) as heap_read, sum(heap_blks_hit)  as heap_hit, (sum(heap_blks_hit) - sum(heap_blks_read)) / sum(heap_blks_hit) as ratio
FROM pg_statio_user_tables;
```

</tags>

<tags table tables size>

 ## all tables and their size, with/without indexes
```sql
select datname, pg_size_pretty(pg_database_size(datname))
from pg_database
order by pg_database_size(datname) desc;
```

</tags>

<tags slow queries query>

 ## slow queriess
/!\ nécéssite l'extension pg_stat_statements
```sql
SELECT query, calls, total_time, rows,
100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) AS hit_percent
FROM pg_stat_statements ORDER BY total_time DESC LIMIT 5;
```

</tags>

<tags undex indexes usage>

 ## table index usage rates (should not be less than 0.99)
/!\ nécéssite l'extension pg_stat_statements
```sql
SELECT relname, 100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used, n_live_tup rows_in_table
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;
```

</tags>

<tags undex indexes cache>

 ## how many indexes are in cache
```sql
SELECT sum(idx_blks_read) as idx_read, sum(idx_blks_hit)  as idx_hit, (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit) as ratio
FROM pg_statio_user_indexes;
```

</tags>

## @ags(analyze,analyse,last) Dernière analyse
```sql
SELECT schemaname, relname, last_analyze
FROM pg_stat_all_tables;

SELECT relname, seq_scan, idx_scan,
         n_tup_ins, n_tup_del, n_tup_upd, n_tup_hot_upd,
         n_live_tup, n_dead_tup,
         last_vacuum, last_autovacuum,
         last_analyze, last_autoanalyze
 FROM pg_stat_user_tables;
```

</tags>

<tags index indexes need>

 ## Table nécessitant des indexes, voir https://kaleman.netlify.app/getting-query-performance-stats-with-pg
```sql
SELECT schemaname,
       relname,
       seq_scan,
       seq_tup_read,
       idx_scan,
       seq_tup_read / seq_scan AS avg
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY seq_tup_read DESC;
```

</tags>

<tags columns colonnes number nombre count>

 ## Nombre de column
```sql
SELECT table_name, count(*) AS column_count
FROM information_schema."columns"
WHERE table_schema = 'public'
GROUP by table_name ORDER BY column_count DESC;
```

</tags>

<tags json where find search>

 ## Recherche sur data json
```sql
SELECT id FROM template_revisions 
WHERE definition->>'content_page_configuration'->>'next_filter_type_keys' IS NOT NULL;
```

</tags>

</gtags>

