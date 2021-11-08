À
VC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Base\DomainEntity.cs
	namespace 	
Domain
 
. 
Entities 
. 
Base 
{ 
public 

class 
DomainEntity 
{ 
}  !
} Ï
TC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Base\EntityBase.cs
	namespace 	
Domain
 
. 
Entities 
. 
Base 
{ 
public 

class 

EntityBase 
< 
T 
> 
:  
DomainEntity! -
,- .
IEntityBase/ :
<: ;
T; <
>< =
{ 
public 
virtual 
T 
Id 
{ 
get !
;! "
set# &
;& '
}( )
=* +
default, 3
!3 4
;4 5
} 
} ì
UC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Base\IEntityBase.cs
	namespace 	
Domain
 
. 
Entities 
. 
Base 
{ 
public 

	interface 
IEntityBase  
<  !
T! "
>" #
{ 
T 	
Id
 
{ 
get 
; 
set 
; 
} 
} 
} ¸
IC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Cell.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
Cell

 
:

 

EntityBase

 !
<

! "
int

" %
>

% &
{ 
public 
int 
Number 
{ 
get 
;  
set! $
;$ %
}& '
public 
bool 
Busy 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
=) *
default+ 2
!2 3
;3 4
public 
void 
ChangeOccupation $
($ %
)% &
{ 	
Busy 
= 
! 
Busy 
; 
} 	
} 
} ø
PC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\CellVehicle.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
CellVehicle

 
:

 

EntityBase

 )
<

) *
int

* -
>

- .
{ 
public 
Cell 
Cell 
{ 
get 
; 
set  #
;# $
}% &
public 
Vehicle 
Vehicle 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	EntryDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
DepartureDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
State 
{ 
get 
;  
set! $
;$ %
}& '
=( )
true* .
;. /
public 
int 
GetDaysBetwenDates %
(% &
)& '
{ 	
var  
vehicleTimeInParking $
=% &
GetParkingTime' 5
(5 6
)6 7
;7 8
return  
vehicleTimeInParking '
.' (
Days( ,
;, -
} 	
public 
int 
GetHoursBetwenDates &
(& '
)' (
{ 	
var  
vehicleTimeInParking $
=% &
GetParkingTime' 5
(5 6
)6 7
;7 8
return  
vehicleTimeInParking '
.' (
Hours( -
;- .
} 	
private 
TimeSpan 
GetParkingTime '
(' (
)( )
=>* ,
DepartureDate- :
-; <
	EntryDate= F
;F G
public   
void   
SetEntryDate    
(    !
)  ! "
{!! 	
	EntryDate"" 
="" 
DateTime""  
.""  !
Now""! $
;""$ %
}## 	
public%% 
void%% 
SetDepartureDate%% $
(%%$ %
)%%% &
{&& 	
DepartureDate'' 
='' 
DateTime'' $
.''$ %
Now''% (
;''( )
}(( 	
public** 
void** 
ChangeState** 
(**  
)**  !
{++ 	
State,, 
=,, 
!,, 
State,, 
;,, 
}-- 	
}// 
}00 ³7
SC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\InvoiceParking.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
InvoiceParking

 
:

  

EntityBase

! +
<

+ ,
int

, /
>

/ 0
{ 
const 
int (
CYLINDERS_MAXIMUN_MOTORCYCLE .
=/ 0
$num1 4
;4 5
public 
double 
SurchangeValue $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
double 
Subtotal 
{  
get! $
;$ %
set& )
;) *
}* +
public 
double 

TotalValue  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
CellVehicle 
CellVehicle &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
default7 >
!> ?
;? @
public 
ParkingValues 
ParkingValues *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
default; B
!B C
;C D
public 
void 
CalculateTotalValue '
(' (
)( )
{ 	
if 
( 
CellVehicle 
. 
Vehicle #
.# $
IsMotorcycle$ 0
(0 1
)1 2
)2 3)
CalculateTotalMotorcycleValue -
(- .
). /
;/ 0
else "
CalculateTotalValueCar &
(& '
)' (
;( )
} 	
public 
void )
CalculateTotalMotorcycleValue 1
(1 2
)2 3
{ 	
int 
numberHours 
= 
CellVehicle )
.) *
GetHoursBetwenDates* =
(= >
)> ?
;? @
int 

numberDays 
= 
CellVehicle (
.( )
GetDaysBetwenDates) ;
(; <
)< =
;= >
if 
( 
IsChargePerHour 
(  
)  !
)! "
Subtotal 
= 
ParkingValues )
.) *
MotorcycleHourValue* =
*> ?
numberHours@ K
;K L
if   
(   

numberDays   
==   
$num   
&&    "
numberHours  # .
>=  / 1
$num  2 3
)  3 4
{!! 
Subtotal"" 
="" 
ParkingValues"" (
.""( )
DayMotorcycleValue"") ;
;""; <
SurchangeValue## 
=##  
ParkingValues##! .
.##. /
ValueSurchange##/ =
;##= >
}$$ 
else%% 
{&& 
if'' 
('' 
numberHours'' 
>=''  "
$num''# $
)''$ %
{(( 
Subtotal)) 
=)) 

