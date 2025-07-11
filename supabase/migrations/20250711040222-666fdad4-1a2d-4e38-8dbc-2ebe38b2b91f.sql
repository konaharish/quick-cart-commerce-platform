
-- Create wishlist table for storing user's favorite products
CREATE TABLE public.wishlist (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID NOT NULL,
  product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, product_id)
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.wishlist ENABLE ROW LEVEL SECURITY;

-- Create policies for wishlist
CREATE POLICY "Users can view their own wishlist" 
  ON public.wishlist 
  FOR SELECT 
  USING (auth.uid() = user_id);

CREATE POLICY "Users can add to their own wishlist" 
  ON public.wishlist 
  FOR INSERT 
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can remove from their own wishlist" 
  ON public.wishlist 
  FOR DELETE 
  USING (auth.uid() = user_id);

-- Make sure we have products with correct category mappings
-- First, let's update products to have the correct category_id based on category slugs

-- Update products for mobiles category
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'mobiles')
WHERE name IN (
  'iPhone 15 Pro Max',
  'Samsung Galaxy S24 Ultra', 
  'Google Pixel 8 Pro',
  'OnePlus 12 Pro',
  'Xiaomi 14 Ultra'
);

-- Update products for laptops category  
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'laptops')
WHERE name IN (
  'MacBook Pro 16" M3 Pro',
  'Dell XPS 13 Plus',
  'ASUS ROG Strix G16',
  'ThinkPad X1 Carbon',
  'Surface Laptop Studio'
);

-- Update products for smart-watches category
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'smart-watches')
WHERE name IN (
  'Apple Watch Series 9',
  'Samsung Galaxy Watch6',
  'Garmin Fenix 7',
  'Fitbit Sense 2',
  'Amazfit GTR 4'
);

-- Update products for earbuds category
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'earbuds')
WHERE name IN (
  'AirPods Pro (2nd Gen)',
  'Sony WF-1000XM4',
  'Bose QuietComfort Earbuds',
  'Samsung Galaxy Buds2 Pro',
  'Jabra Elite 85t'
);

-- Update products for tvs category
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'tvs')
WHERE name IN (
  'Samsung 65" Neo QLED 8K',
  'LG 55" OLED C3',
  'Sony 75" X90L',
  'TCL 65" C835',
  'Hisense 75" U8K'
);

-- Update products for computers category
UPDATE public.products 
SET category_id = (SELECT id FROM public.categories WHERE slug = 'computers')
WHERE name IN (
  'Mac Studio M2 Ultra',
  'ASUS ROG Strix GT35',
  'HP OMEN 45L',
  'Alienware Aurora R15',
  'Origin Chronos'
);

-- Insert additional products to ensure each category has at least 5 products

-- Add more mobiles if needed
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'OnePlus 12 Pro',
    'Flagship smartphone with Snapdragon 8 Gen 3, 50MP camera, and 100W fast charging',
    899.99,
    999.99,
    c.id,
    20,
    4.5,
    680,
    false,
    true,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.82\" LTPO AMOLED", "Processor": "Snapdragon 8 Gen 3", "Camera": "50MP Triple", "Storage": "256GB", "Charging": "100W SuperVOOC"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'mobiles') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'OnePlus 12 Pro')
  
  UNION ALL
  
  SELECT 
    'Xiaomi 14 Ultra',
    'Photography-focused flagship with Leica cameras and professional features',
    1299.99,
    1399.99,
    c.id,
    15,
    4.6,
    420,
    true,
    true,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.73\" LTPO AMOLED", "Processor": "Snapdragon 8 Gen 3", "Camera": "50MP Leica Quad", "Storage": "512GB", "Photography": "Professional grade"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'mobiles') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Xiaomi 14 Ultra')
) AS mobile_products;

