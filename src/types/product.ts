
export interface Product {
  id: string;
  name: string;
  description: string;
  price: number;
  originalPrice?: number;
  image: string;
  rating: number;
  reviewCount: number;
  stock: number;
  category?: string;
  isNew?: boolean;
  isFeatured?: boolean;
  specifications?: Record<string, string>;
}
