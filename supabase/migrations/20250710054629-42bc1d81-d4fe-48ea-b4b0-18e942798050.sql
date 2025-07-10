
-- Insert products for missing categories

-- First, let's get the category IDs we need to work with
WITH category_lookup AS (
  SELECT id, slug FROM public.categories
)

-- Insert products for EARPHONES category (10 products)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'Sony WH-1000XM5 Wireless Headphones',
    'Industry-leading noise canceling wireless headphones with 30-hour battery life',
    399.99,
    449.99,
    c.id,
    25,
    4.8,
    1450,
    true,
    true,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Over-ear wireless", "Battery": "30 hours", "Features": "Industry-leading ANC", "Driver": "30mm"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Apple AirPods Max',
    'High-fidelity headphones with Active Noise Cancellation and Spatial Audio',
    549.99,
    599.99,
    c.id,
    15,
    4.6,
    890,
    true,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Over-ear wireless", "Audio": "Spatial Audio", "Features": "Active Noise Cancellation", "Colors": "5 colors"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Bose QuietComfort 45',
    'Wireless Bluetooth headphones with world-class noise cancellation',
    329.99,
    379.99,
    c.id,
    30,
    4.5,
    1120,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Over-ear wireless", "Battery": "24 hours", "Features": "Quiet Mode", "Comfort": "Plush ear cushions"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Sennheiser HD 660S2',
    'Open-back audiophile headphones with reference-class sound quality',
    499.99,
    549.99,
    c.id,
    20,
    4.7,
    340,
    true,
    true,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Open-back wired", "Impedance": "300 ohms", "Quality": "Audiophile-grade", "Cable": "Detachable"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Audio-Technica ATH-M50xBT2',
    'Professional studio monitor headphones with wireless freedom',
    199.99,
    229.99,
    c.id,
    40,
    4.4,
    680,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Studio monitor wireless", "Battery": "50 hours", "Professional": "Studio quality", "Codec": "AAC, LDAC"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Beyerdynamic DT 990 Pro',
    'Open studio headphones for mixing and mastering applications',
    169.99,
    199.99,
    c.id,
    35,
    4.6,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Open studio wired", "Impedance": "250 ohms", "Use": "Mixing and mastering", "Comfort": "Velour ear pads"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'SteelSeries Arctis 7P',
    'Wireless gaming headset with lossless 2.4GHz connection',
    149.99,
    179.99,
    c.id,
    45,
    4.3,
    750,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Gaming wireless", "Battery": "24 hours", "Platform": "PS5, PC, Switch", "Mic": "ClearCast microphone"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'HyperX Cloud Alpha',
    'Gaming headset with dual chamber drivers for enhanced audio clarity',
    99.99,
    119.99,
    c.id,
    60,
    4.2,
    920,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Gaming wired", "Driver": "Dual chamber 50mm", "Comfort": "Memory foam", "Compatibility": "Multi-platform"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Focal Utopia',
    'Flagship open-back headphones with beryllium drivers',
    3999.99,
    4299.99,
    c.id,
    5,
    4.9,
    85,
    true,
    true,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Flagship open-back", "Driver": "Beryllium M-shape dome", "Handmade": "Made in France", "Premium": "Luxury audiophile"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
  
  UNION ALL
  
  SELECT 
    'Plantronics Voyager Focus 2',
    'Business wireless headset with advanced noise canceling for office use',
    279.99,
    319.99,
    c.id,
    25,
    4.1,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    '{"Type": "Business wireless", "Battery": "19+ hours", "Use": "Office meetings", "Smart": "Smart sensors"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'earphones'
) AS earphones_products;

