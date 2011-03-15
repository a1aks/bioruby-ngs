#
#   bcl2qseq.rb - description
#
# Copyright:: Copyright (C) 2011
#     Raoul Bonnal <@bioruby.org>
# License:: The Ruby License
#
#


#require 'bio/command'
#require 'shellwords'
#require 'thor'
#require 'bio/ngs/utils'

# usage: 
#        setupBclToQseq.py -b /path/to/BaseCalls [--in-place|-o /path/to/Output] [options]
# 
# Script to setup the output directory for the conversion of BCLfiles produced by
# RTA into a standard QSEQ-based base calls folder.
# 
# options:
#   -h, --help            show this help message and exit
#   -b BASE_CALLS_DIRECTORY, --base-calls-directory=BASE_CALLS_DIRECTORY
#                         Full path to the Base Calls directory generated by the
#                         instrument
#   --in-place            Allow in-place conversion (in the Base Calls
#                         directory)
#   -o OUTPUT_DIRECTORY, --output-directory=OUTPUT_DIRECTORY
#                         Full path to the output directory, if not in --in-
#                         place mode
#   -i INTENSITIES_DIRECTORY, --intensities-directory=INTENSITIES_DIRECTORY
#                         Full path to the directory containing the intensities,
#                         if different from the parent of the Base Calls
#                         directory
#   -f FILTER_DIRECTORY, --filter-directory=FILTER_DIRECTORY
#                         Full path to the filter directory, if different from
#                         the Base Calls directory
#   -p POSITIONS_DIRECTORY, --positions-directory=POSITIONS_DIRECTORY
#                         Full path to the positions directory, if different
#                         from the Intensities directory
#   -P POSITIONS_FORMAT, --positions-format=POSITIONS_FORMAT
#                         Positions file format (supported formats are:
#                         {'_pos.txt','.locs','.clocs'})
#   --no-eamss            Do not apply the EAMSS quality masking
#   --overwrite           Overwrite the content of the output directory if it
#                         already exists
#   --GERALD=GERALD       Path to the GERALD config file
#   -S, --silent          Do not produce any information or warnings
#   -Q, --quiet           Produce only warnings. Skips general information
#   -V, --verbose         Produce additional debug information
#   -v, --version         Print the version information and exits
#   -L LOG_FILE, --log-file=LOG_FILE
#                         Full path to the log file
#   -c, --include-controls
#                         Include controls information in Passing Filter column
#   --ignore-missing-bcl  Assume missing *.bcl files correspond to a missed base
#                         call (i.e., '.')
#   --ignore-missing-stats
#                         Fill in with zeros when *.stats files are missing


module Bio
  module Ngs    
    class Bclqseq

      include Bio::Command::Wrapper

      set_program Bio::Ngs::Utils.binary("bclToQseq")

      add_option "base-calls-directory", :type => :string, :aliases =>'-b', :desc => 'Full path to the Base Calls directory generated by the instrument'
      add_option "in-place",:type => :boolean, :desc => 'Allow in-place conversion (in the Base Calls directory)'
      add_option "output-director", :type => :string, :aliases => '-o', :desc => 'Full path to the output directory, if not in --in-place mode'
      add_option "intensities-directory", :type => :string, :aliases => '-i', :desc => 'Full path to the directory containing the intensities, if different from the parent of the Base Calls directory'
      add_option "filter-directory", :type => :string , :aliases => '-f', :desc => 'Full path to the filter directory, if different from the Base Calls directory'
      add_option "positions-directory", :type => :string, :aliases => '-p', :desc => 'Full path to the positions directory, if different from the Intensities directory'
      add_option "positions-format", :type => :string, :aliases => '-P', :desc => 'Positions file format (supported formats are: {'_pos.txt','.locs','.clocs'})'
      add_option "no-eamss", :type => :boolean, :desc => 'Do not apply the EAMSS quality masking'
      add_option "overwrite", :type => :boolean, :desc => 'Overwrite the content of the output directory if it already exists'
      add_option "GERALD", :type => :string, :desc => 'Path to the GERALD config file'
      add_option "silent", :type => :boolean, :aliases => '-S', :desc => 'Do not produce any information or warnings'
      add_option "quiet", :type => :boolean, :aliases => '-Q', :desc => 'Produce only warnings. Skips general information'
      add_option "verbose", :type => :boolean, :aliases => '-V', :desc => 'Produce additional debug information'
      add_option "log-file", :type => :string, :aliases => '-L', :desc => 'Full path to the log file'
      add_option "include-controls", :type => :boolean, :aliases => '-c', :desc => 'Include controls information in Passing Filter column'
      add_option "ignore-missing-bcl", :type => :boolean, :desc => 'Assume missing *.bcl files correspond to a missed base call (i.e., '.')'
      add_option "ignore-missin-stats", :type => :boolean, :desc => 'Fill in with zeros when *.stats files are missing'

    end #Bcl2seq
  end #Ngs
end #Bio 


