-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2024 at 09:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pidevkhedma2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `premon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avie`
--

CREATE TABLE `avie` (
  `id` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `id_resto` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `description` text NOT NULL,
  `etoile` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image_cat` varchar(255) NOT NULL,
  `nom_cat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `premon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `num_tel` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `prix` varchar(50) NOT NULL,
  `dateCommande` date NOT NULL DEFAULT current_timestamp(),
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commandes`
--

INSERT INTO `commandes` (`id`, `prix`, `dateCommande`, `idClient`) VALUES
(23, '66.0', '2024-02-28', 1),
(24, '72.0', '2024-02-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `commande_plats`
--

CREATE TABLE `commande_plats` (
  `idCommande` int(11) NOT NULL,
  `idPlat` int(11) NOT NULL,
  `Quatitie` int(11) NOT NULL,
  `idrestrant` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande_plats`
--

INSERT INTO `commande_plats` (`idCommande`, `idPlat`, `Quatitie`, `idrestrant`, `status`) VALUES
(23, 1, 3, 1, 'Accepter'),
(24, 2, 1, 1, 'En Attente du livraire'),
(24, 1, 1, 1, 'Accepter');

-- --------------------------------------------------------

--
-- Table structure for table `don`
--

CREATE TABLE `don` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gerant`
--

CREATE TABLE `gerant` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `document` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `premon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `id_vehicule` int(11) NOT NULL,
  `id_zone_livraison` int(11) NOT NULL,
  `num_tel` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offre_resto`
--

CREATE TABLE `offre_resto` (
  `id` int(255) NOT NULL,
  `pourcentage` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_resto` int(255) NOT NULL,
  `date_fin` date NOT NULL,
  `id_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panies`
--

CREATE TABLE `panies` (
  `iduser` int(11) NOT NULL,
  `idPlats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `panies`
--

INSERT INTO `panies` (`iduser`, `idPlats`) VALUES
(1, 1),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

CREATE TABLE `plat` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_restaurant` int(11) NOT NULL,
  `description` text NOT NULL,
  `prix` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `imageData` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plat`
--

INSERT INTO `plat` (`id`, `nom`, `id_category`, `id_restaurant`, `description`, `prix`, `image`, `imageData`) VALUES
(1, 'pizza', 1, 1, '...................', 22, 'C:\\Users\\AmiraGHARBI\\Downloads\\téléchargement.jpeg', 0xffd8ffe000104a46494600010100000100010000ffdb0084000a0708161615161616161919181a1c1818181a1a1a181a181c1c18181a1a181818181c212e251c1e2b2118182638262b2f313535351a243b403b343f2e343531010c0c0c100f101f12121f352b242b3434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434ffc000110800bb010e03012200021101031101ffc4001c0000020301010101000000000000000000040503060702010008ffc4003b100001030303010604040503040300000001000211030421051231410622516171811391b1c13242a1f0072352d1e11472f1346292c2156382ffc400190100030101010000000000000000000000010203000405ffc40024110002020202030100020300000000000000010211032112312241510432e11361b1ffda000c03010002110311003f00cc0804a6b656ac89291bfbae95dd2bd7480141a6f6841f56b061cc040dc06b7088f8dddc9ca5377b8e4258c9b7e40a242c9e11cca443020ac98464a6cca9bbd1349a031636d492495dbe98e131acf1180a1b6a45c6067d3295ef614c5a291dc9ad1a784cd9a4be27e1bfff0015cd4b72c80e616fa885a49b885b145469f12bc0d7184c1f482e1b4e12a521191330a4aa010a37d324e029db41d00464f03aadc9a3502876d44db540ee55834bec35c57dae7114da799cba3d15e74aec15b530373779ea5c7edc2ac54bb1f899456b56b97d4a8c05b45d764ad5ed8f82d1e6d1b4fcc2a67687b20ea00d4a64b98396f2e6f9f9842516bb4071654ed18651f736f2d43b1c022995654b4232a1aa30b4e52e75bee1215af54b5de0aaf3dc699cf0ab0a7d31931654a65b821421583e331e3a212a593790abfe87b151465a5bb9dc1843d5a70709c692cc213b4b4093d0356a4f6e65734aa927211d7e1c3a282d294833e2a7194ab62c764552a470a47ea04b608e886b86778c4a8c8c65522da0d12d2aa0f2131b66b4a4dc22285c194b26fd01a1dd5a6ddbd12b655827fba245d4b60a5aea264c258b5ecc907d7a32657b636a37490bd95c532414148641b5d83700a436380a3a63aca9abdd437cd6b8b6003a94132b7a30d4a29d72e778266eb90d016957403bb6b42f786f427e4ae960285b40001279775554d22bcbf0ac3434f7bccc7ba7c70bd8e9a45db4bbd65430d84c753d1e9d6616968c8c1f059e68ecaf42e4b5e65a7f0fa2d3adaa02d13caab0a30bd5e83adeabe93bf29c1f11d0a5b5ae95fbf8a7a70269d668cc96b8fd25670fb52b9e49c58ae34c67a7542f2034124f45a47673b34d05af79970c86f41fe555fb19a680379e7803aad1ec9b09e31bdb0c62316bb6e14edb8e3950522273f547b437c1515b1c49da1d5aad166fa749d50c81b5bce7aa9ac6e9cf60ded8738779a7a4f429a8602be34da3a2cecc619db6b17db5776d07638cb4f413cb52ed3ef09e56c1da2a0c7f71cc0f0f041698cc2ceaf3b24f637e2d00e2de5d4ddf8dbe40f55c329c14dc5ebfe0d2c1271e4b641b81092ead65bb847d2ba1c1c11c83823d42e1f74d9e899269e8e6568aa3f4f7b578c7b860f2ae2fa2d737002ad6a36b05554db74c65213d7999466997bb0e544f64a1cd2703c156ed50da687d73741fd172c968940e9cf1bbbcac2fa20b30a126e3a17a165b3da4e5177d4985b208496b0735d84532a9737213a6d2b1688fe083d146280051d674c67c5437b41d385b9a6e86a27a36ed70c14453b348e9dc3da534a7a8e12b8a4669935ab0139523a801c28e83082897254fe9bd0235b951541b8c4a2aa0842b267845b8d8a7b4e9c1525504f4523a30a46442148643eec9398d6389682ef1573d36ed846481e4a87a3c8042694aa10ba20ea2322dd7ec6f71c08241908cb6d481a9b78ee8f9aa45c6a0f6b65a648c8952e9551f51dbcba1ce00f948e8a3fa7238c3c5ecbe08dcb658bb72d2fb5713036f7bf7f2592d0b80e701d256bbaddbbae2d1ec1f8a0ac8edad21d0441063e4a5872738efb067828c8d17436b58d00780563a0f71803aaac696c8602418c2b05ab88185d5e84436a0f83e27ea8f2f3127849ad6a64fd51cec8fc442310b096dd850dcea200cb80f52a9fda5d7c5b1037ccf000caa05eebcfac4cb8869e887215b48d11fac80ff00e6f5fc246591e4471ee995b5f31df85e1636eb9db80f23dca8d97eff00caf77cd7065fc2b2372bd9d50fd5c55568d47b47d9965c34bd90cab1870e1de4e1d5641a897d37ba9bc10e6983fe3c93aa3daabaa7f86a63c1c2529b973ee6a3aa3ccbddc91854fcff009f263f19bb5e89e69c27b8ad86d86a3022541a85e02bc769fb460fcd01756aef55d1c3cace6e28e18f928b696c7297196f45e36b1253ec3c506b9e2536b7be01b94a5d4010b834f1ca9c9a919c462e731cecc225f4590230ab4e71ddca716cd71009253d25115aa0d16a7908ba56d8cafa8d48195e54ba838506d58aaec16eec01e89656a309d3eb754a6eee729e31bf633198cf0a46519e653ed0f41040754303c3aab85ad850386b01c47b67afcd2c62db1b8e8c9ee6992602f85122256cf4b45a05a7f94ccc74e78094f69bb2cc7d373e9b407b4138fcd03823c709a58ecdc4cc994e5496ccdce8e83f614949b8f3e14ad2181482907d84025a8e6b125d36b82ff329f302ea82f1a16f67c180f217549c293d8de37f1fe1116f44b880392bbedc69ae652a4f032d8923a24c98d4a2d32b19b8b4d16bd35e0b567ddb3d37e0d7ded1dc79f9153697db02c6c3db90391d7d42835eed3b2bb366c33220ae2c38e503a32ce338f63bd1ccb1bde07013da0f20a45d9e2035a4f10ac54992e0bd18ad1c96174990beba3b58e71301a0928ba14ba251db8ae295a543c6e86fcd6aa0b6649adefad55efc91276cf824f51c5b82ac16972c233e883d51ccc8c29c76c4b2b9715a5401c470559e87662e5eddedb5aae6f8ec77cc4893ec975d699b0ed7b1ec7783c3987e4e0aa97c0d8abe33bc531d29ee2ee50b52d238299e896f93ea84ae82aac2afee8b425cdbb07a2677f6fb8c253754b6f01227f42d1e3ded3d5754e9b672021a8b372e6b18f54d7e856839e07014755980a2b793d57d7554e526ac1b3da167bcf29896960e414aadaedcd722ab5e17745469519a185b3cb978587725f4aecb3a152b352cca8b87c3550ca3a28ea5803950b2f838a64c78859c5a358fdf7af3c7f85c335e75b96bdce21a5c01ebc9ebe5ca7fa4dbb003f85c0e7201ff0085c6a5d9fa7569b9840e77019e7c37782ea8c5235b63dd1751f8a4b81909eb987693d3eea95d96b57b1cf07bb0ddc074200572b6a9b9bddfc254a4b6562f464fae5b3695c5668e37120786e01d1faaaf57adb8ab4f6e6dcb6eea03f9831c23fd81a7f56b955abda90242e696a4d08d9e5902da8d3e6ae34caa7dab8ef6cf8856fa192d1e8ba70bb4c0d16decbd949de471c275da6d3855a0f6c7490a3d04c300e13f610442709f9dae29c1208c83050669cb800b47eddf631dbdd5e89ee9cbd9f70a9ba658173db89ce573ca3c5d02997aecf31aca6c0466072acf4a982410124b0a105a070ad14690c2e9aa4644d6ed8553fe2bff00d2371cbdaae96ecca45fc46d3fe2d93e06585ae1ec7295f4c2cc2ec69bdef6d3a6373de61a3ccf89e806493e4b64ecaf62e85b06bde054af83bdc2434fff005b4fe119e79292f62fb3ff0005aeab5000f7704c771a3913e2633ecafd4dd23c92c556cc904b1e3a95d540c7b4b5c1af6f50e01c3dc1549ed5b2f4f76da39106093d7703381d3e5f277d9ed3aab6933fd4381a91de2001e9c638454ac771a04d5fb09a7d6691f08527661f4bf9641f1da3b87dc2cdf50ec75c5a3c8dbbe9e5cda8de080261c3f23bcbe4b6875170e083eab8baa5bd858f682d7608e41959ab169181bde0e52bbea80c856aed8e8e6d9ee80760301c79712374fdb881e6a8372f92a6aef62c9045100745157a12650e1e47544507b8a7b4b60d935bd38086aec24a3d8c30a173092a6a4aec3b06a76ce398465a5304e42ea9bc306657142e86ee7aaa495c74c0ec35f660af7ff8a11c236d9f28dacf01ab9d26bd8b6cacff00a30d7292b5570e0a96aba5c60af5f684f54f52bd9acb7e9fa8161f24e99ac3701dc1f03f555073885e3ab2e8e541a2f55aec329d4aac3c336e41fcc08107d484db43be2ea61a0438005cd39e7f3356556d7751ef7d2dfdc22633c8faf8fb2b97679d518e0edc5cd2c6b434e435ed804cccc1038e171fe99b4d38baa3b3045354d59c76f477e899e8f07d9c0ffecab0e60215a7b7d6a4fc3aa388daef0ef641f9823e4aa0c79384a9f2488e48d499e53a70ec2b1d83a1ed2526b4b77bbbdb700a736e40705d5863a64d97fd2aa02d09bd37aade8cfc056062a3190556687b4b4f510b36a1a39a772f69902491e0415a1b6a01c949ae407d59838c63fbac9726091cd95bc653aa2ce1436b6b852dc5d3290971cf468cb9dfed68e7d78464cd1431a700790e4aadf68b5b66d2cde1adea4900bbc0341e9e7e4a5ab76e7e5e36b3a339f42f3d4f9703f54b752d199581dfdf0efcae630807805a483063af2b872e752f18f5f4ea862adbec5164f63cb5b05b2f21b9ddc1ce7e63d95de9ba1a167173499499dfaad6969eec13ddc4001c7833063a9f15de8dda7ace96bf69c91bc073776d03bc5ae02267a4f1d309f02ab1733ba34663b3f7538779aa9db6b0e2e8763f5f709ad1beeb2ae9911bbcae1ae4236f075530ae0cf8a74033afe2cd29f8471043e7c7a70b297db05b2ff142db75b32a08dd4df193076bf063c7318f55936d53949274c560acb1254b6f6a5a7c910ca90614ec325249a680990d510102daa03b29cd5a1280ab421ca71ae83c8f2e63694a680ef7bab31a12c4b4d9b41e1592d504616b4fbb850dfd620236ce00850ea14c11851569932bedb97029adadc98ca515585aee11745f2aafa0d167aad43907a78a32a051b19242aca3618b0bb0d343cc8c3c7e17781f3f2fee9fe8db8805c20c96b87839b8214dd95b601b52a3861ac3e7983d12fb6bcdb51e5c3b8f2090dfcae0203c0eb8c11d42e6cf89ca3e3d9d383228cb7d173b9b26d6a058ee088f4f03ec72a96cd35b45f0e12e1f2fd55c34dd529ed8ded3e11cf1d41c84b35b60aae69a7922648f3881f39f9a1f9a34d5afea83fa126ad7a12d5ad3d001e48463fbc1195ec6a013b0c2eec7477bc8207cd77c9af47224fd965d1b80ac0c7884aac34f730004e535a564704949c594b2114cbcc090130b6b10d5353a61bc225a11e81d8bb56acea542a5463439cc6b9c074c0e4f90e7d9675a76a8ea8fdee3b9c724932279c0e9e4070b5770413ac690e29331ff006331fa29e48f2543c25c5d9551a8977718c73dfe0d05c7de04347fba02eaa68979559dfa8ca13c81b9ef03cf69027d0c2b853888181e0385c572a51c118f7b1e5964fa30bd6ed7e0dcbd9bcbcb0fe276d0e131f840e07a28a8d664e4493d77199f729b76e6d22e9eefea00fd8aac55610a5272527441b76596deb34c6d799e80933ec8a1a854180e8faaa7d3ac5592ddfb98c71ea04fa8907e89a126fb0a65a74ad4498047a1267eaad368f073f3552d228831d07dd5b6d9a1b03f55d11b0b624fe21db87d95405b3b4b5e0f5690467ea3dd638ca0795b6f6d49167533fd23d65c047bac89e33c29e5ae4248555e941445837c54951ab90e52ed519505567b52fb9705d3f7128b6694e7f282491b4736a25896de18760a72fb42c0965c5091e69959ae8f3e290d91ca106a04f217541ae383c22bff008e042375d981490f808fa56ed60850b2d3615cd6977a045c831a45879445b509223c57cca49df669adff00514c1e377fc2ec92d1345a5960295ab99d48971e327cd676f7e4faad7b54b62fa2f6b4778b4c47331c059a699a31a84ee25a073223d4652ae8762fa592240f7565d14542e040eef9fd930b4d269b236893fd472533a4f0302211a0a25824411844db53038c043ef07aae8d5e8385821d4c826071e29852884ae93e11945e81831c17ad2b96be57c479a013a7288f55e9a8178e3094c70d30a2b87f74fa2908f6415fd60d6389e383e52624f96566c3467bdaa78a8d63c7425a5565f441c4ab36b58a7120c11f35582f3e0b964edd865149903ed3c137b2616d2683c82ef9132a0a6f0394c5ad90df08fbca7c7b623545ab44a0368f6e7ecacb6d4b19cfd128d2d90d181c04f28b31cae8462bfdbca8d6dab9a4e5ce606e3a820fb601cacaea95a37f1218ef854b036ef327acedeefe9bbf459f53a52b9f2ee406ac04992a616b890a6a96c1abba374d88eaa540e27d616ad2e4d6ad46b04084aa8543b8b94552e373fc961a82ee5fb92a78e5307b09181e9d540db77931b5c5de1067e48ab0558b76c1c0535bd78e79562b0ecc55765ccda3cce7e48e1d956b7bd05e7c230ab184a5d9a8a9398e79ee349f180bb1a3d43f963d4aba33497c61840f60a41a5561f971e46557fc31f62d32bc1e99682ffe7d28feb6fd5290534ecf7fd453f59f90255e4f42c7b353a75155fb427e1be470fcfa11ca7b4de84d5ac4566c4c39b25a7ec54d32c56ae2f9db70a2b6d41dd50d7349cd2410411842b64142d828b252bec728865d03ecab2ca8512cac4708584b3d2ba03aa3295e03c1492c28b9fce11cda0f6f0d5ad8686e2ea32a515dc727ac428eded4064bf248e3a0520208c74440140ae9a85f8d01774ea604a013abae0478a577e410e63b8703fa8829957a982abfad5720170f023e412c98d14526bd6dcc21dc93cfa25efb7eaa4a154bdaef53fa99fba9e9d33195cb274c1396c0adedcbded60ea63dba95776689b5ac239c7a70ab960cdaf0e1cf03dd68360f0f6479c8f63fd974e15e37f49f67d6f4a071f24d283c2898c83e2a663538c23edd5b17dab88fca43f80703079e30564ed041300adcb50a3be9bd99ef35c231390b1ba8d8241e84823d1472e9d82c5370d7b8c2e69da389cf29932a09e144f7b8bbb9cf92959819cc231067c111a4698f7bc4821b393d7da558f44b17bdfb9e322326063d3aa735ef5ad3b4460f48e8ad0c49ed99fc21b3d299488734971ffbba26d4d9393b67f54b5d78206673981c7aa269dc755d0924b40a0a682395ebdf108665d4f2bb6d6dc728846141c3aa358c1096d278844d3a88598c9653decbd39a85fd1adfd5d81f755973f10adbd99686b093cbe0fb70dfb9f75a52162b65c68bf089a27bc12ba15044828eb67f0a765280f5bd2cbe5ec12e8c8f1f7f1556a56bb9c44c7d5694e873663d557b55b1cef601b8648fea1fdd358284add20c08323ac7289b7a0dc37690ee85754af09fca57b5eb9c49da958682ade9b9a7994c3e3440493fd51e5776d5f71c985930b4582a5e7748195050b83d50b52e006c480a0a77239959b02434ad71c0527c7e024b7177de10a37ddcc9ddc04ae5b0d0d2bdd6089e4fe8abbda7d4039818cfdcf294ea9aeb402c63a48e4f89417c62f68dc7a29ce435a8a38a6c0d23cf07d791f7520a844a88d1c13f2f5e8baff501c07a4a835645f615675a1ed3e607cf0aefa73cec6fa4aceadae8177180e13e79e1685a3996869e4083f75d98bf8a4643ca6d900a2583f7d5436f1089684c31246165ddaed2cd3ace2c692d79dc03584b44f224626671e6b530547569077202128a92a6630f7d856240149f9c02444fa4f29bd9680f610e73803e039f495a0d5d1cee243847a67e683bdd22a180cda63c5d1f64238e28c55ae68ec05cfc1223949adde37197f1d3aab06aba35c90669b89f1643fd312a8f736d59b540731e003cb985aec6620aa18b3d1ae1c6248f21893e651f56b3180620f5ccaae32ac7112bcab509209cfefa2d602c14af678cf8ff00847d2b910aa94eb1e873e4a665cbc707d73f742c345ad9726516dabd41cf5558b4a8f77e104c26d6d70d8ef883e183f35acd465e6b83cf032e3e49d695ab97606040f281c0c2a76a9576f71a646493e303e93f4465a3c812cc97363c4cedc7dfddbe6a727634551a5d9ea22769e7989e475fa277657c09859dd95e6f6073b0e009c73224989eb2253db4bdea0e707d411d52f21a8d0edae447287b97e09492c6ec903d327a7ef85ddddd73048fdf827e5a16b6057755cc79f0c1f9895f0acd397282f6a1789c81d3c70966f27a18e27a20d8520fb8d45a3a40f1feca1a17cd8264faa16ad7601044a5f5ae9a381fe12b611c55d47c4af1fab01007ecaacd6bac787d4a06eaf0f4283602cf73adc7549aeb5c7be58c983cc7f749d8d7d430263a9f04fec6c83060620927a93d123901b06b4b58cbb2efa221ce76ef25e343a60e1134c93e691bfa249863082d84baa800168e6607a1cfdd10ca7e07f7e686a8c8a827a04b60448d6069681d5681a1980c3e507db0a834487556c8c2d0f4867707a7a15d98ff008a0a1f31f0242959532807121aa4a55f12982312f0a373cf8a0aabe7c47a28a9bddb4c99f03d48f3598460ea84f585e31c421291288608eb28a0124bbc5455a96e0438023a839fd0e14c17a4260157bdec9517ee34ff0096f39ea5b3e878f6f92a5eada556a07f98c3b6603c65a7ff00d74f782b5a23c5475a98220c11d410083ea10a3598c538e33cf447537301e0c0eb130aef7fd93a4e3ba980c7725b1dc3edd3dbe4aa5a9d8ba9bc35ed2d3d047708f1078295e865b0dd36a832003ef8f75dd7a6e070e03c71f7425b433831eeb87dd89c942cd464d74c3b8e67a7c9196556700c10d91cfe264c7e886b9e7dbfbae687e21eff00441f414cb05957711b99cccc74338223d41f994ea85c163e0b636f1e11d154b4e791d7affeaac97665a0fa7ea029bec64cb7da6bad2c2dda0f8787e9e78438d48e6249cf4311d7e4aa96261c631ff299e9f72f2e32e265d1ede0b26663475e17388c923042f7e2b6407188e40fde128bdaa454a9063bcefaa87e29f1ea8b30f1f5e9b70193e6784b6fefd80775ad07c92faf59c41c9e12dbb798e50b01cd7af924f27f45358e9cf7f7888679f5f44259303aab41122785690f2312924fd0b275a3c68d823600380a4a75e5ae0573c82bea5f994644cf2df6b89c9f245d3aac6020941d150ea0dc84af6ccc9ae2e248733001cfa78af6f480f6907969e3d9451dd2b8b2fc43d0fd0a6e8c7355c58f638f044ffe27fcad2741b90f637338e3e8b30d51e65827fabecaebd9479dadcf43f55d989dc462d9a9be29c0393fdf951dab886f1385d553df3e8146c79ddcfee533191355a98ce3a2f2955038fdfef0bd7306d70848ad6b383cb64c48c217b0d5960a75e305154eb7212971c046d032985186fc2e1cfeb2a172e5dc844c11f1b0be35424d71508220c648456ee7d104cd416e7c9c282ead5951a5af6b5cdf3e9fd8f985e596419ca9779faa6b314ad77407325f4882cead71823d1d111ea555ea3a39c2d4ee3823f7d1503b79634d8f6963434bb2624027c638948d0533ffd9);
INSERT INTO `plat` (`id`, `nom`, `id_category`, `id_restaurant`, `description`, `prix`, `image`, `imageData`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE `reclamation` (
  `id` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_resto` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `nombre_reclation` int(11) NOT NULL,
  `etoile` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_restaurant` int(11) NOT NULL,
  `id_table` int(11) NOT NULL,
  `date_reservation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `id` int(11) NOT NULL,
  `nombre_p` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zone_liv`
--

CREATE TABLE `zone_liv` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avie`
--
ALTER TABLE `avie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande_plats`
--
ALTER TABLE `commande_plats`
  ADD KEY `idCommande` (`idCommande`),
  ADD KEY `idPlat` (`idPlat`);

--
-- Indexes for table `don`
--
ALTER TABLE `don`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offre_resto`
--
ALTER TABLE `offre_resto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panies`
--
ALTER TABLE `panies`
  ADD KEY `idPlats` (`idPlats`);

--
-- Indexes for table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone_liv`
--
ALTER TABLE `zone_liv`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avie`
--
ALTER TABLE `avie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `don`
--
ALTER TABLE `don`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gerant`
--
ALTER TABLE `gerant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offre_resto`
--
ALTER TABLE `offre_resto`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plat`
--
ALTER TABLE `plat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zone_liv`
--
ALTER TABLE `zone_liv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande_plats`
--
ALTER TABLE `commande_plats`
  ADD CONSTRAINT `commande_plats_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commandes` (`id`),
  ADD CONSTRAINT `commande_plats_ibfk_2` FOREIGN KEY (`idPlat`) REFERENCES `plat` (`id`);

--
-- Constraints for table `panies`
--
ALTER TABLE `panies`
  ADD CONSTRAINT `panies_ibfk_1` FOREIGN KEY (`idPlats`) REFERENCES `plat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;