<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the rails_eng and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo, twitter_handle, email
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Build Status](https://travis-ci.com/jobannon/rails_eng.svg?branch=master)](https://travis-ci.com/jobannon/rails_eng)

<!-- PROJECT LOGO -->
![schema_rails_eng](https://user-images.githubusercontent.com/16090626/75723704-08c3f380-5c9a-11ea-8683-55080c917730.png)

<h3 align="center">Rails Engine API</h3>

<p align="center">
  A Business Intelligence Focused API.  Built from scratch. 
  <br />
  <a href="https://github.com/jobannon/rails_eng"><strong>Explore the docs »</strong></a>
  <br />
  <br />
  ·
  <a href="https://github.com/jobannon/rails_eng/issues">Report Bug</a>
  ·
  <a href="https://github.com/jobannon/rails_eng/issues">Request Feature</a>
</p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Endpoints](#Endpoints)
  * [Relationships](#Relationships)
  * [Single_Finder](#Single_Finder)
  * [Multi_Finder](#Multi_Finder)
  * [Random](#Random)
  * [Query](#Query)
* [Roadmap](#roadmap)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

Customer Built Business Class API using using Rails and Ruby 

### Built With

* (Ruby 2.5.1)
* (Rails 5.1.7)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* FastAPI

### Installation

1. Clone the repo
    ```sh
    git clone https://github.com/jobannon/rails_eng.git
    ```
2. Setup the Database  
    ```sh
    bundle exec rails db:drop
    bundle exec rails db:create
    bundle exec rails db:migrate
    bundle exec rails db:seed
    ```
3. Populate our API with data using a custom built rake file
    ```sh
    rake import:all_import 
    ```

4. Test Suite Usage 
    ```sh
    bundle exec rspec 
    ```



<!-- USAGE EXAMPLES -->
## Usage

This API is divided into 6 resource tables.  All resources are exposed.
|------| 
|customers|
|transactions|
|invoices|
|merchants|
|items|
|invoiceitems|

### Endpoints

All resource endponts are exposed for an "index" and "show" action

<strong>Index</strong>
* Example

  ```sh 
  GET /api/v1/merchants
  ``` 

* Usage
  ```sh
      GET /api/v1/<resource>
  ```
* Output
  ```sh
    {
    "data": [
    {
      "id": "1",
        "type": "merchant",
        "attributes": {
          "name": "Mike's Awesome Store",
        }
    },
    {
      "id": "2",
      "type": "merchant",
      "attributes": {
        "name": "Store of Fate",
      }
    },
    {
      "id": "3",
      "type": "merchant",
      "attributes": {
        "name": "This is the limit of my creativity",
      }
    }
    ]
  }
  ```
<strong>Show</strong>
* Example
  ```sh 
  GET /api/v1/merchants/:id
  ```
* Usage

  ```sh
      GET /api/v1/resource
  ```

* Output
  ```sh
    {
      "data": {
        "id": "1",
        "type": "merchant",
        "attributes": {
          "name": "Store Name"
        }
      }
    }
  ```


### Single_Finder
* Usage 
  ``` sh
    GET /api/v1/merchants/find?parameters
  ``` 

    | Param| search | resource attribute |
    | ------------- |:-------------:| -----:|
    | id| based on | id |
    | name | based on |   name |
    | created_at | based on | table.timestamp|
    | updated_at| based on  |    table.timestamp |

* All queries will return the first record
* Output
    ```sh
      {
        "data": {
          "id": "1",
          "type": "merchant",
          "attributes": {
            "name": "Store Name"
          }
        }
      }
    ```
### Multi_Finder

* Very similar to a single finder but will return the complete collection matching the search criteria
      ``` sh
      GET /api/v1/merchants/find_all?parameters
      ```

### Random
* Returns a random resource within a collection
    ```sh
    api/v1/merchants/random
    ```
* This was built with `RANDOM` method in SQL 

### Relationships

* Following relationships were built into each resource table and are reflected in the schema

    | GET request | Returns | 
    | --------------------------| -------:| 
    ||  | 
    |<strong>>Merchants</strong> |  | 
    | GET /api/v1/merchants/:id/items | returns a collection of items associated with that merchant |  
    | GET /api/v1/merchants/:id/items | returns a collection of items associated with that merchant |
    | GET /api/v1/merchants/:id/invoices | returns a collection of invoices associated with that merchant from their known orders |  
    | <strong>>Invoices</strong> |  | 
    |  GET /api/v1/invoices/:id/transactions | returns a collection of associated transactions |  
    |  GET /api/v1/invoices/:id/invoice_items |  returns a collection of associated invoice items |  
    | GET /api/v1/invoices/:id/items | returns a collection of associated items |   
    | GET /api/v1/invoices/:id/customer |   returns the associated customer |  
    | GET /api/v1/invoices/:id/merchant  |  returns the associated merchant|  
    | <strong>>Invoice Items</strong>  |  |  
    | GET /api/v1/invoice_items/:id/invoice |returns the associated invoice  |  
    | GET /api/v1/invoice_items/:id/item |returns the associated item  |  
    | <strong>>Items</strong> |  |  
    | GET /api/v1/items/:id/invoice_items | returns a collection of associated invoice items  |  
    | GET /api/v1/items/:id/merchant | returns the associated merchant |  
    |  <strong>>Transactions</strong> |  |  
    | GET /api/v1/transactions/:id/invoice | returns the associated invoice |   
    | <strong>>Customers</strong> |  |  
    | GET /api/v1/customers/:id/invoices | returns a collection of associated invoices |  
    | GET /api/v1/customers/:id/transactions | returns a collection of associated transactions |  
    |  |  |   
      

### Query
* Business Intelligence Queries 

    | GET request | Returns | 
    | ------------| -------:| 
    |<strong> >All Merchants</strong> |  | 
    |GET /api/v1/merchants/most_revenue?quantity=x |  returns the top x merchants ranked by total revenue |  
    |GET /api/v1/merchants/revenue?date=x | returns the total revenue for date x across all merchants |
    | <strong>>Single Merchant</strong> | |
    |GET /api/v1/merchants/:id/favorite_customer | returns the customer who has conducted the most total number of successful transactions |
    | <strong>>Items</strong> | | 
    | GET /api/v1/items/most_revenue?quantity=x | returns the top x items ranked by total revenue generated |
    |GET /api/v1/items/:id/best_day | returns the date with the most sales for the given item using the invoice date. If there are multiple days, return the most recent day |
    | <strong>>Customers</strong> | | 
    |GET /api/v1/customers/:id/favorite_merchant | returns a merchant where the customer has conducted the most successful transactions |


<!-- ROADMAP -->
## Roadmap
* SEE ISSUES  

    See the [open issues](https://github.com/jobannon/rails_eng/issues) for a list of proposed features (and known issues).



<!-- LICENSE -->
## License

Distributed under License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

[@jtobannon](https://twitter.com/jtobannon) - jtobannon@gmail.com 

[https://github.com/jobannon/rails_eng](https://github.com/jobannon/rails_eng)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* Turing School of Software and Design (www.turing.io)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/jobannon/rails_eng
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/LinkedIn-Joshua%20O'Bannon%20(repo%20owner)-0e76a8
[linkedin-url]: https://linkedin.com/in/jtobannon
[product-screenshot]: images/screenshot.png