numberDays)) )
*))* +
ParkingValues)), 9
.))9 :
DayMotorcycleValue)): L
;))L M
}** 
else++ 
{,, 
Subtotal-- 
=-- 

numberDays-- )
*--* +
ParkingValues--, 9
.--9 :
DayMotorcycleValue--: L
+--M N
numberHours--O Z
*--[ \
ParkingValues--] j
.--j k
MotorcycleHourValue--k ~
;--~ 
}.. 
if// 
(// 
HasSuerchange//  
(//  !
)//! "
)//" #
SurchangeValue00 "
=00# $

numberDays00% /
*000 1
ParkingValues002 ?
.00? @
ValueSurchange00@ N
;00N O
}11 

TotalValue22 
=22 
Subtotal22 !
+22" #
SurchangeValue22$ 2
;222 3
}33 	
public55 
void55 "
CalculateTotalValueCar55 *
(55* +
)55+ ,
{66 	
int77 
numberHours77 
=77 
CellVehicle77 )
.77) *
GetHoursBetwenDates77* =
(77= >
)77> ?
;77? @
int88 

numberDays88 
=88 
CellVehicle88 (
.88( )
GetDaysBetwenDates88) ;
(88; <
)88< =
;88= >
if99 
(99 
IsChargePerHour99 
(99  
)99  !
)99! "

TotalValue:: 
=:: 
ParkingValues:: *
.::* +
CarHourValue::+ 7
*::8 9
numberHours::: E
;::E F
if;; 
(;; 

numberDays;; 
==;; 
$num;; 
&&;;  "
numberHours;;# .
>=;;/ 1
$num;;2 3
);;3 4
Subtotal<< 
=<< 
ParkingValues<< (
.<<( )
CarDayValue<<) 4
;<<4 5
else== 
{>> 
if?? 
(?? 
numberHours?? 
>=??  "
$num??# $
)??$ %
{@@ 

numberDaysAA 
+=AA !
$numAA" #
;AA# $
SubtotalBB 
=BB 

numberDaysBB )
*BB* +
ParkingValuesBB, 9
.BB9 :
CarDayValueBB: E
;BBE F
}CC 
elseDD 
SubtotalEE 
=EE 

numberDaysEE )
*EE* +
ParkingValuesEE, 9
.EE9 :
CarDayValueEE: E
+EEF G
numberHoursEEH S
*EET U
ParkingValuesEEV c
.EEc d
CarHourValueEEd p
;EEp q
}FF 

