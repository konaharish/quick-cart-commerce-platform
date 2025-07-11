
import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { useAuth } from './AuthContext';
import { fetchWishlist, toggleWishlist as toggleWishlistService } from '@/services/wishlistService';
import { useToast } from '@/hooks/use-toast';

interface WishlistContextType {
  wishlistItems: string[];
  isInWishlist: (productId: string) => boolean;
  toggleWishlist: (productId: string) => Promise<void>;
  isLoading: boolean;
}

const WishlistContext = createContext<WishlistContextType | undefined>(undefined);

export const useWishlist = () => {
  const context = useContext(WishlistContext);
  if (!context) {
    throw new Error('useWishlist must be used within a WishlistProvider');
  }
  return context;
};

interface WishlistProviderProps {
  children: ReactNode;
}

export const WishlistProvider: React.FC<WishlistProviderProps> = ({ children }) => {
  const [wishlistItems, setWishlistItems] = useState<string[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const { user } = useAuth();
  const { toast } = useToast();

  const loadWishlist = async () => {
    if (!user) {
      setWishlistItems([]);
      return;
    }

    try {
      setIsLoading(true);
      const items = await fetchWishlist();
      setWishlistItems(items);
    } catch (error) {
      console.error('Error loading wishlist:', error);
      toast({
        title: 'Error',
        description: 'Failed to load wishlist',
        variant: 'destructive',
      });
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    loadWishlist();
  }, [user]);

  const isInWishlist = (productId: string): boolean => {
    return wishlistItems.includes(productId);
  };

  const toggleWishlist = async (productId: string): Promise<void> => {
    if (!user) {
      toast({
        title: 'Authentication Required',
        description: 'Please log in to add items to your wishlist',
        variant: 'destructive',
      });
      return;
    }

    try {
      const wasInWishlist = isInWishlist(productId);
      await toggleWishlistService(productId, wasInWishlist);
      
      if (wasInWishlist) {
        setWishlistItems(prev => prev.filter(id => id !== productId));
        toast({
          title: 'Success',
          description: 'Item removed from wishlist',
        });
      } else {
        setWishlistItems(prev => [...prev, productId]);
        toast({
          title: 'Success',
          description: 'Item added to wishlist',
        });
      }
    } catch (error) {
      console.error('Error toggling wishlist:', error);
      toast({
        title: 'Error',
        description: 'Failed to update wishlist',
        variant: 'destructive',
      });
    }
  };

  return (
    <WishlistContext.Provider
      value={{
        wishlistItems,
        isInWishlist,
        toggleWishlist,
        isLoading,
      }}
    >
      {children}
    </WishlistContext.Provider>
  );
};
