

drop table tblAddress;
drop sequence seqAddress;

create table tblAddress(
    seq number primary key,
    name varchar2(30) not null,
    age varchar2(3) not null,
    address varchar2(300) not  null,
    gender char(1) not null check(gender in ('m', 'f')),
    tel varchar2(15) not null
);


create sequence seqAddress;

select * from tblAddress;


--쓰기
insert into tblAddress(seq, name, age, address, gender, tel)
    values (seqAddress.nextVal, '홍길동', 20, '서울시 강남구 역삼동' ,'m', '010-1234-1234');
    
--읽기
select * from tblAddress order by seq asc;

--수정 하기
update tblAddess set name='아무개', age=22, address='서울시 강동구 둔촌동',gender='f', tel='010-1111-111') where seq = 1;