TotalValueGG 
=GG 
SubtotalGG !
;GG! "
}HH 	
privateJJ 
boolJJ 
IsChargePerHourJJ $
(JJ$ %
)JJ% &
{KK 	
returnLL 
CellVehicleLL 
.LL 
GetHoursBetwenDatesLL 2
(LL2 3
)LL3 4
<LL5 6
$numLL7 8
&&LL9 ;
CellVehicleLL< G
.LLG H
GetDaysBetwenDatesLLH Z
(LLZ [
)LL[ \
==LL] _
$numLL` a
;LLa b
}MM 	
publicOO 
boolOO 
HasSuerchangeOO !
(OO! "
)OO" #
{PP 	
ifQQ 
(QQ 
CellVehicleQQ 
.QQ 
VehicleQQ #
.QQ# $
IsMotorcycleQQ$ 0
(QQ0 1
)QQ1 2
)QQ2 3
returnRR 
CellVehicleRR "
.RR" #
VehicleRR# *
.RR* +
	CylindersRR+ 4
>RR5 6(
CYLINDERS_MAXIMUN_MOTORCYCLERR7 S
;RRS T
elseSS 
returnTT 
falseTT 
;TT 
}UU 	
}WW 
}XX Š
LC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Parking.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
Parking

 
:

 

EntityBase

 $
<

$ %
int

% (
>

( )
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
default+ 2
!2 3
;3 4
public 
List 
< 
Cell 
> 
Cells 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
default0 7
!7 8
;8 9
public 
bool 
CellAvailable !
(! "
string" (
type) -
)- .
{ 	
return 
Cells 
. 
Any 
( 
c 
=> !
c# $
.$ %
Type% )
==* ,
type. 2
)2 3
;3 4
} 	
public 
Cell 
? 
GetCellAvailable %
(% &
string& ,
type- 1
)1 2
{ 	
return 
Cells 
. 
FirstOrDefault '
(' (
c( )
=>* ,
c- .
.. /
Busy/ 3
==4 6
false7 <
&&= ?
c@ A
.A B
TypeB F
.F G
EqualsG M
(M N
typeN R
)R S
)S T
;T U
} 	
} 
}  	
RC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\ParkingValues.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
ParkingValues

 
:

 

EntityBase

  *
<

* +
int

+ .
>

. /
{ 
public 
double 
MotorcycleHourValue )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
double 
DayMotorcycleValue (
{) *
get+ .
;. /
set/ 2
;2 3
}4 5
public 
double 
CarHourValue "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
double 
CarDayValue !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
double 
ValueSurchange $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Ã
KC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Person.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Person 
: 

EntityBase $
<$ %
Guid% )
>) *
{ 
const 
int 

TOTAL_DAYS 
= 
$num "
;" #
const		 
int		 
MINIMAL_AGE		 
=		 
$num		  "
;		" #
public

 
string

 
	FirstName

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
default

0 7
!

7 8
;

8 9
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
default/ 6
!6 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
default, 3
!3 4
;4 5
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Person 
( 
string 
	firstName &
,& '
string( .
lastName/ 7
,7 8
string9 ?
email@ E
,E F
DateTimeG O
dateOfBirthP [
)[ \
{ 	
	FirstName 
= 
	firstName !
;! "
LastName 
= 
lastName 
;  
Email 
= 
email 
; 
DateOfBirth 
= 
dateOfBirth %
;% &
} 	
public 
Person 
( 
) 
{ 	
} 	
public 
bool 

IsUnderAge 
=> !
(" #
DateTime# +
.+ ,
Now, /
./ 0
Subtract0 8
(8 9
DateOfBirth9 D
)D E
.E F
	TotalDaysF O
/P Q

TOTAL_DAYSR \
)\ ]
<^ _
MINIMAL_AGE` k
;k l
} 
} Ê
LC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Entities\Vehicle.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 

class

 
Vehicle

 
:

 

EntityBase

 $
<

$ %
int

% (
>

( )
{ 
public 
string 
Plaque 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
default- 4
!4 5
;5 6
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
=) *
default+ 2
!2 3
;3 4
public 
int 
	Cylinders 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Vehicle 
( 
string 
type "
," #
string$ *
plaque+ 1
,1 2
int3 6
	cylinders7 @
)@ A
{ 	
Type 
= 
type 
; 
Plaque 
= 
plaque 
; 
	Cylinders 
= 
	cylinders !
;! "
} 	
public 
Vehicle 
( 
) 
{ 	
} 	
public 
bool 
IsMotorcycle  
(  !
)! "
=># %
Type& *
.* +
Equals+ 1
(1 2
$str2 ?
)? @
;@ A
} 
} ‹
SC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Exceptions\AppException.cs
	namespace 	
Domain
 
