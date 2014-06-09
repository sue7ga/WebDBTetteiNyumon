use strict;
use warnings;

use LWP::UserAgent;
use URI;
use JSON qw/decode_json/;

use Encode qw/encode_utf8/;

my $query = '歌ってみた';

my $uri = URI->new('http://gdata.youtube.com/feeds/api/videos');

$uri->query_form(
  alt => 'json',
  order_by => 'rating',
   q => $query
);

use Data::Dumper;

my $ua = LWP::UserAgent->new;
my $res = $ua->get($uri);
my $json = $res->content;
my $ref = decode_json($json);

foreach my $entry(@{$ref->{feed}{entry}}){
   print $entry->{link}[0]{href},"\n";
}



