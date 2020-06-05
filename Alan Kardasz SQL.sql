CREATE TABLE `Klienci` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `imie` varchar(255),
  `data_dolaczenia` timestamp,
  `kod_pocztowy` int
);

CREATE TABLE `miasta` (
  `kod_pocztowy` int PRIMARY KEY,
  `nazwa` varchar(255),
  `nazwa_panstwa` varchar(255)
);

CREATE TABLE `zamowione_produkty` (
  `id_zamowienia` int,
  `id_produktu` int,
  `ilosc` int DEFAULT 1
);

CREATE TABLE `zamowienia` (
  `id` int PRIMARY KEY,
  `id_klienta` int UNIQUE NOT NULL,
  `status` varchar(255),
  `data_stworzenia` varchar(255) COMMENT 'When order created'
);

CREATE TABLE `produkty` (
  `id` int PRIMARY KEY,
  `nazwa` varchar(255),
  `id_sprzedawcy` int NOT NULL,
  `koszt` int,
  `status` products_status,
  `data_stworzenia` datetime DEFAULT (now())
);

CREATE TABLE `sprzedawcy` (
  `id` int,
  `kod_pocztowy` int,
  `nazwa_sprzedawcy` varchar(255),
  `created at` varchar(255),
  `admin_id` int,
  PRIMARY KEY (`id`, `kod_pocztowy`)
);

ALTER TABLE `Klienci` ADD FOREIGN KEY (`kod_pocztowy`) REFERENCES `miasta` (`kod_pocztowy`);

ALTER TABLE `sprzedawcy` ADD FOREIGN KEY (`kod_pocztowy`) REFERENCES `miasta` (`kod_pocztowy`);

ALTER TABLE `zamowione_produkty` ADD FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id`);

ALTER TABLE `zamowione_produkty` ADD FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`);

ALTER TABLE `sprzedawcy` ADD FOREIGN KEY (`admin_id`) REFERENCES `Klienci` (`id`);

ALTER TABLE `produkty` ADD FOREIGN KEY (`id_sprzedawcy`) REFERENCES `sprzedawcy` (`id`);

CREATE INDEX `produkty_status` ON `produkty` (`id_sprzedawcy`, `status`);

CREATE UNIQUE INDEX `produkty_index_1` ON `produkty` (`id`);
