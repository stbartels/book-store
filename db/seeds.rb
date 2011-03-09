# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Book.delete_all

Book.create(:title => "Visual Basic .NET How to Program: Second Edition",
            :author => "Harvey M. Deitel, Paul J. Deitel & Tem R. Nieto",
            :copy_right_year => "2002",
            :edition => "2",
            :isbn => "0-13-029363-6",
            :cover => "vbnethtp2.png",
            :description => "Microsoft Visual Basic .NET",
            :price => 75.99)
            
Book.create(:title => "C++ How to Program: Fourth Edition",
            :author => "Harvey M. Deitel & Paul J. Deitel",
            :copy_right_year => "2002",
            :edition => "4",
            :isbn => "0-13-038474-7",
            :cover => "cpphtp4.png",
            :description => "Introduces Web Programming with CGI",
            :price => 75.99)
            
Book.create(:title => "C# How to Program: First Edition",
            :author => "Harvey M. Deitel, Paul J. Deitel, Jeff Listfield, Tem R. Nieto, Cheryl Yaeger & Marina Zlatkina",
            :copy_right_year => "2002",
            :edition => "4",
            :isbn => "0-13-062221-4",
            :cover => "csharphtp1.png",
            :description => "Introduces .NET and Web services",
            :price => 75.99)
