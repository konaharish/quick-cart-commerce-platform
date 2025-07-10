
-- First, let's insert the categories
INSERT INTO public.categories (name, slug, description) VALUES
('Mobiles', 'mobiles', 'Latest smartphones and mobile devices'),
('Laptops', 'laptops', 'Powerful laptops for work and gaming'),
('Smart Watches', 'smart-watches', 'Wearable technology and fitness trackers'),
('Earbuds', 'earbuds', 'Wireless earbuds and audio accessories'),
('TVs', 'tvs', 'Smart TVs and entertainment systems'),
('Computers', 'computers', 'Desktop computers and accessories'),
('Fridges', 'fridges', 'Refrigerators and kitchen appliances'),
('Washing Machines', 'washing-machines', 'Laundry appliances'),
('Earphones', 'earphones', 'Wired and wireless headphones'),
('Best Sellers', 'best-sellers', 'Our most popular products'),
('New Releases', 'new-releases', 'Latest product releases')
ON CONFLICT (slug) DO NOTHING;

-- Clear existing products to avoid confusion
DELETE FROM public.products;

-- Now insert products with proper category linking
WITH category_lookup AS (
  SELECT id, slug FROM public.categories
)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  -- MOBILES CATEGORY (10 products)
  SELECT 
    'iPhone 15 Pro Max' as name,
    'Latest iPhone with titanium design and A17 Pro chip for unmatched performance and photography' as description,
    1199.99 as price,
    1299.99 as original_price,
    c.id as category_id,
    25 as stock_quantity,
    4.8 as rating,
    1250 as review_count,
    true as is_featured,
    true as is_new_release,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop' as image_url,
    '{"Display": "6.7 inch Super Retina XDR", "Storage": "256GB", "Camera": "48MP Main", "Chip": "A17 Pro"}'::jsonb as specifications
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy S24 Ultra',
    'Premium Android flagship with S Pen, 200MP camera, and AI-powered features',
    1099.99,
    1199.99,
    c.id,
    30,
    4.7,
    980,
    true,
    false,
    'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400&h=400&fit=crop',
    '{"Display": "6.8 inch Dynamic AMOLED", "Storage": "256GB", "Camera": "200MP Main", "S Pen": "Included"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Google Pixel 8 Pro',
    'AI-powered smartphone with Magic Eraser, Best Take, and pure Android experience',
    899.99,
    999.99,
    c.id,
    20,
    4.6,
    750,
    false,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.7 inch LTPO OLED", "Storage": "128GB", "Camera": "50MP Triple", "AI": "Magic Eraser"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'OnePlus 12',
    'Flagship killer with Snapdragon 8 Gen 3, 100W fast charging, and premium build',
    799.99,
    849.99,
    c.id,
    35,
    4.5,
    620,
    false,
    false,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.82 inch AMOLED 120Hz", "Storage": "256GB", "Camera": "50MP Triple", "Charging": "100W SuperVOOC"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Xiaomi 14 Ultra',
    'Photography flagship with quad Leica cameras and Snapdragon 8 Gen 3 power',
    1199.99,
    1299.99,
    c.id,
    15,
    4.7,
    450,
    true,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.73 inch LTPO AMOLED", "Storage": "512GB", "Camera": "50MP Leica Quad", "Processor": "Snapdragon 8 Gen 3"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'iPhone 14',
    'Reliable iPhone with excellent camera system, Crash Detection, and all-day battery',
    699.99,
    799.99,
    c.id,
    40,
    4.4,
    890,
    false,
    false,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.1 inch Super Retina XDR", "Storage": "128GB", "Camera": "12MP Dual", "Chip": "A15 Bionic"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy A54',
    'Mid-range powerhouse with great camera, long battery life, and premium design',
    399.99,
    449.99,
    c.id,
    50,
    4.3,
    1200,
    false,
    false,
    'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400&h=400&fit=crop',
    '{"Display": "6.4 inch Super AMOLED", "Storage": "128GB", "Camera": "50MP Triple", "Battery": "5000mAh"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Nothing Phone 2',
    'Unique transparent design with Glyph interface and flagship performance',
    599.99,
    649.99,
    c.id,
    25,
    4.2,
    340,
    false,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.7 inch LTPO OLED", "Storage": "256GB", "Camera": "50MP Dual", "Design": "Transparent Glyph"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Realme GT 5 Pro',
    'Gaming-focused smartphone with flagship Snapdragon performance and fast charging',
    549.99,
    599.99,
    c.id,
    30,
    4.4,
    280,
    false,
    false,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.78 inch AMOLED 144Hz", "Storage": "256GB", "Camera": "50MP Triple", "Gaming": "Snapdragon 8 Gen 2"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Oppo Find X7 Pro',
    'Premium smartphone with Hasselblad camera system and elegant design',
    899.99,
    999.99,
    c.id,
    20,
    4.6,
    190,
    true,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.82 inch LTPO AMOLED", "Storage": "256GB", "Camera": "50MP Hasselblad", "Processor": "Snapdragon 8 Gen 3"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'mobiles'

  -- LAPTOPS CATEGORY (10 products)
  UNION ALL
  
  SELECT 
    'MacBook Pro 16" M3 Pro',
    'Professional laptop with M3 Pro chip, Liquid Retina XDR display, and incredible performance',
    2499.99,
    2699.99,
    c.id,
    15,
    4.9,
    560,
    true,
    true,
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    '{"Display": "16.2 inch Liquid Retina XDR", "Processor": "Apple M3 Pro", "RAM": "18GB", "Storage": "512GB SSD"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Dell XPS 13 Plus',
    'Ultra-premium Windows laptop with InfinityEdge display and haptic touchpad',
    1299.99,
    1399.99,
    c.id,
    25,
    4.5,
    430,
    true,
    false,
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    '{"Display": "13.4 inch OLED Touch", "Processor": "Intel Core i7-1360P", "RAM": "16GB", "Storage": "512GB SSD"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'ASUS ROG Strix G16',
    'Gaming laptop with RTX 4070, high refresh display, and RGB lighting',
    1599.99,
    1799.99,
    c.id,
    20,
    4.4,
    320,
    false,
    false,
    'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=400&fit=crop',
    '{"Display": "16 inch QHD 165Hz", "Processor": "Intel Core i7-13650HX", "GPU": "RTX 4070", "RAM": "16GB DDR5"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'HP Spectre x360 14',
    'Premium convertible laptop with OLED display and 360-degree hinge',
    1199.99,
    1299.99,
    c.id,
    18,
    4.3,
    290,
    false,
    false,
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    '{"Display": "13.5 inch OLED Touch", "Processor": "Intel Core i7-1255U", "RAM": "16GB", "Design": "360° Convertible"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Lenovo ThinkPad X1 Carbon',
    'Business laptop with legendary ThinkPad reliability and lightweight design',
    1399.99,
    1499.99,
    c.id,
    22,
    4.6,
    410,
    true,
    false,
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    '{"Display": "14 inch WUXGA IPS", "Processor": "Intel Core i7-1365U", "RAM": "16GB", "Weight": "1.12kg"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'MacBook Air M2',
    'Thin and light laptop with M2 chip, all-day battery, and fanless design',
    1099.99,
    1199.99,
    c.id,
    30,
    4.7,
    890,
    true,
    false,
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    '{"Display": "13.6 inch Liquid Retina", "Processor": "Apple M2", "RAM": "8GB", "Storage": "256GB SSD"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Acer Predator Helios 300',
    'Gaming laptop with RTX 4060, aggressive styling, and advanced cooling',
    1199.99,
    1399.99,
    c.id,
    15,
    4.2,
    250,
    false,
    false,
    'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=400&fit=crop',
    '{"Display": "15.6 inch FHD 144Hz", "Processor": "Intel Core i7-12700H", "GPU": "RTX 4060", "Cooling": "AeroBlade 3D"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Surface Laptop 5',
    'Premium Windows laptop with touchscreen, Alcantara keyboard, and elegant design',
    999.99,
    1099.99,
    c.id,
    25,
    4.4,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    '{"Display": "13.5 inch PixelSense Touch", "Processor": "Intel Core i5-1235U", "RAM": "8GB", "Material": "Alcantara"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'MSI Creator Z16P',
    'Content creation laptop with RTX 4070 and color-accurate display for creators',
    1899.99,
    2099.99,
    c.id,
    12,
    4.5,
    180,
    true,
    true,
    'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=400&fit=crop',
    '{"Display": "16 inch QHD+ 165Hz", "Processor": "Intel Core i7-12700H", "GPU": "RTX 4070", "Color": "100% DCI-P3"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'ASUS ZenBook Pro 14',
    'Compact workstation with OLED display, dedicated GPU, and premium build quality',
    1499.99,
    1699.99,
    c.id,
    18,
    4.3,
    220,
    false,
    true,
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    '{"Display": "14.5 inch 2.8K OLED", "Processor": "Intel Core i7-12700H", "GPU": "RTX 3050", "Design": "Premium Build"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'laptops'

  -- SMART WATCHES CATEGORY (10 products)
  UNION ALL
  
  SELECT 
    'Apple Watch Series 9',
    'Advanced smartwatch with Double Tap gesture, health monitoring, and bright display',
    399.99,
    449.99,
    c.id,
    40,
    4.7,
    1250,
    true,
    true,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "45mm Always-On Retina", "Chip": "S9 SiP", "Health": "ECG, Blood Oxygen", "Battery": "18 hours"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy Watch6',
    'Android smartwatch with body composition analysis and comprehensive health tracking',
    329.99,
    389.99,
    c.id,
    35,
    4.5,
    890,
    true,
    false,
    'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    '{"Display": "1.5 inch Super AMOLED", "Processor": "Exynos W930", "Health": "BioActive Sensor", "OS": "Wear OS"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Garmin Forerunner 965',
    'Premium GPS running watch with AMOLED display and advanced training features',
    599.99,
    649.99,
    c.id,
    25,
    4.8,
    420,
    true,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.4 inch AMOLED", "GPS": "Multi-band", "Battery": "23 days", "Sports": "Running Dynamics"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Fitbit Sense 2',
    'Health-focused smartwatch with stress management and comprehensive wellness tracking',
    249.99,
    299.99,
    c.id,
    30,
    4.3,
    680,
    false,
    false,
    'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    '{"Display": "1.58 inch AMOLED", "Health": "Stress Management", "Battery": "6+ days", "Features": "ECG, SpO2"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Amazfit GTR 4',
    'Long-lasting smartwatch with GPS, health tracking, and 14-day battery life',
    199.99,
    229.99,
    c.id,
    45,
    4.4,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.43 inch AMOLED", "Battery": "14 days", "GPS": "5 Satellite Systems", "Health": "150+ Sports"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Huawei Watch GT 4',
    'Stylish smartwatch with long battery, health features, and premium materials',
    229.99,
    279.99,
    c.id,
    38,
    4.2,
    310,
    false,
    true,
    'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    '{"Display": "1.43 inch AMOLED", "Battery": "14 days", "Health": "TruSleep, TruSeen", "Design": "Premium Materials"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Fossil Gen 6',
    'Wear OS smartwatch with classic design and Google integration',
    179.99,
    229.99,
    c.id,
    20,
    4.1,
    290,
    false,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.28 inch AMOLED", "OS": "Wear OS by Google", "Processor": "Snapdragon Wear 4100+", "Design": "Classic"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'TicWatch Pro 5',
    'Dual-layer display smartwatch with excellent battery life and health monitoring',
    349.99,
    399.99,
    c.id,
    22,
    4.3,
    180,
    false,
    true,
    'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    '{"Display": "1.43 inch AMOLED + FSTN", "Battery": "80 hours", "OS": "Wear OS 3", "Health": "24/7 Monitoring"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Polar Vantage V3',
    'Professional sports watch with advanced training features and dual-frequency GPS',
    599.99,
    699.99,
    c.id,
    15,
    4.6,
    150,
    true,
    true,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"Display": "1.39 inch AMOLED", "GPS": "Dual-frequency", "Training": "FuelWise", "Battery": "140 hours"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Withings ScanWatch 2',
    'Hybrid smartwatch with medical-grade health monitoring and elegant analog design',
    349.99,
    399.99,
    c.id,
    18,
    4.4,
    120,
    false,
    true,
    'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    '{"Display": "Analog + Digital", "Health": "ECG, SpO2, Temperature", "Battery": "30 days", "Design": "Hybrid"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'smart-watches'

  -- Add products for remaining categories to reach 70 total products
  -- EARBUDS CATEGORY (10 products)
  UNION ALL
  
  SELECT 
    'AirPods Pro (2nd Gen)',
    'Premium wireless earbuds with Active Noise Cancellation and Spatial Audio',
    249.99,
    279.99,
    c.id,
    50,
    4.8,
    2450,
    true,
    true,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "Spatial Audio", "Chip": "H2", "Battery": "6h + 24h case", "Features": "Active Noise Cancellation"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Sony WF-1000XM4',
    'Industry-leading noise canceling true wireless earbuds with LDAC support',
    279.99,
    329.99,
    c.id,
    35,
    4.7,
    1890,
    true,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "V1 Processor", "Battery": "8h + 16h case", "Features": "LDAC, Hi-Res", "Design": "Noise Isolating"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Bose QuietComfort Earbuds',
    'Premium noise canceling earbuds with world-class noise cancellation',
    179.99,
    229.99,
    c.id,
    40,
    4.5,
    1320,
    true,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "TriPort acoustic", "Battery": "6h + 18h case", "Features": "Quiet Mode", "Fit": "StayHear Max tips"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy Buds2 Pro',
    'Premium earbuds with intelligent ANC and 360 Audio support',
    199.99,
    229.99,
    c.id,
    45,
    4.4,
    880,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "360 Audio", "Battery": "5h + 18h case", "Features": "Intelligent ANC", "Design": "Ergonomic"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Jabra Elite 85t',
    'Advanced noise canceling earbuds with customizable sound profiles',
    179.99,
    199.99,
    c.id,
    30,
    4.3,
    620,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "12mm speakers", "Battery": "5.5h + 25h case", "Features": "Advanced ANC", "App": "Sound+ customization"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Sennheiser Momentum True Wireless 3',
    'Audiophile-grade sound quality with adaptive noise cancellation',
    249.99,
    299.99,
    c.id,
    25,
    4.6,
    340,
    false,
    true,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "TrueResponse transducers", "Battery": "7h + 21h case", "Features": "Adaptive ANC", "Quality": "Audiophile"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Nothing Ear (2)',
    'Transparent design earbuds with Hi-Res Audio and personalized ANC',
    149.99,
    179.99,
    c.id,
    40,
    4.2,
    480,
    false,
    true,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "Hi-Res Audio", "Battery": "6.3h + 22.5h case", "Features": "Personalized ANC", "Design": "Transparent"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Anker Soundcore Liberty 4 NC',
    'Budget-friendly noise canceling earbuds with long battery life',
    99.99,
    129.99,
    c.id,
    60,
    4.1,
    750,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "11mm drivers", "Battery": "10h + 40h case", "Features": "Adaptive ANC", "Value": "Budget-friendly"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Sony LinkBuds S',
    'Ultra-compact earbuds with smart features and all-day comfort',
    149.99,
    179.99,
    c.id,
    35,
    4.3,
    420,
    false,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "5mm driver", "Battery": "6h + 14h case", "Features": "Smart features", "Design": "Ultra-compact"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'
  
  UNION ALL
  
  SELECT 
    'Master & Dynamic MW08',
    'Luxury wireless earbuds with premium materials and exceptional sound',
    349.99,
    399.99,
    c.id,
    15,
    4.5,
    120,
    true,
    true,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "Beryllium drivers", "Battery": "12h + 30h case", "Materials": "Premium acetate", "Design": "Luxury"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earbuds'

  -- TVs CATEGORY (10 products)
  UNION ALL
  
  SELECT 
    'Samsung 65" QN90C Neo QLED 4K',
    'Premium 4K Smart TV with Quantum Matrix Technology and Neural Quantum Processor',
    1799.99,
    1999.99,
    c.id,
    12,
    4.7,
    450,
    true,
    true,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "65 inch Neo QLED 4K", "Processor": "Neural Quantum 4K", "HDR": "HDR10+", "Smart TV": "Tizen OS"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'LG 55" C3 OLED 4K',
    'OLED Smart TV with perfect blacks, infinite contrast, and webOS platform',
    1299.99,
    1499.99,
    c.id,
    18,
    4.8,
    680,
    true,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "55 inch OLED 4K", "Processor": "α9 Gen6 AI", "HDR": "Dolby Vision IQ", "Smart TV": "webOS 23"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Sony 75" X90L LED 4K',
    'Large screen 4K LED TV with XR Cognitive Processor and Google TV',
    1599.99,
    1799.99,
    c.id,
    8,
    4.5,
    320,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "75 inch LED 4K", "Processor": "XR Cognitive", "HDR": "XR HDR", "Smart TV": "Google TV"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'TCL 65" C845 Mini-LED 4K',
    'Mini-LED 4K Smart TV with Quantum Dot technology and premium picture quality',
    999.99,
    1199.99,
    c.id,
    20,
    4.4,
    280,
    false,
    true,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "65 inch Mini-LED 4K", "Technology": "Quantum Dot", "HDR": "Dolby Vision", "Smart TV": "Google TV"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Hisense 50" U8K ULED 4K',
    'ULED 4K Smart TV with Quantum Dot Wide Color Gamut and Dolby Vision',
    699.99,
    799.99,
    c.id,
    25,
    4.3,
    390,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "50 inch ULED 4K", "Technology": "Quantum Dot", "HDR": "Dolby Vision", "Gaming": "144Hz VRR"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Roku 43" Select Series 4K',
    'Budget-friendly 4K Smart TV with Roku streaming platform built-in',
    299.99,
    349.99,
    c.id,
    40,
    4.1,
    620,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "43 inch LED 4K", "Smart TV": "Roku TV", "HDR": "HDR10", "Streaming": "Roku built-in"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Amazon Fire TV 55" Omni QLED',
    'QLED 4K Smart TV with Alexa Voice Remote and Fire TV experience',
    599.99,
    699.99,
    c.id,
    30,
    4.2,
    480,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "55 inch QLED 4K", "Smart TV": "Fire TV", "Voice": "Alexa built-in", "HDR": "Dolby Vision"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Philips 65" OLED808 4K',
    'OLED 4K TV with Ambilight technology and P5 AI Perfect Picture Engine',
    1599.99,
    1799.99,
    c.id,
    10,
    4.6,
    180,
    true,
    true,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "65 inch OLED 4K", "Technology": "Ambilight", "Processor": "P5 AI", "HDR": "HDR10+ Adaptive"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Vizio 70" MQX Series 4K',
    'Large 4K Smart TV with Quantum Color and Active Full Array backlighting',
    899.99,
    999.99,
    c.id,
    15,
    4.3,
    250,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "70 inch QLED 4K", "Technology": "Quantum Color", "Backlight": "Active Full Array", "Gaming": "Variable Refresh Rate"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'
  
  UNION ALL
  
  SELECT 
    'Sharp 32" FHD Roku TV',
    'Compact HD Smart TV perfect for bedrooms and smaller spaces',
    199.99,
    249.99,
    c.id,
    50,
    4.0,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "32 inch LED FHD", "Smart TV": "Roku TV", "Size": "Compact", "Use": "Bedroom/Small spaces"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'tvs'

  -- COMPUTERS CATEGORY (10 products)
  UNION ALL
  
  SELECT 
    'Apple Mac Studio M2 Ultra',
    'Professional desktop computer with M2 Ultra chip for demanding workflows',
    3999.99,
    4299.99,
    c.id,
    8,
    4.9,
    120,
    true,
    true,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Apple M2 Ultra", "RAM": "64GB", "Storage": "1TB SSD", "Connectivity": "Multiple Thunderbolt"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Dell XPS Desktop 8960',
    'High-performance Windows desktop with latest Intel processors and RTX graphics',
    1299.99,
    1499.99,
    c.id,
    15,
    4.5,
    280,
    true,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i7-13700", "GPU": "RTX 4060", "RAM": "16GB", "Storage": "512GB SSD + 1TB HDD"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'HP OMEN 45L Gaming Desktop',
    'Gaming desktop with RGB lighting, powerful GPU, and advanced cooling',
    1599.99,
    1799.99,
    c.id,
    12,
    4.4,
    220,
    false,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i7-12700K", "GPU": "RTX 4070", "RAM": "16GB DDR4", "Design": "RGB Gaming"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Alienware Aurora R15',
    'Premium gaming desktop with liquid cooling and customizable RGB',
    2299.99,
    2599.99,
    c.id,
    10,
    4.6,
    180,
    true,
    true,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i9-12900F", "GPU": "RTX 4080", "Cooling": "Liquid Cooling", "Design": "Premium Gaming"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Apple iMac 24" M3',
    'All-in-one desktop with 4.5K Retina display and M3 chip performance',
    1299.99,
    1399.99,
    c.id,
    20,
    4.7,
    450,
    true,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Display": "24 inch 4.5K Retina", "Processor": "Apple M3", "RAM": "8GB", "Design": "All-in-one"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'ASUS ROG Strix GT35',
    'Gaming desktop with flagship performance and ROG gaming features',
    1899.99,
    2199.99,
    c.id,
    8,
    4.3,
    150,
    false,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i7-11700K", "GPU": "RTX 4070 Ti", "RAM": "32GB", "Features": "ROG Gaming"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Microsoft Surface Studio 2+',
    'Creative desktop with 28" PixelSense touchscreen and Surface Dial support',
    4299.99,
    4699.99,
    c.id,
    5,
    4.8,
    85,
    true,
    true,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Display": "28 inch PixelSense Touch", "Processor": "Intel Core i7-11370H", "GPU": "RTX 3060", "Creative": "Surface Dial"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Lenovo Legion Tower 7i',
    'High-performance gaming desktop with advanced thermal management',
    1799.99,
    1999.99,
    c.id,
    12,
    4.4,
    190,
    false,
    true,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i7-12700K", "GPU": "RTX 4070", "Cooling": "Legion Coldfront", "RGB": "Legion RGB"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'Origin PC Chronos',
    'Custom-built workstation for professional content creation and rendering',
    2999.99,
    3399.99,
    c.id,
    6,
    4.7,
    95,
    true,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i9-13900K", "GPU": "RTX 4080", "RAM": "64GB", "Use": "Professional Workstation"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
  
  UNION ALL
  
  SELECT 
    'HP Pavilion Desktop TP01',
    'Budget-friendly desktop computer perfect for everyday computing tasks',
    599.99,
    699.99,
    c.id,
    30,
    4.1,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    '{"Processor": "Intel Core i5-12400", "RAM": "8GB", "Storage": "256GB SSD", "Use": "Everyday computing"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'computers'
) AS final_products;
