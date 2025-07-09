
import React from 'react';
import { Star, ShoppingCart, Heart } from 'lucide-react';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import { Link, useNavigate } from 'react-router-dom';

interface ProductCardProps {
  id: string;
  name: string;
  description: string;
  price: number;
  originalPrice?: number;
  image: string;
  rating: number;
  reviewCount: number;
  stock: number;
  isFeatured?: boolean;
  isNewRelease?: boolean;
}

const ProductCard: React.FC<ProductCardProps> = ({
  id,
  name,
  description,
  price,
  originalPrice,
  image,
  rating,
  reviewCount,
  stock,
  isFeatured,
  isNewRelease,
}) => {
  const { addItem, items, updateQuantity } = useCart();
  const { user } = useAuth();
  const navigate = useNavigate();
  
  const cartItem = items.find(item => item.id === id);
  const isInCart = !!cartItem;
  const isOutOfStock = stock <= 0;

  const handleAddToCart = async (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    
    if (!user) {
      navigate('/auth');
      return;
    }

    if (isOutOfStock) return;

    await addItem({
      id,
      name,
      price,
      image,
      stock
    });
  };

  const handleQuantityChange = async (e: React.MouseEvent, newQuantity: number) => {
    e.preventDefault();
    e.stopPropagation();
    
    if (!user) return;
    
    await updateQuantity(id, newQuantity);
  };

  const handleShopNow = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    navigate(`/product/${id}`);
  };

  const discount = originalPrice ? Math.round(((originalPrice - price) / originalPrice) * 100) : 0;

  return (
    <Card className="group hover:shadow-lg transition-all duration-300 h-full flex flex-col">
      <Link to={`/product/${id}`} className="flex-1 flex flex-col">
        <div className="relative overflow-hidden rounded-t-lg">
          <img
            src={image}
            alt={name}
            className="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
          />
          
          {/* Badges */}
          <div className="absolute top-2 left-2 flex flex-col gap-1">
            {isNewRelease && (
              <Badge className="bg-green-500 hover:bg-green-600 text-white">
                New
              </Badge>
            )}
            {isFeatured && (
              <Badge className="bg-blue-500 hover:bg-blue-600 text-white">
                Featured
              </Badge>
            )}
            {discount > 0 && (
              <Badge className="bg-red-500 hover:bg-red-600 text-white">
                -{discount}%
              </Badge>
            )}
          </div>

          {/* Wishlist Button */}
          <Button
            variant="ghost"
            size="sm"
            className="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity bg-white/80 hover:bg-white"
            onClick={(e) => {
              e.preventDefault();
              e.stopPropagation();
            }}
          >
            <Heart className="h-4 w-4" />
          </Button>

          {/* Stock Status */}
          {isOutOfStock && (
            <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
              <Badge variant="destructive" className="text-white">
                Out of Stock
              </Badge>
            </div>
          )}
        </div>

        <CardContent className="p-4 flex-1 flex flex-col">
          <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 group-hover:text-brand-600 transition-colors">
            {name}
          </h3>
          
          <p className="text-sm text-gray-600 mb-3 line-clamp-2 flex-1">
            {description}
          </p>

          {/* Price */}
          <div className="flex items-center gap-2 mb-3">
            <span className="text-lg font-bold text-gray-900">
              ${price.toFixed(2)}
            </span>
            {originalPrice && originalPrice > price && (
              <span className="text-sm text-gray-500 line-through">
                ${originalPrice.toFixed(2)}
              </span>
            )}
          </div>

          {/* Rating */}
          <div className="flex items-center gap-1 mb-4">
            <div className="flex">
              {[...Array(5)].map((_, i) => (
                <Star
                  key={i}
                  className={`h-4 w-4 ${
                    i < Math.floor(rating)
                      ? 'text-yellow-400 fill-current'
                      : 'text-gray-300'
                  }`}
                />
              ))}
            </div>
            <span className="text-sm text-gray-600">
              {rating.toFixed(1)} ({reviewCount})
            </span>
          </div>

          {/* Stock Info */}
          <div className="mb-4">
            <span className="text-sm text-gray-600">
              {stock > 0 ? `${stock} in stock` : 'Out of stock'}
            </span>
          </div>

          {/* Action Buttons */}
          <div className="space-y-2">
            {!isOutOfStock && (
              <>
                {!isInCart ? (
                  <Button
                    onClick={handleAddToCart}
                    className="w-full"
                    disabled={isOutOfStock}
                  >
                    <ShoppingCart className="h-4 w-4 mr-2" />
                    Add to Cart
                  </Button>
                ) : (
                  <div className="flex items-center gap-2">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={(e) => handleQuantityChange(e, cartItem.quantity - 1)}
                      disabled={cartItem.quantity <= 1}
                    >
                      -
                    </Button>
                    <span className="font-medium min-w-[2rem] text-center">
                      {cartItem.quantity}
                    </span>
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={(e) => handleQuantityChange(e, cartItem.quantity + 1)}
                      disabled={cartItem.quantity >= stock}
                    >
                      +
                    </Button>
                  </div>
                )}
                
                <Button
                  variant="outline"
                  onClick={handleShopNow}
                  className="w-full"
                >
                  Shop Now
                </Button>
              </>
            )}
            
            {isOutOfStock && (
              <Button variant="outline" disabled className="w-full">
                Out of Stock
              </Button>
            )}
          </div>
        </CardContent>
      </Link>
    </Card>
  );
};

export default ProductCard;
