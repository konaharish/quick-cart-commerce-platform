
import React, { useMemo } from 'react';
import { useQuery } from '@tanstack/react-query';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { ChevronRight, Smartphone, Laptop, Watch, Headphones, Tv, Monitor, Refrigerator, WashingMachine } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import ProductCard from '@/components/ProductCard';
import { fetchProducts, fetchCategories } from '@/services/productService';

const Home: React.FC = () => {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const searchQuery = searchParams.get('search') || '';
  
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

  // Filter products based on search query
  const filteredProducts = useMemo(() => {
    if (!searchQuery.trim()) return products;
    
    const query = searchQuery.toLowerCase();
    
    return products.filter(product => {
      // Search by product name and description
      const nameMatch = product.name.toLowerCase().includes(query);
      const descriptionMatch = product.description?.toLowerCase().includes(query);
      
      // Search by category
      const categoryMatch = product.category?.toLowerCase().includes(query);
      
      // Handle special category searches
      const isBestSellersSearch = (query.includes('best') || query.includes('seller') || query.includes('featured')) && product.isFeatured;
      const isNewReleasesSearch = (query.includes('new') || query.includes('release') || query.includes('latest')) && product.isNew;
      
      // Handle specific category searches
      const isLaptopsSearch = (query.includes('laptop') || query.includes('computer')) && 
        (product.category?.toLowerCase().includes('laptop') || product.category?.toLowerCase().includes('computer'));
      const isMobilesSearch = (query.includes('mobile') || query.includes('phone') || query.includes('smartphone')) && 
        (product.category?.toLowerCase().includes('mobile') || product.category?.toLowerCase().includes('phone'));
      const isWatchesSearch = (query.includes('watch') || query.includes('smart watch')) && 
        product.category?.toLowerCase().includes('watch');
      const isTvsSearch = (query.includes('tv') || query.includes('television')) && 
        product.category?.toLowerCase().includes('tv');
      const isFridgesSearch = (query.includes('fridge') || query.includes('refrigerator')) && 
        product.category?.toLowerCase().includes('fridge');
      const isWashingMachinesSearch = (query.includes('washing') || query.includes('machine')) && 
        product.category?.toLowerCase().includes('washing');
      const isEarphonesSearch = (query.includes('earphone') || query.includes('earbud') || query.includes('headphone')) && 
        (product.category?.toLowerCase().includes('earphone') || product.category?.toLowerCase().includes('earbud'));
      
      return nameMatch || descriptionMatch || categoryMatch || 
             isBestSellersSearch || isNewReleasesSearch ||
             isLaptopsSearch || isMobilesSearch || isWatchesSearch || 
             isTvsSearch || isFridgesSearch || isWashingMachinesSearch || isEarphonesSearch;
    });
  }, [products, searchQuery]);

  const featuredProducts = (searchQuery ? filteredProducts : products).filter(product => product.isFeatured).slice(0, 8);
  const newReleases = (searchQuery ? filteredProducts : products).filter(product => product.isNew).slice(0, 8);

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

      {/* Search Results or All Products */}
      <section>
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-2xl font-bold text-gray-900">
            {searchQuery ? `Search Results for "${searchQuery}"` : 'All Products'}
          </h2>
          <span className="text-sm text-gray-500">
            {searchQuery ? filteredProducts.length : products.length} products
          </span>
        </div>
        
        {searchQuery && filteredProducts.length === 0 ? (
          <div className="text-center py-12">
            <p className="text-gray-500 text-lg">No products found for "{searchQuery}"</p>
            <p className="text-gray-400 mt-2">Try searching with different keywords</p>
          </div>
        ) : (
          <>
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
              {(searchQuery ? filteredProducts : products).slice(0, 12).map((product) => (
                <ProductCard key={product.id} {...product} />
              ))}
            </div>
            {(searchQuery ? filteredProducts : products).length > 12 && (
              <div className="text-center mt-8">
                <Button variant="outline" size="lg">
                  Load More Products
                </Button>
              </div>
            )}
          </>
        )}
      </section>
    </div>
  );
};

export default Home;
