if defined?(Merb::Plugins)
  Merb::Plugins.config[:merb_db4o] = {}
  
  require 'rdb4o'
  
  system "export CLASSPATH=#{Rdb4o.jar_classpath}/db4o.jar:#{Rdb4o.jar_classpath}/rdb4o.jar:."
  
  require File.dirname(__FILE__) / "merb" / "orms" / "rdb4o" / "connection"
 
  Merb::Plugins.add_rakefiles :merb_rdb4o / :merbtasks
   
  
  class Merb::Orms::Rdb4o::Connect < Merb::BootLoader
    after BeforeAppLoads
    
    def self.run
      Merb::Orms::Rdb4o.connect
    end
  end
  
  
  generators = File.join(File.dirname(__FILE__), 'generators')
  Merb.add_generators generators / :model

end