On Error Resume Next 
Const ForReading = 1, ForWriting = 2
Dim fso, f
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile("myINFO_PC.txt", ForWriting, True)
strComputer = "." 
Set objWMIService = GetObject("winmgmts:" _ 
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
Set colItems = objWMIService.ExecQuery _ 
    ("Select * from Win32_UserAccount Where LocalAccount = True") 
For Each objItem in colItems 
    f.WriteLine("Account Type: " & objItem.AccountType)
    f.WriteLine("Caption: " & objItem.Caption )
    f.WriteLine("Description: " & objItem.Description )
    f.WriteLine("Disabled: " & objItem.Disabled )
    f.WriteLine("Domain: " & objItem.Domain )
    f.WriteLine("Full Name: " & objItem.FullName )
    f.WriteLine("InstallDate: " & objItem.InstallDate )
    f.WriteLine("Local Account: " & objItem.LocalAccount )
    f.WriteLine("Lockout: " & objItem.Lockout )
    f.WriteLine("Name: " & objItem.Name )
    f.WriteLine("Password Changeable: " & objItem.PasswordChangeable ) 
    f.WriteLine("Password Expires: " & objItem.PasswordExpires )
    f.WriteLine("Password Required: " & objItem.PasswordRequired )
    f.WriteLine("SID: " & objItem.SID )
    f.WriteLine("SID Type: " & objItem.SIDType )
    f.WriteLine("Status: " & objItem.Status )
    f.WriteLine("    ")
Next 
f.Close
