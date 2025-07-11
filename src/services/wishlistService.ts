
import { supabase } from '@/integrations/supabase/client';

export interface WishlistItem {
  id: string;
  user_id: string;
  product_id: string;
  created_at: string;
}

export const fetchWishlist = async (): Promise<string[]> => {
  const { data, error } = await supabase
    .from('wishlist')
    .select('product_id');

  if (error) {
    console.error('Error fetching wishlist:', error);
    throw error;
  }

  return data?.map(item => item.product_id) || [];
};

export const addToWishlist = async (productId: string): Promise<void> => {
  const { error } = await supabase
    .from('wishlist')
    .insert([{ product_id: productId }]);

  if (error) {
    console.error('Error adding to wishlist:', error);
    throw error;
  }
};

export const removeFromWishlist = async (productId: string): Promise<void> => {
  const { error } = await supabase
    .from('wishlist')
    .delete()
    .eq('product_id', productId);

  if (error) {
    console.error('Error removing from wishlist:', error);
    throw error;
  }
};

export const toggleWishlist = async (productId: string, isInWishlist: boolean): Promise<void> => {
  if (isInWishlist) {
    await removeFromWishlist(productId);
  } else {
    await addToWishlist(productId);
  }
};