. 
	Exception 
{ 
[ 
Serializable 
] 
public 

class 
AppException 
: 
System  &
.& '
	Exception' 0
{ 
public 
AppException 
( 
) 
{ 
}  !
public 
AppException 
( 
string "
message# *
)* +
:, -
base. 2
(2 3
message3 :
): ;
{< =
}> ?
public 
AppException 
( 
string "
message# *
,* +
System, 2
.2 3
	Exception3 <
inner= B
)B C
:D E
baseF J
(J K
messageK R
,R S
innerT Y
)Y Z
{[ \
}] ^
	protected		 
AppException		 
(		 
System

 
.

 
Runtime

 
.

 
Serialization

 (
.

( )
SerializationInfo

) :
info

; ?
,

? @
System 
. 
Runtime 
. 
Serialization (
.( )
StreamingContext) 9
context: A
)A B
:C D
baseE I
(I J
infoJ N
,N O
contextP W
)W X
{Y Z
}[ \
} 
} Å
lC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Exceptions\CellVehicle\CellNotAvailableException.cs
	namespace 	
Domain
 
. 
	Exception 
{ 
[ 
Serializable 
] 
public 

class %
CellNotAvailableException *
:+ ,
AppException- 9
{ 
public %
CellNotAvailableException (
(( )
)) *
{+ ,
}- .
public %
CellNotAvailableException (
(( )
string) /
message0 7
)7 8
:9 :
base; ?
(? @
message@ G
)G H
{I J
}K L
public %
CellNotAvailableException (
(( )
string) /
message0 7
,7 8
System9 ?
.? @
	Exception@ I
innerJ O
)O P
:Q R
baseS W
(W X
messageX _
,_ `
innera f
)f g
{h i
}j k
	protected		 %
CellNotAvailableException		 +
(		+ ,
System

 
.

 
Runtime

 
.

 
Serialization

 (
.

( )
SerializationInfo

) :
info

; ?
,

? @
System 
. 
Runtime 
. 
Serialization (
.( )
StreamingContext) 9
context: A
)A B
:C D
baseE I
(I J
infoJ N
,N O
contextP W
)W X
{Y Z
}[ \
} 
} ­
hC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Exceptions\CellVehicle\PickAndPlateException.cs
	namespace 	
Domain
 
. 
	Exception 
{ 
[ 
Serializable 
] 
public 

class !
PickAndPlateException &
:& '
AppException( 4
{ 
public !
PickAndPlateException $
($ %
)% &
{' (
}) *
public !
PickAndPlateException $
($ %
string% +
message, 3
)3 4
:5 6
base7 ;
(; <
message< C
)C D
{E F
}G H
public !
PickAndPlateException $
($ %
string% +
message, 3
,3 4
System5 ;
.; <
	Exception< E
innerF K
)K L
:M N
baseO S
(S T
messageT [
,[ \
inner] b
)b c
{d e
}f g
	protected		 !
PickAndPlateException		 '
(		' (
System

 
.

 
Runtime

 
.

 
Serialization

 (
.

( )
SerializationInfo

) :
info

; ?
,

? @
System 
. 
Runtime 
. 
Serialization (
.( )
StreamingContext) 9
context: A
)A B
:C D
baseE I
(I J
infoJ N
,N O
contextP W
)W X
{Y Z
}[ \
} 
} 
_C:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Exceptions\Person\UnderAgeException.cs
	namespace 	
Domain
 
. 
	Exception 
{ 
[ 
Serializable 
] 
public 

class 
UnderAgeException "
:# $
AppException% 1
{ 
public 
UnderAgeException  
(  !
)! "
{# $
}% &
public 
UnderAgeException  
(  !
string! '
message( /
)/ 0
:1 2
base3 7
(7 8
message8 ?
)? @
{A B
}C D
public 
UnderAgeException  
(  !
string! '
message( /
,/ 0
System1 7
.7 8
	Exception8 A
innerB G
)G H
:I J
baseK O
(O P
messageP W
,W X
innerY ^
)^ _
{` a
}b c
	protected		 
UnderAgeException		 #
(		# $
System

 
.

 
Runtime

 
.

 
Serialization

 (
.

( )
SerializationInfo

) :
info

; ?
,

? @
System 
. 
Runtime 
. 
Serialization (
.( )
StreamingContext) 9
context: A
)A B
:C D
baseE I
(I J
infoJ N
,N O
contextP W
)W X
{Y Z
}[ \
} 
} †
TC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Ports\IGenericRepository.cs
	namespace 	
Domain
 
. 
Ports 
{ 
public 

	interface 
IGenericRepository '
<' (
E( )
>) *
:+ ,
IDisposable- 8
where 
E 
: 
Entities 
. 
Base 
. 
DomainEntity +
{ 
Task 
< 
IEnumerable 
< 
E 
> 
> 
GetAsync %
(% &

Expression& 0
<0 1
Func1 5
<5 6
E6 7
,7 8
bool9 =
>= >
>> ?
?? @
filterA G
=H I
nullJ N
,N O
Func		 
<		 

IQueryable		 #
<		# $
E		$ %
>		% &
,		& '
IOrderedQueryable		( 9
<		9 :
E		: ;
>		; <
>		< =
?		= >
orderBy		? F
=		G H
null		I M
,		M N
string		O U#
includeStringProperties		V m
=		n o
$str		p r
,		r s
bool

 

isTracking

 #
=

$ %
false

& +
)

+ ,
;

, -
Task 
< 
IEnumerable 
< 
E 
> 
> 
GetAsync %
(% &

Expression& 0
<0 1
Func1 5
<5 6
E6 7
,7 8
bool9 =
>= >
>> ?
?? @
filterA G
=H I
nullJ N
,N O
Func 
< 

IQueryable 
< 
E 
> 
, 
IOrderedQueryable  1
<1 2
E2 3
>3 4
>4 5
?5 6
orderBy7 >
=? @
nullA E
,E F
bool 

isTracking 
= 
false $
,$ %
params& ,

Expression- 7
<7 8
Func8 <
<< =
E= >
,> ?
object@ F
>F G
>G H
[H I
]I J#
includeObjectPropertiesK b
)b c
;c d
Task 
< 
E 
> 
GetByIdAsync 
( 
object #
id$ &
)& '
;' (
Task 
< 
E 
> 
AddAsync 
( 
E 
entity !
)! "
;" #
Task 
UpdateAsync 
( 
E 
entity !
)! "
;" #
Task 
DeleteAsync 
( 
E 
entity !
)! "
;" #
Task 
< 
bool 
> 
Exist 
( 

Expression #
<# $
Func$ (
<( )
E) *
,* +
bool, 0
>0 1
>1 2
filter3 9
)9 :
;: ;
} 
} ŒT
WC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Services\CellVehicleService.cs
	namespace 	
Domain
 
. 
Services 
{ 
[ 
DomainService 
] 
public 

class 
CellVehicleService #
{		 
readonly

 
IGenericRepository

 #
<

# $
CellVehicle

$ /
>

/ 0"
_repositoryCellVehicle

1 G
;

G H
readonly 
IGenericRepository #
<# $
Parking$ +
>+ ,
_repositoryParking- ?
;? @
readonly 
IGenericRepository #
<# $
Vehicle$ +
>+ ,
_repositoryVehicle- ?
;? @
readonly 
IGenericRepository #
<# $
Cell$ (
>( )
_repositoryCell* 9
;9 :
private 
List 
< 
int 
> 
ValidNumbersOddDays -
=. /
new0 3
(3 4
)4 5
{6 7
$num8 9
,9 :
$num; <
,< =
$num> ?
,? @
$numA B
,B C
$numD E
}F G
;G H
private 
List 
< 
int 
>  
ValidNumbersEvenDays .
=/ 0
new1 4
(4 5
)5 6
{7 8
$num9 :
,: ;
$num< =
,= >
$num? @
,@ A
$numB C
,C D
$numE F
}G H
;H I
public 
CellVehicleService !
(! "
IGenericRepository 
< 
CellVehicle *
>* +

repository, 6
,6 7
IGenericRepository 
< 
Parking &
>& '
repositoryParking( 9
,9 :
IGenericRepository 
< 
Vehicle &
>& '
repositoryVehicle( 9
,9 :
IGenericRepository 
< 
Cell #
># $
repositoryCell% 3
) 
{ 	"
_repositoryCellVehicle "
=# $

repository% /
??0 2
throw3 8
new9 <!
ArgumentNullException= R
(R S
nameofS Y
(Y Z

repositoryZ d
)d e
,e f
$strg z
)z {
;{ |
_repositoryParking 
=  
repositoryParking! 2
??3 5
throw6 ;
new< ?!
ArgumentNullException@ U
(U V
nameofV \
(\ ]
repositoryParking] n
)n o
,o p
$str	q „
)
„ …
;
… †
_repositoryVehicle 
=  
repositoryVehicle! 2
??3 5
throw6 ;
new< ?!
ArgumentNullException@ U
(U V
nameofV \
(\ ]
repositoryVehicle] n
)n o
,o p
$str	q „
)
„ …
;
… †
_repositoryCell 
= 
repositoryCell ,
??- /
throw0 5
new6 9!
ArgumentNullException: O
(O P
nameofP V
(V W
repositoryCellW e
)e f
,f g
$strh {
){ |
;| }
} 	
public 
async 
Task 
< 
CellVehicle %
>% &*
RegisterEntranceToParkingAsync' E
(E F
VehicleF M
vehicleN U
)U V
{ 	
if!! 
(!! 
IsDayPickAndPlate!! !
(!!! "
vehicle!!" )
.!!) *
Plaque!!* 0
)!!0 1
)!!1 2
throw"" 
new"" !
PickAndPlateException"" /
(""/ 0
$str""0 f
)""f g
;""g h
var$$ 
parking$$ 
=$$ 
($$ 
await$$  
_repositoryParking$$! 3
.$$3 4
GetAsync$$4 <
($$< =
null$$= A
,$$A B
null$$C G
,$$G H
$str$$I P
)$$P Q
)$$Q R
.$$R S
ToList$$S Y
($$Y Z
)$$Z [
.$$[ \
First$$\ a
($$a b
)$$b c
;$$c d
if%% 
(%% 
!%% 
parking%% 
.%% 
CellAvailable%% &
(%%& '
vehicle%%' .
.%%. /
Type%%/ 3
)%%3 4
)%%4 5
throw&& 
new&& %
CellNotAvailableException&& 3
(&&3 4
$str&&4 H
)&&H I
;&&I J
if(( 
((( 
await(( 
ExistVehicleAsync(( '
(((' (
vehicle((( /
)((/ 0
)((0 1
vehicle)) 
=)) 
()) 
await))  
_repositoryVehicle))! 3
.))3 4
GetAsync))4 <
())< =
v))= >
=>))? A
v))B C
.))C D
Plaque))D J
.))J K
Equals))K Q
())Q R
vehicle))R Y
.))Y Z
Plaque))Z `
)))` a
)))a b
)))b c
.))c d
First))d i
())i j
)))j k
;))k l
var++ 
cell++ 
=++ 
parking++ 
.++ 
GetCellAvailable++ /
(++/ 0
vehicle++0 7
.++7 8
Type++8 <
)++< =
;++= >
var,, 
anotherCell,, 
=,, 
await,, #
_repositoryCell,,$ 3
.,,3 4
GetByIdAsync,,4 @
(,,@ A
cell,,A E
.,,E F
Id,,F H
),,H I
;,,I J
anotherCell-- 
.-- 
ChangeOccupation-- (
(--( )
)--) *
;--* +
await.. 
_repositoryCell.. !
...! "
UpdateAsync.." -
(..- .
anotherCell... 9
)..9 :
;..: ;
var// 
cellVehicle// 
=// 
new// !
CellVehicle//" -
(//- .
)//. /
;/// 0
cellVehicle00 
.00 
Cell00 
=00 
anotherCell00 *
;00* +
cellVehicle11 
.11 
Vehicle11 
=11  !
vehicle11" )
;11) *
cellVehicle22 
.22 
SetEntryDate22 $
(22$ %
)22% &
;22& '
return33 
await33 "
_repositoryCellVehicle33 /
.33/ 0
AddAsync330 8
(338 9
cellVehicle339 D
)33D E
;33E F
}44 	
public66 
async66 
Task66 
CheckOutAsycn66 '
(66' (
int66( +
cellVehicleId66, 9
)669 :
{77 	
var88 
cellVehicle88 
=88 
(88 
await88 $"
_repositoryCellVehicle88% ;
.88; <
GetAsync88< D
(88D E
cv88E G
=>88H J
cv88K M
.88M N
Id88N P
==88Q S
cellVehicleId88T a
,88a b
null88c g
,88g h
$str88i o
)88o p
)88p q
.88q r
First88r w
(88w x
)88x y
;88y z
cellVehicle99 
.99 
Cell99 
.99 
ChangeOccupation99 -
(99- .
)99. /
;99/ 0
cellVehicle:: 
.:: 
SetDepartureDate:: (
(::( )
)::) *
;::* +
cellVehicle;; 
.;; 
ChangeState;; #
(;;# $
);;$ %
;;;% &
await<< "
_repositoryCellVehicle<< (
.<<( )
UpdateAsync<<) 4
(<<4 5
cellVehicle<<5 @
)<<@ A
;<<A B
}== 	
public?? 
bool?? 
IsDayPickAndPlate?? &
(??& '
string??' -
plate??. 3
)??3 4
{@@ 	
intAA 
lastPlateNumberAA 
=AA  !
GetLastPlateNumberAA" 4
(AA4 5
plateAA5 :
)AA: ;
;AA; <
ifBB 
(BB 
	IsDayPairBB 
(BB 
)BB 
)BB 
returnCC  
ValidNumbersEvenDaysCC +
.CC+ ,
AnyCC, /
(CC/ 0
dCC0 1
=>CC2 4
dCC5 6
.CC6 7
EqualsCC7 =
(CC= >
lastPlateNumberCC> M
)CCM N
)CCN O
;CCO P
elseDD 
returnEE 
ValidNumbersOddDaysEE *
.EE* +
AnyEE+ .
(EE. /
dEE/ 0
=>EE1 3
dEE4 5
.EE5 6
EqualsEE6 <
(EE< =
lastPlateNumberEE= L
)EEL M
)EEM N
;EEN O
}FF 	
privateHH 
intHH 
GetLastPlateNumberHH '
(HH' (
stringHH( .
plateHH/ 4
)HH4 5
=>HH6 8
ConvertHH9 @
.HH@ A
ToInt32HHA H
(HHH I
plateHHI N
.HHN O
	SubstringHHO X
(HHX Y
plateHHY ^
.HH^ _
LengthHH_ e
-HHf g
$numHHh i
,HHi j
$numHHk l
)HHl m
)HHm n
;HHn o
privateJJ 
boolJJ 
	IsDayPairJJ 
(JJ  
)JJ  !
{KK 	
intLL 

currentDayLL 
=LL 
GetCurrentDayLL *
(LL* +
)LL+ ,
;LL, -
returnMM 

currentDayMM 
%MM 
$numMM  !
==MM" $
$numMM% &
;MM& '
}NN 	
privatePP 
intPP 
GetCurrentDayPP "
(PP" #
)PP# $
=>PP% '
DateTimePP( 0
.PP0 1
NowPP1 4
.PP4 5
DayPP5 8
;PP8 9
publicRR 
asyncRR 
TaskRR 
<RR 
boolRR 
>RR 
ExistVehicleAsyncRR  1
(RR1 2
VehicleRR2 9
vehicleRR: A
)RRA B
{SS 	
returnTT 
awaitTT 
_repositoryVehicleTT +
.TT+ ,
ExistTT, 1
(TT1 2
vTT2 3
=>TT4 6
vTT7 8
.TT8 9
PlaqueTT9 ?
.TT? @
EqualsTT@ F
(TTF G
vehicleTTG N
.TTN O
PlaqueTTO U
)TTU V
)TTV W
;TTW X
}UU 	
}WW 
}XX €
[C:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Services\DomainServiceAttribute.cs
	namespace 	
Domain
 
. 
Services 
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
)* +
]+ ,
public 

