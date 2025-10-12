// deno-lint-ignore-file no-explicit-any
import { serve } from "https://deno.land/std@0.182.0/http/server.ts";

serve(async (req: Request): Promise<Response> => {
  try {
    // Example of query param parsing
    const url = new URL(req.url);
    const name = url.searchParams.get("name") || "world";

    // Example of simple logic
    const message = { message: `Hello, ${name}! 👋` };

    return new Response(JSON.stringify(message), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    });
  } catch (err: any) {
    console.error("Error:", err);
    return new Response(
      JSON.stringify({ error: "Internal Server Error" }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
});