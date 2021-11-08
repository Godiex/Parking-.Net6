Ç
ZC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Api\Controllers\CellVehicleController.cs
	namespace 	
Api
 
. 
Controllers 
; 
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class !
CellVehicleController "
{ 
readonly 
	IMediator 
	_mediator  
=! "
default# *
!* +
;+ ,
public 
!
CellVehicleController  
(  !
	IMediator! *
mediator+ 3
)3 4
=>5 7
	_mediator8 A
=B C
mediatorD L
;L M
[ 
HttpPost 
] 
public 

async 
Task 
Post 
( $
CellVehicleCreateCommand 3
request4 ;
); <
=>= ?
await@ E
	_mediatorF O
.O P
SendP T
(T U
requestU \
)\ ]
;] ^
[ 
	HttpPatch 
( 
$str 
) 
] 
public 

async 
Task 
Update 
( 
int  
id! #
)# $
=>% '
await( -
	_mediator. 7
.7 8
Send8 <
(< =
new= @$
CellVehicleUpdateCommandA Y
(Y Z
idZ \
)\ ]
)] ^
;^ _
[ 
HttpGet 
] 
public 

async 
Task 
< 
List 
< 
InvoiceParkingDto ,
>, -
>- .
Get/ 2
(2 3
)3 4
=>5 7
await8 =
	_mediator> G
.G H
SendH L
(L M
newM P
InvoiceParkingQueryQ d
(d e
)e f
)f g
;g h
} ÿ
\C:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Api\Filters\AppExceptionFilterAttribute.cs
	namespace 	
Api
 
