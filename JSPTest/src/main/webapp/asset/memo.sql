 create table tblMemo (
    seq number primary key,
    subject varchar2(100) not null,
    content varchar2(1000) not null,
    name varchar2(30) not null,
    pw varchar2(30) not null,
    regdate date default sysdate not null
 );
 
 create sequence seqMemo;
 
 drop table tblMemo; 
 drop sequence seqMemo;
 
 insert into tblMemo(seq, subject, content, name, pw, regdate) 
    values(seqMemo.nextVal, '메모입니다.', '내용입니다.', '홍길동', '1111', default);
 
select * from tblMemo order by seq desc;

select count(*) from tblMemo where seq = 1 and pw = '1111';

update tblMemo set subject = '', content='', name='' where seq = 1;

delete from tblMemo where seq = 1;



commit;


