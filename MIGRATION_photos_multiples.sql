-- Photos multiples : à exécuter une seule fois dans Supabase (SQL Editor).
alter table portfolio       add column if not exists photos jsonb default '[]'::jsonb;
alter table tissus          add column if not exists photos jsonb default '[]'::jsonb;
alter table modeles         add column if not exists photos jsonb default '[]'::jsonb;
alter table types_vetements add column if not exists photos jsonb default '[]'::jsonb;
notify pgrst, 'reload schema';
