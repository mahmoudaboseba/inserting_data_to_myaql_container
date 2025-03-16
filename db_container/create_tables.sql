create table customer_info (customer_id varchar (11) not null , customer_name varchar (265) , customer_email varchar(230) , primary key (customer_id) );
create table customer_phone_tbl (phone_id varchar (10) not null , customer_id varchar (11) , phone_number varchar(11) , primary key (phone_id) , foreign key (customer_id) references customer_info (customer_id));

