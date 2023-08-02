# Tea Subscription Service API
This is a backend API application that stores data for a tea subscription service with three endpoints allowing a frontend team to access data needed to display to a user. The three endpoints included area ```GET``` request for all subscriptions associated with a customer (both active and canceled), a ```POST``` request to create a new subscription for a customer, and a ```DELETE``` request to cancel a customer's subscriptions.

## Tech Used
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## DB Design
![](https://user-images.githubusercontent.com/118231210/257867107-df8c1669-bbd3-42c7-a5e7-1b1cddb5fd3a.png)

## Getting Started
1. Fork and Clone the repo
2. Run ```bundle install```
3. Set up your database with ```rails db:{drop,create,migrate,seed}```
4. Make sure all tests are passing by running ```bundle exec rspec``` (there should be 26 passing tests)
5. Start up your local server by running ```rails s```
6. See below for endpoints to send requests and for response examples
   
## Endpoints
### `GET /api/v0/customers/:id/subscriptions`
Response
```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Green Tea Subscription",
                "price": "15.00",
                "status": "Active",
                "frequency": "Monthly",
                "customer_id": 1,
                "tea_id": 1
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Black Tea Subscription",
                "price": "20.00",
                "status": "Active",
                "frequency": "Weekly",
                "customer_id": 1,
                "tea_id": 2
            }
        },
        {
            "id": "5",
            "type": "subscription",
            "attributes": {
                "title": "Sweet Tea Subscription",
                "price": "10.00",
                "status": "Cancelled",
                "frequency": "Weekly",
                "customer_id": 1,
                "tea_id": 3
            }
        }
    ]
}
```

### `POST /api/v0/subscriptions`
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| customer_id, integer  | The id of a current customer |
| tea_id, integer  | The id of a current tea |
| title, string  | The title of the subscription service |
| price, string  | The price of the subscription |
| status, string  | The current status of the subscriptions |
| frequency, string  | How often the subscription is sent |

*Example*
```
{
  'customer_id':  "#{customer.id}",
  'tea_id': "#{tea.id}",
  'title': 'Tea Subscription',
  'price': '15.00',
  'status': 'Active',
  'frequency': 'Monthly'
}
```
Response
```
{
    "data": {
        "id": "5",
        "type": "subscription",
        "attributes": {
            "title": "Sweet Tea Subscription",
            "price": "10.00",
            "status": "Active",
            "frequency": "Weekly",
            "customer_id": 1,
            "tea_id": 3
        }
    }
}
```

### `DELETE /api/v0/subscriptions/:id`
Response
```
{
    "data": {
        "id": "5",
        "type": "subscription",
        "attributes": {
            "title": "Sweet Tea Subscription",
            "price": "10.00",
            "status": "Cancelled",
            "frequency": "Weekly",
            "customer_id": 1,
            "tea_id": 3
        }
    }
}
```

## Contributors
- Brian Guthrie [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/Brianisthebest) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/brianguthrie87/)
