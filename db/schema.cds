namespace bookstore.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = ID;
}
entity Books : cuid, managed {
    title    : String;
    author   : UUID;
    chapters : Composition of many Chapters
                   on chapters.book = $self;
}

entity Chapters : cuid, managed {
    book   : Association to Books;
    title  : String;
    number : Integer;
    status : String;
}
