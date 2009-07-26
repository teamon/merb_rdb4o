merb_db4o
=========

Version: 0.1.0

Authors: Kacper Cieśla, Tymon Tobolski

Dependencies: rdb4o (http://github.com/teamon/rdb4o)

A plugin for the Merb framework that provides access to db4o object database.

I wrote it in March 2008, probably needs some work to be usable with current merb (usable is probably too big world for it's current state, maybe better "have some fun"). More docs hopefuly coming soon.  


use_orm :rdb4o

$ jruby -S merb-gen model Foo
$ jruby -S rake rdb4o:compile_models
$ jruby -S rake rdb4o:merb