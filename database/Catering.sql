/*
���
���		id	����
Code����	codeName	���ִ����ĺ�������
Code		code	����
*/

create table codetable
(
	id int identity(1,1)primary key,
	codeName	varchar(20),
	code	int
)

/*
Ա���˺������		
id		enterId
�˺� 	account	
���� 	pwd

*/
create table staffEnter
(
	enterId int identity(1,1)primary key,
	account varchar(30) unique,
	pwd varchar(20)
)

/*
�˿��˺������		
id		enterId
�˺� 	account	
���� 	pwd

*/
create table  customerEnter
(
	enterId int identity(1,1)primary key,
	account varchar(30) unique,
	pwd varchar(20)
)

/*
2��ɫ����
ְ���� 	partId
ְ������ 	partName
*/
create table part
(
	partId int identity(1,1)primary key,
	partName varchar(20)
)
/*
3Ա����Ϣ����
��ԱID		ID			����
Ա����� 	staffID		
���� 		Name  �ǿ�
�Ա�		sex		1Ϊ�л���2ΪŮ �������
����		age
�ֻ���		phone��
��ַ		varchar(20)��
��ְʱ��	accession	
��ɫid		partId	���ս�ɫ��
�˺�		enterID 
*/
create table staffInfo
(
	Id		int identity(1,1)primary key,
	staffId int unique,
	Name varchar(20) not null,
	sex	int foreign key references codetable(id),
	age int,
	phone varchar(11),
	adress varchar(100),
	accession datetime,
	partId int foreign key references staffEnter(enterId )
)


/*
3�˿���Ϣ����
��ԱID		ID			����	
���� 		Name  �ǿ�
�Ա�		sex		1Ϊ�л���2ΪŮ �������
�ֻ���		phone��
��ַ		adress
�˺�		enterId 
*/
create table customerInfo
(
	Id		int identity(1,1)primary key,
	Name varchar(20) not null,
	sex	int foreign key references codetable(id),
	phone varchar(11),
	adress varchar(100),
	enterId int foreign key references customerEnter(enterId)
)

/*
4��λ����
��λid		deskId
��λ����	personNum
������		deskName	
��λ״̬	deskState(0:���ã�1��ռ�ã�2����̨)�������

*/
create table desk
(
	deskId int identity(1,1)primary key,
	personNum int,
	deskName varchar(20),
	deskState int foreign key references codetable(id),
)
/*
6��λ������Ա����
��ϵ���	id	
��λid		deskId  �����λ������λid��
Ա��id		staffID ���Ա����Ϣ��(Ա�����)

*/
create table desk_staff
(
	id int identity(1,1)primary key,
	deskId int foreign key references desk(deskId),
	staffId int foreign key references staffInfo(staffId)
)

/*
7��������
����� 	kindId���� ����
���		kindName�������࣬�Ȳˣ����ˣ���Ʒ��
*/
create table kind
(
	kindId int identity(1,1)primary key,
	kindName varchar(50)
)
/*
8��Ʒ����
��Ʒ��� 	vegetableId ���� ����
���� 		vegetableName
�۸� 		price
����� 	kindId��� ����������ţ�
����ʱ�� 	makeTime��
���ȵȼ� 	priority
��Ʒͼ		pictureName ͼƬ�����ڱ������ݿ�ֻ��������
��󲢲˷���		int 
*/
create table vegetable
(
	vegetableId int identity(1,1)primary key,
	vegetableName varchar(20),
	price int,
	kindId int foreign key references kind(kindId),
	makeTime int,
	priority int,
	picture varbinary,
	maxCopies int
)

/*

9Ȩ�ޱ���
Ȩ�ޱ�� 	authorityId ���� ����
Ȩ������	authorityName
Ȩ�޵ȼ� 	int
Ȩ��·��	varchar

*/
create table authority
(
	authorityId int identity(1,1)primary key,
	authorityName varchar(20),
	authorityLevel int	,
	authorityUrl	varchar(50)
)
/*
10��ɫȨ�ޱ���
���		id		int������ ����
ְ���� 	partId����� ��ɫ����ְ���ţ�
Ȩ�ޱ�� 	authorityId	��� Ȩ�ޱ���Ȩ�ޱ�ţ�

*/
create table part_authority
(
	id int identity(1,1)primary key,
	partId int foreign key references part(partId),
	authorityId int foreign key references authority(authorityId)
)

/*
11��������
����ID 		OrderId int identity primary key, 	
����״̬	OrderStatus �������(�����У���� ��ȡ���������)
�����۸�	OrderPrice int not null,
�������	FoodNum int not null
���˷�ʽ 	varchar���ֽ�֧������΢�ţ�
����ʱ��	OrderDate datetime not null,
��λ		deskId ��� ��λ������λid��
*/
create table orders
(
	ordersId int identity(1,1)primary key,
	ordersStatus int  foreign key references codetable(id),
	ordersPrice int not null,
	FoodNum int not null,
	cost int foreign key references codetable(id),
	ordersTime datetime not null,
	deskId int foreign key references desk(deskId)
)
/*
12������˱���
�ֶ�		����
����ID		ordersId ��� ������������ID��
��ƷID		vegetableId ��� ��Ʒ������Ʒ��� ��
��Ʒ״̬	vegetableStatus �������(1�����ϣ�2��������0��δ��)		
*/
create table orders_vegetable
(
	ordersId int foreign key references orders(ordersId),
	vegetableId int foreign key references vegetable(vegetableId),
	vegetableStatus int foreign key references codetable(id)
)
/*
13�������
�ֶ�		����
id			suggestId
������		ordersId ��� ������������ID ��
��λid		deskId����� ��λ������λid��
������Ϣ 	suggest
*/
create table suggest
(
	suggestId int identity(1,1)primary key,
	ordersId int foreign key references orders(ordersId),
	deskId int foreign key references desk(deskId),
	suggest varchar(200)
)

/*
14�˵�����
�ֶ�		����
id			chargebackId ���� ����
������		ordersId����� ������������ID ��
ԭ��		reason
*/
create table chargeback
(
	chargebackId int identity(1,1)primary key,
	ordersId int foreign key references orders(ordersId),
	reason varchar(200)
)

/*
15�����:	
id		id  ���� ����
����		incomeTime
�ֽ����� 	cash
֧��������	alipay 
΢������	wechat
��������	ordersum
Ӫҵ������	Total
*/
create table income
(
	id int identity(1,1)primary key,
	incomeTime datetime,
	cash int,
	alipay int,
	wechat int,
	ordersum int,
	total int
)


