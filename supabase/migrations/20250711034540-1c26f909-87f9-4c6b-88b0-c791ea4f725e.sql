
-- Insert products for remaining missing categories

WITH category_lookup AS (
  SELECT id, slug FROM public.categories
)

-- Insert products for AUDIO category (10 products)
INSERT INTO public.products (name, description, price, original_price, category_id, stock_quantity, rating, review_count, is_featured, is_new_release, image_url, specifications)
SELECT * FROM (
  SELECT 
    'Sonos Arc Soundbar',
    'Premium smart soundbar with 3D sound and voice control for ultimate home theater',
    899.99,
    999.99,
    c.id,
    20,
    4.7,
    650,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Smart soundbar", "Audio": "3D sound with Dolby Atmos", "Voice": "Alexa built-in", "Connectivity": "WiFi, HDMI eARC"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Klipsch R-51M Bookshelf Speakers',
    'Reference bookshelf speakers with horn-loaded tweeters for detailed sound',
    249.99,
    299.99,
    c.id,
    35,
    4.5,
    420,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Bookshelf speakers", "Driver": "5.25 inch woofer", "Tweeter": "1 inch horn-loaded", "Power": "85W"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Yamaha RX-V6A AV Receiver',
    '7.2-channel AV receiver with 8K HDMI and MusicCast wireless streaming',
    649.99,
    749.99,
    c.id,
    15,
    4.6,
    280,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Channels": "7.2", "Power": "100W per channel", "HDMI": "8K support", "Streaming": "MusicCast"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'KEF LS50 Meta Speakers',
    'Award-winning bookshelf speakers with Metamaterial Absorption Technology',
    1499.99,
    1699.99,
    c.id,
    12,
    4.8,
    190,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Premium bookshelf", "Technology": "Metamaterial Absorption", "Driver": "Uni-Q 12th generation", "Award": "What Hi-Fi? Product of the Year"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Polk Audio T15 Bookshelf Speakers',
    'Affordable bookshelf speakers with balanced sound for music and movies',
    79.99,
    99.99,
    c.id,
    50,
    4.2,
    890,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Budget bookshelf", "Driver": "5.25 inch", "Tweeter": "0.75 inch", "Value": "Best budget option"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'JBL Bar 9.1 Soundbar',
    'True wireless surround soundbar with detachable rear speakers',
    799.99,
    899.99,
    c.id,
    18,
    4.4,
    380,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Wireless surround soundbar", "Channels": "9.1", "Features": "Detachable rear speakers", "Audio": "Dolby Atmos"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Audio-Technica AT-LP120XUSB Turntable',
    'Direct-drive turntable with USB output for vinyl digitization',
    349.99,
    399.99,
    c.id,
    25,
    4.5,
    320,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Direct-drive turntable", "Output": "USB and analog", "Features": "33/45 RPM", "Use": "Vinyl digitization"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Edifier R1280T Powered Speakers',
    'Active bookshelf speakers with multiple inputs and wireless remote',
    99.99,
    129.99,
    c.id,
    40,
    4.3,
    1200,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Powered bookshelf", "Power": "42W RMS", "Inputs": "Multiple connectivity", "Remote": "Wireless control"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Bose SoundLink Revolve+ Bluetooth',
    'Portable 360-degree Bluetooth speaker with True 360 sound',
    299.99,
    329.99,
    c.id,
    30,
    4.4,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Portable Bluetooth", "Sound": "360-degree", "Battery": "16 hours", "Features": "Water-resistant"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
  
  UNION ALL
  
  SELECT 
    'Marshall Acton III Bluetooth Speaker',
    'Iconic home speaker with Marshall signature sound and vintage design',
    279.99,
    319.99,
    c.id,
    22,
    4.6,
    340,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Home Bluetooth speaker", "Design": "Vintage Marshall", "Sound": "Signature Marshall", "Connectivity": "Bluetooth 5.0"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'audio'
) AS audio_products

UNION ALL