-- Add more products for FRIDGES category (bringing total to 10)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'LG InstaView French Door',
    '28 cu. ft. smart refrigerator with InstaView door-in-door and WiFi connectivity',
    2599.99,
    2899.99,
    c.id,
    8,
    4.5,
    420,
    true,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "28 cu. ft.", "Features": "InstaView Door-in-Door", "Smart": "WiFi ThinQ", "Water": "External dispenser"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Whirlpool French Door Counter Depth',
    '24 cu. ft. counter-depth refrigerator with fingerprint-resistant stainless steel',
    1899.99,
    2199.99,
    c.id,
    12,
    4.3,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "24 cu. ft.", "Design": "Counter-depth", "Finish": "Fingerprint resistant", "Features": "Adaptive defrost"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'GE Profile Opal Nugget Ice Maker',
    'Countertop nugget ice maker that produces restaurant-style chewable ice',
    579.99,
    629.99,
    c.id,
    20,
    4.4,
    650,
    false,
    true,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Type": "Nugget ice maker", "Production": "24 lbs per day", "Smart": "WiFi enabled", "Size": "Countertop"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'KitchenAid French Door Refrigerator',
    '25 cu. ft. French door refrigerator with platinum interior and LED lighting',
    2299.99,
    2599.99,
    c.id,
    10,
    4.6,
    290,
    true,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "25 cu. ft.", "Interior": "Platinum interior", "Lighting": "LED", "Design": "French door"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Frigidaire Gallery Side-by-Side',
    '25.5 cu. ft. side-by-side refrigerator with PureSource water filtration',
    1599.99,
    1799.99,
    c.id,
    15,
    4.2,
    510,
    false,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "25.5 cu. ft.", "Type": "Side-by-side", "Water": "PureSource filtration", "Storage": "SpillSafe shelves"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Haier Quad Door Refrigerator',
    '15.7 cu. ft. quad door refrigerator with convertible zone and dry mode',
    1299.99,
    1499.99,
    c.id,
    18,
    4.1,
    320,
    false,
    true,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "15.7 cu. ft.", "Type": "Quad door", "Zone": "Convertible zone", "Features": "Dry mode"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Electrolux Counter-Depth French Door',
    '22.5 cu. ft. counter-depth refrigerator with Perfect Temp drawer',
    2199.99,
    2399.99,
    c.id,
    7,
    4.4,
    180,
    false,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "22.5 cu. ft.", "Design": "Counter-depth", "Drawer": "Perfect Temp", "Quality": "Luxury"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Sub-Zero Built-in French Door',
    '30 cu. ft. built-in French door refrigerator with dual refrigeration',
    8999.99,
    9999.99,
    c.id,
    3,
    4.8,
    95,
    true,
    true,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "30 cu. ft.", "Type": "Built-in luxury", "Technology": "Dual refrigeration", "Premium": "Sub-Zero quality"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
  
  UNION ALL
  
  SELECT 
    'Bosch 800 Series French Door',
    '20.5 cu. ft. counter-depth French door with VitaFresh Pro drawers',
    2799.99,
    3099.99,
    c.id,
    6,
    4.5,
    250,
    true,
    false,
    'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    '{"Capacity": "20.5 cu. ft.", "Series": "800 Series", "Drawers": "VitaFresh Pro", "Design": "European"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'fridges'
) AS additional_fridges;

-- Add more products for WASHING MACHINES category (bringing total to 10)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'Samsung FlexWash + FlexDry',
    'Innovative washer and dryer combo with two separate wash compartments',
    2499.99,
    2799.99,
    c.id,
    5,
    4.7,
    180,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "5.2 + 1.0 cu. ft.", "Innovation": "FlexWash + FlexDry", "Smart": "WiFi enabled", "Design": "Front load"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Whirlpool Cabrio Top Load',
    '4.8 cu. ft. high-efficiency top load washer with built-in water faucet',
    899.99,
    999.99,
    c.id,
    20,
    4.3,
    650,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4.8 cu. ft.", "Type": "Top load HE", "Features": "Built-in faucet", "Efficiency": "High efficiency"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'GE UltraFresh Front Load',
    '4.8 cu. ft. front load washer with UltraFresh Vent System and WiFi',
    1199.99,
    1349.99,
    c.id,
    15,
    4.4,
    420,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4.8 cu. ft.", "Type": "Front load", "System": "UltraFresh Vent", "Smart": "WiFi Connect"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Maytag Bravos XL Top Load',
    '4.6 cu. ft. top load washer with PowerWash agitator and extra power button',
    799.99,
    899.99,
    c.id,
    25,
    4.2,
    580,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4.6 cu. ft.", "Agitator": "PowerWash", "Features": "Extra Power Button", "Type": "Top load"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Electrolux EFLS627U Front Load',
    '4.4 cu. ft. front load washer with Perfect Steam and LuxCare wash system',
    1099.99,
    1249.99,
    c.id,
    12,
    4.5,
    340,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4.4 cu. ft.", "Steam": "Perfect Steam", "System": "LuxCare wash", "Efficiency": "Energy Star"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Speed Queen TC5 Top Load',
    '3.3 cu. ft. commercial-grade top load washer built to last 25 years',
    1499.99,
    1699.99,
    c.id,
    8,
    4.8,
    220,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "3.3 cu. ft.", "Grade": "Commercial", "Durability": "25-year lifespan", "Quality": "Heavy duty"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Bosch 800 Series Front Load',
    '2.2 cu. ft. compact front load washer perfect for apartments and condos',
    1399.99,
    1549.99,
    c.id,
    10,
    4.4,
    280,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "2.2 cu. ft.", "Size": "Compact", "Series": "800 Series", "Use": "Apartment size"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Kenmore Elite Front Load',
    '5.2 cu. ft. front load washer with steam treat option and SmartMotion technology',
    1299.99,
    1449.99,
    c.id,
    12,
    4.3,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "5.2 cu. ft.", "Steam": "Steam Treat", "Technology": "SmartMotion", "Brand": "Kenmore Elite"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
  
  UNION ALL
  
  SELECT 
    'Frigidaire FFTW4120S Top Load',
    '4.1 cu. ft. top load washer with one-touch AutoSense and quick wash cycle',
    449.99,
    499.99,
    c.id,
    30,
    4.0,
    720,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4.1 cu. ft.", "Features": "AutoSense", "Cycle": "Quick wash", "Value": "Budget friendly"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'washing-machines'
) AS additional_washing_machines;
