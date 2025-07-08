
import React from 'react';
import { Package, Truck, CheckCircle, Clock } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Separator } from '@/components/ui/separator';
import { useNavigate } from 'react-router-dom';

// Mock order data
const mockOrders = [
  {
    id: 'ORD-001',
    date: '2024-01-15',
    status: 'delivered',
    total: 1299.99,
    items: [
      {
        id: '1',
        name: 'iPhone 15 Pro Max',
        price: 1199.99,
        quantity: 1,
        image: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop'
      }
    ],
    tracking: 'TRK123456789',
    deliveryDate: '2024-01-18'
  },
  {
    id: 'ORD-002',
    date: '2024-01-20',
    status: 'shipping',
    total: 849.99,
    items: [
      {
        id: '7',
        name: 'Apple Watch Series 9',
        price: 399.99,
        quantity: 1,
        image: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400&h=400&fit=crop'
      },
      {
        id: '9',
        name: 'AirPods Pro (2nd Gen)',
        price: 249.99,
        quantity: 1,
        image: 'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400&h=400&fit=crop'
      }
    ],
    tracking: 'TRK987654321',
    estimatedDelivery: '2024-01-25'
  },
  {
    id: 'ORD-003',
    date: '2024-01-22',
    status: 'processing',
    total: 2499.99,
    items: [
      {
        id: '4',
        name: 'MacBook Pro 16" M3 Pro',
        price: 2499.99,
        quantity: 1,
        image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop'
      }
    ],
    estimatedShipping: '2024-01-25'
  }
];

const Orders: React.FC = () => {
  const navigate = useNavigate();

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'delivered':
        return <CheckCircle className="h-5 w-5 text-green-600" />;
      case 'shipping':
        return <Truck className="h-5 w-5 text-blue-600" />;
      case 'processing':
        return <Clock className="h-5 w-5 text-yellow-600" />;
      default:
        return <Package className="h-5 w-5 text-gray-600" />;
    }
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'delivered':
        return <Badge className="bg-green-100 text-green-800 hover:bg-green-100">Delivered</Badge>;
      case 'shipping':
        return <Badge className="bg-blue-100 text-blue-800 hover:bg-blue-100">Shipping</Badge>;
      case 'processing':
        return <Badge className="bg-yellow-100 text-yellow-800 hover:bg-yellow-100">Processing</Badge>;
      default:
        return <Badge variant="secondary">Unknown</Badge>;
    }
  };

  if (mockOrders.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-16 text-center">
        <Package className="h-16 w-16 text-gray-300 mx-auto mb-4" />
        <h1 className="text-2xl font-bold mb-4">No orders yet</h1>
        <p className="text-gray-600 mb-6">When you place your first order, it will appear here</p>
        <Button onClick={() => navigate('/')}>Start Shopping</Button>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Your Orders</h1>
        <p className="text-gray-600 mt-1">Track and manage your orders</p>
      </div>

      <div className="space-y-6">
        {mockOrders.map((order) => (
          <Card key={order.id} className="shadow-sm">
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  {getStatusIcon(order.status)}
                  <div>
                    <CardTitle className="text-lg">Order {order.id}</CardTitle>
                    <p className="text-sm text-gray-500">
                      Placed on {new Date(order.date).toLocaleDateString()}
                    </p>
                  </div>
                </div>
                <div className="text-right">
                  {getStatusBadge(order.status)}
                  <p className="text-lg font-semibold mt-1">
                    ${order.total.toFixed(2)}
                  </p>
                </div>
              </div>
            </CardHeader>

            <CardContent className="space-y-4">
              {/* Order Items */}
              <div className="space-y-3">
                {order.items.map((item) => (
                  <div key={item.id} className="flex items-center space-x-4">
                    <img
                      src={item.image}
                      alt={item.name}
                      className="w-16 h-16 object-cover rounded-md"
                    />
                    <div className="flex-1">
                      <h4 className="font-medium text-gray-900">{item.name}</h4>
                      <p className="text-sm text-gray-500">
                        Quantity: {item.quantity} • ${item.price.toFixed(2)}
                      </p>
                    </div>
                  </div>
                ))}
              </div>

              <Separator />

              {/* Order Status Details */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  {order.status === 'delivered' && (
                    <div>
                      <p className="text-sm font-medium text-gray-900">Delivered</p>
                      <p className="text-sm text-gray-500">
                        {new Date(order.deliveryDate!).toLocaleDateString()}
                      </p>
                    </div>
                  )}
                  
                  {order.status === 'shipping' && (
                    <div>
                      <p className="text-sm font-medium text-gray-900">Tracking Number</p>
                      <p className="text-sm text-gray-500">{order.tracking}</p>
                      <p className="text-sm text-gray-500 mt-1">
                        Estimated delivery: {new Date(order.estimatedDelivery!).toLocaleDateString()}
                      </p>
                    </div>
                  )}
                  
                  {order.status === 'processing' && (
                    <div>
                      <p className="text-sm font-medium text-gray-900">Processing</p>
                      <p className="text-sm text-gray-500">
                        Estimated shipping: {new Date(order.estimatedShipping!).toLocaleDateString()}
                      </p>
                    </div>
                  )}
                </div>

                <div className="flex justify-end space-x-2">
                  {order.status === 'shipping' && (
                    <Button variant="outline" size="sm">
                      Track Package
                    </Button>
                  )}
                  
                  {order.status === 'delivered' && (
                    <>
                      <Button variant="outline" size="sm">
                        Return Item
                      </Button>
                      <Button variant="outline" size="sm">
                        Leave Review
                      </Button>
                    </>
                  )}
                  
                  <Button variant="outline" size="sm">
                    View Details
                  </Button>
                  
                  <Button size="sm">
                    Buy Again
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Load More */}
      <div className="text-center mt-8">
        <Button variant="outline">Load More Orders</Button>
      </div>
    </div>
  );
};

export default Orders;
