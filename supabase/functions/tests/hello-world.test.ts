import { assertEquals } from "jsr:@std/assert";

Deno.test("hello-world returns correct greeting", async () => {
  const name = "Daniel";
  const response = await fetch(
    `http://localhost:54321/functions/v1/hello-world?name=${name}`,
    { 
      headers: { 
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
      } 
    }
  );
  const data = await response.json();

  assertEquals(response.status, 200);
  assertEquals(data.message, `Hello, ${name}! 👋`);
});

Deno.test("hello-world defaults to 'world' when no name is provided", async () => {
  const response = await fetch(
    "http://localhost:54321/functions/v1/hello-world",
    { 
      headers: { 
        "Content-Type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
      } 
    }
  );
  const data = await response.json();

  assertEquals(response.status, 200);
  assertEquals(data.message, "Hello, world! 👋");
});