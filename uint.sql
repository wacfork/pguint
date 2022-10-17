CREATE TYPE int1;

CREATE FUNCTION int1in(cstring) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'int1in';

CREATE FUNCTION int1out(int1) RETURNS cstring
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'int1out';

CREATE FUNCTION int1recv(internal) RETURNS int1
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'int1recv';

CREATE FUNCTION int1send(int1) RETURNS bytea
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'int1send';


CREATE TYPE int1 (
    INPUT = int1in,
    OUTPUT = int1out,
    RECEIVE = int1recv,
    SEND = int1send,
    INTERNALLENGTH = 1,
    PASSEDBYVALUE,
    ALIGNMENT = char
);

CREATE CAST (double precision AS int1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (numeric AS int1) WITH INOUT AS ASSIGNMENT;
CREATE CAST (real AS int1) WITH INOUT AS ASSIGNMENT;

CREATE CAST (int1 AS double precision) WITH INOUT AS IMPLICIT;
CREATE CAST (int1 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (int1 AS real) WITH INOUT AS IMPLICIT;


CREATE TYPE u8;

CREATE FUNCTION u8in(cstring) RETURNS u8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u8in';

CREATE FUNCTION u8out(u8) RETURNS cstring
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u8out';

CREATE FUNCTION u8recv(internal) RETURNS u8
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u8recv';

CREATE FUNCTION u8send(u8) RETURNS bytea
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u8send';

CREATE TYPE u8 (
    INPUT = u8in,
    OUTPUT = u8out,
    RECEIVE = u8recv,
    SEND = u8send,
    INTERNALLENGTH = 1,
    PASSEDBYVALUE,
    ALIGNMENT = char
);

CREATE CAST (double precision AS u8) WITH INOUT AS ASSIGNMENT;
CREATE CAST (numeric AS u8) WITH INOUT AS ASSIGNMENT;
CREATE CAST (real AS u8) WITH INOUT AS ASSIGNMENT;

CREATE CAST (u8 AS double precision) WITH INOUT AS IMPLICIT;
CREATE CAST (u8 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (u8 AS real) WITH INOUT AS IMPLICIT;


CREATE TYPE u16;

CREATE FUNCTION u16in(cstring) RETURNS u16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u16in';

CREATE FUNCTION u16out(u16) RETURNS cstring
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u16out';

CREATE FUNCTION u16recv(internal) RETURNS u16
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u16recv';

CREATE FUNCTION u16send(u16) RETURNS bytea
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u16send';

CREATE TYPE u16 (
    INPUT = u16in,
    OUTPUT = u16out,
    RECEIVE = u16recv,
    SEND = u16send,
    INTERNALLENGTH = 2,
    PASSEDBYVALUE,
    ALIGNMENT = int2
);

CREATE CAST (double precision AS u16) WITH INOUT AS ASSIGNMENT;
CREATE CAST (numeric AS u16) WITH INOUT AS ASSIGNMENT;
CREATE CAST (real AS u16) WITH INOUT AS ASSIGNMENT;

CREATE CAST (u16 AS double precision) WITH INOUT AS IMPLICIT;
CREATE CAST (u16 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (u16 AS real) WITH INOUT AS IMPLICIT;


CREATE TYPE u32;

CREATE FUNCTION u32in(cstring) RETURNS u32
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u32in';

CREATE FUNCTION u32out(u32) RETURNS cstring
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u32out';

CREATE FUNCTION u32recv(internal) RETURNS u32
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u32recv';

CREATE FUNCTION u32send(u32) RETURNS bytea
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u32send';

CREATE TYPE u32 (
    INPUT = u32in,
    OUTPUT = u32out,
    RECEIVE = u32recv,
    SEND = u32send,
    INTERNALLENGTH = 4,
    PASSEDBYVALUE,
    ALIGNMENT = int4
);

CREATE CAST (double precision AS u32) WITH INOUT AS ASSIGNMENT;
CREATE CAST (numeric AS u32) WITH INOUT AS ASSIGNMENT;
CREATE CAST (real AS u32) WITH INOUT AS ASSIGNMENT;

CREATE CAST (u32 AS double precision) WITH INOUT AS IMPLICIT;
CREATE CAST (u32 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (u32 AS real) WITH INOUT AS IMPLICIT;


CREATE TYPE u64;

CREATE FUNCTION bytea_u64(bytea) RETURNS u64 
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'bytea_u64';

CREATE FUNCTION u64in(cstring) RETURNS u64
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u64in';

CREATE FUNCTION u64out(u64) RETURNS cstring
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u64out';

CREATE FUNCTION u64recv(internal) RETURNS u64
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u64recv';

CREATE FUNCTION u64send(u64) RETURNS bytea
    IMMUTABLE
    STRICT
    LANGUAGE C
    AS '$libdir/uint', 'u64send';

CREATE TYPE u64 (
    INPUT = u64in,
    OUTPUT = u64out,
    RECEIVE = u64recv,
    SEND = u64send,
    INTERNALLENGTH = 8,
    PASSEDBYVALUE,  -- requires 64-bit
    ALIGNMENT = double
);

CREATE CAST (double precision AS u64) WITH INOUT AS ASSIGNMENT;
CREATE CAST (numeric AS u64) WITH INOUT AS ASSIGNMENT;
CREATE CAST (real AS u64) WITH INOUT AS ASSIGNMENT;

CREATE CAST (u64 AS double precision) WITH INOUT AS IMPLICIT;
CREATE CAST (u64 AS numeric) WITH INOUT AS IMPLICIT;
CREATE CAST (u64 AS real) WITH INOUT AS IMPLICIT;
CREATE CAST (bytea AS u64) WITH FUNCTION bytea_u64 AS IMPLICIT;

CREATE FUNCTION int1um(int1) RETURNS int1 IMMUTABLE STRICT LANGUAGE C AS '$libdir/uint', 'int1um';

CREATE OPERATOR - (
   PROCEDURE = int1um,
   RIGHTARG = int1
);
