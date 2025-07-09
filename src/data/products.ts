import { Product } from '@/types/product';

export const products: Product[] = [
  // Mobiles
  {
    id: '1',
    name: 'iPhone 15 Pro Max',
    description: 'The ultimate iPhone experience with titanium design, A17 Pro chip, and advanced camera system.',
    price: 1199.99,
    originalPrice: 1299.99,
    image: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    rating: 4.8,
    reviewCount: 2547,
    stock: 15,
    category: 'mobiles',
    isNew: true,
    isFeatured: true,
    specifications: {
      'Display': '6.7" Super Retina XDR',
      'Chip': 'A17 Pro',
      'Camera': '48MP Main, 12MP Ultra Wide',
      'Storage': '256GB',
      'Battery': 'Up to 29 hours video'
    }
  },
  {
    id: '2',
    name: 'Samsung Galaxy S24 Ultra',
    description: 'Premium Android smartphone with S Pen, 200MP camera, and AI-powered features.',
    price: 1099.99,
    originalPrice: 1199.99,
    image: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400&h=400&fit=crop',
    rating: 4.7,
    reviewCount: 1834,
    stock: 8,
    category: 'mobiles',
    isFeatured: true,
    specifications: {
      'Display': '6.8" Dynamic AMOLED 2X',
      'Processor': 'Snapdragon 8 Gen 3',
      'Camera': '200MP Main + 50MP Periscope',
      'Storage': '256GB',
      'S Pen': 'Included'
    }
  },
  {
    id: '3',
    name: 'Google Pixel 8 Pro',
    description: 'AI-first smartphone with Magic Eraser, Best Take, and pure Android experience.',
    price: 899.99,
    image: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
    rating: 4.6,
    reviewCount: 967,
    stock: 12,
    category: 'mobiles',
    specifications: {
      'Display': '6.7" LTPO OLED',
      'Chip': 'Google Tensor G3',
      'Camera': '50MP Main + 48MP Telephoto',
      'Storage': '128GB',
      'AI Features': 'Magic Eraser, Best Take'
    }
  },

  // Laptops
  {
    id: '4',
    name: 'MacBook Pro 16" M3 Pro',
    description: 'Supercharged for pros with M3 Pro chip, Liquid Retina XDR display, and all-day battery life.',
    price: 2499.99,
    originalPrice: 2699.99,
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
    rating: 4.9,
    reviewCount: 1256,
    stock: 5,
    category: 'laptops',
    isFeatured: true,
    specifications: {
      'Display': '16.2" Liquid Retina XDR',
      'Chip': 'Apple M3 Pro',
      'Memory': '18GB Unified Memory',
      'Storage': '512GB SSD',
      'Battery': 'Up to 22 hours'
    }
  },
  {
    id: '5',
    name: 'Dell XPS 13 Plus',
    description: 'Ultra-premium Windows laptop with InfinityEdge display and haptic touchpad.',
    price: 1299.99,
    image: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
    rating: 4.5,
    reviewCount: 834,
    stock: 18,
    category: 'laptops',
    specifications: {
      'Display': '13.4" OLED Touch',
      'Processor': 'Intel Core i7-1360P',
      'Memory': '16GB LPDDR5',
      'Storage': '512GB SSD',
      'Graphics': 'Intel Iris Xe'
    }
  },
  {
    id: '6',
    name: 'ASUS ROG Strix G16',
    description: 'Gaming powerhouse with RTX 4070, 165Hz display, and RGB lighting.',
    price: 1599.99,
    originalPrice: 1799.99,
    image: 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=400&fit=crop',
    rating: 4.4,
    reviewCount: 567,
    stock: 7,
    category: 'laptops',
    specifications: {
      'Display': '16" QHD 165Hz',
      'Processor': 'Intel Core i7-13650HX',
      'Graphics': 'NVIDIA GeForce RTX 4070',
      'Memory': '16GB DDR5',
      'Storage': '1TB SSD'
    }
  },

  // Smart Watches
  {
    id: '7',
    name: 'Apple Watch Series 9',
    description: 'Most advanced Apple Watch with Double Tap gesture and carbon neutral options.',
    price: 399.99,
    image: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop',
    rating: 4.7,
    reviewCount: 3456,
    stock: 25,
    category: 'smart-watches',
    isNew: true,
    specifications: {
      'Display': '45mm Always-On Retina',
      'Chip': 'S9 SiP',
      'Health': 'ECG, Blood Oxygen, Temperature',
      'Battery': 'Up to 18 hours',
      'Connectivity': 'GPS + Cellular'
    }
  },
  {
    id: '8',
    name: 'Samsung Galaxy Watch6',
    description: 'Advanced health monitoring with body composition analysis and sleep coaching.',
    price: 329.99,
    originalPrice: 379.99,
    image: 'https://images.unsplash.com/photo-1579586337278-3f436f25d4d4?w=400&h=400&fit=crop',
    rating: 4.5,
    reviewCount: 1289,
    stock: 14,
    category: 'smart-watches',
    specifications: {
      'Display': '1.5" Super AMOLED',
      'Processor': 'Exynos W930',
      'Health': 'BioActive Sensor',
      'Battery': 'Up to 40 hours',
      'OS': 'Wear OS powered by Samsung'
    }
  },

  // Earbuds
  {
    id: '9',
    name: 'AirPods Pro (2nd Gen)',
    description: 'Adaptive Audio, Personalized Spatial Audio, and up to 2x more Active Noise Cancellation.',
    price: 249.99,
    image: 'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop',
    rating: 4.8,
    reviewCount: 4567,
    stock: 32,
    category: 'earbuds',
    isFeatured: true,
    specifications: {
      'Chip': 'H2',
      'Battery': '6 hours + 24 hours with case',
      'Features': 'Active Noise Cancellation',
      'Audio': 'Spatial Audio',
      'Controls': 'Touch'
    }
  },
  {
    id: '10',
    name: 'Sony WF-1000XM4',
    description: 'Industry-leading noise canceling with exceptional sound quality.',
    price: 199.99,
    originalPrice: 279.99,
    image: 'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',
    rating: 4.6,
    reviewCount: 2134,
    stock: 19,
    category: 'earbuds',
    specifications: {
      'Driver': '6mm Dynamic',
      'Battery': '8 hours + 16 hours with case',
      'Features': 'Industry-leading noise canceling',
      'Audio': 'LDAC, DSEE Extreme',
      'Water Resistance': 'IPX4'
    }
  },

  // TVs
  {
    id: '11',
    name: 'Samsung 65" Neo QLED 8K',
    description: '8K resolution with Quantum Matrix Technology and Neural Quantum Processor.',
    price: 2499.99,
    originalPrice: 2999.99,
    image: 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
    rating: 4.7,
    reviewCount: 456,
    stock: 3,
    category: 'tvs',
    specifications: {
      'Display': '65" Neo QLED 8K',
      'Processor': 'Neural Quantum Processor 8K',
      'HDR': 'Quantum HDR 32X',
      'Audio': 'Object Tracking Sound+',
      'Smart TV': 'Tizen OS'
    }
  },
  {
    id: '12',
    name: 'LG 55" OLED C3',
    description: 'Self-lit OLED pixels with α9 Gen6 AI Processor for perfect blacks.',
    price: 1399.99,
    image: 'https://images.unsplash.com/photo-1567690187548-f07b1d7bf5a9?w=400&h=400&fit=crop',
    rating: 4.8,
    reviewCount: 678,
    stock: 6,
    category: 'tvs',
    isFeatured: true,
    specifications: {
      'Display': '55" OLED evo',
      'Processor': 'α9 Gen6 AI Processor 4K',
      'HDR': 'Dolby Vision IQ, HDR10 Pro',
      'Gaming': '4 x HDMI 2.1, VRR, ALLM',
      'Smart TV': 'webOS 23'
    }
  },

  // Computers
  {
    id: '13',
    name: 'Mac Studio M2 Ultra',
    description: 'Extraordinarily powerful with M2 Ultra chip for pro workflows.',
    price: 3999.99,
    image: 'https://images.unsplash.com/photo-1547394765-185e1e68f34e?w=400&h=400&fit=crop',
    rating: 4.9,
    reviewCount: 234,
    stock: 2,
    category: 'computers',
    specifications: {
      'Chip': 'Apple M2 Ultra',
      'CPU': '24-core',
      'GPU': '76-core',
      'Memory': '64GB Unified Memory',
      'Storage': '1TB SSD'
    }
  },
  {
    id: '14',
    name: 'ASUS ROG Strix GT35',
    description: 'High-performance gaming desktop with RTX 4080 and liquid cooling.',
    price: 2299.99,
    originalPrice: 2499.99,
    image: 'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=400&h=400&fit=crop',
    rating: 4.5,
    reviewCount: 345,
    stock: 4,
    category: 'computers',
    specifications: {
      'Processor': 'Intel Core i7-13700KF',
      'Graphics': 'NVIDIA GeForce RTX 4080',
      'Memory': '32GB DDR5',
      'Storage': '1TB NVMe SSD',
      'Cooling': 'ROG Keystone II'
    }
  },

  // Fridges
  {
    id: '15',
    name: 'Samsung Family Hub French Door',
    description: 'Smart refrigerator with 21.5" touchscreen and internal cameras.',
    price: 2899.99,
    image: 'https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?w=400&h=400&fit=crop',
    rating: 4.4,
    reviewCount: 567,
    stock: 5,
    category: 'fridges',
    specifications: {
      'Capacity': '28 cu. ft.',
      'Features': 'Family Hub 21.5" Display',
      'Cooling': 'Twin Cooling Plus',
      'Water/Ice': 'External Dispenser',
      'Energy': 'ENERGY STAR Certified'
    }
  },

  // Washing Machines
  {
    id: '16',
    name: 'LG WashTower with AI',
    description: 'All-in-one washer and dryer with AI technology and steam cleaning.',
    price: 1799.99,
    originalPrice: 1999.99,
    image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
    rating: 4.6,
    reviewCount: 432,
    stock: 7,
    category: 'washing-machines',
    specifications: {
      'Capacity': '4.5 cu. ft. Washer / 7.4 cu. ft. Dryer',
      'Features': 'AI DD, TurboWash 360°',
      'Cycles': '12 Wash / 14 Dry Programs',
      'Technology': 'SmartThinQ WiFi',
      'Design': 'Single Unit WashTower'
    }
  }
];

// Helper function to get products by category
export const getProductsByCategory = (category: string): Product[] => {
  if (category === 'best-sellers') {
    return products.filter(p => p.isFeatured).slice(0, 8);
  }
  if (category === 'new-releases') {
    return products.filter(p => p.isNew);
  }
  return products.filter(p => p.category === category);
};

// Helper function to search products
export const searchProducts = (query: string): Product[] => {
  const lowercaseQuery = query.toLowerCase();
  return products.filter(product =>
    product.name.toLowerCase().includes(lowercaseQuery) ||
    product.description.toLowerCase().includes(lowercaseQuery) ||
    product.category.toLowerCase().includes(lowercaseQuery)
  );
};

// Helper function to get featured products
export const getFeaturedProducts = (): Product[] => {
  return products.filter(p => p.isFeatured);
};

// Helper function to get new products
export const getNewProducts = (): Product[] => {
  return products.filter(p => p.isNew);
};
