export function GET() {
  const url = process.env.SUPABASE_URL || '';
  const anonKey = process.env.SUPABASE_PUBLISHABLE_KEY || process.env.SUPABASE_ANON_KEY || '';
  const configured = Boolean(url && anonKey);

  return Response.json(
    { configured, url: configured ? url : null, anonKey: configured ? anonKey : null },
    { headers: { 'Cache-Control': 'no-store' } },
  );
}
