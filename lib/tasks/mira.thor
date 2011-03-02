class Mira < Thor

  class Pre < Mira
    
    # define tasks for pre-processing
    {:sff => ["sff_extract","common"], :ssaha => ["ssaha2","os"]}.each_pair do |name,prog|
      Pre.class_eval do
        desc "#{name} FILE", "run #{prog[0]} with custom options"
        method_option :options, :type => :native
        define_method name do |file|  
          bin = (prog[1] == "os") ? Bio::Ngs::Utils.os_binary(prog[0]) : Bio::Ngs::Utils.binary(prog[0])
          params = (options[:inspect]) ? options[:options] : []
          puts Bio::Command.query_command [bin,file]+params
        end
      end
    end
    
  end
  
  class Run < Mira
    
    # define tasks for basic Mira jobs (useful for the end-user to see the different commands)
    ["genome","denovo","draft","sanger","454","solexa","solid"].each do |job|
      Run.class_eval do 
        desc job, "run Mira with --job="+job
        method_option :options, :type => :native
        define_method job.to_sym do
          bin = Bio::Ngs::Utils.os_binary("mira")
          params = (options[:inspect]) ? options[:options] : []
          puts Bio::Command.query_command [bin, "--job="+job]+params
        end
      end
    end
    
    # handle tasks for complex jobs definition (i.e --job=denovo,solexa,normal,454)
    def method_missing(task, *args)
      bin = Bio::Ngs::Utils.os_binary("mira")
      options = {}
      if args.first == "--options" then
        options[:options] = args[1..-1]
      elsif args.first.kind_of?(Hash) and args[0].include?(:options)
        options = args[0]
      else    
        raise ArgumentError, "you must specify parameters with --options"
      end
      
      puts Bio::Command.query_command [bin, "--job="+task.to_s]+options[:options]
    end
    
  end
  
end
  