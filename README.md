This is my solution to the [Cabify's take-home challenge.](https://github.com/cabify/MobileChallenge)
---------------------------------------------------------------------------------------------------------

I've designed and developed simple and user-friendly application which allows users to buy Cabify's products with different discounts:

<img src="https://drive.google.com/uc?export=view&id=152ePGgDJWtO_uYd6epF0URX_Ci7lziHg"  width=30% height=30%>

General technical info:
---------------

- Application was written using SwiftUI, Swift 5 and Xcode 14.2. (Latest stable releases at the moment)
- Minimum deployment target is iOS 16.0.
- Application uses MVVM Architecture.
- Network data receiving and error handling are written using Combine.

Testing
---------------
- Application is covered by different types of tests: unit, snapshot and UI-tests.
- For snapshot testing the following library is used and connected with Swift Package Manager:
https://github.com/pointfreeco/swift-snapshot-testing

>**⚠️ Warning: Before launching  snapshot tests on your local machine, be sure to select @3x simulator in Xcode (iPhone 14 for example) to prevent unexpected failures because of the different scaling.**

CI
---------------
- Application is connected to a CI via GitHub actions to execute tests remotely after each push.
- On CI tests are executed on iPhone 14 simulator

Core code overview:
---------------

1. **Data loading**
App starts with the ```CatalogueView``` which is configured with the view model of type ```CatalogueScreenViewModel```. This view model loads data from the server with ```NetworkService``` and based of its response produces the ```CatalogueScreenState```. Possible varinats:

- ```.loading``` Screen is in data loading state, ```CatalogueLoadingView``` is shown on screen.
- ```error(error: NetworkError)```  Server request is finished with error, ```CatalogueErrorView``` is shown on screen with the corresponding error description.
- ```.loadedCatalogue(catalogueModel: CatalogueModel)``` Catalogue with its products is properly loaded, ```CatalogueProductsView``` is on screen with all the loaded products.

2. **Price and discount calculations for certain product type.**
    Price and discounts are calculated within ```ProductRowViewModel```. Every time user adds or removes a certain product to a cart, ```updateProducts(_ newNumber: Int)``` function is called. Inside the function first the ```DiscountService``` service tries to apply a discount based on product's type and number of this products'type added. Then the ```CartItem``` instance is created and contains the number of the product's type purchased, overall price for them and overall discount value.
    
 3. **Overall price and discount calculations while checkout**
    After every ```updateProducts(_ newNumber: Int)``` call, the ```updateCart(with item: CartItem)``` function is called inside ```CatalogueProductsScreenViewModel```. Here, the ```CheckoutService``` calcualtes overall products purchased number, overallall price and discount value. If the total number of products is not zero, the ```CheckoutView``` appears and inside ```CheckoutViewModel``` this data is transformed to a proper format.
