
import React from 'react';
import { X, Star, Sparkles, Smartphone, Laptop, Watch, Headphones, Tv, Monitor, ChefHat, WashingMachine } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';
import { Link, useLocation } from 'react-router-dom';

interface SidebarProps {
  isOpen: boolean;
  onClose: () => void;
}

const categories = [
  { name: 'Best Sellers', icon: Star, slug: 'best-sellers' },
  { name: 'New Releases', icon: Sparkles, slug: 'new-releases' },
  { name: 'Mobiles', icon: Smartphone, slug: 'mobiles' },
  { name: 'Laptops', icon: Laptop, slug: 'laptops' },
  { name: 'Smart Watches', icon: Watch, slug: 'smart-watches' },
  { name: 'Earbuds', icon: Headphones, slug: 'earbuds' },
  { name: 'TVs', icon: Tv, slug: 'tvs' },
  { name: 'Computers', icon: Monitor, slug: 'computers' },
  { name: 'Fridges', icon: ChefHat, slug: 'fridges' },
  { name: 'Washing Machines', icon: WashingMachine, slug: 'washing-machines' },
  { name: 'Earphones', icon: Headphones, slug: 'earphones' },
];

const Sidebar: React.FC<SidebarProps> = ({ isOpen, onClose }) => {
  const location = useLocation();
  const currentPath = location.pathname;

  return (
    <>
      {/* Overlay */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 z-40 lg:hidden"
          onClick={onClose}
        />
      )}

      {/* Sidebar */}
      <aside
        className={cn(
          "fixed lg:static inset-y-0 left-0 z-50 w-64 bg-white shadow-lg transform transition-transform duration-300 ease-in-out",
          isOpen ? "translate-x-0" : "-translate-x-full lg:translate-x-0"
        )}
      >
        <div className="flex items-center justify-between p-4 border-b lg:hidden">
          <h2 className="text-lg font-semibold">Categories</h2>
          <Button variant="ghost" size="sm" onClick={onClose}>
            <X className="h-4 w-4" />
          </Button>
        </div>

        <div className="p-4">
          <h3 className="text-sm font-medium text-gray-500 uppercase tracking-wide mb-3">
            Shop by Category
          </h3>
          
          <nav className="space-y-1">
            {categories.map((category) => {
              const Icon = category.icon;
              const isActive = currentPath === `/category/${category.slug}`;
              
              return (
                <Link
                  key={category.slug}
                  to={`/category/${category.slug}`}
                  className={cn(
                    "flex items-center px-3 py-2 text-sm font-medium rounded-md transition-colors",
                    isActive
                      ? "bg-brand-50 text-brand-700 border-r-2 border-brand-700"
                      : "text-gray-700 hover:bg-gray-50 hover:text-gray-900"
                  )}
                  onClick={() => onClose()}
                >
                  <Icon className="mr-3 h-4 w-4" />
                  {category.name}
                </Link>
              );
            })}
          </nav>
        </div>

        {/* Featured section */}
        <div className="p-4 border-t mt-8">
          <div className="bg-gradient-to-r from-brand-500 to-brand-600 rounded-lg p-4 text-white">
            <h4 className="font-semibold mb-1">Special Offers</h4>
            <p className="text-sm text-brand-100 mb-3">
              Up to 50% off on selected items
            </p>
            <Button size="sm" variant="secondary" className="text-brand-700">
              Shop Now
            </Button>
          </div>
        </div>
      </aside>
    </>
  );
};

export default Sidebar;
