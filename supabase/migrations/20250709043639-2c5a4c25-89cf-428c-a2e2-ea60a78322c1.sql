
-- First, let's get the category IDs and insert products for each category
WITH category_data AS (
  SELECT id, slug FROM public.categories
)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications) 
SELECT * FROM (
  -- Mobiles Category Products
  SELECT 
    'iPhone 15 Pro Max' as name,
    'Latest iPhone with titanium design and A17 Pro chip' as description,
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
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy S24 Ultra',
    'Premium Android smartphone with S Pen and 200MP camera',
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
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Google Pixel 8 Pro',
    'AI-powered smartphone with Magic Eraser and pure Android',
    899.99,
    999.99,
    c.id,
    20,
    4.6,
    750,
    false,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.7 inch LTPO OLED", "Storage": "128GB", "Camera": "50MP Main", "AI": "Magic Eraser"}'::jsonb
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'OnePlus 12',
    'Flagship killer with Snapdragon 8 Gen 3 and fast charging',
    799.99,
    849.99,
    c.id,
    35,
    4.5,
    620,
    false,
    false,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.82 inch AMOLED", "Storage": "256GB", "Camera": "50MP Triple", "Charging": "100W SuperVOOC"}'::jsonb
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Xiaomi 14 Ultra',
    'Photography flagship with Leica cameras and Snapdragon 8 Gen 3',
    1199.99,
    1299.99,
    c.id,
    15,
    4.7,
    450,
    true,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.73 inch LTPO AMOLED", "Storage": "512GB", "Camera": "50MP Leica", "Processor": "Snapdragon 8 Gen 3"}'::jsonb
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'iPhone 14',
    'Reliable iPhone with excellent camera and all-day battery',
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
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy A54',
    'Mid-range smartphone with great camera and long battery life',
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
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Nothing Phone 2',
    'Unique transparent design with Glyph interface',
    599.99,
    649.99,
    c.id,
    25,
    4.2,
    340,
    false,
    true,
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    '{"Display": "6.7 inch LTPO OLED", "Storage": "256GB", "Camera": "50MP Dual", "Design": "Transparent Back"}'::jsonb
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Realme GT 5 Pro',
    'Gaming-focused smartphone with flagship performance',
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
  FROM category_data c WHERE c.slug = 'mobiles'
  
  UNION ALL
  
  SELECT 
    'Oppo Find X7 Pro',
    'Premium smartphone with Hasselblad camera system',
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
  FROM category_data c WHERE c.slug = 'mobiles'

  -- Laptops Category Products
  UNION ALL
  
  SELECT 
    'MacBook Pro 16" M3 Pro',
    'Professional laptop with M3 Pro chip and Liquid Retina XDR display',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Dell XPS 13 Plus',
    'Ultra-premium Windows laptop with InfinityEdge display',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'ASUS ROG Strix G16',
    'Gaming laptop with RTX 4070 and high refresh display',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'HP Spectre x360 14',
    'Convertible laptop with OLED display and premium build',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Lenovo ThinkPad X1 Carbon',
    'Business laptop with legendary ThinkPad reliability',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'MacBook Air M2',
    'Thin and light laptop with M2 chip and all-day battery',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Acer Predator Helios 300',
    'Gaming laptop with RTX 4060 and aggressive styling',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'Surface Laptop 5',
    'Premium Windows laptop with touchscreen and Alcantara',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'MSI Creator Z16P',
    'Content creation laptop with RTX 4070 and color-accurate display',
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
  FROM category_data c WHERE c.slug = 'laptops'
  
  UNION ALL
  
  SELECT 
    'ASUS ZenBook Pro 14',
    'Compact workstation with OLED display and dedicated GPU',
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
  FROM category_data c WHERE c.slug = 'laptops'

  -- Smart Watches Category Products
  UNION ALL
  
  SELECT 
    'Apple Watch Series 9',
    'Advanced smartwatch with Double Tap gesture and health monitoring',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Samsung Galaxy Watch6',
    'Android smartwatch with body composition analysis',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Garmin Forerunner 965',
    'Premium GPS running watch with AMOLED display',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Fitbit Sense 2',
    'Health-focused smartwatch with stress management',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Amazfit GTR 4',
    'Long-lasting smartwatch with GPS and health tracking',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Huawei Watch GT 4',
    'Stylish smartwatch with long battery and health features',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Fossil Gen 6',
    'Wear OS smartwatch with classic design',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'TicWatch Pro 5',
    'Dual-layer display smartwatch with excellent battery',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Polar Vantage V3',
    'Professional sports watch with advanced training features',
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
  FROM category_data c WHERE c.slug = 'smart-watches'
  
  UNION ALL
  
  SELECT 
    'Withings ScanWatch 2',
    'Hybrid smartwatch with medical-grade health monitoring',
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
  FROM category_data c WHERE c.slug = 'smart-watches'

  -- Audio Category Products
  UNION ALL
  
  SELECT 
    'AirPods Pro (2nd Gen)',
    'Premium wireless earbuds with Active Noise Cancellation',
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
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Sony WH-1000XM5',
    'Industry-leading noise canceling over-ear headphones',
    399.99,
    449.99,
    c.id,
    35,
    4.7,
    1890,
    true,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "30mm drivers", "Battery": "30 hours", "Features": "Industry-leading noise canceling", "Design": "Over-ear"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Bose QuietComfort Earbuds',
    'Premium noise canceling true wireless earbuds',
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
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Sennheiser HD 660S2',
    'Open-back audiophile headphones with natural sound',
    599.99,
    699.99,
    c.id,
    20,
    4.6,
    280,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "38mm transducers", "Design": "Open-back", "Impedance": "300 ohms", "Type": "Audiophile"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'JBL Flip 6',
    'Portable Bluetooth speaker with powerful sound',
    99.99,
    129.99,
    c.id,
    60,
    4.4,
    950,
    false,
    false,
    'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=400&fit=crop',
    '{"Audio": "2-way speaker system", "Battery": "12 hours", "Features": "IP67 waterproof", "Connect": "PartyBoost"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Audio-Technica ATH-M50xBT2',
    'Professional monitor headphones with Bluetooth',
    199.99,
    229.99,
    c.id,
    30,
    4.5,
    420,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "45mm large-aperture drivers", "Battery": "50 hours", "Features": "Professional monitoring", "Connect": "Bluetooth 5.0"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Marshall Acton III',
    'Iconic Bluetooth speaker with classic rock aesthetics',
    279.99,
    329.99,
    c.id,
    25,
    4.3,
    380,
    false,
    true,
    'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=400&fit=crop',
    '{"Audio": "Class D amplifier", "Design": "Iconic Marshall", "Features": "Bluetooth 5.2", "Controls": "Analog knobs"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Beyerdynamic DT 990 Pro',
    'Open studio headphones for mixing and mastering',
    169.99,
    199.99,
    c.id,
    35,
    4.6,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "45mm dynamic drivers", "Design": "Open-back", "Impedance": "250 ohms", "Use": "Studio monitoring"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Jabra Elite 85h',
    'SmartSound noise canceling headphones',
    199.99,
    249.99,
    c.id,
    28,
    4.4,
    310,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "40mm speakers", "Battery": "36 hours", "Features": "SmartSound technology", "Assistant": "Alexa built-in"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Bang & Olufsen Beoplay H95',
    'Luxury noise canceling headphones with premium materials',
    799.99,
    899.99,
    c.id,
    12,
    4.7,
    85,
    true,
    true,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Audio": "40mm titanium drivers", "Materials": "Lambskin leather", "Battery": "38 hours", "Design": "Luxury Danish"}'::jsonb
  FROM category_data c WHERE c.slug = 'audio'

  -- Electronics Category Products
  UNION ALL
  
  SELECT 
    'iPad Pro 12.9" M2',
    'Professional tablet with M2 chip and Liquid Retina XDR display',
    1099.99,
    1199.99,
    c.id,
    25,
    4.8,
    890,
    true,
    true,
    'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop',
    '{"Display": "12.9 inch Liquid Retina XDR", "Chip": "Apple M2", "Storage": "128GB", "Camera": "12MP + 10MP Ultra Wide"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Nintendo Switch OLED',
    'Hybrid gaming console with vibrant OLED screen',
    349.99,
    379.99,
    c.id,
    40,
    4.6,
    1520,
    true,
    false,
    'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=400&h=400&fit=crop',
    '{"Display": "7 inch OLED", "Storage": "64GB", "Battery": "4.5-9 hours", "Gaming": "Handheld/Docked"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Sony PlayStation 5',
    'Next-gen gaming console with ultra-high speed SSD',
    499.99,
    559.99,
    c.id,
    15,
    4.7,
    2340,
    true,
    false,
    'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=400&h=400&fit=crop',
    '{"CPU": "AMD Zen 2", "GPU": "AMD RDNA 2", "Storage": "825GB SSD", "Gaming": "4K 120fps"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Amazon Echo Dot (5th Gen)',
    'Compact smart speaker with Alexa',
    49.99,
    59.99,
    c.id,
    80,
    4.3,
    4520,
    false,
    true,
    'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=400&fit=crop',
    '{"Audio": "Enhanced audio", "Assistant": "Alexa", "Smart Home": "Hub built-in", "Design": "Compact"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'GoPro HERO12 Black',
    'Action camera with HyperSmooth stabilization',
    399.99,
    449.99,
    c.id,
    30,
    4.5,
    680,
    false,
    true,
    'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=400&fit=crop',
    '{"Video": "5.3K60 + 4K120", "Stabilization": "HyperSmooth 6.0", "Design": "Waterproof", "Features": "HDR Video"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Kindle Paperwhite',
    'Waterproof e-reader with adjustable warm light',
    139.99,
    159.99,
    c.id,
    45,
    4.4,
    3280,
    false,
    false,
    'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop',
    '{"Display": "6.8 inch glare-free", "Battery": "Up to 10 weeks", "Storage": "8GB", "Features": "Adjustable warm light"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Ring Video Doorbell Pro 2',
    'Smart doorbell with 3D motion detection and Head-to-Toe HD+',
    249.99,
    299.99,
    c.id,
    35,
    4.2,
    1890,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Video": "1536p Head-to-Toe HD+", "Detection": "3D Motion Detection", "Power": "Hardwired", "Features": "Pre-Roll"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Dyson V15 Detect',
    'Cordless vacuum with laser dust detection',
    749.99,
    849.99,
    c.id,
    20,
    4.6,
    520,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Suction": "230 AW", "Battery": "Up to 60 min", "Features": "Laser dust detection", "Filtration": "Advanced 5-stage"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Philips Hue Starter Kit',
    'Smart lighting system with color changing bulbs',
    199.99,
    229.99,
    c.id,
    50,
    4.5,
    2340,
    false,
    false,
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
    '{"Bulbs": "3x A19 color bulbs", "Hub": "Philips Hue Bridge", "Colors": "16 million colors", "Control": "App + Voice"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Tesla Model S Plaid Charger',
    'High-speed home charging solution for Tesla vehicles',
    549.99,
    629.99,
    c.id,
    8,
    4.7,
    45,
    true,
    true,
    'https://images.unsplash.com/photo-1593941707882-a5bac6861d75?w=400&h=400&fit=crop',
    '{"Power": "11.5 kW", "Connector": "Tesla proprietary", "Installation": "Hardwired", "Compatibility": "All Tesla models"}'::jsonb
  FROM category_data c WHERE c.slug = 'electronics'
) AS all_products;
