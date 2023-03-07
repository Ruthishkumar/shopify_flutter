class AllQueries {
  String getCollection = """
  query collections (\$first : Int) {
    collections (first : \$first) {
       edges{
			  node{
				title
				id
				products(first : 10){edges{node{featuredImage{url} id title priceRange{minVariantPrice{amount}}
}}}
		 }
	  }
  }
 }
""";

  String getProducts = """
  query products (\$first : Int) {
    products (first : \$first) {
    edges{
		node{
			 featuredImage{
			  url
			  }
				availableForSale
			  priceRange{minVariantPrice{amount}}
				title
				id 
				variants(first : 10){
			  edges{
			  node{
			  quantityAvailable
			 }
			}
		}
				
   }
	}
 }
}
""";

  String productsAttributes = """
   query product (\$id : ID) {
     product (id : \$id) {
       	featuredImage{url}
		    productType
		    options{id name values}
		    title
        variants(first : 12){edges{node{
			  price{amount}
			  sku
			  title
			  id
			  quantityAvailable
			  availableForSale
			  selectedOptions{name value}
		  }
	  }
   }
  }
 }
""";

  String getCart = """
  query cart (\$id : ID!)  {
    cart (id : \$id) {
		 id
		 totalQuantity
		 cost{
		 totalTaxAmount{
		 amount} 
		 totalAmount{
		 amount} 
		 checkoutChargeAmount{
		 amount}
		 }
     lines(first: 10) {
     edges {
       node {
         id
         merchandise {
          ... on ProductVariant {
          	  product{
          	  productType
          	  }
							selectedOptions{
							name, 
							value
							}
							title
							image{
							   url
								}
              }
            }
          }
        }
      }
    }
 }
""";
}
