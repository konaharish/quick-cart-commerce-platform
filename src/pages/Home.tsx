
import React from 'react';
import { useQuery } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import { ChevronRight, Smartphone, Laptop, Watch, Headphones, Tv, Monitor, Refrigerator, WashingMachine } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import ProductCard from '@/components/ProductCard';
import { fetchProducts, fetchCategories } from '@/services/productService';

const Home: React.FC = () => {
  const navigate = useNavigate();
  
  const { data: products = [], isLoading: productsLoading } = useQuery({
    queryKey: ['products'],
    queryFn: fetchProducts,
  });

  const { data: categories = [], isLoading: categoriesLoading } = useQuery({
    queryKey: ['categories'],
    queryFn: fetchCategories,
  });

  const categoryIcons: Record<string, React.ReactNode> = {
    'mobiles': <Smartphone className="h-8 w-8" />,
    'laptops': <Laptop className="h-8 w-8" />,
    'smart-watches': <Watch className="h-8 w-8" />,
    'earbuds': <Headphones className="h-8 w-8" />,
    'earphones': <Headphones className="h-8 w-8" />,
    'tvs': <Tv className="h-8 w-8" />,
    'computers': <Monitor className="h-8 w-8" />,
    'fridges': <Refrigerator className="h-8 w-8" />,
    'washing-machines': <WashingMachine className="h-8 w-8" />,
  };

  const featuredProducts = products.filter(product => product.isFeatured).slice(0, 8);
  const newReleases = products.filter(product => product.isNew).slice(0, 8);

  const handleCategoryClick = (categorySlug: string) => {
    navigate(`/category/${categorySlug}`);
  };

  if (productsLoading || categoriesLoading) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="animate-pulse">
          <div className="h-8 bg-gray-200 rounded w-1/4 mb-6"></div>
          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4 mb-12">
            {[...Array(6)].map((_, i) => (
              <div key={i} className="bg-gray-200 rounded-lg h-24"></div>
            ))}
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {[...Array(8)].map((_, i) => (
              <div key={i} className="bg-gray-200 rounded-lg h-80"></div>
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      {/* Categories Section */}
      <section className="mb-12">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Shop by Category</h2>
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
          {categories.map((category) => (
            <Card 
              key={category.id} 
              className="cursor-pointer hover:shadow-lg transition-shadow duration-200"
              onClick={() => handleCategoryClick(category.slug)}
            >
              <CardContent className="p-4 text-center">
                <div className="flex justify-center mb-2 text-brand-600">
                  {categoryIcons[category.slug] || <Monitor className="h-8 w-8" />}
                </div>
                <h3 className="font-medium text-sm text-gray-900">{category.name}</h3>
              </CardContent>
            </Card>
          ))}
        </div>
      </section>

      {/* Featured Products */}
      {featuredProducts.length > 0 && (
        <section className="mb-12">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-bold text-gray-900">Featured Products</h2>
            <Button 
              variant="ghost" 
              onClick={() => navigate('/category/best-sellers')}
              className="text-brand-600 hover:text-brand-700"
            >
              View All <ChevronRight className="ml-1 h-4 w-4" />
            </Button>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {featuredProducts.map((product) => (
              <ProductCard key={product.id} {...product} />
            ))}
          </div>
        </section>
      )}

      {/* New Releases */}
      {newReleases.length > 0 && (
        <section className="mb-12">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-bold text-gray-900">New Releases</h2>
            <Button 
              variant="ghost" 
              onClick={() => navigate('/category/new-releases')}
              className="text-brand-600 hover:text-brand-700"
            >
              View All <ChevronRight className="ml-1 h-4 w-4" />
            </Button>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {newReleases.map((product) => (
              <ProductCard key={product.id} {...product} />
            ))}
          </div>
        </section>
      )}

      {/* All Products */}
      <section>
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-2xl font-bold text-gray-900">All Products</h2>
          <span className="text-sm text-gray-500">{products.length} products</span>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {products.slice(0, 12).map((product) => (
            <ProductCard key={product.id} {...product} />
          ))}
        </div>
        {products.length > 12 && (
          <div className="text-center mt-8">
            <Button variant="outline" size="lg">
              Load More Products
            </Button>
          </div>
        )}
      </section>
    </div>
  );
};

export default Home;
