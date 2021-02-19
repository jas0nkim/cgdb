--
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.platforms (id, name, description, pictures, slug, created_at, updated_at, available_countries, internet_requirements, supported_devices, verdict) FROM stdin;
4	Luna	- Closed Beta\r\n- Subscribe to channels. Currently Luna Plus (USD $5.99), and Ubisoft Plus (USD $14.99) channels available.	["https://images-na.ssl-images-amazon.com/images/I/518801AgwOL.png"]	luna	2020-12-21 19:56:02.181474+00	2021-01-15 23:18:13.996289+00	["US"]	at least 10Mbps for 1080p, 20Mbps or more are recommended.	["Windows 10 PCs", "2014 or newer hardware and macOS 10.13+ Macs", "Android 9+ Phones/Tablets", "Fire TV"]	["Closed Beta", "Subscribe to channels. Currently Luna Plus (USD $5.99), and Ubisoft Plus (USD $14.99) channels available."]
1	xCloud	- Netflix-like for games.\r\n- May access 100+ games with the subscription: including all Microsoft published games. Adding new third-party games and deleting them from their service. Many big title games are included. No need to buy or own games.\r\n- USD $14.99 per month: includes Xbox Game Pass Console, Xbox Game Pass PC, and Xbox Live Gold.\r\n- EA Play and Uplay included.	["https://images-eu.ssl-images-amazon.com/images/I/41Qcgb%2BvWuL.jpg"]	xcloud	2020-12-13 03:29:47.295079+00	2021-01-15 23:19:17.274488+00	["Austria", "Belgium", "Canada", "Czechia", "Denmark", "Finland", "France", "Germany", "Hungary", "Ireland", "Italy", "Korea", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden", "Switzerland", "United Kingdom", "United States"]	at least 10Mbps speed for 720p, at least 25Mbps for 1080p	["Android 6.0 and up Phones/Tablets", "Xbox One", "Xbox Series X/S", "iPhones/iPads (in Spring 2021)", "Windows PCs (in Spring 2021)"]	["Netflix-like for games.", "May access 100+ games with the subscription: including all Microsoft published games. Adding new third-party games and deleting them from their service. Many big title games are included. No need to buy or own games.", "USD $14.99 per month: includes Xbox Game Pass Console, Xbox Game Pass PC, and Xbox Live Gold.", "EA Play and Uplay included."]
3	Stadia	- Closed platform.\r\n- 100+ game titles available to buy at Stadia Store. Only games from Stadia Store supported. Free games available with Stadia Pro subscription.\r\n- USD $9.99 per month for Stadia Pro subscription. Free tier available: Stadia Base. You may play purchased games with Base plan.\r\n- 4K HDR streaming available with Pro subscription.	["https://ssl.gstatic.com/stadia/gamers/assets/stadia_logo_and_text_v1.jpg"]	stadia	2020-12-20 04:10:34.257248+00	2021-01-15 23:18:44.986816+00	["United States", "Canada", "United Kingdom", "France", "Italy", "Germany", "Austria", "Spain", "Sweden", "Switzerland", "Denmark", "Norway", "Finland", "Belgium", "Ireland", "Netherlands", "Poland", "Portugal", "Czechia", "Slovakia", "Romania", "Hungary"]	at least 10Mbps for 720p, at least 35Mbps for 4K	["Google Chromecast Ultra", "iOS 14.3 and up iPhones/iPadOS 14.3 and up iPads with Safari browser", "Android Phones/Tablets", "PCs/Macs with web browsers"]	["Closed platform.", "100+ game titles available to buy at Stadia Store. Only games from Stadia Store supported. Free games available with Stadia Pro subscription.", "USD $9.99 per month for Stadia Pro subscription. Free tier available: Stadia Base. You may play purchased games with Base plan.", "4K HDR streaming available with Pro subscription."]
11	Apple Arcade	- Download games one-by-one. Not streaming. Offline is possible in number of games. Many family friendly games.\r\n- USD $4.99 per month.	["https://miro.medium.com/max/3504/1*scdHV0GoAnZ0_Uy6iYEdcg.png"]	apple-arcade	2021-01-15 22:35:19.414974+00	2021-01-15 23:16:59.747349+00	["Most countries have Apple App store"]		["latest iOS iPhones", "latest iOS iPods", "latest iPadOS iPad", "latest macOS Mac", "latest tvOS Apple TV"]	["Download games one-by-one. Not streaming. Offline is possible in number of games. Many family friendly games.", "USD $4.99 per month."]
10	PlayStation Now	- More than 800 games. Same libraries on both PS4 and PC. Everything is streaming on PC, on the other hand, you will download games on PS4.\r\n- USD $19.99 per month.	["https://www.obilisk.co/wp-content/uploads/2020/03/playstation-now-listing-thumb-01-us-30sep19.png"]	playstation-now	2021-01-15 22:07:34.402504+00	2021-01-15 23:17:26.715569+00	["Austria", "Belgium", "Canada", "Denmark", "Finland", "France", "Germany", "Ireland", "Italy", "Japan", "Luxembourg", "Norway", "Portugal", "Spain", "Sweden", "Switzerland", "The Netherlands", "UK", "USA"]	at least 5Mbps to stream PlayStation Now	["PS4", "Windows 10 PCs"]	["More than 800 games. Same libraries on both PS4 and PC. Everything is streaming on PC, on the other hand, you will download games on PS4.", "USD $19.99 per month."]
9	GeForce Now	- Open platform. More likely rent a high-end PC on cloud.\r\n- Few free games. Can play games already own from third-party digital stores: Steam, Epic, Uplay, and GOG.com. You keep the game titles you bought. No GeForce Now service dependent.\r\n- USD $4.99 per month for Founders subscription. Free tier available.\r\n- Ray Tracing and DLSS supported with Founders subscription.	["https://images.gamewatcherstatic.com/image/file/0/3a/105870/Nvidia-Geforce-Now-1.png"]	geforce-now	2021-01-14 19:27:17.415136+00	2021-01-15 23:17:53.635277+00	["over 70 countries in Europe", "United States", "Canada", "Mexico", "South Korea", "Japan", "Taiwan"]	at least 15Mbps for 720p at 60fps, and 25Mbps for 1080p at 60fps	["macOS 10.10 and up Mac machines", "64bit Windows 7 and up PCs", "Nvidia Shield TV", "Chrome OS 77.x and up Chromebooks", "Android 5.0 and up Android Phones/Tablets", "iOS 14.2 and up iPhones/iPadOS 14 and up iPads with Safari browser"]	["Open platform. More likely rent a high-end PC on cloud.", "Few free games. Can play games already own from third-party digital stores: Steam, Epic, Uplay, and GOG.com. You keep the game titles you bought. No GeForce Now service dependent.", "USD $4.99 per month for Founders subscription. Free tier available.", "Ray Tracing and DLSS supported with Founders subscription."]
\.