
import React, { useState } from 'react';
import { Search, ShoppingCart, Menu, User, Heart, LogOut } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { useCart } from '@/contexts/CartContext';
import { useAuth } from '@/contexts/AuthContext';
import { Link, useNavigate } from 'react-router-dom';
import CartDrawer from './CartDrawer';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';

interface HeaderProps {
  onMenuClick: () => void;
}

const Header: React.FC<HeaderProps> = ({ onMenuClick }) => {
  const { itemCount } = useCart();
  const { user, signOut } = useAuth();
  const [searchQuery, setSearchQuery] = useState('');
  const [cartOpen, setCartOpen] = useState(false);
  const navigate = useNavigate();

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (searchQuery.trim()) {
      navigate(`/?search=${encodeURIComponent(searchQuery.trim())}`);
    }
  };

  const handleSignOut = async () => {
    await signOut();
    navigate('/');
  };

  return (
    <>
      <header className="bg-white shadow-sm border-b sticky top-0 z-40">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            {/* Mobile menu button */}
            <Button
              variant="ghost"
              size="sm"
              className="lg:hidden"
              onClick={onMenuClick}
            >
              <Menu className="h-6 w-6" />
            </Button>

            {/* Logo */}
            <Link to="/" className="flex items-center space-x-2">
              <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center">
                <ShoppingCart className="h-5 w-5 text-white" />
              </div>
              <span className="text-xl font-bold text-gray-900 hidden sm:block">
                QuickCart
              </span>
            </Link>

            {/* Search bar */}
            <form onSubmit={handleSearch} className="flex-1 max-w-lg mx-4">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  type="text"
                  placeholder="Search products..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10 w-full bg-gray-50 border-0 focus:bg-white focus:ring-2 focus:ring-brand-500"
                />
              </div>
            </form>

            {/* Right section */}
            <div className="flex items-center space-x-2">
              {/* Wishlist - Desktop only */}
              <Link to="/wishlist">
                <Button variant="ghost" size="sm" className="hidden sm:flex">
                  <Heart className="h-5 w-5" />
                  <span className="ml-2 hidden md:inline">Wishlist</span>
                </Button>
              </Link>

              {/* Account */}
              {user ? (
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <Button variant="ghost" size="sm">
                      <User className="h-5 w-5" />
                      <span className="ml-2 hidden md:inline">
                        {user.email?.split('@')[0]}
                      </span>
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end">
                    <DropdownMenuItem onClick={() => navigate('/orders')}>
                      My Orders
                    </DropdownMenuItem>
                    <DropdownMenuItem onClick={handleSignOut}>
                      <LogOut className="h-4 w-4 mr-2" />
                      Sign Out
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              ) : (
                <Link to="/auth">
                  <Button variant="ghost" size="sm">
                    <User className="h-5 w-5" />
                    <span className="ml-2 hidden md:inline">Sign In</span>
                  </Button>
                </Link>
              )}

              {/* Cart */}
              <Button
                variant="ghost"
                size="sm"
                className="relative"
                onClick={() => setCartOpen(true)}
              >
                <ShoppingCart className="h-5 w-5" />
                <span className="ml-2 hidden md:inline">Cart</span>
                {itemCount > 0 && (
                  <Badge
                    variant="destructive"
                    className="absolute -top-2 -right-2 h-5 w-5 flex items-center justify-center p-0 text-xs"
                  >
                    {itemCount}
                  </Badge>
                )}
              </Button>
            </div>
          </div>
        </div>
      </header>

      <CartDrawer open={cartOpen} onOpenChange={setCartOpen} />
    </>
  );
};

export default Header;