. 
Filters 
; 
[ 
AttributeUsage 
( 
AttributeTargets  
.  !
All! $
)$ %
]% &
public		 
sealed		 
class		 '
AppExceptionFilterAttribute		 /
:		0 1$
ExceptionFilterAttribute		2 J
{

 
private 
readonly 
ILogger 
< '
AppExceptionFilterAttribute 8
>8 9
_Logger: A
;A B
public 
'
AppExceptionFilterAttribute &
(& '
ILogger' .
<. /'
AppExceptionFilterAttribute/ J
>J K
loggerL R
)R S
{ 
_Logger 
= 
logger 
; 
} 
public 

override 
void 
OnException $
($ %
ExceptionContext% 5
context6 =
)= >
{ 
if 

( 
context 
!= 
null 
) 
{ 	
context 
. 
HttpContext 
.  
Response  (
.( )

StatusCode) 3
=4 5
context6 =
.= >
	Exception> G
switchH N
{ 
AppException 
=> 
(  !
(! "
int" %
)% &
HttpStatusCode& 4
.4 5

BadRequest5 ?
)? @
,@ A
_ 
=> 
( 
( 
int 
) 
HttpStatusCode )
.) *
InternalServerError* =
)= >
} 
; 
_Logger 
. 
LogError 
( 
context $
.$ %
	Exception% .
,. /
context0 7
.7 8
	Exception8 A
.A B
MessageB I
,I J
newK N
[N O
]O P
{Q R
contextS Z
.Z [
	Exception[ d
.d e

StackTracee o
}p q
)q r
;r s
var 
msg 
= 
new 
{   
context!! 
.!! 
	Exception!! !
.!!! "
Message!!" )
}"" 
;"" 
context$$ 
.$$ 
Result$$ 
=$$ 
new$$  
ObjectResult$$! -
($$- .
msg$$. 1
)$$1 2
;$$2 3
}%% 	
}&& 
}(( ¹
RC:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Api\PersistenceContextFactory.cs
	namespace 	
Api
 
{ 
public 

class %
PersistenceContextFactory *
:+ ,'
IDesignTimeDbContextFactory- H
<H I
PersistenceContextI [
>[ \
{ 
public		 
PersistenceContext		 !
CreateDbContext		" 1
(		1 2
string		2 8
[		8 9
]		9 :
args		; ?
)		? @
{

 	
var 
Config 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
. 
SetBasePath 
( 
	Directory &
.& '
GetCurrentDirectory' :
(: ;
); <
)< =
. 
AddJsonFile 
( 
$str /
)/ 0
. 
Build 
( 
) 
; 
var 
optionsBuilder 
=  
new! $#
DbContextOptionsBuilder% <
<< =
PersistenceContext= O
>O P
(P Q
)Q R
;R S
optionsBuilder 
. 
UseSqlServer '
(' (
Config( .
.. /
GetConnectionString/ B
(B C
$strC M
)M N
,N O
sqloptsP W
=>X Z
{ 
sqlopts 
. "
MigrationsHistoryTable .
(. /
$str/ B
,B C
ConfigD J
.J K
GetValueK S
<S T
stringT Z
>Z [
([ \
$str\ h
)h i
)i j
;j k
} 
) 
; 
return 
new 
PersistenceContext )
() *
optionsBuilder* 8
.8 9
Options9 @
,@ A
ConfigB H
)H I
;I J
} 	
} 
} Ð:
@C:\Users\diego.villa\Downloads\Proyectos\ADN\Back\Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
var 
config 

= 
builder 
. 
Configuration "
;" #
builder 
. 
Services 
. 
AddControllers 
(  
opts  $
=>% '
{ 
opts 
. 	
Filters	 
. 
Add 
( 
typeof 
( '
AppExceptionFilterAttribute 7
)7 8
)8 9
;9 :
} 
) 
; 
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 

AddMediatR 
( 
Assembly $
.$ %
Load% )
() *
$str* 7
)7 8
,8 9
typeof: @
(@ A
ProgramA H
)H I
.I J
AssemblyJ R
)R S
;S T
builder 
. 
Services 
. 
AddAutoMapper 
( 
Assembly '
.' (
Load( ,
(, -
$str- :
): ;
); <
;< =
builder 
. 
Services 
. 
AddDbContext 
< 
PersistenceContext 0
>0 1
(1 2
opt2 5
=>6 8
{ 
opt 
. 
UseSqlServer 
( 
config 
. 
GetConnectionString /
(/ 0
$str0 :
): ;
,; <
sqlopts= D
=>E G
{ 
sqlopts 
. "
MigrationsHistoryTable &
(& '
$str' :
,: ;
config< B
.B C
GetValueC K
<K L
stringL R
>R S
(S T
$strT `
)` a
)a b
;b c
}   
)   
;   
}!! 
)!! 
;!! 
builder## 
.## 
Services## 
.## 
AddHealthChecks##  
(##  !
)##! "
.##" #
AddSqlServer### /
(##/ 0
config##0 6
[##6 7
$str##7 S
]##S T
)##T U
;##U V
builder%% 
.%% 
Services%% 
.%% 

AddLogging%% 
(%% 
loggingBuilder%% *
=>%%+ -
loggingBuilder%%. <
.%%< =

AddSerilog%%= G
(%%G H
dispose%%H O
:%%O P
true%%Q U
)%%U V
)%%V W
;%%W X
builder'' 
.'' 
Services'' 
.'' 
AddPersistence'' 
(''  
config''  &
)''& '
.''' (
AddDomainServices''( 9
(''9 :
)'': ;
.''; <
AddRabbitSupport''< L
(''L M
config''M S
)''S T
;''T U
builder)) 
.)) 
Services)) 
.)) 
AddSwaggerGen)) 
()) 
c))  
=>))! #
{** 
c++ 
.++ 

SwaggerDoc++ 
(++ 
$str++ 
,++ 
new++ 
(++ 
)++ 
{++ 
Title++ $
=++% &
$str++' 2
,++2 3
Version++4 ;
=++< =
$str++> B
}++C D
)++D E
;++E F
},, 
),, 
;,, 
Log.. 
... 
Logger.. 

=.. 
new.. 
LoggerConfiguration.. $
(..$ %
)..% &
...& '
Enrich..' -
...- .
FromLogContext... <
(..< =
)..= >
.// 
WriteTo// 
.// 
Console// 
(// 
)// 
.CC 
CreateLoggerCC 
(CC 
)CC 
;CC 
varEE 
appEE 
=EE 	
builderEE
 
.EE 
BuildEE 
(EE 
)EE 
;EE 
ifGG 
(GG 
appGG 
.GG 
EnvironmentGG 
.GG 
IsDevelopmentGG !
(GG! "
)GG" #
)GG# $
{HH 
appII 
.II 

UseSwaggerII 
(II 
)II 
;II 
appJJ 
.JJ 
UseSwaggerUIJJ 
(JJ 
cJJ 
=>JJ 
cJJ 
.JJ 
SwaggerEndpointJJ +
(JJ+ ,
$strJJ, F
,JJF G
$strJJH S
)JJS T
)JJT U
;JJU V
}KK 
appMM 
.MM 

UseRoutingMM 
(MM 
)MM 
.MM 
UseHttpMetricsMM 
(MM  
)MM  !
.MM! "
UseEndpointsMM" .
(MM. /
	endpointsMM/ 8
=>MM9 ;
{NN 
	endpointsOO 
.OO 
MapGetOO 
(OO 
$strOO *
,OO* +
(OO, -
)OO- .
=>OO/ 1
newOO2 5
{OO6 7
versionOO8 ?
=OO@ A
$numOOB E
,OOE F
byOOG I
=OOJ K
$strOOL _
}OO` a
)OOa b
;OOb c
	endpointsPP 
.PP 

MapMetricsPP 
(PP 
)PP 
;PP 
	endpointsQQ 
.QQ 
MapHealthChecksQQ 
(QQ 
$strQQ '
)QQ' (
;QQ( )
}RR 
)RR 
;RR 
usingTT 
varTT 	
scopeTT
 
=TT 
appTT 
.TT 
ServicesTT 
.TT 

GetServiceTT )
<TT) * 
IServiceScopeFactoryTT* >
>TT> ?
(TT? @
)TT@ A
?TTA B
.TTB C
CreateScopeTTC N
(TTN O
)TTO P
;TTP Q
varUU 
contexUU 

=UU 
scopeUU 
.UU 
ServiceProviderUU "
.UU" #
GetRequiredServiceUU# 5
<UU5 6
PersistenceContextUU6 H
>UUH I
(UUI J
)UUJ K
;UUK L
varVV 
startVV 	
=VV
 
newVV 
StartVV 
(VV 
contexVV 
)VV 
;VV 
startWW 
.WW 
InicializarWW 
(WW 
)WW 
;WW 
appYY 
.YY 
UseHttpLoggingYY 
(YY 
)YY 
;YY 
appZZ 
.ZZ 
UseHttpsRedirectionZZ 
(ZZ 
)ZZ 
;ZZ 
app[[ 
.[[ 
UseAuthorization[[ 
([[ 
)[[ 
;[[ 
app\\ 
.\\ 
MapControllers\\ 
(\\ 
)\\ 
;\\ 
app]] 
.]] 
Run]] 
(]] 
)]] 	
;]]	 
