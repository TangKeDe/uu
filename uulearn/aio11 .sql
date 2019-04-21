-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
drop database uulearn;
create database if not exists `uulearn`;
USE `uulearn`;
DROP TABLE IF EXISTS `tb_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_master` (
  `master_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`master_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_master`
--

LOCK TABLES `tb_master` WRITE;
/*!40000 ALTER TABLE `tb_master` DISABLE KEYS */;
INSERT INTO `tb_master` (`master_name`,`master_password`) VALUES 
('20160000','dd4b21e9ef71e1291183a46b913ae6f2');
/*!40000 ALTER TABLE `tb_master` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_student` (
  `stu_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_specialty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_class` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_subjectnumber` int(4) NOT NULL,
  PRIMARY KEY  (`stu_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student`  (`stu_account`,`stu_password`,`stu_name`,`stu_specialty`,`stu_class`,`stu_subjectnumber`) VALUES 
('20161000','dd4b21e9ef71e1291183a46b913ae6f2','黄泽园','计算机','1607',0),
('20161001','dd4b21e9ef71e1291183a46b913ae6f2','乔曦宇','计算机','1607',0),
('20161002','dd4b21e9ef71e1291183a46b913ae6f2','杨易尘','计算机','1607',0),
('20161003','dd4b21e9ef71e1291183a46b913ae6f2','林健亚','计算机','1607',0),
('20161004','dd4b21e9ef71e1291183a46b913ae6f2','赵思喆','计算机','1607',0);
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;





DROP TABLE IF EXISTS `tb_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_teacher` (
  `teacher_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_entry_year` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`teacher_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher`  (`teacher_account`,`teacher_password`,`teacher_name`,`teacher_subject`,`teacher_entry_year`) VALUES 
('20150000','dd4b21e9ef71e1291183a46b913ae6f2','张一','数据结构','2001'),
('20150001','dd4b21e9ef71e1291183a46b913ae6f2','李二','毛泽东思想和中国特色社会主义理论体系概论','2000'),
('20150002','dd4b21e9ef71e1291183a46b913ae6f2','王三','中国近代史纲要','2002');
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tb_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_homework` (
  `homework_id` int(11) NOT NULL auto_increment,
  `homework_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_question` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_teacher_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`homework_id`),
  foreign key (`homework_teacher_account`) references `tb_teacher`(`teacher_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_homework`
--

LOCK TABLES `tb_homework` WRITE;
/*!40000 ALTER TABLE `tb_homework` DISABLE KEYS */;
INSERT INTO `tb_homework`  (`homework_subject`,`homework_question`,`homework_date`,`homework_teacher_account`,`homework_title`) VALUES 
('数据结构','第一次作业的具体题目','2019-4-20','20150000','第一次作业'),
('数据结构','第二个作业的具体题目','2019-4-21','20150001','第二次作业'),
('马原','第三个作业的题目','2019-4-20','20150001','马原第一次作业');
/*!40000 ALTER TABLE `tb_homework` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `tb_homework_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_homework_ans` (
  `homework_ans_text` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `homework_ans_doc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `ans_student_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homework_up_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans_homework_id` int(11),
  `homework_ans_subject` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci,
  foreign key (`ans_student_id`) references `tb_student`(`stu_account`),
  foreign key (`ans_homework_id`) references `tb_homework`(`homework_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_homework_ans`
--

LOCK TABLES `tb_homework_ans` WRITE;
/*!40000 ALTER TABLE `tb_homework_ans` DISABLE KEYS */;
INSERT INTO `tb_homework_ans`  VALUES 
('作业的文本','c:\作业1','20161004','2019-4-17',1,'数据结构'),
('作业的文本','c:\作业2','20161004','2019-4-18',2,'数据结构');
/*!40000 ALTER TABLE `tb_homework_ans` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_grade` (
  `grade_id` int(11) NOT NULL auto_increment,
  `grade_student` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade_score` int(4) NOT NULL,
  PRIMARY KEY(`grade_id`),
  foreign key (`grade_student`) references `tb_student`(`stu_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grade`
--

LOCK TABLES `tb_grade` WRITE;
/*!40000 ALTER TABLE `tb_grade` DISABLE KEYS */;
INSERT INTO `tb_grade` (`grade_student`,`grade_subject`,`grade_score`) VALUES 
('20161003','马原',99),
('20161003','数据结构',98);
('20161003','数据结构',91);
('20161003','数据结构',90);
/*!40000 ALTER TABLE `tb_grade` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `tb_course_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_course_material` (
  `material_id` int(11) NOT NULL auto_increment,
  `material_subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_file_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_teacher_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`material_id`),
  foreign key (`material_teacher_account`) references `tb_teacher`(`teacher_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course_material`
--

LOCK TABLES `tb_course_material` WRITE;
/*!40000 ALTER TABLE `tb_course_material` DISABLE KEYS */;
INSERT INTO `tb_course_material`  (`material_subject`,`material_title`,`material_file_link`,`material_teacher_account`) VALUES 
('数据结构','第一个学习资料','c:/','20150000'),
('数据结构','第二个学习资料','c:/','20150001'),
('马原','马原第一个学习资料','d:/','20150001');
/*!40000 ALTER TABLE `tb_course_material` ENABLE KEYS */;
UNLOCK TABLES;







--
-- Table structure for table `charter_my`
--

DROP TABLE IF EXISTS `charter_my`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charter_my` (
  `charter_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_of_question` int(4) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`charter_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter_my`
--

LOCK TABLES `charter_my` WRITE;
/*!40000 ALTER TABLE `charter_my` DISABLE KEYS */;
INSERT INTO `charter_my` (`charter_`,`num_of_question`,`name`) VALUES 
('question_my_1_1',15,'第一节'),
('question_my_1_2',30,'第二节'),
('question_my_1_3',30,'第三节'),
('question_my_1_4',30,'第四节'),
('question_my_1_5',28,'第五节'),
('question_my_1_6',30,'第六节'),
('question_my_1_7',20,'第七节'),
('question_my_1_8',20,'第八节');
/*!40000 ALTER TABLE `charter_my` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charter_sjjg`
--

DROP TABLE IF EXISTS `charter_sjjg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charter_sjjg` (
  `charter_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_of_question` int(4) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`charter_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter_sjjg`
--

LOCK TABLES `charter_sjjg` WRITE;
/*!40000 ALTER TABLE `charter_sjjg` DISABLE KEYS */;
INSERT INTO `charter_sjjg` (`charter_`,`num_of_question`,`name`) VALUES 
('question_sjjg_1_1',12,'栈与队列'),
('question_sjjg_1_2',10,'数组和广义表'),
('question_sjjg_1_3',15,'树和二叉树'),
('question_sjjg_1_4',12,'图');
/*!40000 ALTER TABLE `charter_sjjg` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `charter_gy`
--

DROP TABLE IF EXISTS `charter_gy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charter_gy` (
  `charter_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_of_question` int(4) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`charter_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter_gy`
--

LOCK TABLES `charter_gy` WRITE;
/*!40000 ALTER TABLE `charter_gy` DISABLE KEYS */;
INSERT INTO `charter_gy` (`charter_`,`num_of_question`,`name`) VALUES 
('quetsion_gy_1_1',23,'第一节'),
('quetsion_gy_1_2',17,'第二节'),
('quetsion_gy_1_3',22,'第三节'),
('quetsion_gy_1_4',23,'第四节'),
('quetsion_gy_1_5',10,'第五节'),
('quetsion_gy_1_6',12,'第六节'),
('quetsion_gy_1_7',13,'第七节');
/*!40000 ALTER TABLE `charter_gy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charter_mg`
--

DROP TABLE IF EXISTS `charter_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charter_mg` (
  `charter_` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_of_question` int(4) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY  (`charter_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter_mg`
--

LOCK TABLES `charter_mg` WRITE;
/*!40000 ALTER TABLE `charter_mg` DISABLE KEYS */;
INSERT INTO `charter_mg` (`charter_`,`num_of_question`,`name`) VALUES 
('question_mg_1_1',20,'第一节'),
('question_mg_1_2',19,'第二节'),
('question_mg_1_3',19,'第三节'),
('question_mg_1_4',20,'第四节'),
('question_mg_1_5',19,'第五节'),
('question_mg_1_6',20,'第六节');
/*!40000 ALTER TABLE `charter_mg` ENABLE KEYS */;
UNLOCK TABLES;









--
-- Table structure for table `question_sjjg_1_1`
--

DROP TABLE IF EXISTS `question_sjjg_1_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_sjjg_1_1` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sjjg_1_1`
--

LOCK TABLES `question_sjjg_1_1` WRITE;
/*!40000 ALTER TABLE `question_sjjg_1_1` DISABLE KEYS */;
INSERT INTO `question_sjjg_1_1` VALUES (1,'有5个元素abcde依次进栈，可能的出栈序列是','baecd','dceab','abedc','aebcd','c'),
(2,'下列有关递归的叙述中，不正确的是_','在计算机系统中，执行递归函数是通过自动使用栈来实现的','在时间和空间效率方面，递归算法比非递归算法好','递归函数的求解过程分为进栈和出栈两阶段','在递归函数中必须有终止递归的条件','b'),
(3,'一个队列的入队序列为abcd，则该队列的输出序列为','dcba','abcd','adcb','cdba','b'),
(4,'设abcdef以所给的次序进栈,若在进栈操作时,允许退栈操作,则下面得不到的序列为','fedcba','bcafed','dcefba','cabdef','d'),
(5,'设计一个判别表达式中左，右括号是否配对出现的算法，采用( )数据结构最佳','线性表的顺序存储结构','队列','线性表的链式存储结构','栈','d'),
(6,'用链接方式存储的队列，在进行删除运算时( )','仅修改头指针','仅修改尾指针','头、尾指针都要修改','头、尾指针可能都要修改','d'),
(7,'递归过程或函数调用时，处理参数及返回地址，要用一种称为( )的数据结构','队列','多维数组','栈','线性表','c'),
(8,'若用一个大小为 6的数组来实现循环队列，且当前 rear和 front 的值分别为 0和 3，当从队列中删除一个元素，再加入两个元素后，rear 和 front 的值分别为多少？','1 和 5','2 和4','4 和2','5 和1','b'),
(9,'栈和队列的共同点是','都是先进先出','都是先进后出','只允许在端点处插入和删除元素','没有共同点 ','c'),
(10,'假设以数组 A[m]存放循环队列的元素,其头尾指针分别为 front 和rear，则当前队列中的元素个数为','(rear-front+m)%m','rear-front+1','(front-rear+m)%m','(rear-front)%m ','a'),
(11,'最大容量为 n 的循环队列，队尾指针是 rear，队头是 front，则队空的条件是','(rear+1) MOD n=front','rear=front','rear+1=front','(rear-l) MOD n=front','a'),
(12,'设栈S和队列 Q 的初始状态为空，元素 e1，e2，e3，e4,e5 和e6 依次通过栈 S，一个元素出栈后即进队列 Q，若 6 个元素出队的序列是 e2，e4，e3,e6,e5,e1 则栈 S 的容量至少应该是','6','4','3','2','c');
/*!40000 ALTER TABLE `question_sjjg_1_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_sjjg_1_2`
--

DROP TABLE IF EXISTS `question_sjjg_1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_sjjg_1_2` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sjjg_1_2`
--

LOCK TABLES `question_sjjg_1_2` WRITE;
/*!40000 ALTER TABLE `question_sjjg_1_2` DISABLE KEYS */;
INSERT INTO `question_sjjg_1_2` VALUES (1,'常对数组进行的两种基本操作是','建立与删除','索引与修改','查找与修改','查找与索引','c'),
(2,'对于C语言的二维数组DataType A[m][n],每个数据元素占K个存储单元，二维数组中任意元素a[i,j] 的存储位置可由(  )式确定','Loc[i,j]=A[m,n]+[(n+1)*i+j]*k','Loc[i,j]=loc[0,0]+[(m+n)*i+j]*k','Loc[i,j]=loc[0,0]+[(n+1)*i+j]*k','Loc[i,j]=[(n+1)*i+j]*k','c'),
(3,'稀疏矩阵的压缩存储方法是只存储','非零元素','三元祖（i,j, aij）',' aij','i,j','a'),
(4,'数组A[0..5,0..6]的每个元素占五个字节，将其按列优先次序存储在起始地址为1000的内存单元中，则元素A[5，5]的地址是','1175 ','1180','1205','1210','a'),
(5,'A[N，N]是对称矩阵，将下面三角（包括对角线）以行序存储到一维数组T[N（N+1）/2]中，则对任一上三角元素a[i][j]对应T[k]的下标k是','i（i-1）/2+j','j（j-1）/2+i',' i（j-i）/2+1','j（i-1）/2+1','b'),
(6,'用数组r存储静态链表，结点的next域指向后继，工作指针j指向链中结点，使j 沿链移动的操作为','j=r[j].next','j=j+1','j=j->next ','j=r[j]-> next','a'),
(7,'对稀疏矩阵进行压缩存储目的是','便于进行矩阵运算','便于输入和输出 ','节省存储空间','降低运算的时间复杂度','c'),
(8,'已知广义表LS＝((a,b,c),(d,e,f)),运用head和tail函数取出LS中原子e的运算是','head(tail(LS))','tail(head(LS))','head(tail(head(tail(LS)))','head(tail(tail(head(LS))))','c'),
(9,'设广义表L=（（a,b,c）），则L的长度和深度分别为',' 1和1 ','1和3','1和2','2和3','c'),
(10,'下面说法不正确的是','广义表的表头总是一个广义表','广义表的表尾总是一个广义表',' 广义表难以用顺序存储结构','广义表可以是一个多层次的结构','a');
/*!40000 ALTER TABLE `question_sjjg_1_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_sjjg_1_3`
--

DROP TABLE IF EXISTS `question_sjjg_1_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_sjjg_1_3` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sjjg_1_3`
--

LOCK TABLES `question_sjjg_1_3` WRITE;
/*!40000 ALTER TABLE `question_sjjg_1_3` DISABLE KEYS */;
INSERT INTO `question_sjjg_1_3` VALUES (1,'以下说法错误的是','树形结构的特点是一个结点可以有多个直接前趋','线性结构中的一个结点至多只有一个直接后继','树形结构可以表达(组织)更复杂的数据','树(及一切树形结构)是一种"分支层次"结构','a'),
(2,'下列说法中正确的是','任何一棵二叉树中至少有一个结点的度为2','任何一棵二叉树中每个结点的度都为2','任何一棵二叉树中的度肯定等于2','任何一棵二叉树中的度可以小于2','d'),
(3,'讨论树、森林和二叉树的关系，目的是为了','借助二叉树上的运算方法去实现对树的一些运算','将树、森林按二叉树的存储方式进行存储','将树、森林转换成二叉树','体现一种技巧，没有什么实际意义','a'),
(4,'树最适合用来表示','有序数据元素 ','无序数据元素','元素之间具有分支层次关系的数据','元素之间无联系的数据','c'),
(5,'若一棵二叉树具有10个度为2的结点，5个度为1的结点，则度为0的结点个数是','9','11','15','不确定','b'),
(6,'设森林F中有三棵树，第一，第二，第三棵树的结点个数分别为M1，M2和M3。与森林F对应的二叉树根结点的右子树上的结点个数是','M1','M1+M2','M3','M2+M3','d'),
(7,'一棵完全二叉树上有1001个结点，其中叶子结点的个数是','250','500','254','以上答案都不对','d'),
(8,'设给定权值总数有n 个，其哈夫曼树的结点总数为','不确定','2n','2n+1','2n-1','d'),
(9,'一棵二叉树高度为h,所有结点的度或为0，或为2，则这棵二叉树最少有(    )结点','2h','2h-1','2h+1','h+1','b'),
(10,'利用二叉链表存储树，则根结点的右指针是','指向最左孩子','指向最右孩子','空','非空','c'),
(11,'已知一棵二叉树的前序遍历结果为ABCDEF,中序遍历结果为CBAEDF,则后序遍历的结果为','CBEFDA',' FEDCBA ','CBEDFA ','不定','a'),
(12,'已知某二叉树的后序遍历序列是dabec, 中序遍历序列是debac ,  它的前序遍历是','acbed','decab','deabc','cedba','d'),
(13,'在二叉树结点的先序序列，中序序列和后序序列中，所有叶子结点的先后顺序','都不相同','完全相同 ','先序和中序相同，而与后序不同','中序和后序相同，而与先序不同','b'),
(14,'在完全二叉树中，若一个结点是叶结点，则它没','左子结点','右子结点','左子结点和右子结点','左子结点，右子结点和兄弟结点','c'),
(15,'由3 个结点可以构造出多少种不同的二叉树','2','3','4','5','d');
/*!40000 ALTER TABLE `question_sjjg_1_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_sjjg_1_4`
--

DROP TABLE IF EXISTS `question_sjjg_1_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_sjjg_1_4` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sjjg_1_4`
--

LOCK TABLES `question_sjjg_1_4` WRITE;
/*!40000 ALTER TABLE `question_sjjg_1_4` DISABLE KEYS */;
INSERT INTO `question_sjjg_1_4` VALUES (1,'在一个无向图中，所有顶点的度数之和等于所有边数的（ ）倍','1/2','1','2','4','c'),
(2,'含n 个顶点的连通图中的任意一条简单路径，其长度不可能超过','1','n/2','n-1','n','c'),
(3,'G是一个非连通无向图，共有28条边，则该图至少有（ ）个顶点','6','7','8','9','d'),
(4,'判定一个有向图是否存在回路除了可以利用拓扑排序方法外，还可以用','求关键路径的方法','求最短路径的方法','广度优先遍历算法','深度优先遍历算法','d'),
(5,'下面关于工程计划的AOE网的叙述中，不正确的是','关键活动不按期完成就会影响整个工程的完成时间','任何一个关键活动提前完成，那么整个工程将会提前完成','所有的关键活动都提前完成，那么整个工程将会提前完成','某些关键活动若提前完成，那么整个工程将会提前完','b'),
(6,'在一个具有n 个顶点的有向完全图中包含有（ ）条边','n(n-1)/2','n(n-1)',' n(n+1)/2','n2','b'),
(7,'一个具有n个顶点k条边的无向图是一个森林（n>k），则该森林中必有（ ）棵树','k','n','n-k','1','c'),
(8,'用深度优先遍历方法遍历一个有向无环图，并在深度优先遍历算法中按退栈次序打印出相应的顶点，则输出的顶点序列是','逆拓扑有序','拓扑有序','无序','深度优先遍历序列','a'),
(9,'关键路径是AOE网中','从源点到终点的最长路径','从源点到终点的最长路径','最长的回路','最短的回路','a'),
(10,'下列命题正确的是','一个图的邻接矩阵表示是唯一的，邻接表表示也唯一','一个图的邻接矩阵表示是唯一的，邻接表表示不唯一',' 一个图的邻接矩阵表示不唯一的，邻接表表示是唯一','一个图的邻接矩阵表示不唯一的，邻接表表示也不唯一','b'),
(11,'无向图的邻接矩阵是一个（ ）','上三角矩阵','下三角矩阵','对称矩阵','无规律','c'),
(12,'有向图的邻接矩阵是一个（ ）','上三角矩阵','下三角矩阵','对称矩阵','无规律','d');
/*!40000 ALTER TABLE `question_sjjg_1_4` ENABLE KEYS */;
UNLOCK TABLES;
-- ----------------------------
-- Table structure for question_mg_1_1
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_1`;
CREATE TABLE `question_mg_1_1`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_1
-- ----------------------------
INSERT INTO `question_mg_1_1` VALUES (1, '毛泽东最早在哪篇文章中提出“马克思主义中国化”命题()。', '《井冈山的斗争》', '《论新阶段》', '《星星之火可以燎原》', '《新民主主义论》', 'B');
INSERT INTO `question_mg_1_1` VALUES (2, '马克思主义中国化第一个理论成果是()', '邓小平理论', '毛泽东思想', '“三个代表”重要思想', '科学发展观', 'B');
INSERT INTO `question_mg_1_1` VALUES (3, '毛泽东思想紧紧围绕()主题，构成完整科学体系', '中国革命和建设', '中国革命', '农民斗争', '社会主义建设', 'A');
INSERT INTO `question_mg_1_1` VALUES (4, '毛泽东思想达到成熟的主要标志是()。', '农村包围城市武装夺取政权理论', '新民主主义革命理论', '新民主主义总路线', '军事战略理论', 'B');
INSERT INTO `question_mg_1_1` VALUES (5, '毛泽东规定人民军队的唯一宗旨是()。', '打仗', '做群众工作', '生产', '全心全意为人民服务', 'D');
INSERT INTO `question_mg_1_1` VALUES (6, '中国特色社会主义理论体系是在()主题的历史条件下，逐步形成发展起来的。', '战争与革命', '改革开放', '和平与发展', '现代化建设', 'C');
INSERT INTO `question_mg_1_1` VALUES (7, '中国特色社会主义理论体系形成于()。', '国民经济恢复时期', '社会主义改造时期', '开始建设社会主义时期', '改革开放时期', 'D');
INSERT INTO `question_mg_1_1` VALUES (8, '马克思主义中国化理论成果的精髓是()。', '解放思想', '实事求是', '与时俱进', '求真务实', 'B');
INSERT INTO `question_mg_1_1` VALUES (9, '党的十八大明确将()确立为党必须长期坚持的指导思想并写入党章', '邓小平理论', '科学发展观', '“三个代表”重要思想', '中国梦', 'B');
INSERT INTO `question_mg_1_1` VALUES (10, '新时期全党全国各族人民团结奋斗的共同思想基础是()。', '科学发展观', '马克思主义中国化理论成果', '“三个代表”重要思想', '中国特色社会主义理论体系', 'D');
INSERT INTO `question_mg_1_1` VALUES (11, '毛泽东第一次使用“思想路线”概念是在()', '第二次国内革命战争时期', '土地革命战争时期', '抗日战争时期', '解放战争时期', 'A');
INSERT INTO `question_mg_1_1` VALUES (12, '重新确立实事求是思想路线的会议是()。', '十一届二中全会', '十一届三中全会', '十二届三中全会', '十三届三中全会', 'B');
INSERT INTO `question_mg_1_1` VALUES (13, '旗帜鲜明提出毛泽东思想的精髓是实事求是的文章是()。', '解放思想，实事求是，团结一致向前看', '完整准确地理解毛泽东思想', '坚持四项基本原则', '中国共产党第十二次全国代表大会开幕词', 'A');
INSERT INTO `question_mg_1_1` VALUES (14, '党的思想路线的实质和核心是()。', '一切从实际出发', '理论联系实际', '实事求是', '在实践中检验真理和发展真理', 'C');
INSERT INTO `question_mg_1_1` VALUES (15, '邓小平对党的思想路线的内容首次作出概括是在()。', '1978年', '1982年', '1980年', '1989年', 'C');
INSERT INTO `question_mg_1_1` VALUES (16, '党的十六大将()写入党章，实现了党的指导思想的又一次与时俱进。', '邓小平理论', '“三个代表”重要思想', '科学发展观', '中国梦', 'B');
INSERT INTO `question_mg_1_1` VALUES (17, '毛泽东对实事求是的科学含义作出马克思主义界定的文章是()。', '《整顿党的作风》', '《反对党八股》', '《改造我们的学习》', '《论十大关系》', 'C');
INSERT INTO `question_mg_1_1` VALUES (18, '邓小平理论在哪次党代会上被写入党章()。', '党的十五大', '党的十六大', '党的十七大', '党的十八大', 'A');
INSERT INTO `question_mg_1_1` VALUES (19, '确立毛泽东在全党的实际领导地位的会议是()。', '“八七”会议', '六届六中全会', '遵义会议', '党的七大', 'C');
INSERT INTO `question_mg_1_1` VALUES (20, '中国特色社会主义理论体系的开创之作是()。', '邓小平理论', '毛泽东思想', '科学发展观', '“三个代表”重要思想', 'A');

-- ----------------------------
-- Table structure for question_mg_1_2
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_2`;
CREATE TABLE `question_mg_1_2`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_2
-- ----------------------------
INSERT INTO `question_mg_1_2` VALUES (1, '近代中国最基本的国情是()。', '半殖民地半封建社会', '经济文化落后', '人民贫穷', '受帝国主义侵略', 'A');
INSERT INTO `question_mg_1_2` VALUES (2, '中国新民主主义革命的开端是()。', '五四运动', '中国共产党成立', '中国无产阶级的产生', '中共二大', 'A');
INSERT INTO `question_mg_1_2` VALUES (3, '中国新民主主义革命的领导阶级是()。', '农民阶级', '资产阶级', '无产阶级', '城市小资产阶级', 'C');
INSERT INTO `question_mg_1_2` VALUES (4, '中国革命的中心问题是()。', '革命领导权问题', '分清敌友问题', '农民问题', '土地问题', 'A');
INSERT INTO `question_mg_1_2` VALUES (5, '明确提出中国共产党民主革命时期纲领的会议是()。', '八七会议', '中共一大', '中共二大', '中共三大', 'C');
INSERT INTO `question_mg_1_2` VALUES (6, '哪次()党的会议上只提出建立国共合作统一战线思想，没有明确提出无产阶级领导权问题。', '中共三大', '中共四大', '中共五大', '中共六大', 'A');
INSERT INTO `question_mg_1_2` VALUES (7, '中国近代民主革命的主力军是()。', '工人阶级', '农民阶级', '城市小资产阶级', '资产阶级', 'B');
INSERT INTO `question_mg_1_2` VALUES (8, '下列不属于新民主主义革命的主要动力是()。', '工人、农民阶级', '大资产阶级', '城市小资产阶级', '民族资产阶级', 'B');
INSERT INTO `question_mg_1_2` VALUES (9, '中国革命的基本问题是()。', '反对帝国主义侵略', '反对封建主义', '农民问题', '民族独立', 'C');
INSERT INTO `question_mg_1_2` VALUES (10, '半殖民地半封建社会，哪个阶级是带有两面性的阶级()。', '大资产阶级', '民族资产阶级', '城市小资产阶级', '地主阶级', 'B');
INSERT INTO `question_mg_1_2` VALUES (11, '新民主主义革命最基本的动力是()。', '无产阶级', '农民阶级', '城市小资产阶级', '民族资产阶级', 'A');
INSERT INTO `question_mg_1_2` VALUES (12, '毛泽东提出三大法宝的文章是()。', '《新民主主义论》', '《共产党人发刊词》', '《中国革命和中国共产党》', '《实践论》', 'B');
INSERT INTO `question_mg_1_2` VALUES (13, '无产阶级在统一战线中必须坚持的原则是()。', '党的领导', '独立自主', '团结进步', '民主自由', 'B');
INSERT INTO `question_mg_1_2` VALUES (14, '中国新民主主义革命的主要形式是()。', '议会斗争', '经济斗争', '武装斗争', '罢工斗争', 'C');
INSERT INTO `question_mg_1_2` VALUES (15, '毛泽东第一次提出“新民主主义革命”的科学概念是在那篇文章()。', '《在晋绥干部会议上的的讲话》', '《中国革命和中国共产党》', '《新民主主义论》', '《共产党人发刊词》', 'B');
INSERT INTO `question_mg_1_2` VALUES (16, '加强党的建设，必须把()建设始终放在首位。', '政治建设', '组织建设', '作风建设', '思想建设', 'D');
INSERT INTO `question_mg_1_2` VALUES (17, '国共合作的大革命时期，中国革命的主要对象是()。', '帝国主义支持下的北洋军阀', '帝国主义', '大资产阶级', '封建主义', 'A');
INSERT INTO `question_mg_1_2` VALUES (18, '新民主主义国家的国体是()。', '无产阶级专政', '各革命阶级的联合专政', '人民民主专政', '资产阶级专政', 'B');
INSERT INTO `question_mg_1_2` VALUES (19, '无产阶级实现中国革命领导权的关键是()。', '必须建立以工农联盟为基础的广泛统一战线', '必须团结民族资产阶级', '必须对同盟者进行教育', '必须对敌人进行坚决斗争', 'A');

-- ----------------------------
-- Table structure for question_mg_1_3
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_3`;
CREATE TABLE `question_mg_1_3`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_3
-- ----------------------------
INSERT INTO `question_mg_1_3` VALUES (1, '新民主主义社会是一个()。', '独立的社会形态', '过渡性质的社会形态', '资本主义性质的社会形态', '社会主义性质的社会形态', 'B');
INSERT INTO `question_mg_1_3` VALUES (2, '土地改革完成以后，新民主主义社会的主要矛盾转变为()。', '人们日益增长的物质需要同落后的社会市场之间的矛盾', '工人阶级和资产阶级之间的矛盾', '农民阶级和工人阶级之间的矛盾', '小资产阶级和工人阶级之间的矛盾', 'B');
INSERT INTO `question_mg_1_3` VALUES (3, '在()会议上，中国共产党提出使中国“稳步地由农业国转变为工业国，由新民主主义国家转变为社会主义国家”。', '中共七大', '中共七届二中全会', '中共七届三中全会', '中共七届四中全会', 'B');
INSERT INTO `question_mg_1_3` VALUES (4, '过渡时期总路线的主体是()。', '对农业的社会主义改造', '对手工业的社会主义改造', '对资本主义工商业的社会主义改造', '实现国家的社会主义工业化', 'D');
INSERT INTO `question_mg_1_3` VALUES (5, '我国对手工业社会主义改造的方针是()。', '积极领导，稳步前进', '鼓励支持扶持', '利用限制改造', '自愿互利典型示范', 'A');
INSERT INTO `question_mg_1_3` VALUES (6, '手工业社会主义改造经历了由小到大几个步骤()', '一个步骤', '两个步骤', '三个步骤', '四个步骤', 'C');
INSERT INTO `question_mg_1_3` VALUES (7, '我国对资本主义工商业的社会主义改造，主要是通过国家资本主义的途径，国家资本主义的高级形式是()。', '加工订货、统购包销', '公私合营', '四马分肥', '定息', 'B');
INSERT INTO `question_mg_1_3` VALUES (8, '我国农业社会主义改造的第三步是要建立()。', '互助组', '初级农业生产合作社', '高级农业生产合作社', '人民公社', 'C');
INSERT INTO `question_mg_1_3` VALUES (9, '毛泽东正式提出过渡时期总路线是哪一年()。', '1951年', '1952年', '1953年', '1950年', 'C');
INSERT INTO `question_mg_1_3` VALUES (10, '社会主义制度在中国确立的主要标志是()。', '1949年中华人民共和国成立', '1952年国民经济恢复', '1954年《中华人民共和国宪法》颁布', '1956年社会主义改造的基本完成', 'D');
INSERT INTO `question_mg_1_3` VALUES (11, '我国过渡时期总路线的特点是()。', '以农业为基础发展轻工业', '社会主义改造与社会主义建设同时并举', '以工业为主导带动农业合作化', '把对资本主义经济的改造与人的改造结合起来', 'B');
INSERT INTO `question_mg_1_3` VALUES (12, '我国对资本主义工商业社会主义改造采取的方式是()。', '公私合营', '和平赎买', '生活上给出路', '剥夺生产资料', 'B');
INSERT INTO `question_mg_1_3` VALUES (13, '我国社会主义革命(改造)的根本目的是()', '继续解放和发展生产力', '消灭剥削阶级，铲除剥削制度', '建立人民民主专政的共和国', '社会主义思想在上层建筑领域占领阵地', 'A');
INSERT INTO `question_mg_1_3` VALUES (14, '在新民主主义社会的政治经济中，居于领导地位的因素是()。', '个体经济', '手工业经济', '社会主义因素', '非社会主义因素', 'C');
INSERT INTO `question_mg_1_3` VALUES (15, '新民主主义社会属于()体系。', '资本主义', '社会主义', '封建主义', '共产主义', 'B');
INSERT INTO `question_mg_1_3` VALUES (16, '新中国建立初期，国营经济的主要来源是()。', '国家投资', '没收的帝国主义在华企业', '没收的官僚资本', '赎买的民族资本', 'C');
INSERT INTO `question_mg_1_3` VALUES (17, '资本主义工商业、农民和手工业者的个体所有制，都具有私有制的性质。对他们进行改造，都具有()性质。', '新民主主义革命', '社会主义革命', '共产主义革命', '旧民主主义革命', 'B');
INSERT INTO `question_mg_1_3` VALUES (18, '国家资本主义经济的性质是()。', '资本主义性质', '社会主义性质', '共产主义性质', '半社会主义性质', 'B');
INSERT INTO `question_mg_1_3` VALUES (19, '中华人民共和国第一部宪法是哪年颁布的()。', '1956年', '1954年', '1953年', '1955年', 'B');

-- ----------------------------
-- Table structure for question_mg_1_4
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_4`;
CREATE TABLE `question_mg_1_4`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_4
-- ----------------------------
INSERT INTO `question_mg_1_4` VALUES (1, '1956年，毛泽东先后在中央政治局扩大会议和最高国务会议上，作了()报告，明确提出了以苏为鉴，独立自主地探索适合中国情况的社会主义建设道路，这标志着探索中国社会主义建设道路的良好开端。', '《论新阶段》', '《新民主主义论》', '《论十大关系》', '《关于正确处理人民内部矛盾的问题》', 'C');
INSERT INTO `question_mg_1_4` VALUES (2, '1957年2月，毛泽东作了()报告，系统论述了社会主义社会矛盾的理论。', '《关于正确处理人民内部矛盾的问题》', '《论十大关系》', '《论人民民主专政》', '《新民主主义论》', 'A');
INSERT INTO `question_mg_1_4` VALUES (3, '毛泽东指出：“我们历来就主张，在人民民主专政下面，解决敌我之间的和人民内部的这两类不同性质的矛盾，采用()这样两种不同的方法”', '镇压和抵抗', '专政和民主', '讨论和协商', '批评和团结', 'B');
INSERT INTO `question_mg_1_4` VALUES (4, '社会主义建设道路初步探索时期，关于所有制结构调整，()提出了“三个主体，三个补充”的设想。', '毛泽东', '周恩来', '刘少奇', '陈云', 'D');
INSERT INTO `question_mg_1_4` VALUES (5, '首次提出调动一切积极因素为社会主义事业服务的思想的报告是()', '《论十大关系》', '《关于正确处理人民内部矛盾的问题》', '《论党》', '《新民主主义论》', 'A');
INSERT INTO `question_mg_1_4` VALUES (6, '社会主义建设道路初步探索时期，正确认识和处理社会主义社会矛盾的思想，集中体现在()里。', '《论十大关系》', '《关于正确处理人民内部矛盾的问题》', '《新民主主义论》', '《论人民民主专政》', 'B');
INSERT INTO `question_mg_1_4` VALUES (7, '社会主义建设道路初步探索时期，()提出了以农业为基础，以工业为主导，以农轻重为序发展国民经济的总方针。', '刘少奇', '周恩来', '毛泽东', '邓小平', 'C');
INSERT INTO `question_mg_1_4` VALUES (8, '关于社会主义发展阶段，()提出社会主义又可分为两个阶段，第一个阶段是不发达的社会主义，第二个阶段是比较发达的社会主义。后一个阶段可能比前一阶段需要更长的时间。', '毛泽东', '周恩来', '刘少奇', '邓小平', 'A');
INSERT INTO `question_mg_1_4` VALUES (9, '社会主义建设道路初步探索时期，()提出了“我们的教育方针，应该使受教育者在德育、智育、体育几方面都得到发展，成为有社会主义觉悟的有文化的劳动者。”', '毛泽东', '刘少奇', '周恩来', '邓小平', 'A');
INSERT INTO `question_mg_1_4` VALUES (10, '在()会议上，党中央提出要把党和国家的工作重点转到技术革命和社会主义来，要求各级党委要抓社会主义建设工作，全党要学科学、学技术、学新本领。', '中国共产党第十二次代表大会', '中国共产党第八次代表大会', '中国共产党第十一届三中全会', '中国共产党七届二中全会', 'B');
INSERT INTO `question_mg_1_4` VALUES (11, '()提出了“向自然界开战，发展我们的经济，发展我们的文化”，“巩固我们的新制度，建设我们的新国家”等观点。', '邓小平', '刘少奇', '周恩来', '毛泽东', 'D');
INSERT INTO `question_mg_1_4` VALUES (12, '《论十大关系》中论述的第一大关系，是()', '沿海工业和内地工业的关系', '经济建设和国防建设的关系', '国家、集体和个人的关系', '重工业、轻工业和农业的关系', 'D');
INSERT INTO `question_mg_1_4` VALUES (13, '既反保守又反冒进，在综合平衡中稳步前进的经济建设方针，是中国共产党在()上提出的。', '第七届二中全会', '第八次代表大会', '第十一届三中全会', '第十二次代表大会', 'B');
INSERT INTO `question_mg_1_4` VALUES (14, '毛泽东指出，关于正确处理人民内部矛盾的总方针，是用()解决人民内部矛盾。', '专政的方法', '镇压的方法', '民主的方法', '协调的方法', 'C');
INSERT INTO `question_mg_1_4` VALUES (15, '毛泽东在《关于正确处理人民内部矛盾的问题》中指出，对于思想领域的人民内部矛盾，实行()的方针，坚持说服教育、讨论的方法。', '统筹兼顾、适当安排', '“长期共存，互相监督”', '“百花齐放，百家争鸣”', '“团结——批评——团结”', 'D');
INSERT INTO `question_mg_1_4` VALUES (16, '毛泽东在《关于正确处理人民内部矛盾的问题》中指出，对于物质利益、分配方面的人民内部矛盾，实行()的方针，兼顾国家、集体和个人三方面的得益。', '“团结——批评——团结”', '“长期共存，互相监督”', '统筹兼顾，适当安排', '”百花齐放，百家争鸣“', 'C');
INSERT INTO `question_mg_1_4` VALUES (17, '毛泽东在《关于正确处理人民内部矛盾的问题》中指出，对于科学文化领域里的矛盾，实行()的方针，通过自由讨论和科学实践、艺术实践去解决。', '”团结——批评——团结“', '”长期共存，互相监督“', '”百花齐放，百家争鸣“', '统筹兼顾，适当安排', 'C');
INSERT INTO `question_mg_1_4` VALUES (18, '毛泽东在《关于正确处理人民内部矛盾的问题》中指出，对于共产党和民主党派的矛盾，实行在()的前提下“长期共存，互相监督”的方针。', '坚持民主，充分协商', '坚持人民民主专政', '坚持马克思主义指导', '坚持社会主义道路和共产党领导', 'D');
INSERT INTO `question_mg_1_4` VALUES (19, '毛泽东在《关于正确处理人民内部矛盾的问题》中指出，对于共产党和民主党派的矛盾，实行在坚持社会主义道路和共产党领导的前提下()的方针。', '团结——批评——团结', '统筹兼顾，适当安排', '百花齐放，百家争鸣', '长期共存，互相监督', 'D');
INSERT INTO `question_mg_1_4` VALUES (20, '()主张企业要建立合理的规章制度和严格的责任制，提出了“两参一改三结合”。', '陈云', '邓小平', '周恩来', '毛泽东', 'D');

-- ----------------------------
-- Table structure for question_mg_1_5
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_5`;
CREATE TABLE `question_mg_1_5`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_5
-- ----------------------------
INSERT INTO `question_mg_1_5` VALUES (1, '从实际出发建设社会主义，中国最大的“实际”是()', '我国人口多，底子薄，生产力发展落后', '我国处在社会主义初级阶段', '我国是发展中国家', '我国的社会保障体系还不够完备，还很落后', 'B');
INSERT INTO `question_mg_1_5` VALUES (2, '()第一次把社会主义初级阶段作为事关全局的基本国情加以把握，明确了这一问题是党制定路线、方针、政策的出发点和根本依据。', '周恩来', '刘少奇', '邓小平', '毛泽东', 'C');
INSERT INTO `question_mg_1_5` VALUES (3, '认清国情，对革命、建设和改革都是十分重要的，早在民主革命时期，()就指出：“认清中国的国情，乃是认清一切革命问题的基本的根据。”', '邓小平', '毛泽东', '周恩来', '刘少奇', 'B');
INSERT INTO `question_mg_1_5` VALUES (4, '把社会主义初级阶段理论提到全局高度加以系统论述的，是中国共产党()会议。', '十一届三中全会', '十一届六中全会', '第十二次代表大会', '第十三次代表大会', 'D');
INSERT INTO `question_mg_1_5` VALUES (5, '社会主义初级阶段是一个具有特定内涵的新概念，它是()', '泛指任何国家进入社会主义都会经历的起始阶段', '特指我国在生产力发展水平不高、商品经济不发达条件下建设社会主义必然要经历的特定历史阶段', '泛指第三世界国家进入社会主义都会经历的起始阶段', '特指我国发展生产力必然要经历的特定历史阶段', 'B');
INSERT INTO `question_mg_1_5` VALUES (6, '建设中国特色社会主义的总依据是()', '社会主义本质理论', '社会主义初级阶段理论', '改革开放理论', '社会主义基本矛盾理论', 'B');
INSERT INTO `question_mg_1_5` VALUES (7, '中国特色社会主义理论体系的立论基础是()', '社会主义初级阶段理论', '社会主义基本矛盾理论', '社会主义本质理论', '社会主义改革开放理论', 'A');
INSERT INTO `question_mg_1_5` VALUES (8, '社会主义初级阶段的主要矛盾是()', '人民大众同封建主义之间的矛盾', '人民日益增长的物质文化需要同落后的社会生产之间的矛盾', '人民对于先进的工业国的要求同落后的农业国的现实之间的矛盾', '人民对于经济文化迅速发展的需要同当前经济文化不能满足人民需要的状况之间的矛盾', 'B');
INSERT INTO `question_mg_1_5` VALUES (9, '对我国社会主义初级阶段的社会主要矛盾作出规范表述的是()', '十一届三中全会', '十一届六中全会', '十三大', '十五大', 'B');
INSERT INTO `question_mg_1_5` VALUES (10, '()第一次提出了“建设有中国特色社会主义”的概念。', '邓小平在十一届三中全会上', '邓小平在十一届六中全会上', '邓小平在十二大上', '邓小平在十三大上', 'C');
INSERT INTO `question_mg_1_5` VALUES (11, '在整个社会主义初级阶段，必须毫不动摇地坚持党的基本路线，而坚持党的基本路线，必须紧紧围绕()', '政治建设这一中心', '经济建设这一中心', '文化建设这一中心', '生态文明建设这一中心', 'B');
INSERT INTO `question_mg_1_5` VALUES (12, '中国共产党在社会主义初级阶段的基本路线是在()提出的', '十一届三中全会上', '十一届六中全会上', '十二大上', '十三大上', 'D');
INSERT INTO `question_mg_1_5` VALUES (13, '()明确指出我国仍处于并将长期处于社会主义初级阶段，现在达到的小康还是低水平的、不全面的、发展很不平衡的小康，要达到全面小康，还需要进行长时期的艰苦奋斗。', '中国共产党第十三次代表大会', '中国共产党第十五次代表大会', '中国共产党第十六次代表大会', '中国共产党第十七次代表大会', 'C');
INSERT INTO `question_mg_1_5` VALUES (14, '()强调指出我国仍处于并将长期处于社会主义初级阶段的基本国情没有变，人民日益增长的物质文化需要同落后的社会生产之间的矛盾这一社会主要矛盾没有变。', '中国共产党第十三次代表大会', '中国共产党第十五次代表大会', '中国共产党第十六次代表大会', '中国共产党第十七次代表大会', 'D');
INSERT INTO `question_mg_1_5` VALUES (15, '()明确指出我国仍处于并将长期牌社会主义初级阶段的基本国情没有变，人民日益增长的物质文化需要同落后的社会生产之间的矛盾这一社会主要矛盾没有变，我国是发展中国家的国际地位没有变。', '中国共产党第十五次代表大会', '中国共产党第十六次代表大会', '中国共产党第十七次代表大会', '中国共产党第十八次代表大会', 'D');
INSERT INTO `question_mg_1_5` VALUES (16, '()提出了党在社会主义初级阶段的基本路线。', '中国共产党十一届三中全会', '中国共产党第十二次代表大会', '中国共产党第十三次代表大会', '中国共产党第十五次代表大会', 'C');
INSERT INTO `question_mg_1_5` VALUES (17, '()指出：我国的无产阶级同资产阶级之间的矛盾已经基本上解决，几千年来阶级剥削制度的历史已经基本上结束。', '中国共产党第十三次代表大会', '中国共产党第十二次代表大会', '中国共产党十一届三中全会', '中国共产党第八次代表大会', 'D');
INSERT INTO `question_mg_1_5` VALUES (18, '()通过的党章把“和谐”与“富强、民主、文明”一起写入了党在社会主义初级阶段的基本路线。', '中国共产党第十三次代表大会', '中国共产党第十五次代表大会', '中国共产党第十七次代表大会', '中国共产党第十八次代表大会', 'C');
INSERT INTO `question_mg_1_5` VALUES (19, '()以后，社会主义初级阶段的基本纲领完备清晰起来，包括了中国特色社会主义经济建设纲领、政治建设纲领、文化建设纲领、社会建设纲领和生态文明建设纲领。', '中国共产党第十三次代表大会', '中国共产党第十五次代表大会', '中国共产党第十七次代表大会', '中国共产党第十八次代表大会', 'D');

-- ----------------------------
-- Table structure for question_mg_1_6
-- ----------------------------
DROP TABLE IF EXISTS `question_mg_1_6`;
CREATE TABLE `question_mg_1_6`  (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_mg_1_6
-- ----------------------------
INSERT INTO `question_mg_1_6` VALUES (1, '()这一重大问题，是建设中国特色社会主义的首要的基本理论问题。', '建设什么样的党、怎样建设党', '什么是社会主义、怎样建设社会主义', '实现什么样的发展，怎样发展', '实现什么样的改革，怎样改革', 'B');
INSERT INTO `question_mg_1_6` VALUES (2, '()年，邓小平发表南方谈话，对社会主义本质问题作出了总结性的理论概括。', '1978', '1981', '1992', '1997', 'C');
INSERT INTO `question_mg_1_6` VALUES (3, '1956年，周恩来代表党中央提出了“向科学进军”的口号，强调实现四个现代化关键是()', '工业现代化', '农业现代化', '国防现代化', '科学技术现代化', 'D');
INSERT INTO `question_mg_1_6` VALUES (4, '()对社会主义本质问题作出了总结性的理论概括，他指出：“社会主义的本质，是解放生产力，发展生产力，消灭剥削，消除两极分化，最终达到共同富裕。”', '习近平', '胡锦涛', '江泽民', '邓小平', 'D');
INSERT INTO `question_mg_1_6` VALUES (5, '()提出了“科学技术是第一生产力”的论断。', '周恩来', '毛泽东', '邓小平', '习近平', 'C');
INSERT INTO `question_mg_1_6` VALUES (6, '党的十八大强调，()是提高社会生产力和综合国力的战略支撑，必须摆在国家发展全局的核心位置。', '改革开放', '科技创新', '文化创新', '战略创新', 'B');
INSERT INTO `question_mg_1_6` VALUES (7, '()是解决中国一切问题的关键。', '稳定', '改革', '发展', '创新', 'C');
INSERT INTO `question_mg_1_6` VALUES (8, '中国特色社会主义的根本任务是()。', '发展社会主义公有制经济', '解放和发展社会生产力', '坚持科学发展', '大力发展科学技术', 'B');
INSERT INTO `question_mg_1_6` VALUES (9, '()把邓小平“三步走”的发展战略构想确定下来，明确提出：第一步，从1981年到1990年实现国民生产总值比1980年翻一番，解决人民的温饱问题;第二步，从1991年到20世纪末，使国民生产总值再翻一番，达到小康水平;第三步，到21世纪中叶，国民生产总值再翻两番，达到中等发达国家水平，基本实现现代化。', '党的十三大', '党的十四大', '党的十五大', '党的十六大', 'A');
INSERT INTO `question_mg_1_6` VALUES (10, '()把“三步走”战略的第三步进一步具体化，提出了三个阶段性目标：21世纪第一个10年，实现国民生产总值比2000年翻一番，使人民的小康生活更加富裕，形成比较完善的社会主义市场经济体制;再经过10年的努力，到建党100周年时，使国民经济更加发展，各项制度更加守着到21世纪中叶新中国成立100周年时，基本实现现代化，建成富强民主文明的社会主义国家。这是党最初提的“两个一百年”的奋斗目标。', '党的十五大', '党的十六大', '党的十七大', '党的十八大', 'A');
INSERT INTO `question_mg_1_6` VALUES (11, '()从我国总体上实现的还是低水平、不全面、发展很不平衡的小康的实际出发，提出大体用20年的时间，全面建设一个惠及十几亿人口的更高水平的小康社会。', '党的十五大', '党的十六大', '党的十七大', '党的十八大', 'B');
INSERT INTO `question_mg_1_6` VALUES (12, '()根据国内外形势的新变化，鲜明地提出了全面建成小康社会的新要求。', '党的十五大', '党的十六大', '党的十七大', '党的十八大', 'D');
INSERT INTO `question_mg_1_6` VALUES (13, '实现中国梦的根本途径是()，它是实现国家富强、民族振兴、人民幸福的必由之路。', '自治社会主义道路', '中国特色社会主义道路', '独立自主，自力更生', '深化改革，扩大开放', 'B');
INSERT INTO `question_mg_1_6` VALUES (14, '在中国特色社会主义现代化建设过程中，提出“小康”及“小康社会”系列概念的是()', '邓小平', '江泽民', '胡锦涛', '习近平', 'A');
INSERT INTO `question_mg_1_6` VALUES (15, '()指出：“社会主义不是少数人富起来，大多数人穷，不是那个样子。社会主义最大的优越性就是共同富裕，这是体现社会主义本质的一个东西。”', '习近平', '胡锦涛', '江泽民', '邓小平', 'D');
INSERT INTO `question_mg_1_6` VALUES (16, '邓小平曾经指出：社会主义不是少数人富起来，大多数人穷，社会主义最大的优越性就是()，它体现社会主义本质。', '自由、平等、公正、法治', '爱国、敬业、诚信、友善', '共同富裕', '富强、民主、文明、和谐', 'C');
INSERT INTO `question_mg_1_6` VALUES (17, '改革开放以来，中国共产党高度重视发展问题，将发展作为解决中国一切问题的关键。邓小平提出了()的著名论断。', '发展是党执政兴国的第一要务', '“发展才是硬道理”', '科学发展观', '发展就是不断改革创新', 'B');
INSERT INTO `question_mg_1_6` VALUES (18, '改革开放以来，中国共产党高度重视发展问题，将发展作为解决中国一切问题的关键。江泽民提出了()的观点。', '“发展才是硬道理”', '发展是党执政兴国的第一要务', '科学发展观', '发展就是不断改革创新', 'B');
INSERT INTO `question_mg_1_6` VALUES (19, '改革开放以来，中国共产党高度重视发展问题，将发展作为解决中国一切问题的关键。()提出了“发展才是硬道理”的著名论断。', '邓小平', '江泽民', '胡锦涛', '习近平', 'A');
INSERT INTO `question_mg_1_6` VALUES (20, '改革开放以来，中国共产党高度重视发展问题，将发展作为解决中国一切问题的关键。胡锦涛提出了()。', '发展才是硬道理', '发展是党执政兴国的第一要务', '科学发展观', '发展就是不断改革创新', 'C');


--
-- Table structure for table `question_gy_1_1`
--

DROP TABLE IF EXISTS `question_gy_1_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_1` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_1`
--

LOCK TABLES `question_gy_1_1` WRITE;
/*!40000 ALTER TABLE `question_gy_1_1` DISABLE KEYS */;
INSERT INTO `question_gy_1_1` VALUES (1,'使近代中国沦为半殖民地半封建社会的第一个不平等条约是（）','《辛丑条约》','《南京条约》','《马关条约》','《北京条约》','B'),(2,'第二次鸦片战争中，掠夺中国领土最多的侵略者是（）','美国','英国','俄国','法国','C'),(3,'近代中外反动势力开始勾结起来是在（）','第一次鸦片战争以后','第二次鸦片战争以后','甲午战争以后','八国联军侵华战争以后','B'),(4,'把我国领土台湾割让日本的不平等条约是（）','《马关条约》','《天津条约》','《北京条约》','《辛丑条约》','A'),(5,'侵略者第二次洗劫和焚烧圆明园的战争是（）','鸦片战争','第二次鸦片战争','甲午战争','八国联军侵华战争','D'),(6,'1838年6月，鸿胪寺卿（）上疏《请严塞漏厄以培国本》，主张用死刑重治吸食鸦片者。','林则徐','许乃济','邓廷桢','黄爵滋','D'),(7,'中国赔款最多的条约是（）','《北京条约》','《望厦条约》','《马关条约》','《辛丑条约》','D'),(8,'规定割让香港岛的是（）','《南京条约》','《虎门条约》','《天津条约》','《北京条约》','A'),(9,'“允许外国侵略者招募华工出国”是（）中给予他们的特权。','中英、中法《北京条约》','中英《南京条约》','《中法条约》','《辛丑条约》','A'),(10,'19世纪末20世纪初，帝国主义在中国掀起瓜分中国的狂潮，其中广西成了（）的势力范围。英国','俄国','法国','德国','','C'),(11,'近代史上外国在中国（）建立了第一块租界地。','上海','广州','福州','宁波','A'),(12,'规定在中国通商口岸可以投资设厂的条约是（）','《南京条约》','《天津条约》','《马关条约》','《北京条约》','C'),(13,'1858年，沙俄侵略者强迫黑龙江将军奕山签订（），将黑龙江以北，外兴安岭以南60万平方公里的中国领土强行霸占，并把乌苏里江以东的中国领土划为中俄共管。','《瑷珲条约》','《北京条约》','《中俄勘分西北界约记》','《天津条约》','A'),(14,'1860年沙俄借口\"调停有功\"，迫使清政府签订（），将乌苏里江以东40万平方公里的中国领土划为俄国。','《北京条约》','《瑷珲条约》','《中俄勘分西北界约记》','《天津条约》','A'),(15,'中国近代第一个系统介绍西学的启蒙思想家、翻译家是（）','康有为','梁启超','严复','谭嗣同','C'),(16,'中国近代史上第一个睁眼看世界的人是（）','魏源','林则徐','严复','邓廷桢','B'),(17,'下列哪个条约允许外国公使常驻北京（）','《南京条约》','《北京条约》','《望厦条约》','《天津条约》','B'),(18,'以下哪个是外国侵略者控制中国政治的重要手段之一（）','赔款','把持中国海关','制造舆论','进行宗教宣传','B'),(19,'以下（）是中国近代史上中国人民第一次大规模的反侵略武装斗争','三元里人民的武装抗英斗争','香港工人大罢工','义和团反侵略斗争','台湾黑旗军的斗争','A'),(20,'提出了“师夷长技以制夷”的思想的是（）','林则徐','魏源','郑观应','康有为','B'),(21,'（）翻译了《天演论》一书','林则徐','魏源','郑观应','严复','D'),(22,'指挥清军在中越边境前线大败法军，取得镇南关大捷的是（）','冯子才','邓延桢','林则徐','李鸿章','A'),(23,'（）下令镇压义和团运动的上渝','光绪帝','道光帝','慈禧太后','咸丰帝','C');
/*!40000 ALTER TABLE `question_gy_1_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_2`
--

DROP TABLE IF EXISTS `question_gy_1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_2` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_2`
--

LOCK TABLES `question_gy_1_2` WRITE;
/*!40000 ALTER TABLE `question_gy_1_2` DISABLE KEYS */;
INSERT INTO `question_gy_1_2` VALUES (1,'太平天国之所以是中国农民战争的最高峰，最主要是因为（）','其规模和延续时间均属空前','建立了与清政府对立的政权','制定了比较完整的革命纲领','对封建王朝的打击空前沉重','C'),(2,'康有为把西方资本主义的政治学说同传统的儒家思想结合，宣传维新变法的道理。这反映出的根本问题是（）','中国的封建顽固势力相当强大','中国民族资产阶级具有软弱性','中国的封建传统思想根深蒂固','中国民族资产阶级日趋成熟','B'),(3,'外国资本主义企业对中国的侵略由商品输出为主转为以资本输出为主的标志是（）','《南京条约》','《北京条约》','《马关条约》','《辛丑条约》','C'),(4,'太平天国运动失败的根本原因是（）','旧式农民战争的局限性','拜上帝教不合中国国情','在军事策略上率犯错误','对封建王朝打击空前沉重','A'),(5,'洋务运动之所以没有达到“师夷长技以自强”的目的，是因为（）','沿用传统的生产管理方式','局限于引进西方先进科技','外国资本的积压','没有相对稳定的“和平环境”','B'),(6,'太平天国由盛转衰的标志是（）','安庆失陷','天京变乱','洪秀全病逝','天京陷落','B'),(7,'1853年冬太平天国颁布的一个分配制度为核心的社会改革纲领是（）','《中国土地法大纲》','《兴国土地法》','《天朝田亩制度》','《资政新篇》','C'),(8,'揭开维新变法运动序幕的事件是（）','康有为第一次上书','公车上书C、“南学会”创立','《孔子改制考》发表','','B'),(9,'中国近代资本主义（）','是由封建社会中的资本主义萌芽发展而来的','与明清手工业在行业上分布基本相同','是在外国资本主义入侵刺激下产生的','从根本上破坏了封建地主土地所有制','C'),(10,'在马关条约中最有利于列强对华经济扩张的条款是（）','开辟新的内河航线','在苏杭富庶地区开放新的通商口岸','允许日本在通商口岸开设工厂','给于日本巨额赔款','C'),(11,'下列城市，按其在近代历史上开放为商埠的时间先后顺序排列应该是（）①南京②厦门③天津④杭州','①②③④','①③②④','②①③④','②①④③','C'),(12,'戊戌变法运动的突出历史功绩在于（）','挽救民族危亡','推行了资本主义的政治改革','促进思想启蒙','极大发展资本主义经济','C'),(13,'瓦德西说“无论欧美日本各国，皆无此脑力与兵力可以与兵力可以统治此天下生灵四分之一”，“故瓜分一事，实为下策”，这表明列强：①瓜分中国计划破产②已放弃灭亡中国的企图③仍需要扶持清政府以华制华④看到了中国人民的不屈斗争()','①④','①②③','①③④','①②③④','C'),(14,'晚清有御史上奏折称：“近日人心浮动，民主民权之说日益猖獗。若准各省纷纷立会，恐闻风而起，其患不可胜言”。这个奏折针对的是（）','太平军','洋务派C、维新派','义和团','','C'),(15,'天京变乱说明的最基本道理是（）','农民阶级的领袖缺乏革命的进取心','农民政权内部的斗争不可避免','农民阶级绝对不是一个先进的阶级','小农经济的分散性决定了农民阶级不能形成坚强的领导核心','D'),(16,'康有为向光绪帝呈递的《应诏统筹全局折》实际上是维新派的施政纲领，因为它（）','提出了各方面具体的变法建议','主张实行君主立宪的政治体制','系统论证了维新变法的理论','明确指出了变法是救亡图存的唯一出路','A'),(17,'李鸿章是中国近代史上的一个重要人物，他镇压了太平军和捻军起义，签订了《中法新约》、《中日马关条约》和《辛丑条约》等一系列不平等条约，在许多方面负有不可推卸的责任。但李鸿章仍有值得肯定之处，其中最为典型的是（）','掀起“向西方学习”的新思潮','是洋务运动的主要实践者','与顽固派进行论','率兵收复新疆','B');
/*!40000 ALTER TABLE `question_gy_1_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_3`
--

DROP TABLE IF EXISTS `question_gy_1_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_3` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_3`
--

LOCK TABLES `question_gy_1_3` WRITE;
/*!40000 ALTER TABLE `question_gy_1_3` DISABLE KEYS */;
INSERT INTO `question_gy_1_3` VALUES (1,'标志着资产阶级革命派初步形成的事件是（）','兴中会成立','1895年广州起义','三民主义的提出','华兴会的成立','A'),(2,'提出“驱除鞑虏，恢复中华，建立民国，平均地权”的政治纲领的是（）','兴中会','华兴会','光复会','同盟会','D'),(3,'清末“新政”未能挽救清朝灭亡命运的根本原因是（）A“、新政”只是骗局，从来没有真正实行','清政府借“新政”之名增加税收，引起人民反抗','列强反对中国实行“新政”，制造障碍','“新政”不能解决当时的各种社会矛盾','','D'),(4,'孙中山领导辛亥革命的指导思想是（）','民族主义、民权主义、民生主义','驱除鞑虏、恢复中华','建立民国、平均地权','联俄，联共，扶助农工','A'),(5,'清政府的“预备立宪”之所以是一场骗局，主要是因为（）','借“预备”之名拖延立宪','载沣任摄政王总揽大权','不能满足立宪派的要求','极力维护君主专制权力','D'),(6,'武昌起义成功后,建立的政权是（）','湖北军政府','湖北咨议局','中华民国政府','南京临时政府','A'),(7,'三民主义的核心是（）','民族主义','民权主义','民生主义','创立民国','B'),(8,'辛亥革命失败的根本原因是（）','帝国主义的破坏','南京临时政府的涣散和软弱','袁世凯的政治欺骗和军事压力','资产阶级的软弱性和妥协性','D'),(9,'武昌起义爆发后，控制大部分地方政权的是（）','革命党人','北洋军阀和旧官僚','袁世凯的亲信','立宪派和旧官僚','D'),(10,'使孙中山对军阀势力有了比较深刻的认识并得出\"南与北如一丘之貉\"的结论是在（）事件之后','二次革命','护国战争','反张勋复辟','护法运动','D'),(11,'下列条约中，涉及即割地又赔款的是（）①《南京条约》②《北京条约》③《马关条约》④《辛丑条约》','①②③④','①②③','①②④','①③④','B'),(12,'孙中山领导的辛亥革命实现了20世纪中国第一次历史性巨变，因为这次革命（）','推翻了统治中国2000多年的君主专制政体','确立了资产阶级民主共和制度','给予了人民充分的民主和自由权利','结束了帝国主义在中国的殖民统治','A'),(13,'在20世纪初出现的资产阶级革命组织中，孙中山领导的同盟会是第一个资产阶级革命政党，因为它（）','成立时间早','实现了革命团体的大联合','使资产阶级革命进入一个新阶段','有明确的资产阶级革命纲领和组织','D'),(14,'辛亥革命爆发后英、美列强积极扶植袁世凯的主要原因是（）','清政府已经无可救药','袁世凯较清政府更加忠实于帝国主义','革命党人损害了列强的在华利益','认为袁世凯有能力维持中国“国内秩序”','D'),(15,'在中国历史上规定立法、行政、司法三权分离政治体制的第一个文件是（）','《中华民国临时约法》','《钦定宪法大纲》','《中华民国约法》','《中国民国宪法》','A'),(16,'19世纪90年代清政府与列强签订的条约与40-60年代的条约相比，最显著的不同是（）','割地的面积','赔款的数额','开放的口岸','列强办厂的特权','D'),(17,'本世纪初第一场帝国主义战争发生在中国的（）','东北地区','山东半岛','东南沿海','长江流域','A'),(18,'下列各项属于孙中山“三民主义”中“民生主义”的是（）','反对满洲贵族，反对民族压迫','推翻君主专制政体，建立国民政府','国民有言论、集会、著作自由','核定地价、征收地租税，向地主收买土地','D'),(19,'民国初年两次帝制复辟失败的共同原因是（）','资产阶级力量强大','孙中山高举反复辟旗帜','北洋军阀内部矛盾激化','经过辛亥革命民主共和的观念深入人心','D'),(20,'下列武昌起义成功的原因中，最主要的是（）','清朝湖北当局无力抵抗','革命党人筹划周密完善','起义新军的革命主动精神','立宪派改变策略乘机符合','C'),(21,'“二次革命”的导火线是（）','宋教仁被刺','段祺瑞拒绝恢复《临时约法》','袁世凯称帝','张勋复辟闹剧','A'),(22,'“府院之争”的激化，从根本上反映了（）','国会内各派政客之间的权力之争','南北方军阀之间的地盘之争','是否要参加一战之争','美国日本对华控制权之争','D');
/*!40000 ALTER TABLE `question_gy_1_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_4`
--

DROP TABLE IF EXISTS `question_gy_1_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_4` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_4`
--

LOCK TABLES `question_gy_1_4` WRITE;
/*!40000 ALTER TABLE `question_gy_1_4` DISABLE KEYS */;
INSERT INTO `question_gy_1_4` VALUES (1,'新文化运动兴起的直接原因是（）','列强支持袁世凯复辟帝制','中国资本主义有了进一步的发展','袁世凯在掀起尊孔复古逆流','西方启蒙思想进一步介绍到中国','C'),(2,'新文化运动兴起的标志是（）','陈独秀创办《新青年》','民主和科学口号的提出','胡适发表《文学改良刍议》','李大钊发表《庶民的胜利》','A'),(3,'前期新文化运动的指导思想是（）','资产阶级维新思想','民主和科学的思想','“兼容并包”的思想','社会主义的思想','B'),(4,'新文化运动中批孔实际上针对的是（）','儒家思想文化','孔子思想学说','儒家传统道德','封建专制皇权','C'),(5,'史学界把维新变法、辛亥革命和新文化运动都称为近代化运动，因为它们要求（）','实行资产阶级民主政治','提倡民主和科学','彻底废除旧制度','宣传新思想，弘扬新文化','A'),(6,'1911年至1925年间建立的下列政权中，不具有革命性质的是（）','南京临时政府','北京政府','湖北军政府','广州国民政府','B'),(7,'新文化运动中所提出的民主主要是指（）','国家主权和民主权利','人民的民主权利和自由','资本主义的政治制度','无产阶级专政下的人民民主','C'),(8,'民主和科学是前期新文化运动的一面大旗，受此影响最大的是（）','广大青年','无产阶级','小资产阶级','工农群众','A'),(9,'1915年开始的民主、科学与尊孔复古的论战实质是（）','资产阶级与封建地主阶级的思想论战','无产阶级与资产阶级的思想论战','马克思主义与改良主义的论战','西方文明与中华传统文化之间的冲突','A'),(10,'最能完整地体现“五最四运动”性质的口号是（）','废除“二十一条”','拒绝在和约上签字','还我青岛','外争主权，内惩国贼','D'),(11,'五五四运动很快发展成为全国性的爱国运动，这充分说明（）','上海工人觉悟高','五五四运动属于资产阶级民主革命','五五四运动具有反帝反封建的性质','五五四运动具有广泛的群众基础','D'),(12,'推动中国由旧民主主义革命向新民主主义革命转变的最根本因素是C','新文化运动的推动','无产阶级队伍的壮大','中国民族资本主义的进一步发展','俄国十月革命的影响','C'),(13,'五五四运动的中心由北京转移到上海后，运动的新特点是（）','商人罢市','学生大规模罢课','工人阶级登上政治舞台','运动取得初步胜利','C'),(14,'五五四运动是中国新民主主义革命开始的标志，最主要的依据是（）','提出彻底地反帝反封建口号','十月革命影响与马克思主义传播','青年学生领导并有广泛的群众基础','无产阶级成为运动主力','D'),(15,'与辛亥革命相比，五与四运动的特点在于（）','无产阶级政党登上了历史舞台','运动具有广泛的社会性和彻底地反帝反封建的态度','是一场反帝爱国运动','是资产阶级民主革命的一个组成部分','B'),(16,'新文化运动把矛头指向儒家传统道德，其根本原因是：B','儒家思想阻碍了中国资本主义的发展','儒家思想是维护封建统治的理论基础','北洋军阀政府推崇儒家思想','儒家思想落后于资产阶级文化，全是糟粕','B'),(17,'第一个中国共产党早期组织建立于（）','上海','北京','武汉','长沙','A'),(18,'中共一大确定的党的中心任务是（）','实现共产主义','加强无产阶级国际团结','领导和组织工人运动','推翻资产阶级政权','C'),(19,'中国共产党成立后面临的首要任务是（）','建立革命统一战线','组织革命武装','发动工人罢工','制定完整的革命纲领','D'),(20,'中共二大制定民主革命纲领的依据（）','中共的中心任务','中共的奋斗目标','中国的社会性质和革命性质','中国无产阶级的特点','C'),(21,'中共二大提出了党的民主革命纲领表明（）','党的宗旨发生了变化','党在实践中走向成熟','党在不断修正自己的错误','党对中国国情的认识加深','D'),(22,'十年对峙时期，红色政权能够发展壮大的主要原因是（）','建立于敌人力量薄弱的山区','当时新旧军阀混战激烈','得到了大量的国际援助物资','坚持了“工农武装割据”的思想','D'),(23,'国共两党第一次合作的政治基础是（）','联俄、联共、扶助农工三大政策','三民主义','新三民主义','中共三大决议','C');
/*!40000 ALTER TABLE `question_gy_1_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_5`
--

DROP TABLE IF EXISTS `question_gy_1_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_5` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_5`
--

LOCK TABLES `question_gy_1_5` WRITE;
/*!40000 ALTER TABLE `question_gy_1_5` DISABLE KEYS */;
INSERT INTO `question_gy_1_5` VALUES (1,'1930年1月，毛泽东进一步从理论上阐述农村包围城市、武装夺取政权理论的文章是（）','《中国的红色政权为什么能够存在?》','《星星之火，可以燎原》','《井冈山的斗争》','《中国革命战争的战略问题》','B'),(2,'1928年l2月，毛泽东主持制定的中国共产党历史上第一个土地法是（）','《井冈山土地法》','《兴国土地法》','《关于清算、减租及土地问题的指示》','《中国土地法大纲》','A'),(3,'国民党四大家族官僚资本的性质是（）','私人垄断资本主义','封建的买办的国家垄断资本主义','私人资本主义','国家资本主义','B'),(4,'1936年10月，中国工农红军第一、二、四方面军胜利会师于（）','陕北保安地区','陕北洛川地区','陕北瓦窑堡地区','甘肃会宁、静宁地区','D'),(5,'遵义会议后，中共中央政治局成立了新的三人团负责红军的军事行动，其成员是（）','毛泽东、朱德、周恩来','毛泽东、朱德、王稼祥','毛泽东、周恩来、王稼祥','毛泽东、张闻天、周恩来','C'),(6,'毛泽东提出“枪杆子里面出政权”是在（）','四一二政变时','南昌起义时','八七会议上','秋收起义时','C'),(7,'中国工农红军长征的直接原因是（）','中共失去了广大人民的支持','中共认识到北上抗日的重要性','第五次反“围剿”的失利','中共仍未找到夺取革命胜利的道路','C'),(8,'毛泽东说“长征”是宣传队，意思是指（）','长征使中国革命转危为安','红军战胜了党内分裂的危机','长征途中，宣传了马克思主义和抗战的主张','长征为中国革命的继续发展奠定了基础','C'),(9,'万里长征是中国工农红军进行的伟大战略转移，这里的“转移”是指（）','中国革命的性质发生了变化','党的工作重心发生了转移','革命中心地区发生了转移','中国革命的任务发生了变化','C'),(10,'1927年，蒋介石在南京建立政权，其性质是（）','资产阶级政权','官僚资产阶级政权','地主阶级政权','大地主大资产阶级政权','D');
/*!40000 ALTER TABLE `question_gy_1_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_6`
--

DROP TABLE IF EXISTS `question_gy_1_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_6` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_6`
--

LOCK TABLES `question_gy_1_6` WRITE;
/*!40000 ALTER TABLE `question_gy_1_6` DISABLE KEYS */;
INSERT INTO `question_gy_1_6` VALUES (1,'抗日战争时期，根据地政权的民主建设主要体现为（）','建立中华苏维埃共和国','实行“三三制”原则','开展整风运动','推行精兵简政政策','B'),(2,'把毛泽东思想确立为中国共产党的指导思想的是（）','八七会议','遵义会议','中共七大','中共七届二中全会','C'),(3,'1937年日本积极策划全面侵华的根本原因是（）','缓和国内阶级矛盾','扩大在中国的殖民统治','摆脱国内经济危机','制定了所谓的“国策基准”','C'),(4,'中共确定建立抗日民族统一战线的方针是在（）','八七会议','遵义会议','瓦窑堡会议','洛川会议','C'),(5,'抗战初期两条不同抗战路线的根本区别是（）','是否抵抗日本侵略','是否依靠人民群众','是否合作抗战','是否积极抗战','B'),(6,'以国共合作为基础的抗日民族统一战线正式建立的标志是（）','西安事变的和平解决','国民政府发表自卫宣言','中国工农红军改编为八路军、新四军','国民党公布中共中央提交的国共合作宣言','D'),(7,'中国人民取得抗日战争胜利的最主要因素是（）','实行全民族抗战','战争的正义性','国际反法西斯力量配合','正确的战略战术','A'),(8,'造成抗战时期蒋介石集团政治态度两面性的主要原因是（）','日本灭亡中国的方针没有改变','中国领导的抗日武装力量的发展壮大','国民党代表大地主大资产阶级利益','民族矛盾和阶级矛盾的相互作用','D'),(9,'中华民族进入全民族抗战是在（）','九一八事变后','一二八事变后','华北事变后','卢沟桥事变后','D'),(10,'在抗日战争的战略防御阶段，国民党军队在正面战场上取得胜利的战役是（）','台儿庄战役','桂南战役','枣宜战役','中条山战役','A'),(11,'毛泽东在《论持久战》中指出，中国抗日战争取得胜利最关键的阶段是（）','战略防御阶段','战略相持阶段','战略反攻阶段','战略决战阶段','B'),(12,'1947年10月10日，《中国人民解放军宣言》提出的口号是（）','和平、民主、团结','向北发展、向南防御','打倒蒋介石，解放全中国','将革命进行到底','C');
/*!40000 ALTER TABLE `question_gy_1_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_gy_1_7`
--

DROP TABLE IF EXISTS `question_gy_1_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_gy_1_7` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_gy_1_7`
--

LOCK TABLES `question_gy_1_7` WRITE;
/*!40000 ALTER TABLE `question_gy_1_7` DISABLE KEYS */;
INSERT INTO `question_gy_1_7` VALUES (1,'抗日战争胜利后，中国社会的主要矛盾是（）','中美民族矛盾','中日民族矛盾','无产阶级同资产阶级的矛盾','中国人民同美帝国主义支持的国民党反动派之间的矛盾','D'),(2,'《双十协定》的签订，中共取得的战略优势是（）','获得了自卫战争的准备时间','解放区获得了合法地位','赢得了民主党派的支持','取得了政治上的主动地位','D'),(3,'重庆谈判的焦点问题是（）','人民军队和解放区的合法地位问题','要不要和平建国的问题','实行宪政、结束训政的问题','人民的民主、自由权利的问题','A'),(4,'解放战争时期，最早与蒋介石集团决裂的民主党派是（）','中国民主同盟','民主建国会','中国民主促进会','中国国民党革命委员会','A'),(5,'1947年刘邓大军挺进中原的重大意义在于（）','影响战略决战主攻方向','粉碎蒋介石的重点进攻','改变敌我双方的力量对比','改变解放战争的战略态势','D'),(6,'对第三次国内革命战争时期反蒋斗争第二条战线的准确表述是（）','国统区的学生运动','国统区的工农运动','国统区的地下斗争','国统区的民主运动','D'),(7,'蒋介石被迫下台后，代总统李宗仁的实际政治态度是（）','希望结束内战，实现和平','接受中共八项条件，进行和谈','与中共和谈，划江而治','顽固不化，准备卷土重来','D'),(8,'中共七届二中全会需要解决的重要问题是（）','如何夺取全国革命胜利','如何解决民主革命遗留的任务的问题','党的工作重心转移问题','民主革命向社会主义革命转变的问题','A'),(9,'七届二中全会召开的地点是（）','北平','延安','西柏坡','上海','C'),(10,'全面内战爆发的标志是国民党（）','撕毁《双十协定》','进攻中原解放区','进攻上党地区','撕毁停战协定','D'),(11,'揭开人民解放军全国性战略进攻序幕的是（）','孟良崮战役开始','刘邓大军挺进大别山','三大战役开始','渡江战役开始','B'),(12,'率领北平国民党军队接受和平改编的国民党将领是（）','张治中','蔡廷锴','杜聿明','傅作义','D'),(13,'毛泽东提出“一切反动派都是纸老虎”的著名论断，针对的是（）','打垮国民党的历次反革命军事围剿','国民党顽固派制造皖南事变等反共浪潮','日本帝国主义被迫宣布无条件投降','内战初期国民党在军事和经济方面占有明显优势','D');
/*!40000 ALTER TABLE `question_gy_1_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_1`
--

DROP TABLE IF EXISTS `question_my_1_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_1` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_1`
--

LOCK TABLES `question_my_1_1` WRITE;
/*!40000 ALTER TABLE `question_my_1_1` DISABLE KEYS */;
INSERT INTO `question_my_1_1` VALUES (1,'马克思主义理论从狭义上说是','无产阶级争取自身解放和整个人类解放的学说体系','关于无产阶级斗争的性质、目的和解放条件的学说','马克思和恩格斯创立的基本理论、基本观点和基本方法构成的科学体系','关于资本主义转化为社会主义以及社会主义和共产主义发展的普遍规律的学说','C'),(2,'马克思主义理论从广义上说是','不仅指马克思恩格斯创立的基本理论、基本观点和学说的体系，也包括继承者对它的发展。','无产阶级争取自身解放和整个人类解放的学说体系','关于无产阶级斗争的性质、目的和解放条件的学说','马克思和恩格斯创立的基本理论、基本观点和基本方法构成的科学体系','A'),(3,'作为中国共产党和社会主义事业指导思想的马克思主义是指','不仅指马克思恩格斯创立的基本理论、基本观点和学说的体系，也包括继承者对它的发展。','无产阶级争取自身解放和整个人类解放的学说体系','关于无产阶级斗争的性质、目的和解放条件的学说','列宁创立的基本理论、基本观点和基本方法构成的科学体系','A'),(4,'在19世纪三大工人运动中，集中反映工人政治要求的是','法国里昂工人起义','英国宪章运动','芝加哥工人起义','德国西里西亚纺织工人起义','B'),(5,'马克思主义产生的经济根源是','工业革命','资本主义经济危机','资本主义社会生产力和生产关系的矛盾运动','阶级斗争','C'),(6,'马克思主义产生的阶级基础和实践基础是','资本主义的剥削和压迫','无产阶级作为一支独立的政治力量登上了历史舞台','工人罢工和起义','工人运动得到了“农民的合唱”','B'),(7,'马克思和恩格斯进一步发展和完善了英国古典经济学理论是','辩证法','历史观','劳动价值论','剩余价值论','C'),(8,'马克思把黑格尔的辩证法称为','合理内核','基本内核','精髓','核心','A'),(9,'在第一次世界大战中成为东西方矛盾焦点和帝国主义政治体系最薄弱环节的国家是','德国','奥地利','中国','俄国','D'),(10,'“哲学把无产阶级当作自己的物质武器，同样，无产阶级把哲学当作自己的精神武器”，这个论断的含义是','马克思主义是无产阶级的世界观和方法论','哲学的存在方式是物质','无产阶级的存在方式是精神','无产阶级掌握哲学就由自为阶级转变为自在阶级','A'),(11,'马克思主义生命力的根源在于','以实践为基础的科学性与革命性的统一','与时俱进','科学性与阶级性的统一','科学性','A'),(12,'无产阶级的科学世界观和方法论是','辩证唯物主义','历史唯物主义','辩证唯物主义和历史唯物主义','唯物主义','C'),(13,'马克思主义最重要的理论品质是','吐故纳新','科学严谨','博大精深','与时俱进','D'),(14,'马克思主义最崇高的社会理想','实现共产主义','消灭阶级、消灭国家','实现个人的绝对自由','实现人权','A'),(15,'学习马克思主义基本原理的根本方法','认真学习马克思主义的著作','一切从实际出发','理论联系实际','实事求是','C');
/*!40000 ALTER TABLE `question_my_1_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_2`
--

DROP TABLE IF EXISTS `question_my_1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_2` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_2`
--

LOCK TABLES `question_my_1_2` WRITE;
/*!40000 ALTER TABLE `question_my_1_2` DISABLE KEYS */;
INSERT INTO `question_my_1_2` VALUES (1,'恩格斯认为，全部哲学、特别是近代哲学的重大的基本问题是 ','哲学与人类生存活动之间的内在联系问题 ','人与周围世界的基本联系问题 ','思维和存在的关系问题 ','关于人的本质问题 ','C'),(2,'对哲学基本问题第一方面的不同回答是划分（）的标准 ','唯物主义和唯心主义    ','辩证法和形而上学 ','可知论与不可知论        ','一元论和二元论 ','A'),(3,'对哲学基本问题第二个方面的不同回答是划分()的标准 ','唯物主义和唯心主义    ','反映论和先验论 ','可知论和不可知论        ','唯物史观和唯心史观 ','C'),(4,'马克思主义认为，世界的真正统一性在于它的 ','实践性   ','运动性   ','物质性   ','客观性 ','C'),(5,'“坐地日行八万里，巡天遥看一千河”，这一著名诗句包含的哲理是 ','物质运动的客观性和时空的主观性的统一 ','物质运动无限性和有限性的统一 ','时空的无限性和有限性的统一 ','运动的绝对性和静止的相对性的统一 ','D'),(6,'“旧唯物主义是半截子的唯物主义”，这是指 ','旧唯物主义是形而上学的唯物主义 ','旧唯物主义在社会历史观上是唯心主义 ','旧唯物主义是机械唯物主义 ','旧唯物主义是割裂了运动与静止的辩证法 ','B'),(7,'既是自然界与人类社会分化统一的历史前提，又是自然界与人类社会统一起来的现实基础，这指的是 ','运动','实践','精神生产','物质生产 ','B'),(8,'辩证唯物主义认为事物发展的规律是 ','思维对事物本质的概括和反映','用来整理感性材料的思维形式 ','事物内在的本质和稳定的联系','事物联系和发展的基本环节 ','C'),(9,'柏拉图的“理念论”是的理论 ','唯物主义   ','二元论   ','唯心主义  ','怀疑论 ','C'),(10,'“沉舟侧畔千帆过，病树前头万木春。”“芳林新叶催陈叶，流水前波让后波。”这两句诗包含的哲学道理是 ','矛盾是事物发展的动力 ','事物是本质和现象的统一 ','事物的发展是量变和质变的统一 ','新事物代替旧事物是事物发展的总趋势 ','D'),(11,'中国古代哲学家公孙龙“白马非马”之说的错误在于割裂了 ','内因和外因的关系  ','矛盾统一性和斗争性的关系 ','矛盾主要方面和次要方面的关系  ','矛盾的普遍性和特殊性的关系 ','D'),(12,'辩证法的否定即“扬弃”，它的含义是指 ','抛弃','事物中好的方面和坏的方面的组合 ','纯粹的否定','既克服又保留 ','D'),(13,'唯物辩证法的否定之否定规律揭示了事物发展的 ','方向和道路','形式和状态','结构和功能','源泉和动力 ','A'),(14,'主观辩证法与客观辩证法的关系是 ','反映与被反映的关系','唯心主义与唯物主义的关系 ','抽象与具体的关系','唯心辩证法与唯物辩证法的关系 ','A'),(15,'对于同一事物，不同的人有不同的反映，这说明 ','意识是主体的自由创造','意识不受客体影响 ','意识受主体状况的影响','意识的内容是主观的 ','C'),(16,'人工智能的出现对马克思主义哲学意识论的意义是 ','否定了物质对意识的决定作用 ','改变了人类意识活动的规律性 ','肯定了人工智能可以代替意识的能动活动 ','证明了意识可以在高度发展的物质中产生 ','D'),(17,'学习马克思主义的根本方法是 ','认真阅读马克思主义经典著作 ','在实践中自己探索 ','循序渐进 ','理论联系实际 ','D'),(18,'“从个别到一般，从一般到个别”的思维方法是 ','归纳与演绎','分析与综合','抽象到具体','实践到认识 ','A'),(19,'辩证思维方法从抽象上升到具体的过程是 ','从实践到认识的过程','从认识到实践的过程 ','思维生成现实具体的过程','在思维中形成“多种规定的统一”的过程 ','D '),(20,'唯物辩证法和形而上学斗争的焦点在于是否承认 ','事物是客观存在的','事物是普遍联系的 ','事物是变化发展的','矛盾是事物发展的动力 ','D'),(21,'有的哲学家认为，因果联系是由于人们多次看到两组现象前后相随而形成的心理习惯。这种观点属于 ','唯物主义决定论','唯心主义非决定论 ','形而上学的机械决定论','相对主义诡辩论','B'),(22,'在内容和形式的矛盾运动中， ','内容是相对稳定的，形式是活跃易变的 ','内容是活跃易变的，形式是相对稳定的 ','内容和形式都是处在不停的显著运动状况 ','内容的变化总是落后于形式的变化 ','B'),(23,'在现实中还没有充分的根据，也不具备一定的条件，在目前不 能实现的，属于 ','不可能性','微小的可能性 ','现实的可能性','抽象的可能性 ','B'),(24,'度是 ','事物的质量和数量的界限 ','事物保持其质的稳定性的数量界限 ','事物保持其量的稳定性的范围 ','事物发生变化的关节点 ','D'),(25,'《坛经》“时有风吹幡动，----僧曰风动，---僧曰幡动，议论不已。惠能进曰:不是风动，不是幡动，仁者心动”。惠能关于运动的观点是 ','运动是物质之根本属性','运动与物质不可分 ','精神运动是物质运动的一种形式','精神是运动的主体 ','B'),(26,'从解决哲学基本问题的角度看，物质的惟一特性是','运动性','客观实在性 ','不可分性','时空性 ','D'),(27,'实践是指 ','个人的生活活动','一切有利于自己的活动 ','人有目的的、达到真理性的认识活动 ','人们能动地改造和探索现实世界的社会性的客观物质活动 ','B'),(28,'唯物主义哲学发展的三个基本历史形态是 ','形而上学唯物主义、庸俗唯物主义、辩证唯物主义。 ','古代朴素唯物主义、形而上学唯物主义、辩证唯物主义。 ','奴隶社会时期的唯物主义、封建社会时期的唯物主义、资本主义时期的唯物主义。 ','机械唯物主义、形而上学唯物主义、辩证唯物主义。 ','D'),(29,'区分新旧事物的标志在于看它们','是不是在新的历史条件下出现的 ','是不是符合事物发展规律、具有强大的生命力 ','是不是有新形式和新特点 ','是不是得到大多数人的承认 ','B'),(30,'学习马克思主义哲学的根本目的是为了 ','掌握这一正确的哲学理论 ','锻炼逻辑思维能力 ','宣传马克思主义哲学 ','树立科学的世界观和人生观 ','D '),(1,'恩格斯认为，全部哲学、特别是近代哲学的重大的基本问题是 ','哲学与人类生存活动之间的内在联系问题 ','人与周围世界的基本联系问题 ','思维和存在的关系问题 ','关于人的本质问题 ','C'),(2,'对哲学基本问题第一方面的不同回答是划分（）的标准 ','唯物主义和唯心主义    ','辩证法和形而上学 ','可知论与不可知论        ','一元论和二元论 ','A'),(3,'对哲学基本问题第二个方面的不同回答是划分()的标准 ','唯物主义和唯心主义    ','反映论和先验论 ','可知论和不可知论        ','唯物史观和唯心史观 ','C'),(4,'马克思主义认为，世界的真正统一性在于它的 ','实践性   ','运动性   ','物质性   ','客观性 ','C'),(5,'“坐地日行八万里，巡天遥看一千河”，这一著名诗句包含的哲理是 ','物质运动的客观性和时空的主观性的统一 ','物质运动无限性和有限性的统一 ','时空的无限性和有限性的统一 ','运动的绝对性和静止的相对性的统一 ','D'),(6,'“旧唯物主义是半截子的唯物主义”，这是指 ','旧唯物主义是形而上学的唯物主义 ','旧唯物主义在社会历史观上是唯心主义 ','旧唯物主义是机械唯物主义 ','旧唯物主义是割裂了运动与静止的辩证法 ','B'),(7,'既是自然界与人类社会分化统一的历史前提，又是自然界与人类社会统一起来的现实基础，这指的是 ','运动','实践','精神生产','物质生产 ','B'),(8,'辩证唯物主义认为事物发展的规律是 ','思维对事物本质的概括和反映','用来整理感性材料的思维形式 ','事物内在的本质和稳定的联系','事物联系和发展的基本环节 ','C'),(9,'柏拉图的“理念论”是的理论 ','唯物主义   ','二元论   ','唯心主义  ','怀疑论 ','C'),(10,'“沉舟侧畔千帆过，病树前头万木春。”“芳林新叶催陈叶，流水前波让后波。”这两句诗包含的哲学道理是 ','矛盾是事物发展的动力 ','事物是本质和现象的统一 ','事物的发展是量变和质变的统一 ','新事物代替旧事物是事物发展的总趋势 ','D'),(11,'中国古代哲学家公孙龙“白马非马”之说的错误在于割裂了 ','内因和外因的关系  ','矛盾统一性和斗争性的关系 ','矛盾主要方面和次要方面的关系  ','矛盾的普遍性和特殊性的关系 ','D'),(12,'辩证法的否定即“扬弃”，它的含义是指 ','抛弃','事物中好的方面和坏的方面的组合 ','纯粹的否定','既克服又保留 ','D'),(13,'唯物辩证法的否定之否定规律揭示了事物发展的 ','方向和道路','形式和状态','结构和功能','源泉和动力 ','A'),(14,'主观辩证法与客观辩证法的关系是 ','反映与被反映的关系','唯心主义与唯物主义的关系 ','抽象与具体的关系','唯心辩证法与唯物辩证法的关系 ','A'),(15,'对于同一事物，不同的人有不同的反映，这说明 ','意识是主体的自由创造','意识不受客体影响 ','意识受主体状况的影响','意识的内容是主观的 ','C'),(16,'人工智能的出现对马克思主义哲学意识论的意义是 ','否定了物质对意识的决定作用 ','改变了人类意识活动的规律性 ','肯定了人工智能可以代替意识的能动活动 ','证明了意识可以在高度发展的物质中产生 ','D'),(17,'学习马克思主义的根本方法是 ','认真阅读马克思主义经典著作 ','在实践中自己探索 ','循序渐进 ','理论联系实际 ','D'),(18,'“从个别到一般，从一般到个别”的思维方法是 ','归纳与演绎','分析与综合','抽象到具体','实践到认识 ','A'),(19,'辩证思维方法从抽象上升到具体的过程是 ','从实践到认识的过程','从认识到实践的过程 ','思维生成现实具体的过程','在思维中形成“多种规定的统一”的过程 ','D '),(20,'唯物辩证法和形而上学斗争的焦点在于是否承认 ','事物是客观存在的','事物是普遍联系的 ','事物是变化发展的','矛盾是事物发展的动力 ','D'),(21,'有的哲学家认为，因果联系是由于人们多次看到两组现象前后相随而形成的心理习惯。这种观点属于 ','唯物主义决定论','唯心主义非决定论 ','形而上学的机械决定论','相对主义诡辩论','B'),(22,'在内容和形式的矛盾运动中， ','内容是相对稳定的，形式是活跃易变的 ','内容是活跃易变的，形式是相对稳定的 ','内容和形式都是处在不停的显著运动状况 ','内容的变化总是落后于形式的变化 ','B'),(23,'在现实中还没有充分的根据，也不具备一定的条件，在目前不 能实现的，属于 ','不可能性','微小的可能性 ','现实的可能性','抽象的可能性 ','B'),(24,'度是 ','事物的质量和数量的界限 ','事物保持其质的稳定性的数量界限 ','事物保持其量的稳定性的范围 ','事物发生变化的关节点 ','D'),(25,'《坛经》“时有风吹幡动，----僧曰风动，---僧曰幡动，议论不已。惠能进曰:不是风动，不是幡动，仁者心动”。惠能关于运动的观点是 ','运动是物质之根本属性','运动与物质不可分 ','精神运动是物质运动的一种形式','精神是运动的主体 ','B'),(26,'从解决哲学基本问题的角度看，物质的惟一特性是','运动性','客观实在性 ','不可分性','时空性 ','D'),(27,'实践是指 ','个人的生活活动','一切有利于自己的活动 ','人有目的的、达到真理性的认识活动 ','人们能动地改造和探索现实世界的社会性的客观物质活动 ','B'),(28,'唯物主义哲学发展的三个基本历史形态是 ','形而上学唯物主义、庸俗唯物主义、辩证唯物主义。 ','古代朴素唯物主义、形而上学唯物主义、辩证唯物主义。 ','奴隶社会时期的唯物主义、封建社会时期的唯物主义、资本主义时期的唯物主义。 ','机械唯物主义、形而上学唯物主义、辩证唯物主义。 ','D'),(29,'区分新旧事物的标志在于看它们','是不是在新的历史条件下出现的 ','是不是符合事物发展规律、具有强大的生命力 ','是不是有新形式和新特点 ','是不是得到大多数人的承认 ','B'),(30,'学习马克思主义哲学的根本目的是为了 ','掌握这一正确的哲学理论 ','锻炼逻辑思维能力 ','宣传马克思主义哲学 ','树立科学的世界观和人生观 ','D ');
/*!40000 ALTER TABLE `question_my_1_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_3`
--

DROP TABLE IF EXISTS `question_my_1_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_3` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_3`
--

LOCK TABLES `question_my_1_3` WRITE;
/*!40000 ALTER TABLE `question_my_1_3` DISABLE KEYS */;
INSERT INTO `question_my_1_3` VALUES (1,'“从物到感觉和思想”与“从思想和感觉到物”，这是（） ','辩证唯物论与旧唯物论两条认识路线的对立 ','辩证法和形而上学的对立 ','唯物论与唯心论两条认识路线的对立 ','可知论与不可知论的对立 ','C　'),(2,'实践的主体是（） ','绝对精神 ','具有思维能力、从事社会实践和认识活动的人 ','人 ','人的意识 ','B　'),(3,'实践的客体是（） ','绝对精神的对象化','客观物质世界 ','人的意识的创造物','进人主体的认识和实践范围的客观事物 ','D　'),(4,'实践的中介是（） ','各种形式的工具、手段及其运用的程序和方法 ','对一事物存在和发展有联系的各种要素的总和 ','构成事物一切要素的总和 ','受命于主观，见之于客观的活动 ','A　'),(5,'马克思主义认为，主客体之间的价值关系是指（） ','主体对客体的物质欲望和要求','主体对客体的能动反映 ','主体对客体的改造和变革的结果','客体对于主体的有用性和效益性 ','D　'),(6,'“社会上一旦有技术上的需要，则这种需要会比十所大学更能把科学推向前进。”这说明（） ','实践是认识的来源','技术推动了科学的发展 ','实践是认识发展的动力','科学进步是实践的目的 ','C　'),(7,'恩格斯说：“人的智力是按照人如何学会改造自然界而发展的。”这说明（） ','自然界是认识发展的动力','实践是认识发展的动力 ','人的认识具有主观能动性','人具有认识自然的能力 ','B　'),(8,'科学家尼葛庞蒂说：“预测未来的最好办法就是把它创造出来。”从认识和实践的关系看，这句话对我们的启示是（） ','认识总是滞后于实践 ','实践和认识互为先导 ','实践高于（理论的）认识，因为它不仅具有普遍性的品格，而且具有直接现实性的品格 ','实践与认识是合一的 ','C　'),(9,'“纸上得来终觉浅．绝知此事要躬行”，陆游这一名句强调的是（） ','实践是认识的来源','实践是推动认识发展的动力 ','实践是认识的目的','间接经验毫无用处 ','C　'),(10,'感性认识和理性认识的区别是（） ','感性认识是可靠的，理性认识是不可靠的 ','感性认识来源于实践，理性认识来源于书本 ','感性认识是对现象的认识，理性认识是对本质的认识 ','感性认识来源于直接经验，理性认识来源于间接经验 ','C　'),(11,'我们通过眼、耳、鼻、舌、身各种感官感觉到一个梨子的各种属性，在意识中把它们联系起来形成了关于这个梨子的感性形象，这种反映形式是（） ','感觉','知觉','表象','分析 ','B '),(12,'对于哲学史上长期争论不休的唯理论和经验论两大派别的正确评价是（） ','唯理论是正确的，经验论是错误的 ','经验论是正确的，唯理论是错误地 ','唯理论和经验论各有片面的真理性 ','唯理论和经验论都是完全错误的 ','C　'),(13,'“真理和谬误的对立，只是在非常有限的范围内才有意义”是（） ','形而上学的观点','唯物辩证法的观点 ','诡辩论的观点','相对主义的观点 ','B　'),(14,'真理与谬误之间的相互关系是（） ','在任何情况下都是绝对对立的','没有相互转化的可能性 ','在一定条件下可以互相转化','两者之间没有原则区别 ','C　'),(15,'“真理是人造的供人使用的工具”的看法是（） ','主观唯心主义','客观唯心主义 ','辩证唯物主义','机械唯物主义 ','A　'),(16,'“真理是思想形式，是人类经验的组织形式”这是（） ','主观唯心主义真理论','辩证唯物主义真理论 ','客观真理论','形而上学真理论 ','A　'),(17,'“此亦一是非，彼亦一是非”的命题，其含义是（） ','强调真理的客观性','否认真理的客观性 ','强调真理具有客观标准','否认真理具有客观标准 ','D　'),(18,'“对客观事物的反映即是真理”，这是（） ','混淆了真理性认识与一般认识的错误观点 ','辩证唯物主义的真理观 ','一切唯物主义的真理观 ','混淆了真理的客观性与规律客观性 ','A　'),(19,'“听其言必责其用，观其行必求其功。”这种观点是（） ','强调认识对实践的作用','强调实践对认识的检验作用 ','认为认识可以脱离实践','认为实践可以脱离认识 ','B　'),(20,'承认我们知识的相对性就（） ','必然归结为诡辩论','必然归结为怀疑主义 ','必然归结为不可知论','可以防止认识的僵化 ','D'),(21,'“人的思维是否具有真理性，这并不是一个理论的问题，而是一个实践的问题。人应该在实践中证明自己思维的真理性，即自己思维的现实性和力量，亦即自己思维的此岸性。”这一论断说明了（） ','实践是认识的来源和动力 ','实践是检验认识是否具有真理性的唯一标准 ','实践检验真理不需要理论指导 ','认识活动与实践活动具有同样的作用和力量 ','B'),(22,'列宁提出的：“从物到感觉和思想”与“从思想和感觉到物”是（） ','唯物主义认识论与唯心主义认识论的对立 ','经验论与唯理论的对立 ','反映论与先验论的对立 ','可知论与不可知论的对立 ','A　'),(23,'没有抽象的真理，真理总是具体的。这一命题强调（） ','真理是感性的直观，不是理性的抽象 ','真理的内容是客观的，形式是主观的 ','同一对象真理性的认识只有一个 ','真理是与人的具体利益相联系的 ','C　'),(24,'列宁说：“没有革命的理论，就不会有革命的行动”，这一命题的含义是（） ','革命理论比革命行动更重要 ','革命运动是革命理论的派生物 ','革命理论对革命实践具有指导作用 ','革命理论最终决定革命运动的成败 　','C　'),(25,'法国科学家路易·巴斯德说：“在观察事物之际，机遇偏爱有准备的头脑。”这句话强调了（） ','人们只有发挥主观能动性才能认识事物','人们获得感性经验至关重要 ','人们不仅要善于观察事物，而且要善于思考问题 ','人们在认识事物是要有理性的指导 ','D　'),(26,'马克思指出：“搬运夫和哲学家之间的原始差别要比家犬和猎犬之间的差别小得多，它们之间的鸿沟是分工掘成的。”这表明（） ','人的聪明才智无先天区别 ','人的聪明才智的大小主要取决于主观努力的程度 ','人的聪明才智主要来源于后天实践 ','人的聪明才智由人的社会政治地位决定 ','C　'),(27,'真理和谬误的界限在于（） ','是否符合人的利益和愿望','是否符合马克思主义 ','是否反映了客观事物的本质和规律','是否为大多数人所接受 ','C　'),(28,'真理的绝对性是指它的（） ','具体性','客观性','终极性','全面性 ','B　'),(29,'真理观上的相对主义，错误在于（） ','夸大真理的相对性，否认真理的绝对性 ','夸大真理的绝对性，否认真理的相对性 ','只讲真理的客观性，否认真理的相对性 ','认为关于同一对象真理性的认识只有一个 ','A　'),(30,'实践基础上的理论创新，是（） ','决定了社会发展趋势','决定着社会变革力度 ','社会发展和变革的先导','一个国家兴旺发达的最终源泉 ','C　'),(1,'“从物到感觉和思想”与“从思想和感觉到物”，这是（） ','辩证唯物论与旧唯物论两条认识路线的对立 ','辩证法和形而上学的对立 ','唯物论与唯心论两条认识路线的对立 ','可知论与不可知论的对立 ','C　'),(2,'实践的主体是（） ','绝对精神 ','具有思维能力、从事社会实践和认识活动的人 ','人 ','人的意识 ','B　'),(3,'实践的客体是（） ','绝对精神的对象化','客观物质世界 ','人的意识的创造物','进人主体的认识和实践范围的客观事物 ','D　'),(4,'实践的中介是（） ','各种形式的工具、手段及其运用的程序和方法 ','对一事物存在和发展有联系的各种要素的总和 ','构成事物一切要素的总和 ','受命于主观，见之于客观的活动 ','A　'),(5,'马克思主义认为，主客体之间的价值关系是指（） ','主体对客体的物质欲望和要求','主体对客体的能动反映 ','主体对客体的改造和变革的结果','客体对于主体的有用性和效益性 ','D　'),(6,'“社会上一旦有技术上的需要，则这种需要会比十所大学更能把科学推向前进。”这说明（） ','实践是认识的来源','技术推动了科学的发展 ','实践是认识发展的动力','科学进步是实践的目的 ','C　'),(7,'恩格斯说：“人的智力是按照人如何学会改造自然界而发展的。”这说明（） ','自然界是认识发展的动力','实践是认识发展的动力 ','人的认识具有主观能动性','人具有认识自然的能力 ','B　'),(8,'科学家尼葛庞蒂说：“预测未来的最好办法就是把它创造出来。”从认识和实践的关系看，这句话对我们的启示是（） ','认识总是滞后于实践 ','实践和认识互为先导 ','实践高于（理论的）认识，因为它不仅具有普遍性的品格，而且具有直接现实性的品格 ','实践与认识是合一的 ','C　'),(9,'“纸上得来终觉浅．绝知此事要躬行”，陆游这一名句强调的是（） ','实践是认识的来源','实践是推动认识发展的动力 ','实践是认识的目的','间接经验毫无用处 ','C　'),(10,'感性认识和理性认识的区别是（） ','感性认识是可靠的，理性认识是不可靠的 ','感性认识来源于实践，理性认识来源于书本 ','感性认识是对现象的认识，理性认识是对本质的认识 ','感性认识来源于直接经验，理性认识来源于间接经验 ','C　'),(11,'我们通过眼、耳、鼻、舌、身各种感官感觉到一个梨子的各种属性，在意识中把它们联系起来形成了关于这个梨子的感性形象，这种反映形式是（） ','感觉','知觉','表象','分析 ','B '),(12,'对于哲学史上长期争论不休的唯理论和经验论两大派别的正确评价是（） ','唯理论是正确的，经验论是错误的 ','经验论是正确的，唯理论是错误地 ','唯理论和经验论各有片面的真理性 ','唯理论和经验论都是完全错误的 ','C　'),(13,'“真理和谬误的对立，只是在非常有限的范围内才有意义”是（） ','形而上学的观点','唯物辩证法的观点 ','诡辩论的观点','相对主义的观点 ','B　'),(14,'真理与谬误之间的相互关系是（） ','在任何情况下都是绝对对立的','没有相互转化的可能性 ','在一定条件下可以互相转化','两者之间没有原则区别 ','C　'),(15,'“真理是人造的供人使用的工具”的看法是（） ','主观唯心主义','客观唯心主义 ','辩证唯物主义','机械唯物主义 ','A　'),(16,'“真理是思想形式，是人类经验的组织形式”这是（） ','主观唯心主义真理论','辩证唯物主义真理论 ','客观真理论','形而上学真理论 ','A　'),(17,'“此亦一是非，彼亦一是非”的命题，其含义是（） ','强调真理的客观性','否认真理的客观性 ','强调真理具有客观标准','否认真理具有客观标准 ','D　'),(18,'“对客观事物的反映即是真理”，这是（） ','混淆了真理性认识与一般认识的错误观点 ','辩证唯物主义的真理观 ','一切唯物主义的真理观 ','混淆了真理的客观性与规律客观性 ','A　'),(19,'“听其言必责其用，观其行必求其功。”这种观点是（） ','强调认识对实践的作用','强调实践对认识的检验作用 ','认为认识可以脱离实践','认为实践可以脱离认识 ','B　'),(20,'承认我们知识的相对性就（） ','必然归结为诡辩论','必然归结为怀疑主义 ','必然归结为不可知论','可以防止认识的僵化 ','D'),(21,'“人的思维是否具有真理性，这并不是一个理论的问题，而是一个实践的问题。人应该在实践中证明自己思维的真理性，即自己思维的现实性和力量，亦即自己思维的此岸性。”这一论断说明了（） ','实践是认识的来源和动力 ','实践是检验认识是否具有真理性的唯一标准 ','实践检验真理不需要理论指导 ','认识活动与实践活动具有同样的作用和力量 ','B'),(22,'列宁提出的：“从物到感觉和思想”与“从思想和感觉到物”是（） ','唯物主义认识论与唯心主义认识论的对立 ','经验论与唯理论的对立 ','反映论与先验论的对立 ','可知论与不可知论的对立 ','A　'),(23,'没有抽象的真理，真理总是具体的。这一命题强调（） ','真理是感性的直观，不是理性的抽象 ','真理的内容是客观的，形式是主观的 ','同一对象真理性的认识只有一个 ','真理是与人的具体利益相联系的 ','C　'),(24,'列宁说：“没有革命的理论，就不会有革命的行动”，这一命题的含义是（） ','革命理论比革命行动更重要 ','革命运动是革命理论的派生物 ','革命理论对革命实践具有指导作用 ','革命理论最终决定革命运动的成败 　','C　'),(25,'法国科学家路易·巴斯德说：“在观察事物之际，机遇偏爱有准备的头脑。”这句话强调了（） ','人们只有发挥主观能动性才能认识事物','人们获得感性经验至关重要 ','人们不仅要善于观察事物，而且要善于思考问题 ','人们在认识事物是要有理性的指导 ','D　'),(26,'马克思指出：“搬运夫和哲学家之间的原始差别要比家犬和猎犬之间的差别小得多，它们之间的鸿沟是分工掘成的。”这表明（） ','人的聪明才智无先天区别 ','人的聪明才智的大小主要取决于主观努力的程度 ','人的聪明才智主要来源于后天实践 ','人的聪明才智由人的社会政治地位决定 ','C　'),(27,'真理和谬误的界限在于（） ','是否符合人的利益和愿望','是否符合马克思主义 ','是否反映了客观事物的本质和规律','是否为大多数人所接受 ','C　'),(28,'真理的绝对性是指它的（） ','具体性','客观性','终极性','全面性 ','B　'),(29,'真理观上的相对主义，错误在于（） ','夸大真理的相对性，否认真理的绝对性 ','夸大真理的绝对性，否认真理的相对性 ','只讲真理的客观性，否认真理的相对性 ','认为关于同一对象真理性的认识只有一个 ','A　'),(30,'实践基础上的理论创新，是（） ','决定了社会发展趋势','决定着社会变革力度 ','社会发展和变革的先导','一个国家兴旺发达的最终源泉 ','C　');
/*!40000 ALTER TABLE `question_my_1_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_4`
--

DROP TABLE IF EXISTS `question_my_1_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_4` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_4`
--

LOCK TABLES `question_my_1_4` WRITE;
/*!40000 ALTER TABLE `question_my_1_4` DISABLE KEYS */;
INSERT INTO `question_my_1_4` VALUES (1,'在人类社会发展中起决定作用的因素是（） ','生产方式','地理条件','社会意识','人口因素 ','A　'),(2,'社会意识相对独立性的最突出表现是它（） ','同社会存在发展的不同步性','具有历史的继承性 ','对社会存在具有能动的反作用','同社会经济的发展具有不平衡性 ','C　'),(3,'在生产关系中起决定作用的是（） ','生产资料所有制','产品的分配和交换 ','在生产中人与人的关系','管理者和生产者的不同地位 ','A　'),(4,'“手推磨产生的是封建主的社会，蒸汽磨产生的是工业资本家的社会”,这句话揭示了（） ','生产工具是衡量生产力水平的重要尺度 ','科学技术是第一生产力 ','社会形态的更替有其一定的顺序性 ','物质生产的发展藉要建立相应的生产关系 ','D　'),(5,'十一届三中全会以来，我党制定的一系列正确的路线、方针、政策促进了我国经济的迅猛发展，这说明（） ','经济基础发展的道路是由上层建筑决定的 ','上层建筑的发展决定经济基础的发展方向 ','上层建筑对经济基础具有积极的能动作用 ','社会主义社会的发展不受经济基础决定上层建筑规律的制约 ','C　'),(6,'一定社会形态的经济基础是（） ','生产力 ','该社会的各种生产关系 ','政治制度和法律制度 ','与一定生产力发展阶段相适应的生产关系的总和 ','D　'),(7,'上层建筑是指（） ','社会的经济制度 ','科学技术 ','社会生产关系 ','建立在一定社会经济基础之上的意识形态及相应的制度和设施 ','D　'),(8,'社会形态是（） ','生产力和生产关系的统一 ','同生产力发展一定阶段相适应的经济基础和上层建筑的统一体 ','社会存在和社会意识的统一 ','物质世界和精神世界的统一 ','B　'),(9,'人类社会发展的一般规律是（） ','生产方式内部的矛盾规律 B、生产力和生产关系、经济基础和上层建筑之间的矛盾运动规律 ','社会存在和社会意识的矛盾规律 ','物质生产和精神生产的矛盾规律 ','','B　'),(10,'阶级斗争对阶级社会发展的推动作用突出表现在（） ','生产力的发展','生产关系的变革 ','社会形态的更替','科技的进步 ','C'),(11,'社会革命根源于（） ','人口太多','少数英雄人物组织暴动 ','先进思想和革命理论的传播','社会基本矛盾的尖锐化 ','D '),(12,'社会主义改革的根本目的在于（） ','改变社会主义制度','完善社会主义制度 ','解放和发展生产力','实现社会公平 ','C　'),(13,'“蒸汽、电力和自动纺织机甚至是比巴尔贝斯、拉斯拜尔和布朗基诸位公民更危险万分的革命家。”这一论断的含义是（） ','科技革命是对统治阶级的极大威胁 ','科技革命对变革社会制度具有直接的决定作用 ','滥用科技革命的成果会对人类造成“危险” ','科技革命导致社会政治革命 ','D　'),(14,'人民群众既是历史的“剧中人”，又是历史的“剧作者”，这是（） ','唯心主义的观点','折中主义的观点 ','历史唯物主义的观点','历史循环论的观点 ','C　'),(15,'理解人类社会发展的钥匙是（） ','阶级斗争史','思想发展史 ','劳动发展史','文化发展史 ','C　'),(16,'阶级实质上是一个（） ','思想范畴','经济范畴','政治范畴','文化范畴 ','B　'),(17,'英雄史观的理论出发点是主张（） ','人是社会历史的主体','人的意识对社会存在具有能动的作用 ','社会意识决定社会存在','社会运动受偶然性支配 ','C　'),(18,'人民群众是历史的创造者，其根本原因在于人民群众（） ','占人口大多数','是社会生产力的体现者 ','具有先进思想','掌握历史发展规律 ','B　'),(19,'制约人民群众创造历史的决定性条件是（） ','经济条件','法律制度','传统观念','文化水平 ','A　'),(20,'历史上杰出人物的产生（） ','纯粹偶然的','纯粹必然的 ','偶然与必然的统一','有的是偶然有的是必然 ','C'),(21,'正确评价历史人物的方法是（） ','古为今用方针','历史分析方法 ','彻底批判的革命精神','全盘否定的分析方法 ','B'),(22,'历史发展是“合力”作用的结果，这就是说（） ','历史发展无规律可循','历史发展是无法认识的 ','历史发展的因素是复杂的','社会中的每个人不都是“合力”的一部分','C'),(23,'人类全部社会关系中最基础的关系是（） ','生产关系','血缘关系','政治关系','思想关系 ','A'),(24,'人口因素在社会发展中的作用是可以（） ','决定社会制度的性质','决定社会制度的更替 ','制约和影响社会发展','决定国家的贫富强弱 ','C'),(25,'地理环境对社会发展的作用主要通过（）  ','对人的心理素质的影响才能实现 ','对人的生理结构的影响才能实现 ','对民族气质的影响才能实现 ','对生产过程的影响才能实现 ','D'),(26,'劳动过程是劳动一般性质和劳动的社会形式的统一。劳动的一般性质是指（） ','个人与社会之间的相互作用过程 ','劳动者相互之间的信息交流过程 ','人与自然之间的物质变换过程 ','社会与自然之间的物质变换过程 ','C'),(27,'联结人与自然的中介是（） ','地理环境','生产劳动','社会关系','社会意识 ','B'),(28,'物质资料的生产方式包括（） ','劳动者和劳动工具两个方面','劳动资料和劳动对象两个方面 ','生产关系和生产资料两个方面','生产力和生产关系两个方面 ','D'),(29,'人类区别于动物的根本标志是（） ','制造使用工具','具有宗教信仰 ','具有语言文字','具有思想意识 ','A'),(30,'社会各种矛盾中最基本的是（） ','生产力与生产关系的矛盾','物质生产和精神生产的关系 ','经济基础和上层建筑的关系','阶级与阶级之间的关系 ','A');
/*!40000 ALTER TABLE `question_my_1_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_5`
--

DROP TABLE IF EXISTS `question_my_1_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_5` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_5`
--

LOCK TABLES `question_my_1_5` WRITE;
/*!40000 ALTER TABLE `question_my_1_5` DISABLE KEYS */;
INSERT INTO `question_my_1_5` VALUES (1,'商品的本质因素是（） ','使用价值','价值','交换价值','价格 ','B　'),(2,'生产商品的劳动分具体劳动和抽象劳动，其中具体劳动的作用是（） ','创造新价值','创造剩余价值 ','创造必要价值','创造使用价值 ','D　'),(3,'社会必要劳动时间是在现有的社会正常生产条件下，在社会平均劳动熟练程度和劳动强度下制造某种使用价值所需要的劳动时间，它是以（） ','具体劳动为尺度的','简单劳动为尺度的 ','复杂劳动为尺度的','个别劳动为尺度的 ','B　'),(4,'商品经济是通过商品货币关系实行等价交换的经济形式，它的基本规律是（） ','价值规律','剩余价值规律 ','竞争规律','货币流通规律 ','A　'),(5,'马克思说：“一切商品对它们的所有者是非使用价值，对它们的非所有者是使用价值。”这句话表明（） ','有使用价值的不一定有价值','商品的使用价值是对它的购买消费者而言的 ','商品所有者同时获得使用价值和价值 ','商品是使用价值和价值的对立统一 ','B　'),(6,'如果部门劳动生产率下降，同一劳动在单位时间内创造的（） ','使用价值量减少，单位产品的价值量增加 ','使用价值量减少，单位产品的价值量减少 ','价值量增加，单位产品的价值量增加 ','价值量减少，单位产品的价值量减少 ','A　'),(7,'对“劳动是财富之父，土地是财富之母”这句话的正确解释是（） ','劳动和土地都是价值的源泉 ','劳动创造使用价值，土地形成价值 ','劳动是创造价值的外部条件，土地是价值的真正源泉 ','劳动必须和自然物相结合才能创造出物质财富 ','D　'),(8,'商品内在的使用价值与价值的矛盾，其完备的外在表现是（） ','商品与商品之间的对立','私人劳动与社会劳动之间的对立 ','商品与货币之间的对立','资本与雇佣劳动之间的对立 ','C　'),(9,'价值规律是商品经济的基本规律，它的作用是通过（） ','生产者之间的竞争实现的 ','消费者之间的竞争实现的 ','生产者和消费者之间的竞争实现的 ','价格机制、供求机制和竟争机制实现的 ','D　'),(10,'在商品经济中，形成价值的抽象劳动的支出必须借助于（） ','具体劳动','剩余劳动 ','商品的生产形式','资本主义生产方式 ','A　'),(11,'商品生产者要获得更多收益必须使生产商品的（） ','个别劳动时间等于倍加的社会必要劳动时间 ','个别劳动时间等于社会必要劳动时间 ','个别劳动时间大于社会必要劳动时间 ','个别劳动时间小于社会必要劳动时间 ','D　'),(12,'正确认识价值创造和财富生产的关系，关键是运用（） ','劳动二重性学说','资本有机构成学 ','剩余价值学说','平均利润学说 ','A '),(13,'货币之所以能执行价值尺度的职能，是因为（） ','它能衡量其他商品价值的大小 ','它是社会劳动的产物，本身具有价值 ','它具有计量单位 ','它可以是观念上的货币 ','B　'),(14,'资本集中的方式是（） ','资本积聚和资本积累','竞争和剩余价值的资本化 ','竞争和信用','简单再生产和扩大再生产 ','C　'),(15,'资本主义地租是（） ','平均利润转化来的','超额利润转化来的 ','垄断利润转化来的','企业利润转化来的 ','B　'),(16,'资本是一种运动，资本循环是从（） ','资本运动的形式和条件方面研究资本的运动 ','资本运动的速度方面研究资本的运动 ','资本运动的实现条件方面研究资本的运动 ','资本运动的矛盾性方面研究资本的运动 ','A　'),(17,'资本循环的三种职能形式是（） ','产业资本、商业资本、借贷资本','固定资本、流动资本、生产资本 ','货币资本、生产资本、商品资本','不变资本、可变资本、流通资本 ','C　'),(18,'资本主义经济危机的实质是（） ','生产过剩的危机','生产不足的危机 ','生产相对过剩的危机','生产绝对过剩的危机 ','C　'),(19,'资本主义经济危机呈现出周期性的原因在于（） ','资本主义基本矛盾','资本主义基本矛盾运动的特点 ','资本主义的基本矛盾周期性','资本主义再生产的周期性 ','B　'),(20,'下列实物形态的资本中，同时属于生产资本、不变资本和固定资本的是（） ','原料和燃料','辅助材料 ','机器设备','商业设施 ','C'),(21,'产业资本划分为货币资本、生产资本、商品资本的依据是资本各个部分（） ','在价值增殖过程中的作用不同','价值周转方式不同 ','存在的物质形态不同','在循环中的职能不同 ','D　'),(22,'加快资本周转，可以增加年剩余价值量和提高年剩余价值率，根本是因为（） ','预付的资本总量增加了','实际发挥作用的可变资本增加了 ','流通对生产的反作用','剩余价值率提高了 ','B　'),(23,'最鲜明体现资本主义国家实质的国家职能是（） ','政治职能','经济职能 ','社会职能','对外交往职能 ','A '),(24,'资本主义法制的核心是（） 　 ','民法','宪法','刑法','行政法 ','B　'),(25,'美国采取权力制衡的组织形式，其中立法权属于（） ','国会','总统','最高法院','最高检察院 ','A　'),(26,'资本主义国家的选举的实质是（） ','资产阶级和无产阶级分权 ','每个公民都能通过竞选参与政治活动，表达自己的愿望和要求 ','协调统治阶级内部利益关系和矛盾的重要措施 ','人民当家作主 ','C　'),(27,'资本主义政党制度的实质是（） ','允许工人阶级及其政党参与国家政治生活 ','允许马克思主义政党独立执政 ','不受资本主义国家政权的资本主义性质制约 ','资产阶级选择自己的国家管理者，实现其内部利益平衡的政治机制   ','D　'),(28,'资产阶级意识形态的核心是（） ','文学、艺术和宗教','道德、伦理 ','政治思想和法律思想','哲学、历史 ','C ');
/*!40000 ALTER TABLE `question_my_1_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_6`
--

DROP TABLE IF EXISTS `question_my_1_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_6` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_6`
--

LOCK TABLES `question_my_1_6` WRITE;
/*!40000 ALTER TABLE `question_my_1_6` DISABLE KEYS */;
INSERT INTO `question_my_1_6` VALUES (1,'第二次世界大战后，发达资本主义国家的发展进人国家垄断资本主义的新阶段，这意味着（） ','发达资本主义国家的政府担当调控国家宏观经济的重要职能 ','国家垄断资本掌控经济生活 ','所有重要的经济部门实行国有化 ','国家垄断重于私人垄断 ','A　'),(2,'国家垄断资本主义的产生和发展，从根本上说是（） ','国内市场竞争的结果 ','国际竞争激烈化的结果 ','垄断统治加强的结果 ','生产社会化和资本主义私人占有制之间矛盾发展的结果 ','D　'),(3,'当代资本主义国际垄断组织的主要形式是（） ','国际卡特尔','混合联合企业级 ','跨国公司','国际康采恩 ','C　'),(4,'第二次世界大战后，发达资本主义国家和私人垄断统治的发展表现在（） ','托拉斯和康采恩的出现','金融寡头的统治 ','国际垄断同盟的兴起','形成跨行业跨部门的混合联合企业 ','D　'),(5,'金融资本是由（） ','产业资本和商业资本融合或混合生长而成的 ','银行资本的工业资本融合或混合生长而成的 ','垄断的银行资本和垄断的工业资本融合或混合生长而成的 ','垄断银行资本和银行资本融合或混合生长而成的 ','C　'),(6,'在垄断资本主义阶段占统治地位的资本是（） ','工业资本','农业资本 ','银行资本','金融资本 ','D　'),(7,'在垄断资本主义的各个基本经济特征中最根本的特征是（） ','国家垄断同盟的形成','资本输出具有重要的意义 ','垄断在经济生活中占统治地位','瓜分世界领土，形成殖民体系 ','C　'),(8,'资本主义由自由竞争阶段进人垄断阶段，最根本的标志在于（） ','垄断代替自由竞争在经济生活中占统治地位 ','资本输出代替商品输出在经济生活中占统治地位 ','银行资本代替工业资本在经济生活中占统治地位 ','国家垄断代替私人垄断在经济生活中占统治地位 ','A　'),(9,'国家垄断资本主义发展的基础是（） ','国有垄断资本','资产阶级国家 ','私人垄断资本','资本输出 ','C　'),(10,'国家垄断资本主义的发展（） ','改变了经济的资本主义性质','符合垄断资本家的整体利益 ','代表了个别资本家的利益','消灭了私人垄断资本主义的基础','B'),(11,'金融寡头实现经济上统治的“参与制”是指金融寡头（） ','直接参与工业企业的生产经营和管理 ','直接参与银行的经营和管理 ','通过购买一定数量的股票层层控制许多大企业和大银行的经济统治方式 ','通过购买所属公司全部股票直接掌握许多大企业和大银行的经济统治方式 ','C　'),(12,'国家垄断资本主义是（） ','消除生产无政府状态的垄断资本主义 ','资产阶级国家同垄断资本相互分离的垄断资本主义 ','资产阶级国家同垄断资本融合在一起的垄断资本主义 ','带有社会主义因素的垄断资本主义 ','C '),(13,'第二次世界大战后，国家垄断资本主义发展的特点是（） ','发展缓慢不稳定','发展迅速且持续稳定 C，发展迅速但不稳定','时而削弱，时而发展 ','','B　'),(14,'国家垄断资本主义的宏观管理和调节体现的是（） ','全体劳动人民的经济利益','个别金融寡头的经济利益 ','垄断资产阶级的整体利益','国有企业的经济利益 ','C　'),(15,'国家垄断资本主义的形式中，最主要、最重要的形式是（） 　','国家市场垄断经济','国家调节经济 ','公私合营经济','国家自然垄断经济 ','B　'),(16,'垄断资本主义国家的“经济计划化”（） ','可以从根本上解决资本主义基本矛盾 ','使生产的无政府状态得到一定的缓解 ','导致资本主义向社会主义和平过渡 ','可以消除资本主义经济危机 ','B　'),(17,'国家垄断资本主义的局限性在于（） ','使垄断资本主义存在着时而迅速发展时而停滞的趋势 ','使垄断资本主义经济长期处于停滞状态 ','使垄断资本主义经济长期处于滞胀状态 ','它只能暂时使某些矛盾缓和，但却使这些矛盾进一步加深和复杂化 ','D　'),(18,'垄断资本主义国家的金融寡头在经济上的统治主要借助于（） ','“代理制”','“个人联合” ','“企业联合”','“参与制” ','D　'),(19,'各国垄断组织从经济上瓜分世界产生了（） ','国家垄断资本主义','国际垄断同盟 ','金融资本和金融寡头','殖民地和宗主国 ','B　'),(20,'经济全球化发展趋势的现实基础是（） ','新科技革命','生产国际化 ','国际贸易的高度发展','国际金融的迅速发展','C'),(21,'经济全球化的实质决定了它的发展必然是（） ','有利于所有国家','有利于发达资本主义国家 ','有利于发展中国家','有利于社会主义国家 ','B　'),(22,'下列不属于经济全球化发展趋势的选项是（） ','市场经济成为全球经济体制','区域经济集团日益发展 ','跨国公司的主导作用增强','国际经济新秩序的建立 ','D　'),(23,'经济全球化带给发达国家的好处很多，但不包括（） ','从世界各地获取大量的利润','降低其生产成本 ','扩大了贸易逆差','加强对国际金融市场的控制 ','C '),(24,'经济全球化带给发展中国家的消极影响有许多，但不包括（） ','经济发展受到一定程度的损失 ','在国际贸易关系中剩余价值大量流失 ','金融风险加大 ','经济发展机会大大减少 ','D　'),(25,'资本主义发展的历史趋势是（） 　','计划经济取代市场经济 ','市场经济取代计划经济 ','计划经济取代商品经济 ','社会主义公有制取代资本主义私有制 ','D　'),(26,'资本主义的历史地位是（） ','寄生的资本主义','腐朽的资本主义 ','不断发展的资本主义','过渡的资本主义 ','D　'),(27,'国家垄断资本主义为向社会主义过渡准备了物质条件是指（） ','全面的社会化','全面的商品化 ','全面的市场化','市场的计划化 ','A　'),(28,'正确认识资本主义的历史过渡性要（） ','否定资本主义生产关系的一切改良 ','对资本主义采取全面肯定的态度 ','借鉴资本主义社会中反映人类文明进步的改良 ','借鉴并发展资本主义的经济制度 ','C　'),(29,'资本社会化的最高形式是（） ','垄断资本主义','国家垄断资本主义 ','生产社会化','经营管理社会化 ','B　'),(30,'国家垄断资本主义对经济的干预（） ','从根本上解决了垄断资本主义国家的阶级矛盾 ','改变了资本主义私有制的性质 ','使资产阶级和工人阶级形成了利益一致 ','没有改变劳动者受剥削的地位 ','D ');
/*!40000 ALTER TABLE `question_my_1_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_7`
--

DROP TABLE IF EXISTS `question_my_1_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_7` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_7`
--

LOCK TABLES `question_my_1_7` WRITE;
/*!40000 ALTER TABLE `question_my_1_7` DISABLE KEYS */;
INSERT INTO `question_my_1_7` VALUES (1,'科学社会主义的直接理论来源是（） ','16、17世纪的早期空想社会主义 ','19世纪初期以圣西门、傅立叶、欧文为代表的空想社会主义 ','18世纪的空想平均共产主义 ','文艺复兴运动 ','B'),(2,'科学社会主义创立的理论基础是（） ','英国古典政治经济学','德国古典哲学','唯物史观和剩余价值学说','空想社会主义学说 ','C'),(3,'社会主义由空想到科学的标志是（） ','《共产党宣言》的发表','“共产主义者同盟”的建立 ','空想社会主义理想的破灭','无产阶级革命的胜利 ','A　'),(4,'社会主义政治制度的基本特征是坚持（） ','马克思主义的指导','共产党的领导 ','无产阶级专政','社会主义方向 ','C'),(5,'建设社会主义的根本目的是（） ','消灭剥削、消除两极分化，最终达到共同富裕 ','实行无产阶级专政 ','巩固共产党的领导 ','镇压资产阶级的反抗 ','A'),(6,'“民主社会主义”实质上是（） ','发达国家的社会主义','改良的资本主义 ','科学社会主义中的一种','社会主义的最佳模式 ','B'),(7,'无产阶级政党的组织原则是（） ','民主集中制','理论联系实际 ','实事求是','集体领导 ','A'),(8,'无产阶级夺取国家政权的最终目的是（） ','改变无产阶级受剥削、受压迫的地位 ','实现共产主义 ','解放和促进社会生产力的发展 ','彻底打碎资产阶级国家的机器 ','C'),(9,'列宁提出社会主义可能在一国或数国首先取得胜利观点的依据是（） ','无产阶级是最先进、最革命的阶级的原理 ','帝国主义时代资本主义政治经济发展不平衡的规律 ','资本主义国家无产阶级与资产阶级斗争的规律 ','资本主义必然灭亡、社会主义必然胜利的规律 ','B'),(10,'下列观点中，错误的是（） ','国际共产主义运动当今正处在低潮时期 ','社会主义必然取代资本主义 ','社会主义取代资本主义是一个长期的曲折的过程 ','社会主义在若干国家的严重挫折改变了资本主义必然灭亡的命运 ','D'),(11,'资本主义必然被社会主义所代替的主要依据是（） ','现代无产阶级日益壮大和觉醒 ','个别企业有组织的生产与整个社会生产无政府状态之间的矛盾 ','无产阶级与资产阶级斗争的尖锐化 ','生产的社会化与资本主义私人占有制之间的矛盾 ','D'),(12,'无产阶级革命之所以能取得胜利，其根本保证是（） ','无产阶级政党的正确领导','取得国家政权 ','人民群众的革命积极性的极大提高','建立革命统一战线 ','A'),(13,'无产阶级革命的根本问题是（） A，统一战线中的领导权问题','国家政权问题 ','武装斗争问题','农民问题 ','','B　'),(14,'无产阶级反对资产阶级的斗争中，最具决定意义的是（） ','理论斗争','议会斗争','经济斗争','政治斗争 ','D　'),(15,'实现社会主义的必要政治前提是（） ','建立无产阶级专政','建立广泛的革命统一战线 ','无产阶级的革命斗争','无产阶级政党的领导 ','A　'),(16,'马克思说：“暴力是每一个孕育着新社会的旧社会的助产婆”，这说明了（） ','暴力革命是无产阶级革命的唯一形式 ','暴力革命是无产阶级革命的主要的基本形式 ','暴力革命与和平发展互相排斥 ','暴力革命与和平发展可以相互取代 ','B　'),(17,'列宁对社会主义革命学说的重大贡献是（） ','提出了新经济政策 ','提出了战时共产主义政策 ','提出了社会主义革命将首先在一国或数国取得胜利的理论 ','提出了利用国家资本主义过渡社会主义的理论 ','C　'),(18,'科学社会主义的核心内容是（） ','无产阶级专政和社会主义民主','国家政权 ','生产资料公有制','唯物史观 ','A　'),(19,'无产阶级专政的实质，就是（） ','无产阶级作为统治阶级掌握国家政权 ','要消灭剥削、消灭阶级，进到无阶级社会 ','镇压敌对阶级的反抗和破坏活动 ','领导和组织社会主义建设 ','A　'),(20,'经济文化相对落后的国家可以先于发达资本主义国家进人社会主义，其根本原因是（） ','革命的客观形势和条件所决定的 ','经济文化相对落后的国家具有较高的精神文明 ','它是以高度社会化的资本主义大生产作为社会主义革命的物质前提的 ','社会主义生产关系可以在旧社会的内部孕育生长起来 ','A');
/*!40000 ALTER TABLE `question_my_1_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_my_1_8`
--

DROP TABLE IF EXISTS `question_my_1_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_my_1_8` (
  `num` int(4) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a` varchar(50) NOT NULL,
  `b` varchar(50) NOT NULL,
  `c` varchar(50) NOT NULL,
  `d` varchar(50) NOT NULL,
  `ans` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_my_1_8`
--

LOCK TABLES `question_my_1_8` WRITE;
/*!40000 ALTER TABLE `question_my_1_8` DISABLE KEYS */;
INSERT INTO `question_my_1_8` VALUES (1,'在下列观点中，正确的是（） ','只有空想社会主义思想家预见了未来社会 ','许多思想家都预见了未来社会 ','只有唯心主义思想家预见了未来社会 ','只有马克思列宁主义经典作家预见了未来社会 ','B　'),(2,'采用“通过批判旧世界来发现新世界”方法的是（） ','空想社会主义者','马克思主义 ','唯物主义','唯心主义 ','B　'),(3,'“代替那存在着阶级和阶级对立的资产阶级旧社会的，将是这样一个联合体，在那里，每个人的自由发展是一切人的自由发展的条件”。这一段话出现在（） ','《资本论》中','《共产主义原理》中 ','《哥达纲领批判》中','《共产党宣言》中 ','D　'),(4,'“人的依赖性关系”指（） ','资本主义社会之前的人与人之间的关系 ','资本主义社会之中的人与人之间的关系 ','社会主义社会之前的人与人之间的关系    ','共产主义社会之中的人与人之间的关系 ','A　'),(5,'“物的依赖性关系”是（） ','资本主义社会以前的人与人之间的关系 ','资本主义社会之中的人与人之间的关系 ','社会主义社会之中的人与人之间的关系    ','共产主义社会之中的人与人之间的关系 ','B　'),(6,'实现了人的“自由个性”的发展，是（） ','资本主义社会以前的人的生存状态 ','资本主义社会之中的人的生存状态 ','社会主义社会之中的人的生存状态 ','共产主义社会之中的人的生存状态 ','D　'),(7,'“两个必然”和“两个决不会”是（） ','相互矛盾的','完全不同的两回事 ','有着内在联系的','内容和形式的关系 ','C　'),(8,'“必然王国”和“自由王国”是（） ','空间性概念','物质性概念 ','历史性概念','时间性概念 ','C　'),(9,'在马克思主义看来，消灭“三大差别”的关键在于（） ','消灭利益差别','消灭城市和乡村的差别 ','消灭脑力劳动和体力劳动的差别','消灭工业与农业差别 ','A　'),(10,'实行“各尽所能，按需分配”分配方式是（） ','原始社会','阶级社会 ','社会主义社会','共产主义社会 ','D　'),(11,'共产主义社会的物质基础是（） ','比资本主义社会高的社会生产力 ','与发达资本主义国家相同的社会生产力 ','远远高于以往一切社会的高度发达的社会生产力 ','高新技术发达的生产力 ','C '),(12,'共产主义社会制度具有巨大优越性的根本保证是() ','社会制度的和谐完善 ','创造出前所未有的高水平的劳动生产率 ','人的精神境界极大提高 ','科学技术的不断进步 ','B　'),(13,'阶级消灭和国家消亡的实现是在() ','社会主义革命中','社会主义初级阶段 ','社会主义高级阶段','共产主义社会 ','D　'),(14,'共产主义社会的本质因素是() ','实现社会单一的公有制','按需分配 ','人的自由而全面发展','劳动生产率的极大提高 ','C　'),(15,'人的发展和社会发展之间的关系是，（） ','前者体现了个人价值，后者体现了社会价值 ','前者是个人的理想，后者是社会的目标 ','前者和后者是彼此独立的历史发展过程 ','前者和后者互为前提和基础 ','D'),(16,'江泽民说：“忘记远大理想而只顾眼前，就会失去前进方向，离开现实工作而空谈远大理想，就会脱离实际。”“远大理想”是指    ','共产主义远大理想','建设中国特色社会主义共同理想 ','个人对将来职业的向往与追求','个人对美好生活的向往与追求 ','A'),(17,'属于自由王国社会状态的是（） ','资本主义社会','封建社会 ','原始社会','共产主义社会','A'),(18,'自由王国是指人们（） ','处于绝对自由的原始社会状态 ','不再受自然规律和社会规律支配的状态 ','允许自由竞争的资本主义状态 ','摆脱了自然和社会关系的奴役，成为自己社会关系主人的状态 ','D'),(19,'社会主义和共产主义都存在的经济关系是() ','实行生产资料的社会公有制 ','实行按劳分配原则 ','实行按需分配原则 ','实行商品经济、市场经济体制 ','A'),(20,'共产主义社会的必经阶段和必由之路是() ','社会主义革命和无产阶级专政 ','向社会主义过渡时期 ','社会主义初级阶段 ',' 社会主义社会 ','D ');
/*!40000 ALTER TABLE `question_my_1_8` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-10 20:56:24
