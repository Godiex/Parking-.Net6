–
nC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Commands\CellVehicleCreateCommand.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{ 
public 

record $
CellVehicleCreateCommand *
(* +
[ 	
Required	 
] 
string 
Plaque  
,  !
[ 	
Required	 
] 
int 
	Cylinders  
,  !
[		 	
Required			 
]		 
string		 
Type		 
)

 
:

 
IRequest

 
;

 
} ⁄
nC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Commands\CellVehicleCreateHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{& '
public 

class $
CellVehicleCreateHandler )
:* +
AsyncRequestHandler, ?
<? @$
CellVehicleCreateCommand@ X
>X Y
{ 
private		 
readonly		 
CellVehicleService		 +
_CellVehicleService		, ?
;		? @
public $
CellVehicleCreateHandler '
(' (
CellVehicleService( :
cellVehicleService; M
)M N
{ 	
_CellVehicleService 
=  !
cellVehicleService" 4
??5 7
throw8 =
new> A!
ArgumentNullExceptionB W
(W X
nameofX ^
(^ _
cellVehicleService_ q
)q r
)r s
;s t
} 	
	protected 
override 
async  
Task! %
Handle& ,
(, -$
CellVehicleCreateCommand- E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
await 
_CellVehicleService %
.% &*
RegisterEntranceToParkingAsync& D
(D E
new 
Domain 
. 
Entities $
.$ %
Vehicle% ,
{ 
Type 
= 
request #
.# $
Type$ (
,( )
	Cylinders 
=  
request! (
.( )
	Cylinders) 2
,2 3
Plaque 
= 
request %
.% &
Plaque& ,
} 
) 
; 
} 	
} 
} ˆ
nC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Commands\CellVehicleUpdateCommand.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{% &
public 

record $
CellVehicleUpdateCommand *
(* +
[+ ,
Required, 4
]4 5
int6 9
Id: <
)< =
:> ?
IRequest@ H
;H I
} ¿
nC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Commands\CellVehicleUpdateHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{& '
public 

class $
CellVehicleUpdateHandler )
:* +
AsyncRequestHandler, ?
<? @$
CellVehicleUpdateCommand@ X
>X Y
{ 
private

 
readonly

 
CellVehicleService

 +
_CellVehicleService

, ?
;

? @
public $
CellVehicleUpdateHandler '
(' (
CellVehicleService( :
cellVehicleService; M
)M N
{ 	
_CellVehicleService 
=  !
cellVehicleService" 4
??5 7
throw8 =
new> A!
ArgumentNullExceptionB W
(W X
nameofX ^
(^ _
cellVehicleService_ q
)q r
)r s
;s t
} 	
	protected 
override 
async  
Task! %
Handle& ,
(, -$
CellVehicleUpdateCommand- E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
await 
_CellVehicleService %
.% &
CheckOutAsycn& 3
(3 4
request4 ;
.; <
Id< >
)> ?
;? @
} 	
} 
} Ò
ZC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\PersonProfile.cs
	namespace 	
Application
 
. 
Person 
{ 
public 

class 
CellVehicleProfile #
:$ %
Profile& -
{ 
public		 
CellVehicleProfile		 !
(		! "
)		" #
{

 	
	CreateMap 
< 
Domain 
. 
Entities %
.% &
InvoiceParking& 4
,4 5
	PersonDto6 ?
>? @
(@ A
)A B
.B C

ReverseMapC M
(M N
)N O
;O P
} 	
} 
} ˛
fC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Queries\InvoiceParkingDto.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{% &
public 

class 
InvoiceParkingDto "
{ 
public 
double 
SurchangeValue $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
double 
Subtotal 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 

TotalValue  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
InvoiceParkingDto  
(  !
)! "
{		 	
}

 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
CellDto 
CellDto 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
default/ 6
!6 7
;7 8
public 

VehicleDto 

VehicleDto $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
default5 <
!< =
;= >
} 
public 

class 
CellDto 
{ 
public 
CellDto 
( 
) 
{ 	
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
Number 
{ 
get 
;  
set! $
;$ %
}& '
public 
bool 
Busy 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
=) *
default+ 2
!2 3
;3 4
} 
public 

class 

VehicleDto 
{ 
public 

VehicleDto 
( 
) 
{   	
}!! 	
public## 
int## 
Id## 
{## 
get## 
;## 
set##  
;##  !
}##" #
public$$ 
string$$ 
Plaque$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
=$$+ ,
default$$- 4
!$$4 5
;$$5 6
public%% 
string%% 
Type%% 
{%% 
get%%  
;%%  !
set%%" %
;%%% &
}%%' (
=%%) *
default%%+ 2
!%%2 3
;%%3 4
public&& 
int&& 
	Cylinders&& 
{&& 
get&& "
;&&" #
set&&$ '
;&&' (
}&&) *
}'' 
})) É
hC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Queries\InvoiceParkingQuery.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{% &
public 

record 
InvoiceParkingQuery %
(% &
)& '
:( )
IRequest* 2
<2 3
List3 7
<7 8
InvoiceParkingDto8 I
>I J
>J K
;K L
} £
gC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\CellVehicle\Queries\PersonQueryHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{ 
public		 

class		 &
InvoiceParkingQueryHandler		 +
:		, -
IRequestHandler		. =
<		= >
InvoiceParkingQuery		> Q
,		Q R
List		S W
<		W X
InvoiceParkingDto		X i
>		i j
>		j k
{

 
private 
readonly 
IDbConnection &
_dapperSource' 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public &
InvoiceParkingQueryHandler )
() *
IDbConnection* 7
dapperSource8 D
,D E
IMapperF M
mapperN T
)T U
{ 	
_dapperSource 
= 
dapperSource (
;( )
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
List 
< 
InvoiceParkingDto 0
>0 1
>1 2
Handle3 9
(9 :
InvoiceParkingQuery: M
requestN U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
var 
query 
= 
await 
_dapperSource +
.+ ,%
QuerySingleOrDefaultAsync, E
<E F
DomainF L
.L M
EntitiesM U
.U V
CellV Z
>Z [
([ \
$str t
+u v
$str L
+M N
$str #
+$ %
$str 0
+1 2
$str &
+' (
$str +
+, -
$str )
)) *
;* +
return   
_mapper   
.   
Map   
<   
List   #
<  # $
InvoiceParkingDto  $ 5
>  5 6
>  6 7
(  7 8
query  8 =
)  = >
;  > ?
}!! 	
}$$ 
}%% »
dC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Commands\PersonCreateCommand.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{ 
public 

record 
PersonCreateCommand %
(% &
[ 	
Required	 
] 
string 
	FirstName #
,# $
[ 	
Required	 
] 
string 
LastName "
," #
[		 	
Required			 
]		 
string		 
Email		 
,		  
[

 	
Required

	 
]

 
DateTime

 
?

 
DateOfBirth

 (
) 
: 
IRequest 
; 
} ò
dC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Commands\PersonCreateHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{& '
public 

class 
PersonHandler 
:  
AsyncRequestHandler! 4
<4 5
PersonCreateCommand5 H
>H I
{ 
private		 
readonly		 
PersonService		 &
_PersonService		' 5
;		5 6
public 
PersonHandler 
( 
PersonService *
personService+ 8
)8 9
{ 	
_PersonService 
= 
personService *
??+ -
throw. 3
new4 7!
ArgumentNullException8 M
(M N
nameofN T
(T U
personServiceU b
)b c
)c d
;d e
} 	
	protected 
override 
async  
Task! %
Handle& ,
(, -
PersonCreateCommand- @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
await 
_PersonService  
.  !
RegisterPersonAsync! 4
(4 5
new 
Domain 
. 
Entities $
.$ %
Person% +
{ 
Email 
= 
request $
.$ %
Email% *
,* +
	FirstName 
=  
request! (
.( )
	FirstName) 2
,2 3
LastName 
= 
request  '
.' (
LastName( 0
,0 1
DateOfBirth  
=! "
request# *
.* +
DateOfBirth+ 6
.6 7
Value7 <
} 
) 
; 
} 	
} 
}   ∑
iC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Commands\PersonUpdateAsyncCommand.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{ 
public 

record $
PersonUpdateAsyncCommand *
(* +
[ 	
Required	 
] 
Guid 
Id 
, 
[ 	
Required	 
] 
string 
	FirstName #
,# $
[		 	
Required			 
]		 
string		 
LastName		 "
,		" #
[

 	
Required

	 
]

 
string

 
Email

 
,

  
[ 	
Required	 
] 
DateTime 
? 
DateOfBirth (
) 
: 
IRequest 
; 
} º
iC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Commands\PersonUpdateAsyncHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Commands %
{& '
public 

class $
PersonUpdateAsyncHandler )
:* +
AsyncRequestHandler, ?
<? @$
PersonUpdateAsyncCommand@ X
>X Y
{ 
private

 
readonly

 

IMessaging

 #

_messaging

$ .
;

. /
public $
PersonUpdateAsyncHandler '
(' (

IMessaging( 2
	messaging3 <
)< =
{ 	

_messaging 
= 
	messaging "
;" #
} 	
	protected 
override 
async  
Task! %
Handle& ,
(, -$
PersonUpdateAsyncCommand- E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
await 

_messaging 
. 
SendMessageAsync -
(- .
request. 5
,5 6
$str7 C
)C D
;D E
} 	
} 
} ⁄
UC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\PersonProfile.cs
	namespace 	
Application
 
. 
Person 
{ 
public 

class 
PersonProfile 
:  
Profile! (
{ 
public		 
PersonProfile		 
(		 
)		 
{

 	
	CreateMap 
< 
Domain 
. 
Entities %
.% &
Person& ,
,, -
	PersonDto. 7
>7 8
(8 9
)9 :
.: ;

ReverseMap; E
(E F
)F G
;G H
} 	
} 
} ¸

YC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Queries\PersonDto.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{% &
public 

class 
	PersonDto 
{ 
public 
	PersonDto 
( 
) 
{ 	
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
default0 7
!7 8
;8 9
public		 
string		 
LastName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
=		- .
default		/ 6
!		6 7
;		7 8
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
=

* +
default

, 3
!

3 4
;

4 5
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} å
[C:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Queries\PersonQuery.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{% &
public 

record 
PersonQuery 
( 
[ 
Required '
]' (
Guid) -
Id. 0
)0 1
:2 3
IRequest4 <
<< =
	PersonDto= F
>F G
;G H
} ƒ
bC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Person\Queries\PersonQueryHandler.cs
	namespace 	
Application
 
. 
Person 
. 
Queries $
{ 
public		 

class		 
PersonQueryHandler		 #
:		$ %
IRequestHandler		& 5
<		5 6
PersonQuery		6 A
,		A B
	PersonDto		C L
>		L M
{

 
private 
readonly 
IDbConnection &
_dapperSource' 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public 
PersonQueryHandler !
(! "
IDbConnection" /
dapperSource0 <
,< =
IMapper> E
mapperF L
)L M
{ 	
_dapperSource 
= 
dapperSource (
;( )
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
	PersonDto #
># $
Handle% +
(+ ,
PersonQuery, 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
_ 
= 
request 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
requestB I
)I J
,J K
$strL w
)w x
;x y
var 

personInfo 
= 
await "
_dapperSource# 0
.0 1%
QuerySingleOrDefaultAsync1 J
<J K
DomainK Q
.Q R
EntitiesR Z
.Z [
Person[ a
>a b
(b c
$str	c é
,
é è
new
ê ì
{
î ï
Id
ï ó
=
ò ô
request
ö °
.
° ¢
Id
¢ §
}
§ •
)
• ¶
;
¶ ß
return 
_mapper 
. 
Map 
< 
	PersonDto (
>( )
() *

personInfo* 4
)4 5
;5 6
} 	
} 
} √
QC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Application\Ports\IMessaging.cs
	namespace 	
Application
 
. 
Ports 
; 
public 
	interface 

IMessaging 
{ 
Task 
SendMessageAsync	 
( 
object  
o! "
," #
string$ *
queue+ 0
)0 1
;1 2
} 