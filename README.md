# Signal / Systems Roadmap Tracker

A Vercel app for tracking the complete 104-week low-latency systems syllabus. Supabase Auth provides accounts, and Supabase Postgres stores each account's progress with Row Level Security.

## Deploy to Vercel

Import this private repository as a Vercel project. Choose **Other** as the framework, leave the build command blank, and set the output directory to `.`. Add these environment variables for Production and Preview:

- `SUPABASE_URL` — your Supabase project URL
- `SUPABASE_PUBLISHABLE_KEY` — your Supabase publishable key

Then deploy. The `api/config.js` function exposes only those public client settings to the app. Never add a Supabase secret or service role key.

## Set up Supabase

Run [`supabase/migrations/202611260001_tracker_state.sql`](supabase/migrations/202611260001_tracker_state.sql) in the Supabase SQL Editor. In Authentication → URL Configuration, set the Site URL to the Vercel production domain and allow that URL for email confirmation redirects.

After deployment, create an account in the app. Progress is saved to that account and syncs across devices; JSON export/import is available for backups.

## Local development

Use `vercel dev` with `SUPABASE_URL` and `SUPABASE_PUBLISHABLE_KEY` in `.env.local`. A static web server can run the UI in local-only mode.

The syllabus is linked in the app sidebar. The supplied infographic is in `public/images/roadmap.png`.
