
import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useQuery } from '@tanstack/react-query';
import { ArrowLeft } from 'lucide-react';
import { Button } from '@/components/ui/button';
import ProductCard from '@/components/ProductCard';
import { fetchProductsByCategory } from '@/services/productService';

const CategoryProducts: React.FC = () => {
  const { categorySlug } = useParams<{ categorySlug: string }>();
  const navigate = useNavigate();

  const { data: products = [], isLoading, error } = useQuery({
    queryKey: ['products', 'category', categorySlug],
    queryFn: () => fetchProductsByCategory(categorySlug!),
    enabled: !!categorySlug,
  });

  if (isLoading) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="animate-pulse">
          <div className="h-8 bg-gray-200 rounded w-1/4 mb-6"></div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {[...Array(8)].map((_, i) => (
              <div key={i} className="bg-gray-200 rounded-lg h-80"></div>
            ))}
          </div>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Error loading products</h1>
          <p className="text-gray-600 mb-6">There was an error loading the products. Please try again.</p>
          <Button onClick={() => navigate('/')}>Go Back Home</Button>
        </div>
      </div>
    );
  }

  const categoryName = products[0]?.category || categorySlug?.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase());

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <div className="flex items-center mb-6">
        <Button
          variant="ghost"
          onClick={() => navigate('/')}
          className="mr-4"
        >
          <ArrowLeft className="h-4 w-4 mr-2" />
          Back to Home
        </Button>
        <h1 className="text-3xl font-bold text-gray-900">{categoryName}</h1>
      </div>

      {products.length === 0 ? (
        <div className="text-center py-12">
          <h2 className="text-xl font-semibold text-gray-900 mb-2">No products found</h2>
          <p className="text-gray-600">We couldn't find any products in this category.</p>
        </div>
      ) : (
        <>
          <p className="text-gray-600 mb-8">
            Showing {products.length} {products.length === 1 ? 'product' : 'products'} in {categoryName}
          </p>
          
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {products.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
        </>
      )}
    </div>
  );
};

export default CategoryProducts;
