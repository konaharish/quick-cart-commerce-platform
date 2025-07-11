
import { supabase } from '@/integrations/supabase/client';
import { Product } from '@/types/product';

export const fetchProducts = async (): Promise<Product[]> => {
  const { data, error } = await supabase
    .from('products')
    .select(`
      id,
      name,
      description,
      price,
      original_price,
      image_url,
      rating,
      review_count,
      stock_quantity,
      is_featured,
      is_new_release,
      specifications,
      categories (
        name,
        slug
      )
    `)
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error fetching products:', error);
    throw error;
  }

  return data?.map(product => ({
    id: product.id,
    name: product.name,
    description: product.description || '',
    price: Number(product.price),
    originalPrice: product.original_price ? Number(product.original_price) : undefined,
    image: product.image_url || 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=400&fit=crop',
    rating: Number(product.rating) || 0,
    reviewCount: product.review_count || 0,
    stock: product.stock_quantity,
    category: product.categories?.name,
    isNew: product.is_new_release || false,
    isFeatured: product.is_featured || false,
    specifications: product.specifications as Record<string, string> || {}
  })) || [];
};

export const fetchProductById = async (id: string): Promise<Product | null> => {
  const { data, error } = await supabase
    .from('products')
    .select(`
      id,
      name,
      description,
      price,
      original_price,
      image_url,
      rating,
      review_count,
      stock_quantity,
      is_featured,
      is_new_release,
      specifications,
      categories (
        name,
        slug
      )
    `)
    .eq('id', id)
    .single();

  if (error) {
    console.error('Error fetching product:', error);
    return null;
  }

  if (!data) return null;

  return {
    id: data.id,
    name: data.name,
    description: data.description || '',
    price: Number(data.price),
    originalPrice: data.original_price ? Number(data.original_price) : undefined,
    image: data.image_url || 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=400&fit=crop',
    rating: Number(data.rating) || 0,
    reviewCount: data.review_count || 0,
    stock: data.stock_quantity,
    category: data.categories?.name,
    isNew: data.is_new_release || false,
    isFeatured: data.is_featured || false,
    specifications: data.specifications as Record<string, string> || {}
  };
};

export const fetchProductsByCategory = async (categorySlug: string): Promise<Product[]> => {
  // Handle special categories
  if (categorySlug === 'best-sellers') {
    const { data, error } = await supabase
      .from('products')
      .select(`
        id,
        name,
        description,
        price,
        original_price,
        image_url,
        rating,
        review_count,
        stock_quantity,
        is_featured,
        is_new_release,
        specifications,
        categories (
          name,
          slug
        )
      `)
      .eq('is_featured', true)
      .order('created_at', { ascending: false });

    if (error) {
      console.error('Error fetching best-sellers:', error);
      throw error;
    }

    return data?.map(product => ({
      id: product.id,
      name: product.name,
      description: product.description || '',
      price: Number(product.price),
      originalPrice: product.original_price ? Number(product.original_price) : undefined,
      image: product.image_url || 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=400&fit=crop',
      rating: Number(product.rating) || 0,
      reviewCount: product.review_count || 0,
      stock: product.stock_quantity,
      category: product.categories?.name,
      isNew: product.is_new_release || false,
      isFeatured: product.is_featured || false,
      specifications: product.specifications as Record<string, string> || {}
    })) || [];
  }

  if (categorySlug === 'new-releases') {
    const { data, error } = await supabase
      .from('products')
      .select(`
        id,
        name,
        description,
        price,
        original_price,
        image_url,
        rating,
        review_count,
        stock_quantity,
        is_featured,
        is_new_release,
        specifications,
        categories (
          name,
          slug
        )
      `)
      .eq('is_new_release', true)
      .order('created_at', { ascending: false });

    if (error) {
      console.error('Error fetching new-releases:', error);
      throw error;
    }

    return data?.map(product => ({
      id: product.id,
      name: product.name,
      description: product.description || '',
      price: Number(product.price),
      originalPrice: product.original_price ? Number(product.original_price) : undefined,
      image: product.image_url || 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=400&fit=crop',
      rating: Number(product.rating) || 0,
      reviewCount: product.review_count || 0,
      stock: product.stock_quantity,
      category: product.categories?.name,
      isNew: product.is_new_release || false,
      isFeatured: product.is_featured || false,
      specifications: product.specifications as Record<string, string> || {}
    })) || [];
  }

  // Handle regular categories
  const { data, error } = await supabase
    .from('products')
    .select(`
      id,
      name,
      description,
      price,
      original_price,
      image_url,
      rating,
      review_count,
      stock_quantity,
      is_featured,
      is_new_release,
      specifications,
      categories!inner (
        name,
        slug
      )
    `)
    .eq('categories.slug', categorySlug)
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error fetching products by category:', error);
    throw error;
  }

  return data?.map(product => ({
    id: product.id,
    name: product.name,
    description: product.description || '',
    price: Number(product.price),
    originalPrice: product.original_price ? Number(product.original_price) : undefined,
    image: product.image_url || 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=400&fit=crop',
    rating: Number(product.rating) || 0,
    reviewCount: product.review_count || 0,
    stock: product.stock_quantity,
    category: product.categories?.name,
    isNew: product.is_new_release || false,
    isFeatured: product.is_featured || false,
    specifications: product.specifications as Record<string, string> || {}
  })) || [];
};

export const fetchCategories = async () => {
  const { data, error } = await supabase
    .from('categories')
    .select('id, name, slug, description')
    .order('name');

  if (error) {
    console.error('Error fetching categories:', error);
    throw error;
  }

  return data || [];
};
