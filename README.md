isBridgetTeachingAtTriyoga
==========================

Check who is teaching the next Anusara class - to avoid having to cross london for nothing.

Run automatically using launchd I set this up with Lingon - see example file that is actually saved at `~/Library/LaunchAgents/com.yannick.bridgetChecker.plist ` - this runs the script every wednesday if I am logged in.

The ruby commmand needs to know about nokogiri etc gems. 

        /usr/local/Cellar/ruby/2.0.0-p247/bin/ruby /Users/yannickwurm/gitStuff/isBridgetTeachingAtTriyoga/checkBridget.rb