sealed 
class "
DomainServiceAttribute .
:/ 0
	Attribute1 :
{ 
} 
}		 €
RC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Domain\Services\PersonService.cs
	namespace 	
Domain
 
. 
Services 
{ 
[ 
DomainService 
] 
public 

class 
PersonService 
{		 
readonly

 
IGenericRepository

 #
<

# $
Person

$ *
>

* +
_repository

, 7
;

7 8
public 
PersonService 
( 
IGenericRepository /
</ 0
Person0 6
>6 7

repository8 B
)B C
{ 	
_repository 
= 

repository $
??% '
throw( -
new. 1!
ArgumentNullException2 G
(G H
nameofH N
(N O

repositoryO Y
)Y Z
,Z [
$str\ o
)o p
;p q
} 	
public 
async 
Task 
< 
Person  
>  !
RegisterPersonAsync" 5
(5 6
Person6 <
person= C
)C D
{ 	
if 
( 
! 
person 
. 

IsUnderAge "
)" #
{ 
return 
await 
_repository (
.( )
AddAsync) 1
(1 2
person2 8
)8 9
;9 :
} 
throw 
new 
UnderAgeException '
(' (
$str( i
)i j
;j k
} 	
public 
async 
Task 
< 
Person  
>  !
Get" %
(% &
)' (
{ 	
return 
( 
await 
_repository %
.% &
GetAsync& .
(. /
)/ 0
)0 1
.1 2
ToList2 8
(8 9
)9 :
.: ;
First; @
(@ A
)A B
;B C
} 	
} 
} 