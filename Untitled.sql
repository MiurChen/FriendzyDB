create table `ROLE` (
ID int not null auto_increment comment '編號',
`NAME` varchar(100) not null comment '角色名稱',
primary key (ID)
) comment = '角色資料表';
insert into ROLE(ID, NAME)
values (1,'ADMIN'), (2,'USER');