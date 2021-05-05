-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2021 at 04:58 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k25dsfnxjl`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add Token', 5, 'add_token'),
(18, 'Can change Token', 5, 'change_token'),
(19, 'Can delete Token', 5, 'delete_token'),
(20, 'Can view Token', 5, 'view_token'),
(21, 'Can add site', 6, 'add_site'),
(22, 'Can change site', 6, 'change_site'),
(23, 'Can delete site', 6, 'delete_site'),
(24, 'Can view site', 6, 'view_site'),
(25, 'Can add social application', 7, 'add_socialapp'),
(26, 'Can change social application', 7, 'change_socialapp'),
(27, 'Can delete social application', 7, 'delete_socialapp'),
(28, 'Can view social application', 7, 'view_socialapp'),
(29, 'Can add social account', 8, 'add_socialaccount'),
(30, 'Can change social account', 8, 'change_socialaccount'),
(31, 'Can delete social account', 8, 'delete_socialaccount'),
(32, 'Can view social account', 8, 'view_socialaccount'),
(33, 'Can add social application token', 9, 'add_socialtoken'),
(34, 'Can change social application token', 9, 'change_socialtoken'),
(35, 'Can delete social application token', 9, 'delete_socialtoken'),
(36, 'Can view social application token', 9, 'view_socialtoken'),
(37, 'Can add email address', 10, 'add_emailaddress'),
(38, 'Can change email address', 10, 'change_emailaddress'),
(39, 'Can delete email address', 10, 'delete_emailaddress'),
(40, 'Can view email address', 10, 'view_emailaddress'),
(41, 'Can add email confirmation', 11, 'add_emailconfirmation'),
(42, 'Can change email confirmation', 11, 'change_emailconfirmation'),
(43, 'Can delete email confirmation', 11, 'delete_emailconfirmation'),
(44, 'Can view email confirmation', 11, 'view_emailconfirmation'),
(45, 'Can add Password Reset Token', 12, 'add_resetpasswordtoken'),
(46, 'Can change Password Reset Token', 12, 'change_resetpasswordtoken'),
(47, 'Can delete Password Reset Token', 12, 'delete_resetpasswordtoken'),
(48, 'Can view Password Reset Token', 12, 'view_resetpasswordtoken'),
(49, 'Can add user', 13, 'add_user'),
(50, 'Can change user', 13, 'change_user'),
(51, 'Can delete user', 13, 'delete_user'),
(52, 'Can view user', 13, 'view_user'),
(53, 'Can add user profile', 14, 'add_userprofile'),
(54, 'Can change user profile', 14, 'change_userprofile'),
(55, 'Can delete user profile', 14, 'delete_userprofile'),
(56, 'Can view user profile', 14, 'view_userprofile'),
(57, 'Can add course', 15, 'add_course'),
(58, 'Can change course', 15, 'change_course'),
(59, 'Can delete course', 15, 'delete_course'),
(60, 'Can view course', 15, 'view_course'),
(61, 'Can add course_ module', 16, 'add_course_module'),
(62, 'Can change course_ module', 16, 'change_course_module'),
(63, 'Can delete course_ module', 16, 'delete_course_module'),
(64, 'Can view course_ module', 16, 'view_course_module'),
(65, 'Can add certificate', 17, 'add_certificate'),
(66, 'Can change certificate', 17, 'change_certificate'),
(67, 'Can delete certificate', 17, 'delete_certificate'),
(68, 'Can view certificate', 17, 'view_certificate'),
(69, 'Can add badge', 18, 'add_badge'),
(70, 'Can change badge', 18, 'change_badge'),
(71, 'Can delete badge', 18, 'delete_badge'),
(72, 'Can view badge', 18, 'view_badge'),
(73, 'Can add feedback', 19, 'add_feedback'),
(74, 'Can change feedback', 19, 'change_feedback'),
(75, 'Can delete feedback', 19, 'delete_feedback'),
(76, 'Can view feedback', 19, 'view_feedback'),
(77, 'Can add answer', 20, 'add_answer'),
(78, 'Can change answer', 20, 'change_answer'),
(79, 'Can delete answer', 20, 'delete_answer'),
(80, 'Can view answer', 20, 'view_answer'),
(81, 'Can add question', 21, 'add_question'),
(82, 'Can change question', 21, 'change_question'),
(83, 'Can delete question', 21, 'delete_question'),
(84, 'Can view question', 21, 'view_question'),
(85, 'Can add quiz', 22, 'add_quiz'),
(86, 'Can change quiz', 22, 'change_quiz'),
(87, 'Can delete quiz', 22, 'delete_quiz'),
(88, 'Can view quiz', 22, 'view_quiz'),
(89, 'Can add quiz taker', 23, 'add_quiztaker'),
(90, 'Can change quiz taker', 23, 'change_quiztaker'),
(91, 'Can delete quiz taker', 23, 'delete_quiztaker'),
(92, 'Can view quiz taker', 23, 'view_quiztaker'),
(93, 'Can add users answer', 24, 'add_usersanswer'),
(94, 'Can change users answer', 24, 'change_usersanswer'),
(95, 'Can delete users answer', 24, 'delete_usersanswer'),
(96, 'Can view users answer', 24, 'view_usersanswer'),
(97, 'Can add lesson', 25, 'add_lesson'),
(98, 'Can change lesson', 25, 'change_lesson'),
(99, 'Can delete lesson', 25, 'delete_lesson'),
(100, 'Can view lesson', 25, 'view_lesson'),
(101, 'Can add lesson_ status', 26, 'add_lesson_status'),
(102, 'Can change lesson_ status', 26, 'change_lesson_status'),
(103, 'Can delete lesson_ status', 26, 'delete_lesson_status'),
(104, 'Can view lesson_ status', 26, 'view_lesson_status'),
(105, 'Can add session', 27, 'add_session'),
(106, 'Can change session', 27, 'change_session'),
(107, 'Can delete session', 27, 'delete_session'),
(108, 'Can view session', 27, 'view_session'),
(109, 'Can add blacklisted token', 28, 'add_blacklistedtoken'),
(110, 'Can change blacklisted token', 28, 'change_blacklistedtoken'),
(111, 'Can delete blacklisted token', 28, 'delete_blacklistedtoken'),
(112, 'Can view blacklisted token', 28, 'view_blacklistedtoken'),
(113, 'Can add outstanding token', 29, 'add_outstandingtoken'),
(114, 'Can change outstanding token', 29, 'change_outstandingtoken'),
(115, 'Can delete outstanding token', 29, 'delete_outstandingtoken'),
(116, 'Can view outstanding token', 29, 'view_outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `badge_badge`
--

CREATE TABLE `badge_badge` (
  `id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_certificate`
--

CREATE TABLE `certificate_certificate` (
  `id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses_course`
--

CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `course_overview` longtext COLLATE utf8_unicode_ci NOT NULL,
  `course_content_one` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_content_two` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricing` int(11) DEFAULT NULL,
  `sub_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_modules_course_module`
--

CREATE TABLE `course_modules_course_module` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `module_number` int(11) NOT NULL,
  `module_overview` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_one` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_two` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-01-07 07:45:44.381060', '1', 'Business Analysis', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"question\", \"object\": \"Business Analysis competencies are divided into three groups . Which of the following are the groups of competencies for a Business Analyst?\\r\\na.\\tIT Skills\\r\\nb.\\tBehavioral Skills\\r\\nc.\\tTechniques.\\r\\nd.\\tProject management Support.\\r\\ne.\\tBusiness Knowledge.\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Who should be defined as the owner of a risk?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following would BEST be managed with the \\u201ckeep satisfied\\u201d stakeholder management strategy?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following is likely to be an input into the Analysing needs stage of the business analysis process model?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"In which of the following business analysis area does the traditional systems analyst role permanently operate?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"The business activity model shows the doing activities of a business system. Which element of CATWOE do these activities relate to?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"One of the claimed advantages of buying a software package is that it is possible to predict future maintenance cost with some certainty. How would these costs be classified in a cost benefit analysis?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"A use case Place order must always invoke a related use case Check Credit. How is the association between the two use cases shown?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"The change curve shows the range of emotions experience by people when facing change. One of the axes on the graphs is Time, What is the other axis?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What occurs at the handoffs when two actors do not synchronise their work?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"When is the self esteem of individuals affected by a change process usually at its lowest?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Linking a piece of delivered software functionality with a requirement is known as which of the following?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"In a particular organisation it a common practice to call all managers by their first name. It is part of the culture of the organisation. Newcomers are quickly corrected if they do not follow this informal approach. What would knowing about this convention be classified as in Requirement Engineering?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following is a primary activity in the value chain?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following models shows the driving and resisting forces of change?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"An analyst has discovered that a company wishes to hold information about departments and employees. A department may have the many employees in it, but each employee can at any one time, only work in one department. There is no requirement to store historical information. However, there are currently eight departments and over one hundred employees. How would this relationship be shown on an Entity Relationship diagram?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"When undertaking business system modelling how many Business activity Models (BAM\\u2019s) are initially produced.\"}}, {\"added\": {\"name\": \"question\", \"object\": \"The following is a list of statements concerning investigation techniques.\\r\\n\\r\\na.\\tQuestionnaires are an effective way of developing rapport with the business users.\\r\\nb.\\tWorkshops are an effective way of obtaining user buy in and acceptance\\r\\nc.\\tProtocol analysis involves following a user for a period to find out what they do.\\r\\nd.\\tScenarios can be used as an effective basis for the development of prototypes\\r\\n\\r\\nWhich of the following is correct?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"In which of the following circumstances is supplier power high?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following is likely to be shown as a process in a swim lane diagram of a library book borrowing system?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following are steps in the Isaken and Treffingers creative problem solving model?\\r\\n\\r\\na.\\tMess Finding\\r\\nb.\\tData Modelling\\r\\nc.\\tProcess Finding \\r\\nd.\\tProblem Finding \\r\\ne.\\tSolution Finding\"}}, {\"added\": {\"name\": \"question\", \"object\": \"An It department needs to upgrade its hard ware to run the new version of an established operating system. The cost of this upgrade is $2million. As an alternative, the IT director has suggested that the company should change to a completely different operating system. Although this will cost $6 million, the change will bring many other benefits, including cheaper maintenance cost and increased security. What is the avoided cost in his proposal?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"The requirements catalogue documents the business user or users who requested the requirement. Which heading in the requirements catalogue template would this information be recorded?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"The entity relationship model below shows the relationship between customer and order. Which of the following business rules is correct?\\r\\n\\r\\nSOME IMAGE HERE\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following statements is TRUE?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Every night at midnight a batch process is invoked to invoice all orders received that day. How will the time midnight be repeated on a use case diagram?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following techniques can be used to pull together the results of an analysis of the external and internal business environment of an organisation?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which investigation technique is supported by use case descriptions?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following statements is TRUE about the process view of an organisation?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What do the arrow headed lines between activities represent on a business activity model?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What is the first stage of the waterfall systems development lifecycle?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following is an input to the \\u201cinvestigate the situation\\u201d stage of the business analysis process model?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"During a workshop. It is useful to ask participants to come up with ideas which are listed for later evaluation. What is this technique called?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What is the MoSCoW principle used for?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"A requirement has been identified as beneficial. It will be included in the system if it does not take too long to deliver or cost too much. How would this requirement be prioritised in the MoSCoW classification?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Cars, trucks and motorbikes are all types of a vehicle. What structure could be used on a class model to model this?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which of the following is an advantage to the host organisation of using an internal consultant to conduct a business analysis project?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What does a force field analysis consider?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What is the business analyst doing when he or she compare the BAM with the current business situation.\"}}, {\"added\": {\"name\": \"question\", \"object\": \"When analysing stakeholders, it is useful to produce a stakeholder analysis grid. What is depicted on the axes of this grid?\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"b, c and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"a, b and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"b, c and d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"a, d and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The person who documented the risk in the risk register.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The person who identified the risk in the initial requirement analysis.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The person responsible for defining the probability of the risk\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The person best placed to take the necessary counter measure to the risk\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Those with high power/influence and no interest in the project.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Those with high power influence and some interests in the project\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Those with some power influence and high interest in the project.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Those with some power influence and some interest in the project.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Shortlist of business options\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Validated requirements documents\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The business case\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Agreed business activity model\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Quantifying costs and benefits\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Defining the needs of the business\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Implementing business changes\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Specifying IT systems requirements\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Transformation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Actor\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Environment\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Owner\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As an intangible cost\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a tangible benefit\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a tangible cost\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"An  intangible benefit\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"By a solid line with no arrowhead or stereotype\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"By a broken arrowed line stereotyped with the word <<extend>>\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"By a broken arrowed line stereotyped with the word <<e>include>>\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"By a broken arrowed line stereotyped with the word <<include>>\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Fear\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Self esteem\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Anger\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Shock\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Errors\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Queues\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Functions\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Decisions\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"At the end of the change process\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"At the start of the change process\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"At all points during the change process\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"In the middle phase of the change process\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Requirement Validation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Requirement Verification\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Requirement testing\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Requirements traceability\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Explicit individual knowledge\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Tacit individual knowledge\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Explicit corporate knowledge\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Tacit corporate knowledge\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Procurement\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Firm infrastructure\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Service\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Technology development\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Force field analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Five forces model\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Power impact grid\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Learning cycle\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As (8,,100) at the Department end of the relationship\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a many to many between Department and Employee\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a one to one between Department and Employee\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a one to many between Department and Employee\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"One for each system under consideration\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"One for each CATWOE\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"One for each Actor\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"One to reflect the perspective of the Owner\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Statements a and c are incorrect, statements b and d are correct.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Statements a and d are incorrect, statements b and c are correct\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Statements b  and c are incorrect, statements a and d are correct.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Statements c and d are incorrect, statements a and b are correct\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"When switching cost are low\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"When there are relatively few customers\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"When the supplier brand is powerful\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"When alternatives are readily available\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Book\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Librarian\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Borrowing limit\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Borrow book\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"a, b, c and d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"b, c and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"a, d and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"a, c, d and e\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"$2 million\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"$4 million\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"$6 million\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"$8 million\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Owner\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Justification\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Author\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Source\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"An order may be placed by many customers.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"A customer may place many orders\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"A customer may never place an order\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"An order need not be placed by a customer.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Improving the business process is concerned with removing problems identified in the AS-IS process\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Introducing bottlenecks is an important principle of business process re-design.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"It is not permissible to show decision diamonds on a swim lane diagram.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Processes cannot be improved by changing the sequence of activities alone.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a use case\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As an association\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As an actor\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a system boundary\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"SWOT analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Resource audit\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Five forces model\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Balance business scorecard\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Scenario Analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Questionnaires\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Document Analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Interviewing\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"It focuses on the customer of the organisation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"It focuses solely on the interval view of the organisation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"It focuses on the functions of an organisation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"It focuses on the organisational structure\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Activity sequence\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Logical dependency\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Functional optionality\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Flow of data\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Plan\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Feasibility Study\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Strategic Vision\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Stakeholder perspectives\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"List of issues and problems\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Business case\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Terms of reference\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Round Robin\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Brainstorming\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Mind Mapping\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Mess Finding\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"To analyse stakeholders\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"To determine strategy\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"To determine a root definition\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"To prioritise requirements\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a \\u201cM\\u201d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a \\u201cC\\u201d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a \\u201cS\\u201d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"As a \\u201cW\\u201d\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Generalisation\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Association Class\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Exclusivity relationship\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The <<include>> construct\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"They will have a broad business perspective.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"They will be familiar with the host organisation.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"They will be only paid when they are needed.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"They will have a dispassionate view of the host organisation.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Forces for and against business change\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Forces in the competitive environment\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The financial strength of the organisation.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"The power of external suppliers.\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Conceptual Modelling\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Analysing perspectives\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Gap analysis\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Defining the CATWOE\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Objective and interests\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Power and influence\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Perspectives and impacts\"}}, {\"added\": {\"name\": \"answer\", \"object\": \"Power and interest.\"}}]', 22, 1),
(2, '2021-01-07 08:08:35.375369', '1', 'Business Analysis', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 22, 1),
(3, '2021-01-07 08:13:19.132774', '1', 'Business Analysis 1', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'account', 'emailaddress'),
(11, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(8, 'allauth', 'socialaccount'),
(7, 'allauth', 'socialapp'),
(9, 'allauth', 'socialtoken'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(5, 'authtoken', 'token'),
(18, 'badge', 'badge'),
(17, 'certificate', 'certificate'),
(4, 'contenttypes', 'contenttype'),
(16, 'course_modules', 'course_module'),
(15, 'courses', 'course'),
(12, 'django_rest_passwordreset', 'resetpasswordtoken'),
(19, 'feedback', 'feedback'),
(25, 'lessons', 'lesson'),
(26, 'lessons', 'lesson_status'),
(20, 'practice_test', 'answer'),
(21, 'practice_test', 'question'),
(22, 'practice_test', 'quiz'),
(23, 'practice_test', 'quiztaker'),
(24, 'practice_test', 'usersanswer'),
(27, 'sessions', 'session'),
(6, 'sites', 'site'),
(28, 'token_blacklist', 'blacklistedtoken'),
(29, 'token_blacklist', 'outstandingtoken'),
(13, 'users', 'user'),
(14, 'users', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'users', '0001_initial', '2021-01-06 21:48:26.237890'),
(2, 'account', '0001_initial', '2021-01-06 21:48:29.292716'),
(3, 'account', '0002_email_max_length', '2021-01-06 21:48:31.031081'),
(4, 'contenttypes', '0001_initial', '2021-01-06 21:48:32.339138'),
(5, 'admin', '0001_initial', '2021-01-06 21:48:33.899593'),
(6, 'admin', '0002_logentry_remove_auto_add', '2021-01-06 21:48:35.136077'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-06 21:48:35.458304'),
(8, 'contenttypes', '0002_remove_content_type_name', '2021-01-06 21:48:36.840227'),
(9, 'auth', '0001_initial', '2021-01-06 21:48:39.268239'),
(10, 'auth', '0002_alter_permission_name_max_length', '2021-01-06 21:48:41.676617'),
(11, 'auth', '0003_alter_user_email_max_length', '2021-01-06 21:48:41.891341'),
(12, 'auth', '0004_alter_user_username_opts', '2021-01-06 21:48:42.128211'),
(13, 'auth', '0005_alter_user_last_login_null', '2021-01-06 21:48:42.390478'),
(14, 'auth', '0006_require_contenttypes_0002', '2021-01-06 21:48:42.706850'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2021-01-06 21:48:43.023942'),
(16, 'auth', '0008_alter_user_username_max_length', '2021-01-06 21:48:43.344345'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2021-01-06 21:48:43.648360'),
(18, 'auth', '0010_alter_group_name_max_length', '2021-01-06 21:48:44.465489'),
(19, 'auth', '0011_update_proxy_permissions', '2021-01-06 21:48:45.090567'),
(20, 'authtoken', '0001_initial', '2021-01-06 21:48:46.106498'),
(21, 'authtoken', '0002_auto_20160226_1747', '2021-01-06 21:48:56.104489'),
(22, 'badge', '0001_initial', '2021-01-06 21:48:57.320890'),
(23, 'certificate', '0001_initial', '2021-01-06 21:48:58.454772'),
(24, 'courses', '0001_initial', '2021-01-06 21:49:00.373057'),
(25, 'courses', '0002_auto_20201007_1414', '2021-01-06 21:49:02.005813'),
(26, 'course_modules', '0001_initial', '2021-01-06 21:49:04.302437'),
(27, 'django_rest_passwordreset', '0001_initial', '2021-01-06 21:49:06.208878'),
(28, 'django_rest_passwordreset', '0002_pk_migration', '2021-01-06 21:49:16.779848'),
(29, 'django_rest_passwordreset', '0003_allow_blank_and_null_fields', '2021-01-06 21:49:17.541435'),
(30, 'feedback', '0001_initial', '2021-01-06 21:49:19.039125'),
(31, 'sites', '0001_initial', '2021-01-06 21:51:17.757007'),
(32, 'sites', '0002_alter_domain_unique', '2021-01-06 21:51:18.240332'),
(33, 'practice_test', '0001_initial', '2021-01-06 21:52:15.835416'),
(34, 'practice_test', '0002_auto_20200929_1344', '2021-01-06 21:52:19.621406'),
(35, 'practice_test', '0003_quiztaker_percentage', '2021-01-06 21:52:20.427239'),
(36, 'lessons', '0001_initial', '2021-01-06 21:53:05.769636'),
(37, 'users', '0002_auto_20200927_1930', '2021-01-06 21:53:34.471950'),
(38, 'sessions', '0001_initial', '2021-01-06 22:07:58.484718'),
(39, 'token_blacklist', '0001_initial', '2021-01-06 22:08:01.504915'),
(40, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2021-01-06 22:08:02.612461'),
(41, 'token_blacklist', '0003_auto_20171017_2007', '2021-01-06 22:08:03.352145'),
(42, 'token_blacklist', '0004_auto_20171017_2013', '2021-01-06 22:08:04.451921'),
(43, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2021-01-06 22:08:05.846746'),
(44, 'token_blacklist', '0006_auto_20171017_2113', '2021-01-06 22:08:06.330518'),
(45, 'token_blacklist', '0007_auto_20171017_2214', '2021-01-06 22:08:16.021324');

-- --------------------------------------------------------

--
-- Table structure for table `django_rest_passwordreset_resetpasswordtoken`
--

CREATE TABLE `django_rest_passwordreset_resetpasswordtoken` (
  `created_at` datetime(6) NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` char(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8c7o7vmy2ke6sm4z9chqkneu68dix5xn', 'YWNiMzNhNzE2YjI3MDljYWZjZjM5ZjNlZGYwMzFhODgzNTA4MGM0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNmZhZjcyZmQyNjA2Yzk0OTFiOTQwYzM5ZDZiMGY3YTY1OTA3ZTIxIn0=', '2021-01-20 23:36:56.700033');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_feedback`
--

CREATE TABLE `feedback_feedback` (
  `id` int(11) NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons_lesson`
--

CREATE TABLE `lessons_lesson` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_number` int(11) NOT NULL,
  `content_one` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_two` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_three` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `video_one` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons_lesson_status`
--

CREATE TABLE `lessons_lesson_status` (
  `id` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `practice_test_answer`
--

CREATE TABLE `practice_test_answer` (
  `id` int(11) NOT NULL,
  `label` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `practice_test_answer`
--

INSERT INTO `practice_test_answer` (`id`, `label`, `is_correct`, `question_id`) VALUES
(1, 'b, c and e', 1, 1),
(2, 'a, b and e', 0, 1),
(3, 'b, c and d', 0, 1),
(4, 'a, d and e', 0, 1),
(5, 'The person who documented the risk in the risk register.', 0, 2),
(6, 'The person who identified the risk in the initial requirement analysis.', 0, 2),
(7, 'The person responsible for defining the probability of the risk', 0, 2),
(8, 'The person best placed to take the necessary counter measure to the risk', 1, 2),
(9, 'Those with high power/influence and no interest in the project.', 0, 3),
(10, 'Those with high power influence and some interests in the project', 1, 3),
(11, 'Those with some power influence and high interest in the project.', 0, 3),
(12, 'Those with some power influence and some interest in the project.', 0, 3),
(13, 'Shortlist of business options', 0, 4),
(14, 'Validated requirements documents', 0, 4),
(15, 'The business case', 0, 4),
(16, 'Agreed business activity model', 1, 4),
(17, 'Quantifying costs and benefits', 0, 5),
(18, 'Defining the needs of the business', 0, 5),
(19, 'Implementing business changes', 0, 5),
(20, 'Specifying IT systems requirements', 1, 5),
(21, 'Transformation', 1, 6),
(22, 'Actor', 0, 6),
(23, 'Environment', 0, 6),
(24, 'Owner', 0, 6),
(25, 'As an intangible cost', 0, 7),
(26, 'As a tangible benefit', 0, 7),
(27, 'As a tangible cost', 1, 7),
(28, 'An  intangible benefit', 0, 7),
(29, 'By a solid line with no arrowhead or stereotype', 0, 8),
(30, 'By a broken arrowed line stereotyped with the word <<extend>>', 0, 8),
(31, 'By a broken arrowed line stereotyped with the word <<e>include>>', 0, 8),
(32, 'By a broken arrowed line stereotyped with the word <<include>>', 1, 8),
(33, 'Fear', 0, 9),
(34, 'Self esteem', 1, 9),
(35, 'Anger', 0, 9),
(36, 'Shock', 0, 9),
(37, 'Errors', 0, 10),
(38, 'Queues', 1, 10),
(39, 'Functions', 0, 10),
(40, 'Decisions', 0, 10),
(41, 'At the end of the change process', 0, 11),
(42, 'At the start of the change process', 0, 11),
(43, 'At all points during the change process', 0, 11),
(44, 'In the middle phase of the change process', 1, 11),
(45, 'Requirement Validation', 0, 12),
(46, 'Requirement Verification', 0, 12),
(47, 'Requirement testing', 0, 12),
(48, 'Requirements traceability', 1, 12),
(49, 'Explicit individual knowledge', 0, 13),
(50, 'Tacit individual knowledge', 0, 13),
(51, 'Explicit corporate knowledge', 0, 13),
(52, 'Tacit corporate knowledge', 1, 13),
(53, 'Procurement', 0, 14),
(54, 'Firm infrastructure', 0, 14),
(55, 'Service', 1, 14),
(56, 'Technology development', 0, 14),
(57, 'Force field analysis', 1, 15),
(58, 'Five forces model', 0, 15),
(59, 'Power impact grid', 0, 15),
(60, 'Learning cycle', 0, 15),
(61, 'As (8,,100) at the Department end of the relationship', 0, 16),
(62, 'As a many to many between Department and Employee', 0, 16),
(63, 'As a one to one between Department and Employee', 0, 16),
(64, 'As a one to many between Department and Employee', 1, 16),
(65, 'One for each system under consideration', 0, 17),
(66, 'One for each CATWOE', 1, 17),
(67, 'One for each Actor', 0, 17),
(68, 'One to reflect the perspective of the Owner', 0, 17),
(69, 'Statements a and c are incorrect, statements b and d are correct.', 1, 18),
(70, 'Statements a and d are incorrect, statements b and c are correct', 0, 18),
(71, 'Statements b  and c are incorrect, statements a and d are correct.', 0, 18),
(72, 'Statements c and d are incorrect, statements a and b are correct', 0, 18),
(73, 'When switching cost are low', 0, 19),
(74, 'When there are relatively few customers', 0, 19),
(75, 'When the supplier brand is powerful', 1, 19),
(76, 'When alternatives are readily available', 0, 19),
(77, 'Book', 0, 20),
(78, 'Librarian', 0, 20),
(79, 'Borrowing limit', 0, 20),
(80, 'Borrow book', 1, 20),
(81, 'a, b, c and d', 0, 21),
(82, 'b, c and e', 0, 21),
(83, 'a, d and e', 1, 21),
(84, 'a, c, d and e', 0, 21),
(85, '$2 million', 1, 22),
(86, '$4 million', 0, 22),
(87, '$6 million', 0, 22),
(88, '$8 million', 0, 22),
(89, 'Owner', 0, 23),
(90, 'Justification', 0, 23),
(91, 'Author', 0, 23),
(92, 'Source', 1, 23),
(93, 'An order may be placed by many customers.', 0, 24),
(94, 'A customer may place many orders', 1, 24),
(95, 'A customer may never place an order', 0, 24),
(96, 'An order need not be placed by a customer.', 0, 24),
(97, 'Improving the business process is concerned with removing problems identified in the AS-IS process', 1, 25),
(98, 'Introducing bottlenecks is an important principle of business process re-design.', 0, 25),
(99, 'It is not permissible to show decision diamonds on a swim lane diagram.', 0, 25),
(100, 'Processes cannot be improved by changing the sequence of activities alone.', 0, 25),
(101, 'As a use case', 0, 26),
(102, 'As an association', 0, 26),
(103, 'As an actor', 1, 26),
(104, 'As a system boundary', 0, 26),
(105, 'SWOT analysis', 1, 27),
(106, 'Resource audit', 0, 27),
(107, 'Five forces model', 0, 27),
(108, 'Balance business scorecard', 0, 27),
(109, 'Scenario Analysis', 1, 28),
(110, 'Questionnaires', 0, 28),
(111, 'Document Analysis', 0, 28),
(112, 'Interviewing', 0, 28),
(113, 'It focuses on the customer of the organisation', 1, 29),
(114, 'It focuses solely on the interval view of the organisation', 0, 29),
(115, 'It focuses on the functions of an organisation', 0, 29),
(116, 'It focuses on the organisational structure', 0, 29),
(117, 'Activity sequence', 0, 30),
(118, 'Logical dependency', 1, 30),
(119, 'Functional optionality', 0, 30),
(120, 'Flow of data', 0, 30),
(121, 'Plan', 0, 31),
(122, 'Analysis', 0, 31),
(123, 'Feasibility Study', 1, 31),
(124, 'Strategic Vision', 0, 31),
(125, 'Stakeholder perspectives', 0, 32),
(126, 'List of issues and problems', 0, 32),
(127, 'Business case', 0, 32),
(128, 'Terms of reference', 1, 32),
(129, 'Round Robin', 0, 33),
(130, 'Brainstorming', 1, 33),
(131, 'Mind Mapping', 0, 33),
(132, 'Mess Finding', 0, 33),
(133, 'To analyse stakeholders', 0, 34),
(134, 'To determine strategy', 0, 34),
(135, 'To determine a root definition', 0, 34),
(136, 'To prioritise requirements', 1, 34),
(137, 'As a “M”', 0, 35),
(138, 'As a “C”', 0, 35),
(139, 'As a “S”', 1, 35),
(140, 'As a “W”', 0, 35),
(141, 'Generalisation', 1, 36),
(142, 'Association Class', 0, 36),
(143, 'Exclusivity relationship', 0, 36),
(144, 'The <<include>> construct', 0, 36),
(145, 'They will have a broad business perspective.', 0, 37),
(146, 'They will be familiar with the host organisation.', 1, 37),
(147, 'They will be only paid when they are needed.', 0, 37),
(148, 'They will have a dispassionate view of the host organisation.', 0, 37),
(149, 'Forces for and against business change', 1, 38),
(150, 'Forces in the competitive environment', 0, 38),
(151, 'The financial strength of the organisation.', 0, 38),
(152, 'The power of external suppliers.', 0, 38),
(153, 'Conceptual Modelling', 0, 39),
(154, 'Analysing perspectives', 0, 39),
(155, 'Gap analysis', 1, 39),
(156, 'Defining the CATWOE', 0, 39),
(157, 'Objective and interests', 0, 40),
(158, 'Power and influence', 0, 40),
(159, 'Perspectives and impacts', 0, 40),
(160, 'Power and interest.', 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `practice_test_question`
--

CREATE TABLE `practice_test_question` (
  `id` int(11) NOT NULL,
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `practice_test_question`
--

INSERT INTO `practice_test_question` (`id`, `label`, `order`, `quiz_id`) VALUES
(1, 'Business Analysis competencies are divided into three groups . Which of the following are the groups of competencies for a Business Analyst?\r\na.	IT Skills\r\nb.	Behavioral Skills\r\nc.	Techniques.\r\nd.	Project management Support.\r\ne.	Business Knowledge.', 1, 1),
(2, 'Who should be defined as the owner of a risk?', 2, 1),
(3, 'Which of the following would BEST be managed with the “keep satisfied” stakeholder management strategy?', 3, 1),
(4, 'Which of the following is likely to be an input into the Analysing needs stage of the business analysis process model?', 40, 1),
(5, 'In which of the following business analysis area does the traditional systems analyst role permanently operate?', 4, 1),
(6, 'The business activity model shows the doing activities of a business system. Which element of CATWOE do these activities relate to?', 5, 1),
(7, 'One of the claimed advantages of buying a software package is that it is possible to predict future maintenance cost with some certainty. How would these costs be classified in a cost benefit analysis?', 6, 1),
(8, 'A use case Place order must always invoke a related use case Check Credit. How is the association between the two use cases shown?', 7, 1),
(9, 'The change curve shows the range of emotions experience by people when facing change. One of the axes on the graphs is Time, What is the other axis?', 8, 1),
(10, 'What occurs at the handoffs when two actors do not synchronise their work?', 9, 1),
(11, 'When is the self esteem of individuals affected by a change process usually at its lowest?', 10, 1),
(12, 'Linking a piece of delivered software functionality with a requirement is known as which of the following?', 11, 1),
(13, 'In a particular organisation it a common practice to call all managers by their first name. It is part of the culture of the organisation. Newcomers are quickly corrected if they do not follow this informal approach. What would knowing about this convention be classified as in Requirement Engineering?', 12, 1),
(14, 'Which of the following is a primary activity in the value chain?', 13, 1),
(15, 'Which of the following models shows the driving and resisting forces of change?', 14, 1),
(16, 'An analyst has discovered that a company wishes to hold information about departments and employees. A department may have the many employees in it, but each employee can at any one time, only work in one department. There is no requirement to store historical information. However, there are currently eight departments and over one hundred employees. How would this relationship be shown on an Entity Relationship diagram?', 15, 1),
(17, 'When undertaking business system modelling how many Business activity Models (BAM’s) are initially produced.', 16, 1),
(18, 'The following is a list of statements concerning investigation techniques.\r\n\r\na.	Questionnaires are an effective way of developing rapport with the business users.\r\nb.	Workshops are an effective way of obtaining user buy in and acceptance\r\nc.	Protocol analysis involves following a user for a period to find out what they do.\r\nd.	Scenarios can be used as an effective basis for the development of prototypes\r\n\r\nWhich of the following is correct?', 17, 1),
(19, 'In which of the following circumstances is supplier power high?', 18, 1),
(20, 'Which of the following is likely to be shown as a process in a swim lane diagram of a library book borrowing system?', 19, 1),
(21, 'Which of the following are steps in the Isaken and Treffingers creative problem solving model?\r\n\r\na.	Mess Finding\r\nb.	Data Modelling\r\nc.	Process Finding \r\nd.	Problem Finding \r\ne.	Solution Finding', 20, 1),
(22, 'An It department needs to upgrade its hard ware to run the new version of an established operating system. The cost of this upgrade is $2million. As an alternative, the IT director has suggested that the company should change to a completely different operating system. Although this will cost $6 million, the change will bring many other benefits, including cheaper maintenance cost and increased security. What is the avoided cost in his proposal?', 21, 1),
(23, 'The requirements catalogue documents the business user or users who requested the requirement. Which heading in the requirements catalogue template would this information be recorded?', 22, 1),
(24, 'The entity relationship model below shows the relationship between customer and order. Which of the following business rules is correct?\r\n\r\nSOME IMAGE HERE', 23, 1),
(25, 'Which of the following statements is TRUE?', 24, 1),
(26, 'Every night at midnight a batch process is invoked to invoice all orders received that day. How will the time midnight be repeated on a use case diagram?', 25, 1),
(27, 'Which of the following techniques can be used to pull together the results of an analysis of the external and internal business environment of an organisation?', 26, 1),
(28, 'Which investigation technique is supported by use case descriptions?', 27, 1),
(29, 'Which of the following statements is TRUE about the process view of an organisation?', 28, 1),
(30, 'What do the arrow headed lines between activities represent on a business activity model?', 29, 1),
(31, 'What is the first stage of the waterfall systems development lifecycle?', 30, 1),
(32, 'Which of the following is an input to the “investigate the situation” stage of the business analysis process model?', 31, 1),
(33, 'During a workshop. It is useful to ask participants to come up with ideas which are listed for later evaluation. What is this technique called?', 32, 1),
(34, 'What is the MoSCoW principle used for?', 33, 1),
(35, 'A requirement has been identified as beneficial. It will be included in the system if it does not take too long to deliver or cost too much. How would this requirement be prioritised in the MoSCoW classification?', 34, 1),
(36, 'Cars, trucks and motorbikes are all types of a vehicle. What structure could be used on a class model to model this?', 35, 1),
(37, 'Which of the following is an advantage to the host organisation of using an internal consultant to conduct a business analysis project?', 36, 1),
(38, 'What does a force field analysis consider?', 37, 1),
(39, 'What is the business analyst doing when he or she compare the BAM with the current business situation.', 38, 1),
(40, 'When analysing stakeholders, it is useful to produce a stakeholder analysis grid. What is depicted on the axes of this grid?', 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `practice_test_quiz`
--

CREATE TABLE `practice_test_quiz` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roll_out` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `practice_test_quiz`
--

INSERT INTO `practice_test_quiz` (`id`, `name`, `description`, `slug`, `roll_out`, `timestamp`) VALUES
(1, 'Business Analysis 1', 'Business Analysis Examination Mockup', 'business-analysis-1', 0, '2021-01-07 07:44:58.613833');

-- --------------------------------------------------------

--
-- Table structure for table `practice_test_quiztaker`
--

CREATE TABLE `practice_test_quiztaker` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `date_finished` datetime(6) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `practice_test_quiztaker`
--

INSERT INTO `practice_test_quiztaker` (`id`, `score`, `completed`, `date_finished`, `timestamp`, `quiz_id`, `user_id`, `percentage`) VALUES
(1, 0, 0, NULL, '2021-01-07 08:14:24.013059', 1, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `practice_test_usersanswer`
--

CREATE TABLE `practice_test_usersanswer` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `quiz_taker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `practice_test_usersanswer`
--

INSERT INTO `practice_test_usersanswer` (`id`, `answer_id`, `question_id`, `quiz_taker_id`) VALUES
(1, NULL, 1, 1),
(2, NULL, 2, 1),
(3, NULL, 3, 1),
(4, NULL, 4, 1),
(5, NULL, 5, 1),
(6, NULL, 6, 1),
(7, NULL, 7, 1),
(8, NULL, 8, 1),
(9, NULL, 9, 1),
(10, NULL, 10, 1),
(11, NULL, 11, 1),
(12, NULL, 12, 1),
(13, NULL, 13, 1),
(14, NULL, 14, 1),
(15, NULL, 15, 1),
(16, NULL, 16, 1),
(17, NULL, 17, 1),
(18, NULL, 18, 1),
(19, NULL, 19, 1),
(20, NULL, 20, 1),
(21, NULL, 21, 1),
(22, NULL, 22, 1),
(23, NULL, 23, 1),
(24, NULL, 24, 1),
(25, NULL, 25, 1),
(26, NULL, 26, 1),
(27, NULL, 27, 1),
(28, NULL, 28, 1),
(29, NULL, 29, 1),
(30, NULL, 30, 1),
(31, NULL, 31, 1),
(32, NULL, 32, 1),
(33, NULL, 33, 1),
(34, NULL, 34, 1),
(35, NULL, 35, 1),
(36, NULL, 36, 1),
(37, NULL, 37, 1),
(38, NULL, 38, 1),
(39, NULL, 39, 1),
(40, NULL, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` int(11) NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` int(11) NOT NULL,
  `token` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jti` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

INSERT INTO `token_blacklist_outstandingtoken` (`id`, `token`, `created_at`, `expires_at`, `user_id`, `jti`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMDIzNTM0MywianRpIjoiZmM0NDI2YWU3M2NkNDBiODlkMmY2ZTc4N2YxZGI3MTYiLCJ1c2VyX2lkIjoxMX0.vVOZguO04Jp7BR5KiSqAoYenqgG4B6M1NmInTSfwUDg', '2021-01-06 23:35:43.946373', '2021-01-09 23:35:43.000000', 11, 'fc4426ae73cd40b89d2f6e787f1db716'),
(2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxOTI3MDIxMywianRpIjoiNjE0NDliZDAwMDA0NDNmM2I1OTZiNzQxNDU1N2E1ZGQiLCJ1c2VyX2lkIjoxfQ.U1EBs-qS3l1YpukFkZT3zaNwK5EHzau56IKpKXu2fx0', '2021-04-21 13:16:53.699345', '2021-04-24 13:16:53.000000', 1, '61449bd0000443f3b596b7414557a5dd'),
(3, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxOTI3MDIyMSwianRpIjoiYWI0NDliZjRhMGZlNDI4Yjg5Mjg3MWYxZWY2YTI2MzIiLCJ1c2VyX2lkIjoxfQ.O5V1Xx9pSoM0vceuMUGw-GxgYXaZ25mklhfpa7HVlZ8', '2021-04-21 13:17:01.945209', '2021-04-24 13:17:01.000000', 1, 'ab449bf4a0fe428b892871f1ef6a2632');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`id`, `password`, `last_login`, `email`, `firstname`, `lastname`, `student_type`, `is_active`, `is_admin`, `is_staff`) VALUES
(1, 'pbkdf2_sha256$180000$OhsFmBS3nJ6E$t1KkqEHUC9BWXcKMqjnr7EVQ5Rxv75yknNFEq58w1cU=', '2021-01-06 23:36:56.514753', 'test.littlms@gmail.com', 'Admin', 'Admin', 'individual', 1, 1, 1),
(11, 'pbkdf2_sha256$180000$HBRn8v6mXFdU$q3EACZ20U0tybYQ7BQKVHHamkXkGdjoeGZDN4GZTh+k=', NULL, 'curtismensah48@gmail.com', 'Curtis', 'Mensah', 'individual', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_userprofile`
--

CREATE TABLE `users_userprofile` (
  `user_id` int(11) NOT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession_info` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_region` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedIn_address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_userprofile`
--

INSERT INTO `users_userprofile` (`user_id`, `avatar_url`, `bio`, `phone`, `profession`, `profession_info`, `education`, `location`, `state_region`, `linkedIn_address`, `facebook_address`) VALUES
(1, NULL, 'Agile Developer, LMS Adminstrator, Business Analyst, Ghana Teacher', '0544990204849373', 'Scrum Master', 'Agile leader', 'Lean Icon Training', 'Ghana', 'Accra', 'user@linkedin.com', 'user@facebook.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_users_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `badge_badge`
--
ALTER TABLE `badge_badge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_certificate`
--
ALTER TABLE `certificate_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses_course`
--
ALTER TABLE `courses_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `course_modules_course_module`
--
ALTER TABLE `course_modules_course_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `module_number` (`module_number`),
  ADD UNIQUE KEY `course_modules_course_module_course_id_title_909db258_uniq` (`course_id`,`title`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_rest_passwordreset_resetpasswordtoken`
--
ALTER TABLE `django_rest_passwordreset_resetpasswordtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq` (`key`),
  ADD KEY `django_rest_password_user_id_e8015b11_fk_users_use` (`user_id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `feedback_feedback`
--
ALTER TABLE `feedback_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons_lesson`
--
ALTER TABLE `lessons_lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `lesson_number` (`lesson_number`),
  ADD UNIQUE KEY `lessons_lesson_course_module_id_title_b191cfa6_uniq` (`course_module_id`,`title`);

--
-- Indexes for table `lessons_lesson_status`
--
ALTER TABLE `lessons_lesson_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_lesson_status_lesson_id_3851c3ee_fk_lessons_lesson_id` (`lesson_id`),
  ADD KEY `lessons_lesson_status_user_id_cd0ef723_fk_users_user_id` (`user_id`);

--
-- Indexes for table `practice_test_answer`
--
ALTER TABLE `practice_test_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practice_test_answer_question_id_fd865ea5_fk_practice_` (`question_id`);

--
-- Indexes for table `practice_test_question`
--
ALTER TABLE `practice_test_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practice_test_question_quiz_id_4fd4a2db_fk_practice_test_quiz_id` (`quiz_id`);

--
-- Indexes for table `practice_test_quiz`
--
ALTER TABLE `practice_test_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practice_test_quiz_slug_1f1cc88e` (`slug`);

--
-- Indexes for table `practice_test_quiztaker`
--
ALTER TABLE `practice_test_quiztaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practice_test_quizta_quiz_id_3e668d88_fk_practice_` (`quiz_id`),
  ADD KEY `practice_test_quiztaker_user_id_04bd150d_fk_users_user_id` (`user_id`);

--
-- Indexes for table `practice_test_usersanswer`
--
ALTER TABLE `practice_test_usersanswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practice_test_usersa_answer_id_ffc0c410_fk_practice_` (`answer_id`),
  ADD KEY `practice_test_usersa_question_id_eaa99c98_fk_practice_` (`question_id`),
  ADD KEY `practice_test_usersa_quiz_taker_id_35496854_fk_practice_` (`quiz_taker_id`);

--
-- Indexes for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`);

--
-- Indexes for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  ADD KEY `token_blacklist_outs_user_id_83bc629a_fk_users_use` (`user_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_userprofile`
--
ALTER TABLE `users_userprofile`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `badge_badge`
--
ALTER TABLE `badge_badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_certificate`
--
ALTER TABLE `certificate_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses_course`
--
ALTER TABLE `courses_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_modules_course_module`
--
ALTER TABLE `course_modules_course_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `django_rest_passwordreset_resetpasswordtoken`
--
ALTER TABLE `django_rest_passwordreset_resetpasswordtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback_feedback`
--
ALTER TABLE `feedback_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons_lesson`
--
ALTER TABLE `lessons_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons_lesson_status`
--
ALTER TABLE `lessons_lesson_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `practice_test_answer`
--
ALTER TABLE `practice_test_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `practice_test_question`
--
ALTER TABLE `practice_test_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `practice_test_quiz`
--
ALTER TABLE `practice_test_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `practice_test_quiztaker`
--
ALTER TABLE `practice_test_quiztaker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `practice_test_usersanswer`
--
ALTER TABLE `practice_test_usersanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `course_modules_course_module`
--
ALTER TABLE `course_modules_course_module`
  ADD CONSTRAINT `course_modules_cours_course_id_1f3475da_fk_courses_c` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `django_rest_passwordreset_resetpasswordtoken`
--
ALTER TABLE `django_rest_passwordreset_resetpasswordtoken`
  ADD CONSTRAINT `django_rest_password_user_id_e8015b11_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `lessons_lesson`
--
ALTER TABLE `lessons_lesson`
  ADD CONSTRAINT `lessons_lesson_course_module_id_9351db11_fk_course_mo` FOREIGN KEY (`course_module_id`) REFERENCES `course_modules_course_module` (`id`);

--
-- Constraints for table `lessons_lesson_status`
--
ALTER TABLE `lessons_lesson_status`
  ADD CONSTRAINT `lessons_lesson_status_lesson_id_3851c3ee_fk_lessons_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons_lesson` (`id`),
  ADD CONSTRAINT `lessons_lesson_status_user_id_cd0ef723_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `practice_test_answer`
--
ALTER TABLE `practice_test_answer`
  ADD CONSTRAINT `practice_test_answer_question_id_fd865ea5_fk_practice_` FOREIGN KEY (`question_id`) REFERENCES `practice_test_question` (`id`);

--
-- Constraints for table `practice_test_question`
--
ALTER TABLE `practice_test_question`
  ADD CONSTRAINT `practice_test_question_quiz_id_4fd4a2db_fk_practice_test_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `practice_test_quiz` (`id`);

--
-- Constraints for table `practice_test_quiztaker`
--
ALTER TABLE `practice_test_quiztaker`
  ADD CONSTRAINT `practice_test_quizta_quiz_id_3e668d88_fk_practice_` FOREIGN KEY (`quiz_id`) REFERENCES `practice_test_quiz` (`id`),
  ADD CONSTRAINT `practice_test_quiztaker_user_id_04bd150d_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `practice_test_usersanswer`
--
ALTER TABLE `practice_test_usersanswer`
  ADD CONSTRAINT `practice_test_usersa_answer_id_ffc0c410_fk_practice_` FOREIGN KEY (`answer_id`) REFERENCES `practice_test_answer` (`id`),
  ADD CONSTRAINT `practice_test_usersa_question_id_eaa99c98_fk_practice_` FOREIGN KEY (`question_id`) REFERENCES `practice_test_question` (`id`),
  ADD CONSTRAINT `practice_test_usersa_quiz_taker_id_35496854_fk_practice_` FOREIGN KEY (`quiz_taker_id`) REFERENCES `practice_test_quiztaker` (`id`);

--
-- Constraints for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD CONSTRAINT `token_blacklist_blac_token_id_3cc7fe56_fk_token_bla` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`);

--
-- Constraints for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_userprofile`
--
ALTER TABLE `users_userprofile`
  ADD CONSTRAINT `users_userprofile_user_id_87251ef1_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
