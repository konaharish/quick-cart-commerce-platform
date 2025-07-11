import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./components/Layout";
import Home from "./pages/Home";
import ProductDetail from "./pages/ProductDetail";
import CategoryProducts from "./pages/CategoryProducts";
import Wishlist from "./pages/Wishlist";
import Auth from "./pages/Auth";
import Checkout from "./pages/Checkout";
import Orders from "./pages/Orders";
import NotFound from "./pages/NotFound";
import { AuthProvider } from "./contexts/AuthContext";
import { CartProvider } from "./contexts/CartContext";
import { WishlistProvider } from "./contexts/WishlistContext";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <AuthProvider>
        <WishlistProvider>
          <CartProvider>
            <Toaster />
            <Sonner />
            <BrowserRouter>
              <Layout>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/product/:id" element={<ProductDetail />} />
                  <Route path="/category/:categorySlug" element={<CategoryProducts />} />
                  <Route path="/wishlist" element={<Wishlist />} />
                  <Route path="/auth" element={<Auth />} />
                  <Route path="/checkout" element={<Checkout />} />
                  <Route path="/orders" element={<Orders />} />
                  <Route path="*" element={<NotFound />} />
                </Routes>
              </Layout>
            </BrowserRouter>
          </CartProvider>
        </WishlistProvider>
      </AuthProvider>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
