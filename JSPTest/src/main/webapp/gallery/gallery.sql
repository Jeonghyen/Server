

create table tblGallery (
    seq number primary key,
    filename varchar2(100) not null, --하드 디스크에 저장된 이름
    subject varchar2(100) not null,
    regdate date default sysdate --업로드 시각
);

create sequence seqGallery;

--업무 질의

--쓰기
insert into tblgallery values (seqGallery.nextVal,'사진.jpg','사진', sysdate);
insert into tblgallery (seq, filename, subject) values (seqGallery.nextVal,'사진.jpg','사진');

--읽기
select * from tblgallery;

--수정
update tblgallery set subject='사진1' where seq=1;

--삭제
delete from tblgallery where seq = 1;

delete from tblgallery;

--파일명 가져오기

select subject from tblgallery where filename='06.png';




