
import React from 'react';
import { useWishlist } from '@/contexts/WishlistContext';
import { useQuery } from '@tanstack/react-query';
import { fetchProductById } from '@/services/productService';
import { Heart, ShoppingCart, Trash2 } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import { Link, useNavigate } from 'react-router-dom';

const Wishlist: React.FC = () => {
  const { wishlistItems, toggleWishlist, isLoading } = useWishlist();
  const { addItem } = useCart();
  const { user } = useAuth();
  const navigate = useNavigate();

  const { data: wishlistProducts, isLoading: productsLoading } = useQuery({
    queryKey: ['wishlist-products', wishlistItems],
    queryFn: async () => {
      if (wishlistItems.length === 0) return [];
      const products = await Promise.all(
        wishlistItems.map(productId => fetchProductById(productId))
      );
      return products.filter(Boolean);
    },
    enabled: wishlistItems.length > 0
  });

  if (!user) {
    return (
      <div className="min-h-screen bg-gray-50 py-8">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <Heart className="h-16 w-16 text-gray-400 mx-auto mb-4" />
            <h1 className="text-2xl font-bold text-gray-900 mb-2">Sign in to view your wishlist</h1>
            <p className="text-gray-600 mb-6">Save your favorite items for later</p>
            <Link to="/auth">
              <Button>Sign In</Button>
            </Link>
          </div>
        </div>
      </div>
    );
  }

  if (isLoading || productsLoading) {
    return (
      <div className="min-h-screen bg-gray-50 py-8">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-brand-600 mx-auto"></div>
            <p className="mt-4 text-gray-600">Loading your wishlist...</p>
          </div>
        </div>
      </div>
    );
  }

  const handleAddToCart = async (product: any) => {
    await addItem({
      id: product.id,
      name: product.name,
      price: product.price,
      image: product.image,
      stock: product.stock
    });
  };

  const handleRemoveFromWishlist = async (productId: string) => {
    await toggleWishlist(productId);
  };

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">My Wishlist</h1>
          <p className="text-gray-600">
            {wishlistProducts?.length || 0} item{(wishlistProducts?.length || 0) !== 1 ? 's' : ''} saved
          </p>
        </div>

        {!wishlistProducts || wishlistProducts.length === 0 ? (
          <div className="text-center py-12">
            <Heart className="h-16 w-16 text-gray-400 mx-auto mb-4" />
            <h2 className="text-xl font-semibold text-gray-900 mb-2">Your wishlist is empty</h2>
            <p className="text-gray-600 mb-6">Start adding items you love to your wishlist</p>
            <Link to="/">
              <Button>Continue Shopping</Button>
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {wishlistProducts.map((product) => (
              <Card key={product.id} className="group hover:shadow-lg transition-all duration-300">
                <Link to={`/product/${product.id}`}>
                  <div className="relative overflow-hidden rounded-t-lg">
                    <img
                      src={product.image}
                      alt={product.name}
                      className="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
                    />
                    {product.stock <= 0 && (
                      <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
                        <span className="bg-red-500 text-white px-3 py-1 rounded-full text-sm font-medium">
                          Out of Stock
                        </span>
                      </div>
                    )}
                  </div>
                </Link>

                <CardContent className="p-4">
                  <Link to={`/product/${product.id}`}>
                    <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 group-hover:text-brand-600 transition-colors">
                      {product.name}
                    </h3>
                  </Link>
                  
                  <div className="flex items-center gap-2 mb-3">
                    <span className="text-lg font-bold text-gray-900">
                      ${product.price.toFixed(2)}
                    </span>
                    {product.originalPrice && product.originalPrice > product.price && (
                      <span className="text-sm text-gray-500 line-through">
                        ${product.originalPrice.toFixed(2)}
                      </span>
                    )}
                  </div>

                  <div className="flex gap-2">
                    {product.stock > 0 ? (
                      <Button
                        onClick={() => handleAddToCart(product)}
                        className="flex-1"
                        size="sm"
                      >
                        <ShoppingCart className="h-4 w-4 mr-2" />
                        Add to Cart
                      </Button>
                    ) : (
                      <Button disabled className="flex-1" size="sm">
                        Out of Stock
                      </Button>
                    )}
                    
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => handleRemoveFromWishlist(product.id)}
                      className="text-red-600 hover:text-red-700"
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default Wishlist;