-- For BEST SELLERS, we'll mark existing high-rated products as best sellers
-- First, let's add some best-selling products from various categories
SELECT * FROM (
  SELECT 
    'Apple iPhone 15',
    'Latest iPhone with USB-C, 48MP camera, and A16 Bionic chip',
    799.99,
    899.99,
    c.id,
    100,
    4.6,
    2500,
    true,
    true,
    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    '{"Display": "6.1 inch Super Retina XDR", "Storage": "128GB", "Camera": "48MP Main", "Chip": "A16 Bionic"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'AirPods (3rd Generation)',
    'Popular wireless earbuds with spatial audio and improved battery life',
    179.99,
    199.99,
    c.id,
    150,
    4.5,
    3200,
    true,
    false,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Audio": "Spatial Audio", "Battery": "6h + 24h case", "Features": "Adaptive EQ", "Design": "Contoured design"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Samsung 55" Crystal UHD 4K TV',
    'Best-selling 4K Smart TV with Crystal Processor and Tizen OS',
    499.99,
    599.99,
    c.id,
    80,
    4.3,
    1850,
    true,
    false,
    'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    '{"Display": "55 inch Crystal UHD 4K", "Processor": "Crystal Processor 4K", "Smart TV": "Tizen OS", "Popular": "Best seller"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Echo Dot (5th Gen) Smart Speaker',
    'Amazon most popular smart speaker with improved sound and Alexa',
    49.99,
    59.99,
    c.id,
    200,
    4.4,
    5200,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Smart speaker", "Voice": "Alexa built-in", "Sound": "Improved audio", "Hub": "Smart home hub"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Ring Video Doorbell',
    'Best-selling smart doorbell with HD video and motion detection',
    99.99,
    119.99,
    c.id,
    120,
    4.2,
    4100,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Video": "1080p HD", "Features": "Motion detection", "Storage": "Cloud recording", "Installation": "Easy setup"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Instant Pot Duo 7-in-1',
    'Multi-functional electric pressure cooker, top kitchen appliance seller',
    79.99,
    99.99,
    c.id,
    90,
    4.6,
    2800,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Functions": "7-in-1 multi-cooker", "Capacity": "6 Qt", "Features": "Pressure cook, slow cook", "Popular": "Kitchen bestseller"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Roku Streaming Stick 4K+',
    'Popular 4K streaming device with voice remote and private listening',
    49.99,
    69.99,
    c.id,
    160,
    4.4,
    1900,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Streaming": "4K HDR", "Remote": "Voice remote", "Features": "Private listening", "Apps": "500,000+ movies"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Nintendo Switch OLED',
    'Best-selling gaming console with vibrant OLED screen',
    349.99,
    379.99,
    c.id,
    75,
    4.7,
    3500,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Display": "7 inch OLED", "Storage": "64GB", "Features": "Enhanced audio", "Gaming": "Portable and docked"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Keurig K-Classic Coffee Maker',
    'Best-selling single serve coffee maker with K-Cup pod brewing',
    89.99,
    109.99,
    c.id,
    110,
    4.3,
    2200,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Single serve", "Brewing": "K-Cup pods", "Sizes": "6, 8, 10 oz", "Popular": "Coffee bestseller"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
  
  UNION ALL
  
  SELECT 
    'Fitbit Charge 5',
    'Best-selling fitness tracker with built-in GPS and health monitoring',
    149.99,
    179.99,
    c.id,
    95,
    4.2,
    1600,
    true,
    false,
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    '{"GPS": "Built-in GPS", "Health": "Stress management", "Battery": "7 days", "Features": "ECG app"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'best-sellers'
) AS best_sellers_products

UNION ALL

-- Insert products for ELECTRONICS category (general electronics - 10 products)
SELECT * FROM (
  SELECT 
    'Anker PowerCore 10000 Power Bank',
    'Compact portable charger with fast charging for smartphones and tablets',
    29.99,
    39.99,
    c.id,
    200,
    4.4,
    3200,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "10000mAh", "Output": "12W", "Features": "PowerIQ technology", "Size": "Compact design"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Logitech MX Master 3S Wireless Mouse',
    'Advanced wireless mouse with ultra-fast scrolling and ergonomic design',
    99.99,
    119.99,
    c.id,
    80,
    4.6,
    920,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Connectivity": "Wireless", "Sensor": "4000 DPI", "Battery": "70 days", "Features": "Ultra-fast scroll"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Belkin 12-Outlet Power Strip Surge Protector',
    'Heavy-duty surge protector with 12 outlets and 8-foot cord',
    39.99,
    49.99,
    c.id,
    150,
    4.3,
    1400,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Outlets": "12 outlets", "Protection": "4320 Joules", "Cord": "8-foot", "Safety": "Lifetime warranty"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'SanDisk 1TB Extreme Portable SSD',
    'High-speed portable SSD with USB-C connectivity and rugged design',
    159.99,
    199.99,
    c.id,
    60,
    4.5,
    680,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "1TB", "Speed": "1050MB/s read", "Connectivity": "USB-C", "Design": "IP55 rated"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'TP-Link AC1750 WiFi Router',
    'Dual-band wireless router with high-speed internet for home networking',
    79.99,
    99.99,
    c.id,
    70,
    4.2,
    1200,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Speed": "AC1750", "Bands": "Dual-band", "Coverage": "2500 sq ft", "Devices": "50+ devices"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Razer DeathAdder V3 Gaming Mouse',
    'Ergonomic gaming mouse with Focus Pro 30K sensor and ultra-lightweight',
    89.99,
    109.99,
    c.id,
    45,
    4.4,
    520,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Sensor": "Focus Pro 30K", "Weight": "59g", "Clicks": "90M click lifecycle", "Gaming": "Esports grade"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Western Digital 4TB My Passport External Drive',
    'Portable external hard drive with password protection and backup software',
    109.99,
    129.99,
    c.id,
    85,
    4.3,
    890,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Capacity": "4TB", "Connectivity": "USB 3.0", "Security": "Password protection", "Software": "WD Backup"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Corsair K95 RGB Platinum Mechanical Keyboard',
    'Premium mechanical gaming keyboard with Cherry MX switches and RGB lighting',
    199.99,
    229.99,
    c.id,
    30,
    4.5,
    380,
    true,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Switches": "Cherry MX", "Lighting": "RGB per-key", "Features": "Macro keys", "Build": "Aircraft-grade aluminum"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'Blue Yeti USB Microphone',
    'Professional USB microphone for streaming, podcasting, and recording',
    99.99,
    129.99,
    c.id,
    55,
    4.4,
    1100,
    false,
    false,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "USB condenser", "Patterns": "4 pickup patterns", "Controls": "Headphone monitoring", "Use": "Streaming/podcasting"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
  
  UNION ALL
  
  SELECT 
    'ASUS ROG Swift 27" Gaming Monitor',
    '1440p 144Hz gaming monitor with G-SYNC and ultra-low input lag',
    399.99,
    449.99,
    c.id,
    25,
    4.6,
    320,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Size": "27 inch", "Resolution": "1440p", "Refresh": "144Hz", "Features": "G-SYNC Compatible"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'electronics'
) AS electronics_products

UNION ALL

-- Insert products for NEW RELEASES category (10 products)
SELECT * FROM (
  SELECT 
    'Vision Pro Mixed Reality Headset',
    'Revolutionary mixed reality headset with spatial computing and eye tracking',
    3499.99,
    3699.99,
    c.id,
    5,
    4.3,
    85,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Display": "Micro-OLED", "Tracking": "Eye and hand tracking", "Computing": "Spatial computing", "Storage": "256GB"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Google Pixel Buds Pro 2',
    'Latest wireless earbuds with Tensor A1 chip and enhanced ANC',
    229.99,
    249.99,
    c.id,
    40,
    4.5,
    190,
    true,
    true,
    'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    '{"Chip": "Tensor A1", "ANC": "Enhanced Active Noise Cancellation", "Battery": "8h + 22h case", "Features": "Conversation Detection"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Steam Deck OLED',
    'Latest handheld gaming PC with OLED display and improved battery',
    549.99,
    599.99,
    c.id,
    20,
    4.7,
    280,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Display": "7.4 inch OLED HDR", "Storage": "512GB", "Battery": "Extended life", "Gaming": "PC gaming handheld"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Meta Quest 3S VR Headset',
    'Affordable mixed reality headset with full-color passthrough',
    399.99,
    449.99,
    c.id,
    30,
    4.4,
    220,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Display": "Fast-switch LCD", "Features": "Full-color passthrough", "Controllers": "Touch Plus controllers", "VR": "Mixed reality"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Framework Laptop 16',
    'Modular laptop with upgradeable graphics and customizable ports',
    1699.99,
    1899.99,
    c.id,
    15,
    4.6,
    120,
    true,
    true,
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    '{"Modular": "Upgradeable components", "GPU": "Modular graphics", "Ports": "Customizable", "Sustainability": "Repairable design"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Rabbit R1 AI Device',
    'Pocket AI assistant with natural language interface and camera',
    199.99,
    229.99,
    c.id,
    25,
    4.1,
    150,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"AI": "Large Action Model", "Interface": "Natural language", "Camera": "360-degree rotation", "Battery": "All-day usage"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'DJI Air 3 Drone',
    'Latest dual-camera drone with 4K video and obstacle avoidance',
    1549.99,
    1699.99,
    c.id,
    18,
    4.5,
    180,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Cameras": "Dual 4K cameras", "Flight": "46-minute flight time", "Avoidance": "Omnidirectional obstacle sensing", "Range": "20km"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Humane AI Pin',
    'Wearable AI assistant with laser projection and voice interface',
    799.99,
    899.99,
    c.id,
    10,
    3.9,
    95,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Display": "Laser projection", "AI": "Voice assistant", "Wearable": "Magnetic attachment", "Features": "Translation, camera"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Teenage Engineering OP-1 Field',
    'Portable synthesizer and sampler with tape-style workflow',
    1999.99,
    2199.99,
    c.id,
    8,
    4.7,
    75,
    true,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Type": "Portable synthesizer", "Workflow": "Tape-style", "Features": "Built-in mic and speaker", "Creative": "Music production"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
  
  UNION ALL
  
  SELECT 
    'Elgato Stream Deck Neo',
    'Compact stream controller with customizable LCD keys for content creators',
    99.99,
    119.99,
    c.id,
    35,
    4.3,
    160,
    false,
    true,
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    '{"Keys": "8 LCD keys", "Use": "Content creation", "Software": "Stream Deck software", "Compact": "Desktop-friendly"}'::jsonb
  FROM category_lookup c WHERE c.slug = 'new-releases'
) AS new_releases_products;
