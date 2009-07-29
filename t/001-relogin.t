#!/usr/bin/env perl

use strict;
use warnings;
use lib 't/lib';
use Test::More tests => 2;

use Net::Journyx;

my $jx = Net::Journyx->new(
    site => 'https://services.journyx.com/jxadmin23/jtcgi/jxapi.pyc',
    wsdl => 'file:../jxapi.wsdl',
    username => $ENV{'JOURNYX_USER'},
    password => $ENV{'JOURNYX_PASSWORD'},
);

my $session = $jx->session;
ok $session, "logged in";

$jx->logout;
$jx->session( $session );

is $jx->whoami, $ENV{'JOURNYX_USER'}, "retry on expired sessin works";
