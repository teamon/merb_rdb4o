namespace :rdb4o do
  desc "Generate and compile java model files"
  task :compile_models do
    require 'rdb4o'
    cp = "#{Rdb4o.jar_classpath}/db4o.jar:#{Rdb4o.jar_classpath}/rdb4o.jar:."
    
    Dir["app/models/**/*.rb"].each do |file|
      puts file
      dir = File.dirname(file)
      package = dir.gsub("/", ".")
      dir += "/java"

      require file

      until Rdb4o::Model::Generator.classes.empty?
        klazz = Rdb4o::Model::Generator.classes.pop
        Dir.mkdir(dir) unless File.exists?(dir)
        File.open(dir + "/#{klazz}.java", "w") {|f| 
          f.write Rdb4o::Model::Generator.generate!(klazz, package) 
        }
      end
    end
    
    Dir["app/models/**/*.java"].each do |file|
      cmd = "javac -cp #{cp} #{file}"
      puts cmd
      system(cmd)
    end
    
  end
  
  desc "Export CLASSPATH"
  task :merb do
    
    # puts ARGV.inspect
    require 'rdb4o'
    system "CLASSPATH=#{Rdb4o.jar_classpath}/db4o.jar:#{Rdb4o.jar_classpath}/rdb4o.jar:. merb"
    
  end
end
