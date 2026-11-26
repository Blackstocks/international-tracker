-- One private progress document per authenticated Supabase user.
create table if not exists public.tracker_state (
  user_id uuid primary key references auth.users (id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.tracker_state enable row level security;

revoke all on table public.tracker_state from anon;
grant select, insert, update on table public.tracker_state to authenticated;

drop policy if exists "Users can read their tracker" on public.tracker_state;
create policy "Users can read their tracker"
  on public.tracker_state for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can create their tracker" on public.tracker_state;
create policy "Users can create their tracker"
  on public.tracker_state for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their tracker" on public.tracker_state;
create policy "Users can update their tracker"
  on public.tracker_state for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
