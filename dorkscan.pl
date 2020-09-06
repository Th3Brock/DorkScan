#!/usr/bin/perl 
#Version 1.0 Perl	
#Autor >> AlfonzCS

use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
use Win32::Console::ANSI;
use IO::Socket::INET;
use Term::ANSIColor;
use IO::Select;
use HTTP::Response;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;



if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else { system("clear"); }
print color 'reset';                                                                                            
print color("bold yellow"), "   ..#..#...#####....####...#####...##..##...####....####....####...##..##...#..#..\n";
print color("bold yellow"), "   .######..##..##..##..##..##..##..##.##...##......##..##..##..##..###.##..######.\n";
print color("bold blue"), "   ..#..#...##..##..##..##..#####...####.....####...##......######..##.###...#..#..\n";
print color("bold blue"), "   .######..##..##..##..##..##..##..##.##.......##..##..##..##..##..##..##..######.\n";
print color("bold red"), "   ..#..#...#####....####...##..##..##..##...####....####...##..##..##..##...#..#..\n";
print color("bold red"), "   ................................................................................\n"; 
print color 'reset';
print color("bold Green"), "		 CS! : DorkScan Buscador de enlaces usando Dorks.								\n";
print color 'reset';
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

print color("bold Green"),"  \n\n  Introdusca Dork ~# ";
$dork=<STDIN>;
chomp $dork;
print color("yellow"), "\n";

for (my $i=1; $i<=2000; $i+=10) {
$url = "http://www.bing.com/search?q=$dork&filt=all&first=$i&FORM=PERE";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

while($rrs =~ m/<a href=\"?http:\/\/(.*?)\//g){

$link = $1;
	if ( $link !~ /overture|msn|live|bing|yahoo|duckduckgo|google|w3|microsof/)
	{
				if ($link !~ /^http:/)
			 {
				$link = 'http://' . "$link" . '/';
			 }



if($link !~ /\"|\?|\=|index\.php/){
					if  (!  grep (/$link/,@result))
					{
print "$link\n";
open(save, '>>scanned_dork.txt');
    print save "$link\n";
    close(save);
						push(@result,$link);
					}
} 
}
}
}








exit