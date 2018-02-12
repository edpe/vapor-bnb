```
 __   __   ______     ______   ______     ______        ______     __   __     ______    
/\ \ / /  /\  __ \   /\  == \ /\  __ \   /\  == \      /\  == \   /\ "-.\ \   /\  == \   
\ \ \'/   \ \  __ \  \ \  _-/ \ \ \/\ \  \ \  __<      \ \  __<   \ \ \-.  \  \ \  __<   
 \ \__|    \ \_\ \_\  \ \_\    \ \_____\  \ \_\ \_\     \ \_____\  \ \_\\"\_\  \ \_____\
  \/_/      \/_/\/_/   \/_/     \/_____/   \/_/ /_/      \/_____/   \/_/ \/_/   \/_____/

```
[Ed Perkins](https://github.com/edpe) || [Agata Golebiewska](https://github.com/MissDove) || [Roland Vink](https://github.com/rcvink) || [Ellie Wem](https://github.com/elliewem)

## ☯ w h a t _ i s _ t h i s ☯

VAPOR_ BNB is a clone of air bnb but with extra a e s t h e t i c.

## ▲ H O W do I USE ▲

To use VAPOR_ BNB all you need to do is:

```
~> git clone https://github.com/edpe/vapor-bnb.git
~> psql
  ~> CREATE DATABASE vapor_bnb_test;
  ~> CREATE DATABASE vapor_bnb_development;
  ~> \q
~> bundle
~> rackup

go to your local host and question your motives
```

### ♛ APPROACH ♛

#### user stories

```
As a ~ user ~
So that I can list a ~ space ~,
I want to be able to * sign up *.

As a ~ user ~
So that someone can request to hire my ~ space ~,
I want to be able to * list * a ~ space ~.

As a ~ user ~
So that I can make more money,
I want to be able to * list * multiple ~ spaces ~.

As a ~ user ~
So that I can communicate information about my ~ space ~,
I want to * assign * my ~ space ~ a * name *, * description *, and * price *.

As a ~ user ~
So that I can avoid double renting out my ~ space ~,
I want to * input * a range of ~ dates ~ my ~ space ~ is available.

As a ~ user ~
So that I can find an available ~ space ~,
I want to * see * a range of ~ dates ~ a space is available.

As a ~ user ~
So that I can sleep somewhere,
I want to be able to * request * to hire a ~ space ~ for one night.

As a ~ user ~
So that I can maintain control over my ~ space ~,
I want to be able to * approve * requests.

As a ~ user ~
So that I can avoid double renting out my ~ space ~,
I want booked ~ spaces ~ to become unavailable.

As a ~ user ~
So that I don't lose potential bookings,
I want ~ spaces ~ to be available until I * approve * a request.

```

#### ~ DIVGRVMMING ~

We had five days to work on this challenge so we devoted the first day to diagramming and user stories to ensure we were working from a shared headspace.

![Diagramming image one](https://github.com/edpe/vapor-bnb/blob/master/images/diagramming1.jpg)

![Diagramming image two](https://github.com/edpe/vapor-bnb/blob/master/images/diagramming2.jpg)

The main direction was to create three models: User, Space, and Booking. The user has many spaces, spaces have many bookings, and bookings has a user.
