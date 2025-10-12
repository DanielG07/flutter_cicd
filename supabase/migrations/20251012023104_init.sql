-- Tabla de perfiles
CREATE TABLE public.profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  full_name text,
  created_at timestamptz DEFAULT now()
);

-- Tabla de mensajes
CREATE TABLE public.messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  content text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Insert de prueba inicial
INSERT INTO public.profiles (email, full_name)
VALUES ('test@example.com', 'Test User');

INSERT INTO public.messages (user_id, content)
SELECT id, 'Hello world!' FROM public.profiles WHERE email = 'test@example.com';