-- Add more laptops if needed
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'ThinkPad X1 Carbon Gen 11',
    'Ultra-lightweight business laptop with Intel vPro and 14-inch display',
    1599.99,
    1799.99,
    c.id,
    25,
    4.4,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    '{"Display": "14\" WUXGA", "Processor": "Intel Core i7-1355U", "Memory": "16GB LPDDR5", "Storage": "512GB SSD", "Weight": "2.48 lbs"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'laptops') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'ThinkPad X1 Carbon Gen 11')
  
  UNION ALL
  
  SELECT 
    'Surface Laptop Studio 2',
    'Versatile 2-in-1 laptop with touchscreen and Surface Pen support',
    1999.99,
    2199.99,
    c.id,
    12,
    4.3,
    380,
    true,
    true,
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    '{"Display": "14.4\" PixelSense Touch", "Processor": "Intel Core i7-13700H", "GPU": "NVIDIA RTX 4050", "Memory": "32GB", "Storage": "1TB SSD"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'laptops') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Surface Laptop Studio 2')
) AS laptop_products;

-- Add more smart watches if needed
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'Garmin Fenix 7 Sapphire Solar',
    'Premium multisport GPS watch with solar charging and rugged design',
    749.99,
    849.99,
    c.id,
    18,
    4.7,
    890,
    true,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.3\" MIP", "Battery": "22 days + solar", "GPS": "Multi-band", "Sports": "100+ activities", "Build": "Sapphire crystal"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'smart-watches') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Garmin Fenix 7 Sapphire Solar')
  
  UNION ALL
  
  SELECT 
    'Fitbit Sense 2',
    'Advanced health and fitness smartwatch with stress management tools',
    299.99,
    349.99,
    c.id,
    35,
    4.2,
    1240,
    false,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.58\" AMOLED", "Health": "ECG, SpO2, Stress", "Battery": "6+ days", "Fitness": "40+ exercise modes", "GPS": "Built-in"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'smart-watches') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Fitbit Sense 2')
  
  UNION ALL
  
  SELECT 
    'Amazfit GTR 4',
    'Stylish smartwatch with 14-day battery life and 150+ sports modes',
    199.99,
    249.99,
    c.id,
    40,
    4.1,
    780,
    false,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.43\" AMOLED", "Battery": "14 days", "Sports": "150+ modes", "Health": "BioTracker 4.0", "GPS": "Dual-band"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'smart-watches') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Amazfit GTR 4')
) AS smartwatch_products;

-- Add more earbuds if needed
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'Bose QuietComfort Earbuds',
    'World-class noise cancellation in true wireless earbuds',
    279.99,
    329.99,
    c.id,
    30,
    4.5,
    1120,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Battery": "6 hours + 12 hours case", "Features": "World-class ANC", "Audio": "TriPort acoustic", "Fit": "StayHear Max tips", "Control": "Touch"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'earbuds') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Bose QuietComfort Earbuds')
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy Buds2 Pro',
    'Premium earbuds with intelligent ANC and 360 Audio',
    229.99,
    249.99,
    c.id,
    45,
    4.3,
    890,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Battery": "5 hours + 13 hours case", "Audio": "360 Audio", "Features": "Intelligent ANC", "Codec": "Samsung Seamless", "Water": "IPX7"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'earbuds') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Samsung Galaxy Buds2 Pro')
  
  UNION ALL
  
  SELECT 
    'Jabra Elite 85t',
    'Advanced true wireless earbuds with multipoint connectivity',
    179.99,
    229.99,
    c.id,
    25,
    4.2,
    650,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Battery": "5.5 hours + 19.5 hours case", "Features": "Advanced ANC", "Connectivity": "Multipoint Bluetooth", "Calls": "6-mic technology", "App": "Sound+"}'::jsonb
  FROM (SELECT id FROM public.categories WHERE slug = 'earbuds') c
  WHERE NOT EXISTS (SELECT 1 FROM public.products WHERE name = 'Jabra Elite 85t')
) AS earbud_products;
