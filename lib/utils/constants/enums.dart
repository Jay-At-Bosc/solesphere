// Text Sizes
enum TextSizes { small, medium, large }

// Customer Status
enum CustomerStatus { prime, nonPrime }

// Customer Gender
enum CustomerGender { kids, women, men }

// Footwear Type
enum FootwearType {
  sneakers,
  walking,
  formal,
  running,
  loafers,
  sports,
}

// Footwear Material
enum FootwearMaterial {
  acrylic,
  canvas,
  cotton,
  denim,
  fauxFur,
  fauxLeather,
  fur,
  leather,
  linen,
  mesh,
  naturalRubber,
  neoprene,
  nylon,
  polyester,
  pvc,
  wool
}

// Footwear Closure Type
enum ClosureType { buckle, bungee, hookNloop, laceUp, pullOn }

// Sort by
enum SortBy {
  lowToHigh,
  highToLow,
  newArrivals,
  last30Days,
  last90Days,
}

// Order Status
enum OrderStatus { placed, shipment, delivered, cancelled, pending }

// Payment Mothods
enum PaymentMethods { razorpay, cod }

// Payment Status
enum PaymentStatus { successful, pending, failed, refunded }

// Delivery Status
enum DeliveryStatus {
  onTime,
  delayed,
}
