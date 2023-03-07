const String createCustomer = """
mutation customerCreate(\$input: CustomerCreateInput!) {
	customerCreate(input: \$input) {
		customer {
			firstName
			lastName
			email
			phone
		}
		customerUserErrors {
			field
			message
			code
		}
	}
}
""";

const String createCustomerToken = """
mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: \$input) {
    customerAccessToken {
			accessToken
			expiresAt
    }
    customerUserErrors {
			message
    }
  }
}
""";

const String createCart = """
mutation cartCreate (\$input:  CartInput) {
  cartCreate (input : \$input ) {
    cart {
      id
        lines(first: 10) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
								selectedOptions{
									name, 
									value}
								title
								image{url}
              }
            }
          }
        }
      }
    }
    userErrors {
      field
      message
    }
  }
}
""";

const String cartLinesUpdate = """

""";

const String cartLinesAdd = """
mutation cartLinesAdd(\$cartId: ID!, \$lines: [CartLineInput!]!) {
  cartLinesAdd(cartId: \$cartId, lines: \$lines) {
    cart {
			id
		 lines(first: 2) {
        edges {
          node {
            id
						cost{totalAmount{amount}}
            merchandise {
              ... on ProductVariant {
                id
								selectedOptions{
									name, 
									value}
								title
								product{availableForSale}
								image{url}
								price{amount}
								quantityAvailable
              }
            }
          }
        }
      }
	  }
    userErrors {
      field
      message
    }
  }
}

""";

const String cartLinesRemove = """
mutation cartLinesRemove(\$cartId: ID!, \$lineIds: [ID!]!) {
  cartLinesRemove(cartId: \$cartId, lineIds: \$lineIds) {
    cart {
     id
		 cost{totalAmount{amount}}
    }
    userErrors {
      field
      message
    }
  }
}
""";

const String createCheckOut = """
mutation checkoutCreate(\$input: CheckoutCreateInput!) {
  checkoutCreate(input: \$input) {
    checkout {
      id
      webUrl
      email
      shippingAddress{firstName lastName phone address1 address2 city  country  province  zip}
      subtotalPrice{amount}
			paymentDue{amount}
			totalPrice{amount}
    }
    checkoutUserErrors {
     message
    }
    queueToken
  }
}
""";

const String checkOutShippingAddress = """
mutation checkoutShippingAddressUpdateV2(\$checkoutId: ID!, \$shippingAddress: MailingAddressInput!) {
  checkoutShippingAddressUpdateV2(checkoutId: \$checkoutId, shippingAddress: \$shippingAddress) {
    checkout {
     id
     paymentDue{amount}
     shippingAddress{firstName lastName phone address1 address2 city  country  province  zip}
    }
    checkoutUserErrors {
     message
    }
  }
}
""";
