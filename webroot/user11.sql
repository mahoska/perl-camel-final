-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 02 2017 г., 10:02
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user11`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `content`, `date`) VALUES
(3, 1, 'Italy opens up island of Montecristo to tourists', 'The tiny Tuscan island of Montecristo, whose mysterious history is filled with saints,\n monks and pirates, is to be opened up to the public for the first time.\r\n                  \n The diamond-shaped island, which is around four square miles in size, was immortalised by Alexandre Dumas in The Count of Monte Cristo as the site of \n an enormous hidden treasure.\r\n             \n For almost 40 years, since it became a nature reserve, only scientists and researchers have been allowed within three miles of the island''s granite cliffs.\r\n  \nThe waters were regularly patrolled to make sure the island''s population of monk seals, dolphins, tuna and rare birds was not disturbed.\r\n       \nAnyone entering the waters illegally was liable to an instant 150 pounds fine.\r\n    \nHowever, the Park Authority for the Tuscan Archipelago has now decided to allow up to 1,000 tourists a year to visit Montecristo, \nwhich lies 22 miles south of Elba and 40 miles from the coast of Italy.\r\n                  \nVisitors will be allowed from April 1 to July 15 and then from August 31 to the end of October each year. \nTrips for 2009 have to be booked with the authority by the end of January next year.\r\n                   \nDumas arrived on the island in 1842, in the company of Napoleon Bonaparte''s nephew. \r\n  ''It is fantastic and lonely, smelling of thyme and broom,'' he wrote, in a letter.\r\n  \nHe decided to write The Count of Monte Cristo to remind him of the trip.\r\n \nHis hero, Edmond Dantes, discovers a pirate''s treasure on the island after being tipped off by his companion in prison, Abbe Faria.\r\n \n Dumas described the island at midday: ''Thousands of grasshoppers, hidden in the bushes, chirped with a monotonous and dull note; \n the leaves of the myrtle and olive trees waved and rustled in the wind. \r\n \n ''At every step that Edmond took he disturbed the lizards glittering with hues of emerald; afar off he saw the wild goats bounding from crag to crag.''\r\n     \n Dumas was inspired by tales of a pirate''s haul, buried in one of the island''s grottos. In the 1550s, two pirates, Red Beard and Dragut, sacked the monastery\n on Montecristo and set up their base. Dragut, a Turk, is thought to have accumulated vast wealth and hidden his haul somewhere on the island. \r\n                  \nHowever, no one has found it yet.\r\n ', '2017-09-01'),
(4, 1, 'Famed Roman statue ''not ancient'' ', 'A statue symbolising the mythical origins and power of Rome, long thought to have been made around 500BC, \nhas been found to date from the 1200s.\r\n \nThe statue depicts a she-wolf suckling Remus and his twin brother Romulus - who is said to have founded Rome.\r\n \nThe statue of the wolf was carbon-dated last year, but the test results have only now been made public.\r\n  \nThe figures of Romulus and Remus have already been shown to be 15th Century additions to the statue.\r\n \nIn a front page article in the Italian newspaper, La Repubblica, Rome''s former top heritage official, Professor Adriano La Regina, said about 20 tests \nwere carried out on the she-wolf at the University of Salerno.\r\n \nHe said the results of the tests gave a very precise indication that the statue was manufactured in the 13th Century.\r\n Damaged paw\r\n ', '2017-09-01'),
(5, 2, 'Crumbs: half of Britons injured by their biscuits on coffee break, survey reveals', 'More than half of all Britons have been injured by biscuits ranging \nfrom scalding from hot tea or coffee while dunking or breaking a tooth eating during a morning tea break, a survey has revealed. \n              \n An estimated 25 million adults have been injured while eating during a tea or coffee break - with at least 500 landing themselves in hospital, the survey revealed. \n  \nThe custard cream biscuit was found to be the worse offender to innocent drinkers. \n                   \nIt beat the cookie to top a table of 15 generic types of biccy whose potential dangers were calculated by The Biscuit Injury Threat Evaluation. \n  \n Hidden dangers included flying fragments and being hurt while dunking in scalding tea through to the more strange such as people poking \n themselves in the eye with a biscuit or fallen off a chair reaching for the tin.\n                    \nOne man even ended up stuck in wet concrete after wading in to pick up a stray biscuit.\n                   \nCustard creams get a risk rating of 5.63, the highest of all.\n                   \nThis compared to 1.16 for Jaffa cakes, which was the safest biscuit of all in the evaluation.\n                   \nResearch company Mindlab International were commissioned by Rocky, a chocolate biscuit bar, to conduct the research.\n  \nIt found almost a third of adults said they had been splashed or scalded by hot drinks while dunking or trying to fish the remnants of a collapsed digestive.\n   \nIt also revealed 28 per cent had choked on crumbs while one in 10 had broken a tooth or filling biting a biscuit.\n \nMore unusually, three per cent had poked themselves in the eye with a biscuit and seven per cent bitten by a pet or "other wild animal" trying to get their biscuit.\n  \n ', '2017-09-01'),
(6, 2, 'Atom-sized transistor created by scientists', 'Scientists have shrunk a transistor to the size of a single atom,\r\n                    \nbringing closer the day of microscopic electronic devices that will revolutionise computing, engineering and medicine.\r\n  \nResearchers at Cornell University, New York, and Harvard University, Boston, fashioned the two ''nano-transistors'' from purpose-made molecules. \r\n   \n When voltage was applied, electrons flowed through a single atom in each molecule.\r\n                    \nThe ability to use individual atoms as components of electronic circuits marks a key breakthrough in nano-technology, the creation of machines at the smallest possible size.\r\n  \nProf Paul McEuen, a physicist at Cornell, who reports the breakthrough in today''s issue of Nature, said the single-atom transistor did not\n have all the functions of a conventional transistor such as the ability to amplify.\r\n \n But it had potential use as a chemical sensor to any change in its environment.\r\n \n By David Derbyshire, Science Correspondent ', '2017-09-01'),
(7, 1, 'Japan centenarians at record high', 'The number of Japanese people hitting the landmark age of 100 has reached record levels. \n   \nThere are now 36,276 centenarians in the country-a rise of 4,000 on last year''s figure, a report by the Health and Welfare Ministry found.\n  \n Women make up the vast majority of those who are living past 100.\n  \n Japan has one of the world''s longest life expectancies, but there are concerns about the burden this is placing on society.\n  \n Both the country''s pension system and social services are under pressure from its burgeoning greying population. \n              \nActive lives', '2017-09-01');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`) VALUES
(1, 'tom', '12345', 'tom@mail.ru'),
(2, 'stive', '12345', 'stive@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_fk0` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
