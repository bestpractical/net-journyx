use inc::Module::Install;

name            'Net-Journyx';
all_from        'lib/Net/Journyx.pm';

requires        'Moose' => '0.50';
requires        'MooseX::Role::Parameterized' => '0.03';
requires        'LWP::UserAgent';
requires        'URI';

requires        'XML::Compile';

# We need _exactly_ this version, unfortunately.
requires        'XML::Compile::SOAP' => 0.78;

require XML::Compile::SOAP;
if ($XML::Compile::SOAP::VERSION != 0.78) {
    die "Net::Journyx requires exactly XML::Compile::SOAP version 0.78.";
}

build_requires  'Test::More';
build_requires  'Test::MockObject';

features(
    'Date loading' => [
        -default => 0,
       recommends( 'DateTime')
    ],
);

WriteAll;

