--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    category_id smallint NOT NULL,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);


--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_customer_demo (
    customer_id bpchar NOT NULL,
    customer_type_id bpchar NOT NULL
);


--
-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_demographics (
    customer_type_id bpchar NOT NULL,
    customer_desc text
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    customer_id bpchar NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employees (
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employee_territories (
    employee_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL
);




--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    order_id smallint NOT NULL,
    customer_id bpchar,
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15)
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    product_id smallint NOT NULL,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);


--
-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE region (
    region_id smallint NOT NULL,
    region_description bpchar NOT NULL
);


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shippers (
    shipper_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);



--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suppliers (
    supplier_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


--
-- Name: territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE territories (
    territory_id character varying(20) NOT NULL,
    territory_description bpchar NOT NULL,
    region_id smallint NOT NULL
);


--
-- Name: us_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE us_states (
    state_id smallint NOT NULL,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO categories VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', '\x');
INSERT INTO categories VALUES (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', '\x');
INSERT INTO categories VALUES (3, 'Confections', 'Desserts, candies, and sweet breads', '\x');
INSERT INTO categories VALUES (4, 'Dairy Products', 'Cheeses', '\x');
INSERT INTO categories VALUES (5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', '\x');
INSERT INTO categories VALUES (6, 'Meat/Poultry', 'Prepared meats', '\x');
INSERT INTO categories VALUES (7, 'Produce', 'Dried fruit and bean curd', '\x');
INSERT INTO categories VALUES (8, 'Seafood', 'Seaweed and fish', '\x');


--
-- Data for Name: customer_customer_demo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_demographics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customers VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO customers VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customers VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO customers VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO customers VALUES ('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO customers VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO customers VALUES ('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO customers VALUES ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO customers VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO customers VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO customers VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO customers VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO customers VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO customers VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO customers VALUES ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO customers VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO customers VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO customers VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO customers VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO customers VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO customers VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO customers VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO customers VALUES ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO customers VALUES ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO customers VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO customers VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO customers VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO customers VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO customers VALUES ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO customers VALUES ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO customers VALUES ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO customers VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO customers VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO customers VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO customers VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO customers VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO customers VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO customers VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO customers VALUES ('KOENE', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO customers VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');

--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employees VALUES (1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', '\x', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees VALUES (3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', '\x', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees VALUES (4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', '\x', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees VALUES (5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', '\x', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees VALUES (6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', '\x', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', '\x', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', '\x', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', '\x', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');


--
-- Data for Name: employee_territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employee_territories VALUES (1, '06897');
INSERT INTO employee_territories VALUES (1, '19713');
INSERT INTO employee_territories VALUES (2, '01581');
INSERT INTO employee_territories VALUES (2, '01730');
INSERT INTO employee_territories VALUES (2, '01833');
INSERT INTO employee_territories VALUES (2, '02116');
INSERT INTO employee_territories VALUES (2, '02139');
INSERT INTO employee_territories VALUES (2, '02184');
INSERT INTO employee_territories VALUES (2, '40222');
INSERT INTO employee_territories VALUES (3, '30346');
INSERT INTO employee_territories VALUES (3, '31406');
INSERT INTO employee_territories VALUES (3, '32859');
INSERT INTO employee_territories VALUES (3, '33607');
INSERT INTO employee_territories VALUES (4, '20852');
INSERT INTO employee_territories VALUES (4, '27403');
INSERT INTO employee_territories VALUES (4, '27511');
INSERT INTO employee_territories VALUES (5, '02903');
INSERT INTO employee_territories VALUES (5, '07960');
INSERT INTO employee_territories VALUES (5, '08837');
INSERT INTO employee_territories VALUES (5, '10019');
INSERT INTO employee_territories VALUES (5, '10038');
INSERT INTO employee_territories VALUES (5, '11747');
INSERT INTO employee_territories VALUES (5, '14450');
INSERT INTO employee_territories VALUES (6, '85014');
INSERT INTO employee_territories VALUES (6, '85251');
INSERT INTO employee_territories VALUES (6, '98004');
INSERT INTO employee_territories VALUES (6, '98052');
INSERT INTO employee_territories VALUES (6, '98104');
INSERT INTO employee_territories VALUES (7, '60179');
INSERT INTO employee_territories VALUES (7, '60601');
INSERT INTO employee_territories VALUES (7, '80202');
INSERT INTO employee_territories VALUES (7, '80909');
INSERT INTO employee_territories VALUES (7, '90405');
INSERT INTO employee_territories VALUES (7, '94025');
INSERT INTO employee_territories VALUES (7, '94105');
INSERT INTO employee_territories VALUES (7, '95008');
INSERT INTO employee_territories VALUES (7, '95054');
INSERT INTO employee_territories VALUES (7, '95060');
INSERT INTO employee_territories VALUES (8, '19428');
INSERT INTO employee_territories VALUES (8, '44122');
INSERT INTO employee_territories VALUES (8, '45839');
INSERT INTO employee_territories VALUES (8, '53404');
INSERT INTO employee_territories VALUES (9, '03049');
INSERT INTO employee_territories VALUES (9, '03801');
INSERT INTO employee_territories VALUES (9, '48075');
INSERT INTO employee_territories VALUES (9, '48084');
INSERT INTO employee_territories VALUES (9, '48304');
INSERT INTO employee_territories VALUES (9, '55113');
INSERT INTO employee_territories VALUES (9, '55439');


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO order_details VALUES (10248, 11, 14, 12, 0);
INSERT INTO order_details VALUES (10248, 42, 9.80000019, 10, 0);
INSERT INTO order_details VALUES (10248, 72, 34.7999992, 5, 0);
INSERT INTO order_details VALUES (10249, 14, 18.6000004, 9, 0);
INSERT INTO order_details VALUES (10249, 51, 42.4000015, 40, 0);
INSERT INTO order_details VALUES (10250, 41, 7.69999981, 10, 0);
INSERT INTO order_details VALUES (10250, 51, 42.4000015, 35, 0.150000006);
INSERT INTO order_details VALUES (10250, 65, 16.7999992, 15, 0.150000006);
INSERT INTO order_details VALUES (10251, 22, 16.7999992, 6, 0.0500000007);
INSERT INTO order_details VALUES (10251, 57, 15.6000004, 15, 0.0500000007);
INSERT INTO order_details VALUES (10251, 65, 16.7999992, 20, 0);
INSERT INTO order_details VALUES (10252, 20, 64.8000031, 40, 0.0500000007);
INSERT INTO order_details VALUES (10252, 33, 2, 25, 0.0500000007);
INSERT INTO order_details VALUES (10252, 60, 27.2000008, 40, 0);
INSERT INTO order_details VALUES (10253, 31, 10, 20, 0);
INSERT INTO order_details VALUES (10253, 39, 14.3999996, 42, 0);
INSERT INTO order_details VALUES (10253, 49, 16, 40, 0);
INSERT INTO order_details VALUES (10254, 24, 3.5999999, 15, 0.150000006);
INSERT INTO order_details VALUES (10254, 55, 19.2000008, 21, 0.150000006);
INSERT INTO order_details VALUES (10254, 74, 8, 21, 0);
INSERT INTO order_details VALUES (10255, 2, 15.1999998, 20, 0);
INSERT INTO order_details VALUES (10255, 16, 13.8999996, 35, 0);
INSERT INTO order_details VALUES (10255, 36, 15.1999998, 25, 0);
INSERT INTO order_details VALUES (10255, 59, 44, 30, 0);
INSERT INTO order_details VALUES (10256, 53, 26.2000008, 15, 0);
INSERT INTO order_details VALUES (10256, 77, 10.3999996, 12, 0);
INSERT INTO order_details VALUES (10257, 27, 35.0999985, 25, 0);
INSERT INTO order_details VALUES (10257, 39, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (10257, 77, 10.3999996, 15, 0);
INSERT INTO order_details VALUES (10258, 2, 15.1999998, 50, 0.200000003);
INSERT INTO order_details VALUES (10258, 5, 17, 65, 0.200000003);
INSERT INTO order_details VALUES (10258, 32, 25.6000004, 6, 0.200000003);
INSERT INTO order_details VALUES (10259, 21, 8, 10, 0);
INSERT INTO order_details VALUES (10259, 37, 20.7999992, 1, 0);
INSERT INTO order_details VALUES (10260, 41, 7.69999981, 16, 0.25);
INSERT INTO order_details VALUES (10260, 57, 15.6000004, 50, 0);
INSERT INTO order_details VALUES (10260, 62, 39.4000015, 15, 0.25);
INSERT INTO order_details VALUES (10260, 70, 12, 21, 0.25);
INSERT INTO order_details VALUES (10261, 21, 8, 20, 0);
INSERT INTO order_details VALUES (10261, 35, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (10262, 5, 17, 12, 0.200000003);
INSERT INTO order_details VALUES (10262, 7, 24, 15, 0);
INSERT INTO order_details VALUES (10262, 56, 30.3999996, 2, 0);
INSERT INTO order_details VALUES (10263, 16, 13.8999996, 60, 0.25);
INSERT INTO order_details VALUES (10263, 24, 3.5999999, 28, 0);
INSERT INTO order_details VALUES (10263, 30, 20.7000008, 60, 0.25);
INSERT INTO order_details VALUES (10263, 74, 8, 36, 0.25);
INSERT INTO order_details VALUES (10264, 2, 15.1999998, 35, 0);
INSERT INTO order_details VALUES (10264, 41, 7.69999981, 25, 0.150000006);
INSERT INTO order_details VALUES (10265, 17, 31.2000008, 30, 0);
INSERT INTO order_details VALUES (10265, 70, 12, 20, 0);
INSERT INTO order_details VALUES (10266, 12, 30.3999996, 12, 0.0500000007);
INSERT INTO order_details VALUES (10267, 40, 14.6999998, 50, 0);
INSERT INTO order_details VALUES (10267, 59, 44, 70, 0.150000006);
INSERT INTO order_details VALUES (10267, 76, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (10268, 29, 99, 10, 0);
INSERT INTO order_details VALUES (10268, 72, 27.7999992, 4, 0);
INSERT INTO order_details VALUES (10269, 33, 2, 60, 0.0500000007);
INSERT INTO order_details VALUES (10269, 72, 27.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (10270, 36, 15.1999998, 30, 0);
INSERT INTO order_details VALUES (10270, 43, 36.7999992, 25, 0);
INSERT INTO order_details VALUES (10271, 33, 2, 24, 0);
INSERT INTO order_details VALUES (10272, 20, 64.8000031, 6, 0);
INSERT INTO order_details VALUES (10272, 31, 10, 40, 0);
INSERT INTO order_details VALUES (10272, 72, 27.7999992, 24, 0);
INSERT INTO order_details VALUES (10273, 10, 24.7999992, 24, 0.0500000007);
INSERT INTO order_details VALUES (10273, 31, 10, 15, 0.0500000007);
INSERT INTO order_details VALUES (10273, 33, 2, 20, 0);
INSERT INTO order_details VALUES (10273, 40, 14.6999998, 60, 0.0500000007);
INSERT INTO order_details VALUES (10273, 76, 14.3999996, 33, 0.0500000007);
INSERT INTO order_details VALUES (10274, 71, 17.2000008, 20, 0);
INSERT INTO order_details VALUES (10274, 72, 27.7999992, 7, 0);
INSERT INTO order_details VALUES (10275, 24, 3.5999999, 12, 0.0500000007);
INSERT INTO order_details VALUES (10275, 59, 44, 6, 0.0500000007);
INSERT INTO order_details VALUES (10276, 10, 24.7999992, 15, 0);
INSERT INTO order_details VALUES (10276, 13, 4.80000019, 10, 0);
INSERT INTO order_details VALUES (10277, 28, 36.4000015, 20, 0);
INSERT INTO order_details VALUES (10277, 62, 39.4000015, 12, 0);
INSERT INTO order_details VALUES (10278, 44, 15.5, 16, 0);
INSERT INTO order_details VALUES (10278, 59, 44, 15, 0);
INSERT INTO order_details VALUES (10278, 63, 35.0999985, 8, 0);
INSERT INTO order_details VALUES (10278, 73, 12, 25, 0);
INSERT INTO order_details VALUES (10279, 17, 31.2000008, 15, 0.25);
INSERT INTO order_details VALUES (10280, 24, 3.5999999, 12, 0);
INSERT INTO order_details VALUES (10280, 55, 19.2000008, 20, 0);
INSERT INTO order_details VALUES (10280, 75, 6.19999981, 30, 0);
INSERT INTO order_details VALUES (10281, 19, 7.30000019, 1, 0);
INSERT INTO order_details VALUES (10281, 24, 3.5999999, 6, 0);
INSERT INTO order_details VALUES (10281, 35, 14.3999996, 4, 0);
INSERT INTO order_details VALUES (10282, 30, 20.7000008, 6, 0);
INSERT INTO order_details VALUES (10282, 57, 15.6000004, 2, 0);
INSERT INTO order_details VALUES (10283, 15, 12.3999996, 20, 0);
INSERT INTO order_details VALUES (10283, 19, 7.30000019, 18, 0);
INSERT INTO order_details VALUES (10283, 60, 27.2000008, 35, 0);
INSERT INTO order_details VALUES (10283, 72, 27.7999992, 3, 0);
INSERT INTO order_details VALUES (10284, 27, 35.0999985, 15, 0.25);
INSERT INTO order_details VALUES (10284, 44, 15.5, 21, 0);
INSERT INTO order_details VALUES (10284, 60, 27.2000008, 20, 0.25);
INSERT INTO order_details VALUES (10284, 67, 11.1999998, 5, 0.25);
INSERT INTO order_details VALUES (10285, 1, 14.3999996, 45, 0.200000003);
INSERT INTO order_details VALUES (10285, 40, 14.6999998, 40, 0.200000003);
INSERT INTO order_details VALUES (10285, 53, 26.2000008, 36, 0.200000003);
INSERT INTO order_details VALUES (10286, 35, 14.3999996, 100, 0);
INSERT INTO order_details VALUES (10286, 62, 39.4000015, 40, 0);
INSERT INTO order_details VALUES (10287, 16, 13.8999996, 40, 0.150000006);
INSERT INTO order_details VALUES (10287, 34, 11.1999998, 20, 0);
INSERT INTO order_details VALUES (10287, 46, 9.60000038, 15, 0.150000006);
INSERT INTO order_details VALUES (10288, 54, 5.9000001, 10, 0.100000001);
INSERT INTO order_details VALUES (10288, 68, 10, 3, 0.100000001);

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (10248, 'VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10249, 'TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10250, 'HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300018, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10251, 'VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10252, 'SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.2999992, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10253, 'HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10254, 'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10255, 'RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.330002, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10256, 'WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10257, 'HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100037, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10258, 'ERNSH', 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.509995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10259, 'CENTC', 4, '1996-07-18', '1996-08-15', '1996-07-25', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico');
INSERT INTO orders VALUES (10260, 'OTTIK', 4, '1996-07-19', '1996-08-16', '1996-07-29', 1, 55.0900002, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10261, 'QUEDE', 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.04999995, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10262, 'RATTC', 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.2900009, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10263, 'ERNSH', 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.059998, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10264, 'FOLKO', 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.67000008, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10265, 'BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.2799988, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10266, 'WARTH', 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.7299995, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10267, 'FRANK', 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.580002, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10268, 'GROSR', 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.2900009, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES (10269, 'WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.55999994, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10270, 'WARTH', 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.539993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10271, 'SPLIR', 6, '1996-08-01', '1996-08-29', '1996-08-30', 2, 4.53999996, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10272, 'RATTC', 6, '1996-08-02', '1996-08-30', '1996-08-06', 2, 98.0299988, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10273, 'QUICK', 3, '1996-08-05', '1996-09-02', '1996-08-12', 3, 76.0699997, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10274, 'VINET', 6, '1996-08-06', '1996-09-03', '1996-08-16', 1, 6.01000023, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10275, 'MAGAA', 1, '1996-08-07', '1996-09-04', '1996-08-09', 1, 26.9300003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10276, 'TORTU', 8, '1996-08-08', '1996-08-22', '1996-08-14', 3, 13.8400002, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10277, 'MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 125.769997, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10278, 'BERGS', 8, '1996-08-12', '1996-09-09', '1996-08-16', 2, 92.6900024, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10279, 'LEHMS', 8, '1996-08-13', '1996-09-10', '1996-08-16', 2, 25.8299999, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10280, 'BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 8.97999954, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10281, 'ROMEY', 4, '1996-08-14', '1996-08-28', '1996-08-21', 1, 2.94000006, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10282, 'ROMEY', 4, '1996-08-15', '1996-09-12', '1996-08-21', 1, 12.6899996, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10283, 'LILAS', 3, '1996-08-16', '1996-09-13', '1996-08-23', 3, 84.8099976, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10284, 'LEHMS', 4, '1996-08-19', '1996-09-16', '1996-08-27', 1, 76.5599976, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10285, 'QUICK', 1, '1996-08-20', '1996-09-17', '1996-08-26', 2, 76.8300018, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10286, 'QUICK', 8, '1996-08-21', '1996-09-18', '1996-08-30', 3, 229.240005, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10287, 'RICAR', 8, '1996-08-22', '1996-09-19', '1996-08-28', 3, 12.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10288, 'REGGC', 4, '1996-08-23', '1996-09-20', '1996-09-03', 1, 7.44999981, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10289, 'BSBEV', 7, '1996-08-26', '1996-09-23', '1996-08-28', 3, 22.7700005, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10290, 'COMMI', 8, '1996-08-27', '1996-09-24', '1996-09-03', 1, 79.6999969, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (10291, 'QUEDE', 6, '1996-08-27', '1996-09-24', '1996-09-04', 2, 6.4000001, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10292, 'TRADH', 1, '1996-08-28', '1996-09-25', '1996-09-02', 2, 1.35000002, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10293, 'TORTU', 1, '1996-08-29', '1996-09-26', '1996-09-11', 3, 21.1800003, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10294, 'RATTC', 4, '1996-08-30', '1996-09-27', '1996-09-05', 2, 147.259995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10295, 'VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1.14999998, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10296, 'LILAS', 6, '1996-09-03', '1996-10-01', '1996-09-11', 1, 0.119999997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10297, 'BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 5.73999977, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10298, 'HUNGO', 6, '1996-09-05', '1996-10-03', '1996-09-11', 2, 168.220001, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10299, 'RICAR', 4, '1996-09-06', '1996-10-04', '1996-09-13', 2, 29.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10300, 'MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 17.6800003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10301, 'WANDK', 8, '1996-09-09', '1996-10-07', '1996-09-17', 2, 45.0800018, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES (1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO products VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO products VALUES (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO products VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO products VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500004, 0, 0, 0, 1);
INSERT INTO products VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO products VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO products VALUES (8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO products VALUES (9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);
INSERT INTO products VALUES (10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO products VALUES (11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO products VALUES (12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO products VALUES (13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO products VALUES (14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO products VALUES (15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0);
INSERT INTO products VALUES (16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.4500008, 29, 0, 10, 0);
INSERT INTO products VALUES (17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1);
INSERT INTO products VALUES (18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO products VALUES (19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.19999981, 25, 0, 5, 0);
INSERT INTO products VALUES (20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO products VALUES (21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO products VALUES (22, 'Gustaf''s Knäckebröd', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO products VALUES (23, 'Tunnbröd', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO products VALUES (24, 'Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, 1);
INSERT INTO products VALUES (25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO products VALUES (26, 'Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.2299995, 15, 0, 0, 0);
INSERT INTO products VALUES (27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9000015, 49, 0, 30, 0);
INSERT INTO products VALUES (28, 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, 0, 0, 1);
INSERT INTO products VALUES (29, 'Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790001, 0, 0, 0, 1);
INSERT INTO products VALUES (30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8899994, 10, 0, 15, 0);
INSERT INTO products VALUES (31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO products VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO products VALUES (33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO products VALUES (34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO products VALUES (35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO products VALUES (36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO products VALUES (37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO products VALUES (38, 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO products VALUES (39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO products VALUES (40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, 0, 30, 0);
INSERT INTO products VALUES (41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, 0, 10, 0);
INSERT INTO products VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO products VALUES (43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO products VALUES (44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.4500008, 27, 0, 15, 0);
INSERT INTO products VALUES (45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO products VALUES (46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO products VALUES (47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO products VALUES (48, 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO products VALUES (49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO products VALUES (50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO products VALUES (51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO products VALUES (52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO products VALUES (53, 'Perth Pasties', 24, 6, '48 pieces', 32.7999992, 0, 0, 0, 1);
INSERT INTO products VALUES (54, 'Tourtière', 25, 6, '16 pies', 7.44999981, 21, 0, 10, 0);
INSERT INTO products VALUES (55, 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO products VALUES (56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO products VALUES (57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO products VALUES (58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO products VALUES (59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO products VALUES (60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO products VALUES (61, 'Sirop d''érable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO products VALUES (62, 'Tarte au sucre', 29, 3, '48 pies', 49.2999992, 17, 0, 0, 0);
INSERT INTO products VALUES (63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9000015, 24, 0, 5, 0);
INSERT INTO products VALUES (64, 'Wimmers gute Semmelknödel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO products VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.0499992, 76, 0, 0, 0);
INSERT INTO products VALUES (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO products VALUES (67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO products VALUES (68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO products VALUES (69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO products VALUES (70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO products VALUES (71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO products VALUES (72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.7999992, 14, 0, 0, 0);
INSERT INTO products VALUES (73, 'Röd Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO products VALUES (74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO products VALUES (75, 'Rhönbräu Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO products VALUES (76, 'Lakkalikööri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO products VALUES (77, 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13, 32, 0, 15, 0);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO region VALUES (1, 'Eastern');
INSERT INTO region VALUES (2, 'Western');
INSERT INTO region VALUES (3, 'Northern');
INSERT INTO region VALUES (4, 'Southern');


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippers VALUES (1, 'Speedy Express', '(503) 555-9831');
INSERT INTO shippers VALUES (2, 'United Package', '(503) 555-3199');
INSERT INTO shippers VALUES (3, 'Federal Shipping', '(503) 555-9931');
INSERT INTO shippers VALUES (4, 'Alliance Shippers', '1-800-222-0451');
INSERT INTO shippers VALUES (5, 'UPS', '1-800-782-7892');
INSERT INTO shippers VALUES (6, 'DHL', '1-800-225-5345');



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO suppliers VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES (4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO suppliers VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES (6, 'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES (7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO suppliers VALUES (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO suppliers VALUES (10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO suppliers VALUES (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO suppliers VALUES (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO suppliers VALUES (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES (15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO suppliers VALUES (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);
INSERT INTO suppliers VALUES (17, 'Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL);
INSERT INTO suppliers VALUES (18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL);
INSERT INTO suppliers VALUES (19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO suppliers VALUES (20, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO suppliers VALUES (21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL);
INSERT INTO suppliers VALUES (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL);
INSERT INTO suppliers VALUES (23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL);
INSERT INTO suppliers VALUES (24, 'G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO suppliers VALUES (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL);
INSERT INTO suppliers VALUES (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL);
INSERT INTO suppliers VALUES (27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL);
INSERT INTO suppliers VALUES (28, 'Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL);
INSERT INTO suppliers VALUES (29, 'Forêts d''érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO territories VALUES ('01581', 'Westboro', 1);
INSERT INTO territories VALUES ('01730', 'Bedford', 1);
INSERT INTO territories VALUES ('01833', 'Georgetow', 1);
INSERT INTO territories VALUES ('02116', 'Boston', 1);
INSERT INTO territories VALUES ('02139', 'Cambridge', 1);
INSERT INTO territories VALUES ('02184', 'Braintree', 1);
INSERT INTO territories VALUES ('02903', 'Providence', 1);
INSERT INTO territories VALUES ('03049', 'Hollis', 3);
INSERT INTO territories VALUES ('03801', 'Portsmouth', 3);
INSERT INTO territories VALUES ('06897', 'Wilton', 1);
INSERT INTO territories VALUES ('07960', 'Morristown', 1);
INSERT INTO territories VALUES ('08837', 'Edison', 1);
INSERT INTO territories VALUES ('10019', 'New York', 1);
INSERT INTO territories VALUES ('10038', 'New York', 1);
INSERT INTO territories VALUES ('11747', 'Mellvile', 1);
INSERT INTO territories VALUES ('14450', 'Fairport', 1);
INSERT INTO territories VALUES ('19428', 'Philadelphia', 3);
INSERT INTO territories VALUES ('19713', 'Neward', 1);
INSERT INTO territories VALUES ('20852', 'Rockville', 1);
INSERT INTO territories VALUES ('27403', 'Greensboro', 1);
INSERT INTO territories VALUES ('27511', 'Cary', 1);
INSERT INTO territories VALUES ('29202', 'Columbia', 4);
INSERT INTO territories VALUES ('30346', 'Atlanta', 4);
INSERT INTO territories VALUES ('31406', 'Savannah', 4);
INSERT INTO territories VALUES ('32859', 'Orlando', 4);
INSERT INTO territories VALUES ('33607', 'Tampa', 4);
INSERT INTO territories VALUES ('40222', 'Louisville', 1);
INSERT INTO territories VALUES ('44122', 'Beachwood', 3);
INSERT INTO territories VALUES ('45839', 'Findlay', 3);
INSERT INTO territories VALUES ('48075', 'Southfield', 3);
INSERT INTO territories VALUES ('48084', 'Troy', 3);
INSERT INTO territories VALUES ('48304', 'Bloomfield Hills', 3);
INSERT INTO territories VALUES ('53404', 'Racine', 3);
INSERT INTO territories VALUES ('55113', 'Roseville', 3);
INSERT INTO territories VALUES ('55439', 'Minneapolis', 3);
INSERT INTO territories VALUES ('60179', 'Hoffman Estates', 2);
INSERT INTO territories VALUES ('60601', 'Chicago', 2);
INSERT INTO territories VALUES ('72716', 'Bentonville', 4);
INSERT INTO territories VALUES ('75234', 'Dallas', 4);
INSERT INTO territories VALUES ('78759', 'Austin', 4);
INSERT INTO territories VALUES ('80202', 'Denver', 2);
INSERT INTO territories VALUES ('80909', 'Colorado Springs', 2);
INSERT INTO territories VALUES ('85014', 'Phoenix', 2);
INSERT INTO territories VALUES ('85251', 'Scottsdale', 2);
INSERT INTO territories VALUES ('90405', 'Santa Monica', 2);
INSERT INTO territories VALUES ('94025', 'Menlo Park', 2);
INSERT INTO territories VALUES ('94105', 'San Francisco', 2);
INSERT INTO territories VALUES ('95008', 'Campbell', 2);
INSERT INTO territories VALUES ('95054', 'Santa Clara', 2);
INSERT INTO territories VALUES ('95060', 'Santa Cruz', 2);
INSERT INTO territories VALUES ('98004', 'Bellevue', 2);
INSERT INTO territories VALUES ('98052', 'Redmond', 2);
INSERT INTO territories VALUES ('98104', 'Seattle', 2);


--
-- Data for Name: us_states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO us_states VALUES (1, 'Alabama', 'AL', 'south');
INSERT INTO us_states VALUES (2, 'Alaska', 'AK', 'north');
INSERT INTO us_states VALUES (3, 'Arizona', 'AZ', 'west');
INSERT INTO us_states VALUES (4, 'Arkansas', 'AR', 'south');
INSERT INTO us_states VALUES (5, 'California', 'CA', 'west');
INSERT INTO us_states VALUES (6, 'Colorado', 'CO', 'west');
INSERT INTO us_states VALUES (7, 'Connecticut', 'CT', 'east');
INSERT INTO us_states VALUES (8, 'Delaware', 'DE', 'east');
INSERT INTO us_states VALUES (9, 'District of Columbia', 'DC', 'east');
INSERT INTO us_states VALUES (10, 'Florida', 'FL', 'south');
INSERT INTO us_states VALUES (11, 'Georgia', 'GA', 'south');
INSERT INTO us_states VALUES (12, 'Hawaii', 'HI', 'west');
INSERT INTO us_states VALUES (13, 'Idaho', 'ID', 'midwest');
INSERT INTO us_states VALUES (14, 'Illinois', 'IL', 'midwest');
INSERT INTO us_states VALUES (15, 'Indiana', 'IN', 'midwest');
INSERT INTO us_states VALUES (16, 'Iowa', 'IO', 'midwest');
INSERT INTO us_states VALUES (17, 'Kansas', 'KS', 'midwest');
INSERT INTO us_states VALUES (18, 'Kentucky', 'KY', 'south');
INSERT INTO us_states VALUES (19, 'Louisiana', 'LA', 'south');
INSERT INTO us_states VALUES (20, 'Maine', 'ME', 'north');
INSERT INTO us_states VALUES (21, 'Maryland', 'MD', 'east');
INSERT INTO us_states VALUES (22, 'Massachusetts', 'MA', 'north');
INSERT INTO us_states VALUES (23, 'Michigan', 'MI', 'north');
INSERT INTO us_states VALUES (24, 'Minnesota', 'MN', 'north');
INSERT INTO us_states VALUES (25, 'Mississippi', 'MS', 'south');
INSERT INTO us_states VALUES (26, 'Missouri', 'MO', 'south');
INSERT INTO us_states VALUES (27, 'Montana', 'MT', 'west');
INSERT INTO us_states VALUES (28, 'Nebraska', 'NE', 'midwest');
INSERT INTO us_states VALUES (29, 'Nevada', 'NV', 'west');
INSERT INTO us_states VALUES (30, 'New Hampshire', 'NH', 'east');
INSERT INTO us_states VALUES (31, 'New Jersey', 'NJ', 'east');
INSERT INTO us_states VALUES (32, 'New Mexico', 'NM', 'west');
INSERT INTO us_states VALUES (33, 'New York', 'NY', 'east');
INSERT INTO us_states VALUES (34, 'North Carolina', 'NC', 'east');
INSERT INTO us_states VALUES (35, 'North Dakota', 'ND', 'midwest');
INSERT INTO us_states VALUES (36, 'Ohio', 'OH', 'midwest');
INSERT INTO us_states VALUES (37, 'Oklahoma', 'OK', 'midwest');
INSERT INTO us_states VALUES (38, 'Oregon', 'OR', 'west');
INSERT INTO us_states VALUES (39, 'Pennsylvania', 'PA', 'east');
INSERT INTO us_states VALUES (40, 'Rhode Island', 'RI', 'east');
INSERT INTO us_states VALUES (41, 'South Carolina', 'SC', 'east');
INSERT INTO us_states VALUES (42, 'South Dakota', 'SD', 'midwest');
INSERT INTO us_states VALUES (43, 'Tennessee', 'TN', 'midwest');
INSERT INTO us_states VALUES (44, 'Texas', 'TX', 'west');
INSERT INTO us_states VALUES (45, 'Utah', 'UT', 'west');
INSERT INTO us_states VALUES (46, 'Vermont', 'VT', 'east');
INSERT INTO us_states VALUES (47, 'Virginia', 'VA', 'east');
INSERT INTO us_states VALUES (48, 'Washington', 'WA', 'west');
INSERT INTO us_states VALUES (49, 'West Virginia', 'WV', 'south');
INSERT INTO us_states VALUES (50, 'Wisconsin', 'WI', 'midwest');
INSERT INTO us_states VALUES (51, 'Wyoming', 'WY', 'west');


--
-- Name: pk_categories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);


--
-- Name: pk_customer_customer_demo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: pk_customer_demographics; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_demographics
    ADD CONSTRAINT pk_customer_demographics PRIMARY KEY (customer_type_id);


--
-- Name: pk_customers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- Name: pk_employees; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: pk_employee_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT pk_employee_territories PRIMARY KEY (employee_id, territory_id);


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- Name: pk_products; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- Name: pk_region; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT pk_region PRIMARY KEY (region_id);


--
-- Name: pk_shippers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);


--
-- Name: pk_suppliers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);


--
-- Name: pk_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT pk_territories PRIMARY KEY (territory_id);


--
-- Name: pk_usstates; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY us_states
    ADD CONSTRAINT pk_usstates PRIMARY KEY (state_id);


--
-- Name: fk_orders_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_orders_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_orders_shippers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES shippers;


--
-- Name: fk_order_details_products; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES products;


--
-- Name: fk_order_details_orders; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders;


--
-- Name: fk_products_categories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories;


--
-- Name: fk_products_suppliers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers;


--
-- Name: fk_territories_region; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES region;


--
-- Name: fk_employee_territories_territories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES territories;


--
-- Name: fk_employee_territories_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_customer_customer_demo_customer_demographics; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES customer_demographics;


--
-- Name: fk_customer_customer_demo_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_employees_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES employees;
