
#robocopy e:\Test \\uswpshared01\sfacte\_keith\GBL\50.40.30.38 /e /xd Te* /copy:DAT /dcopy:T  /log+:e:\log-e.txt
#robocopy e:\ \\uswpshared01\sfacte\_keith\GBL\50.40.30.38  /e /xd Ca* Co* cr* Dep* Ma* N* S* G* C*] /copy:DAT /dcopy:T  /log+:e:\log-e.txt
#robocopy e:\Suggestion_cleanup \\uswpshared01\sfacte\_keith\GBL\50.40.30.38  /e /copy:DAT /dcopy:T  /log+:e:\log-e.txt
#s.b. - created 06122018 copy everything from 54.40.30.38 D drive and copy it to network share.

# Options
# Exclude Directory recyclebin, system volumeInformation, projects
# Exclude .ini files, shortcut files .lnk.
# Copy all empty and non empty subdirectory:  /E
# COPY options Data, Attribute, and TimeStamp COPY: DAT
# Show estimated time of completion: /ETA
# Retry for 100 times : /R:100 
# append log with each iteration on source: /LOG+:robocopylog and save it on source
#Uncomment and run below to see the log priorhand
# robocopy D:\ \\uswpshared01\sfacte\_keith\GBL\50.40.30.38\D-Drive\   /xd "D:\`$RECYCLE.BIN\" /xd "D:\System Volume Information" /xd "D:\projects" /e /copy:DAT /dcopy:T /eta /r:100 /log+:D:/copylog.txt /L

#For D:\ Drive
#remove system and hidden attribute Get-ItemProperty in shell to /a-:HS
robocopy D:\ \\uswpshared01\sfacte\_keith\GBL\50.40.30.38\D-Drive\   /xd "D:\`$RECYCLE.BIN\" /xd "D:\System Volume Information" /xd "D:\projects" /e /copy:DAT /dcopy:T /a-:HS /eta /r:100 /log+:D:/copylog.txt

#For Desktop

robocopy C:\users\administrator\desktop\ \\uswpshared01\sfacte\_keith\GBL\50.40.30.38\Desktop\ /xf *.lnk /xf *.ini /xf *.website /e /copy:DAT /dcopy:T /eta /r:100 /log+:c:/users/administrator/desktop/Desktop-copylog.txt

#Network to Network
robocopy \\uswpshared01\sfacte\_keith\GBL\50.40.30.38\D-Drive\ \\uswpshared01\sfacte\_keith\GBL\50.40.30.38\D\ /xf *.lnk /xf *.ini /xf *.website /e /copy:DAT /dcopy:T /eta /r:100 /log+:`\\uswpshared01\sfacte\_keith\GBL\50.40.30.38\drived\
#remove attribute system (S) and Hidden (H) so that destination does not set it to hidden and system
robocopy Y:\D Y:\drived /e /copy:DAT /dcopy:T /a-:HS /log:c:\users\Administrator\desktop\tryd.txt /L

#Copy e drive to e drive
robocopy e:\ Y:\E-Drive /e /copy:DAT /dcopy:T /a-:HS /xd "E:\`$RECYCLE.BIN\" /xd "E:\System Volume Information" /xf *.lnk /xf *.ini /log+:e:\e-backuplog.txt /L


======================================END OF ROBOCOPY==============================================