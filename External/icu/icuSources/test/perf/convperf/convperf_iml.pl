#!/usr/bin/perl -w
#  ********************************************************************
#  * COPYRIGHT:
#  * Copyright (c) 2002-2003, International Business Machines Corporation and
#  * others. All Rights Reserved.
#  ********************************************************************

use strict;

use lib '../perldriver';

use PerfFramework;


my $options = {
	       "title"=>"Conversion Performance: ICU 2.6 vs. Windows2000 IMultiLanguage Interface",
	       "headers"=>"Windows2000(IMultiLanguage2) ICU",
	       "operationIs"=>"code point",
	       "passes"=>"10",
	       "time"=>"5",
	       #"outputType"=>"HTML",
	       "dataDir"=>"c:/src/perf/data",
	       "outputDir"=>"../results"
	      };

# programs
# tests will be done for all the programs. Results will be stored and connected
my $p = "release/convperf.exe";

my $tests = { 
	     "UTF-8 From Unicode",          ["$p TestWinIML2_UTF8_FromUnicode"  ,    "$p TestICU_UTF8_FromUnicode" ],
	     "UTF-8 To Unicode",            ["$p TestWinIML2_UTF8_ToUnicode"    ,    "$p TestICU_UTF8_ToUnicode" ],
         ####
	     "ISO-8859-1 From Unicode",     ["$p TestWinIML2_Latin1_FromUnicode"  ,  "$p TestICU_Latin1_FromUnicode" ],
	     "ISO-8859-1 To Unicode",       ["$p TestWinIML2_Latin1_ToUnicode"    ,  "$p TestICU_Latin1_ToUnicode" ],
         ####
	     "Shift-JIS From Unicode",      ["$p TestWinIML2_SJIS_FromUnicode"  ,    "$p TestICU_SJIS_FromUnicode" ],
	     "Shift-JIS To Unicode",        ["$p TestWinIML2_SJIS_ToUnicode"    ,    "$p TestICU_SJIS_ToUnicode" ],
         ####
	     "EUC-JP From Unicode",         ["$p TestWinIML2_EUCJP_FromUnicode"  ,   "$p TestICU_EUCJP_FromUnicode" ],
	     "EUC-JP To Unicode",           ["$p TestWinIML2_EUCJP_ToUnicode"    ,   "$p TestICU_EUCJP_ToUnicode" ],
         ####
	     "GB2312 From Unicode",         ["$p TestWinIML2_GB2312_FromUnicode"  ,  "$p TestICU_GB2312_FromUnicode" ],
	     "GB2312 To Unicode",           ["$p TestWinIML2_GB2312_ToUnicode"    ,  "$p TestICU_GB2312_ToUnicode" ],
         ####
	     "ISO2022KR From Unicode",      ["$p TestWinIML2_ISO2022KR_FromUnicode",  "$p TestICU_ISO2022KR_FromUnicode" ],
	     "ISO2022KR To Unicode",        ["$p TestWinIML2_ISO2022KR_ToUnicode"  ,  "$p TestICU_ISO2022KR_ToUnicode" ],
         ####
	     "ISO2022JP From Unicode",      ["$p TestWinIML2_ISO2022JP_FromUnicode", "$p TestICU_ISO2022JP_FromUnicode" ],
	     "ISO2022JP To Unicode",        ["$p TestWinIML2_ISO2022JP_ToUnicode"  ,  "$p TestICU_ISO2022JP_ToUnicode" ],
	    };

my $dataFiles = "";

runTests($options, $tests, $dataFiles);
