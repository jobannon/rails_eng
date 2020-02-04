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
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/jobannon/rails_eng">
    <img src="images/schema.png" alt="Logo" width="80" height="80">
  </a>

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
  * [Query](#Query)
* [Roadmap](#roadmap)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here's a blank template to get started:
**To avoid retyping too much info. Do a search and replace with your text editor for the following:**
`github_username`, `repo`, `twitter_handle`, `email`


### Built With

* [](Ruby 2.5.1)
* [](Rails 5.1.7)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
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
3. Test Suite Usage 
```sh
bundle exec rspec 
```



<!-- USAGE EXAMPLES -->
## Usage

This API is divided into 6 resource tables.  All resources are exposed.

customers
transactions
invoices
merchants
items
invoiceitems

### Endpoints

All resource endponts are exposed for an "index" and "show" action
Index>
  * Example
    ``` sh 
    GET /api/v1/merchants
    ``` 
  * Usage
    GET /api/v1/<resource>
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
Show>
  * Example
    ``` sh 
    GET /api/v1/merchants/:id
    ```
  * Usage
    GET /api/v1/resource
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
### Multi_Finder
### Relationships
### Query
This 
Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/jobannon/rails_eng/issues) for a list of proposed features (and known issues).



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@jtobannon](https://twitter.com/jtobannon) - email

Project Link: [https://github.com/jobannon/rails_eng](https://github.com/jobannon/rails_eng)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
