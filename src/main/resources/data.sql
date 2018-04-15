/* if you keep this file empty;you will get an error */

insert into bl_investor (id, name) values (1, 'Babar');

insert into bl_investment (id, investor_id, investment_type, amount, description, date)
  values (1, 1, 'PRODUCT', 2500, 'Bought ...', '2018-02-13 07:15:31.123456789');

insert into bl_product (id, bl_id, source_id, name, image_url, prod_url, buying_price, selling_price, product_type, material,
  stock, discontinued, description) values (1, '#4455', '1129', 'Colorphabets',
  'https://scontent-sin6-1.xx.fbcdn.net/v/t1.0-9/29216533_950728858423176_2205159836105048064_n.jpg?oh=009114f73d091bffa4458f55d088d0b9&oe=5B3215E6',
   'www.google.com', 360, 480, 'LEARNING_TOOL', 'WOOD', 14, 0, 'Very good...');

insert into bl_shipment (id, transport_vendor, serial_no_with_transport_vendor, shipment_status, shipment_date, payment_method,
      payment_date, amount_paid, comment) VALUES (1, 'KAHAR', 1, 'NOT_SHIPPED', '2018-02-13 07:15:31.123456789',
      'CASH_WITH_RIAD', '2018-02-13 07:15:31.123456789', 220, 'comment... comment... comment...');

insert into bl_order
  (id, system_id, client_name, client_fb_id, address, phone, order_detail, inside_dhaka, transport_vendor, order_status,
  delivery_charge, discount_amount, comment, shipped, shipment_id)
  values (1, '#32', 'Abul Hasan', 'https://www.facebook.com', 'banani 11', '0154214547', 'order detail', 1, 'KAHAR',  'DELIVERED',
   60, 30, 'comment', 0, null);

insert into bl_order_product_count (id, order_id, product_id, count) values (1, 1, 1, 2);
