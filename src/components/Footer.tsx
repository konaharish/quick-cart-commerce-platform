
import React from 'react';
import { ShoppingCart, Facebook, Twitter, Instagram, Youtube, Mail, Phone, MapPin } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Separator } from '@/components/ui/separator';
import { Link } from 'react-router-dom';

const Footer: React.FC = () => {
  return (
    <footer className="bg-gray-900 text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {/* Company Info */}
          <div className="space-y-4">
            <Link to="/" className="flex items-center space-x-2">
              <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center">
                <ShoppingCart className="h-5 w-5 text-white" />
              </div>
              <span className="text-xl font-bold">QuickCart</span>
            </Link>
            <p className="text-gray-300 text-sm">
              Your one-stop destination for the latest electronics, gadgets, and tech accessories. 
              Quality products, competitive prices, and exceptional service.
            </p>
            <div className="flex space-x-4">
              <Button size="sm" variant="ghost" className="text-gray-300 hover:text-white p-2">
                <Facebook className="h-4 w-4" />
              </Button>
              <Button size="sm" variant="ghost" className="text-gray-300 hover:text-white p-2">
                <Twitter className="h-4 w-4" />
              </Button>
              <Button size="sm" variant="ghost" className="text-gray-300 hover:text-white p-2">
                <Instagram className="h-4 w-4" />
              </Button>
              <Button size="sm" variant="ghost" className="text-gray-300 hover:text-white p-2">
                <Youtube className="h-4 w-4" />
              </Button>
            </div>
          </div>

          {/* Quick Links */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Quick Links</h3>
            <div className="space-y-2">
              <Link to="/" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Home
              </Link>
              <Link to="/?category=best-sellers" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Best Sellers
              </Link>
              <Link to="/?category=new-releases" className="block text-gray-300 hover:text-white text-sm transition-colors">
                New Releases
              </Link>
              <Link to="/?category=mobiles" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Mobile Phones
              </Link>
              <Link to="/?category=laptops" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Laptops
              </Link>
              <Link to="/orders" className="block text-gray-300 hover:text-white text-sm transition-colors">
                My Orders
              </Link>
            </div>
          </div>

          {/* Customer Service */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Customer Service</h3>
            <div className="space-y-2">
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Help Center
              </a>
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Track Your Order
              </a>
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Returns & Exchanges
              </a>
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Shipping Info
              </a>
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Size Guide
              </a>
              <a href="#" className="block text-gray-300 hover:text-white text-sm transition-colors">
                Contact Us
              </a>
            </div>
          </div>

          {/* Newsletter */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Stay Connected</h3>
            <p className="text-gray-300 text-sm">
              Subscribe to get updates on new arrivals and exclusive offers.
            </p>
            <div className="flex space-x-2">
              <Input
                type="email"
                placeholder="Enter your email"
                className="bg-gray-800 border-gray-700 text-white placeholder-gray-400"
              />
              <Button size="sm" className="bg-brand-600 hover:bg-brand-700">
                <Mail className="h-4 w-4" />
              </Button>
            </div>
            
            <div className="space-y-2 pt-4">
              <div className="flex items-center space-x-2 text-gray-300 text-sm">
                <Phone className="h-4 w-4" />
                <span>1-800-QUICKCART</span>
              </div>
              <div className="flex items-center space-x-2 text-gray-300 text-sm">
                <Mail className="h-4 w-4" />
                <span>support@quickcart.com</span>
              </div>
              <div className="flex items-center space-x-2 text-gray-300 text-sm">
                <MapPin className="h-4 w-4" />
                <span>123 Commerce St, Tech City</span>
              </div>
            </div>
          </div>
        </div>

        <Separator className="my-8 bg-gray-700" />

        {/* Bottom section */}
        <div className="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
          <div className="flex flex-wrap items-center space-x-6 text-sm text-gray-300">
            <a href="#" className="hover:text-white transition-colors">Privacy Policy</a>
            <a href="#" className="hover:text-white transition-colors">Terms of Service</a>
            <a href="#" className="hover:text-white transition-colors">Cookie Policy</a>
            <a href="#" className="hover:text-white transition-colors">Accessibility</a>
          </div>
          
          <div className="text-sm text-gray-300">
            © 2024 QuickCart. All rights reserved.
          </div>
        </div>

        {/* Payment methods */}
        <div className="flex justify-center items-center space-x-4 mt-8 pt-8 border-t border-gray-700">
          <span className="text-sm text-gray-400">We accept:</span>
          <div className="flex space-x-2">
            <div className="w-8 h-5 bg-gray-600 rounded text-xs flex items-center justify-center text-gray-300">
              VISA
            </div>
            <div className="w-8 h-5 bg-gray-600 rounded text-xs flex items-center justify-center text-gray-300">
              MC
            </div>
            <div className="w-8 h-5 bg-gray-600 rounded text-xs flex items-center justify-center text-gray-300">
              AMEX
            </div>
            <div className="w-8 h-5 bg-gray-600 rounded text-xs flex items-center justify-center text-gray-300">
              PP
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
