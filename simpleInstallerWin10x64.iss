; Script generated by the Inno Setup Script Wizard.                                                                                                             
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; #define MajorVersion "{#SetupSetting('MAJOR')}"
; #define MinorVersion "{#SetupSetting('MINOR')}"
; #define PatchVersion "{#SetupSetting('PATCH')}"

 
#define PythonVersion "{#major}.{#minor}.{#patch}"
#define PythonStrictVersion "{#major}{#minor}"

#define arch "amd64"
#define PythonLocalInstallDir "%localappdata%\Programs\Python\Python"+PythonStrictVersion+"\"
#define PythonFullInstallationExe "python-{#PythonVersion}.exe"
#define MyAppName "PyTn"
#define MyAppVersion "1.0"
#define MyAppPublisher "Selmen Arous"
#define MyAppURL "https://selmen.tn"


[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{10E0D286-4928-469E-A6F1-F5A213737C86}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
ChangesAssociations=yes
; Remove the following line to run in administrative install mode (install for all users.)
;PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=mysetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
LicenseFile=license-for-win-installer.txt

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Components]

Name: "python_installer"; Description: "Python {#PythonVersion}: Ne décocher cette case que si vous vouler utiliser une autre version de python"; Types: full  custom;
Name: "editors"; Description: "Editeurs Python(Thonny seulement pour le moment )"; Types: full compact custom;
Name: "editors\ps_flag_thonny"; Description: "Drapeau Palestinian au lieu de Ukranian dans Thonny"; Types: full compact custom;
Name: "editors\thonny_autosave"; Description: "Enregistrer automatiqement dans Thonny"; Types: full compact custom;
Name: "editors\thonny_loaduiautocomplete"; Description: "Détecter automatiquement les composants de l'interface graphique dans Thonny(thonny_loaduiautocomplete)"; Types: full compact custom;
Name: "editors\thonny_tunisiaschools" ; Description: "Générer le code PyQt5 dans Thonny / Dossier par défaut(thonny_tunisiaschools)"; Types: full compact custom;
Name: "bac_sc"; Description: "Bibliothèques pour bac scientifiques / bac informatiques : PyQt5 / Numpy / Designer "; Types: full compact custom;
Name: "bac_eco"; Description: "Bibliothèques pour bac économie:  pandas matplotlib xlrd xlsxwriter xlwt openpyxl"; Types: full compact custom;
Name: "bac_eco\jupyter_lab"; Description: "Installation Jupyter Lab"; Types: full compact custom;
Name: "bac_eco\jupyter_notebook"; Description: "Installation Jupyter Notebook"; Types: full compact custom;


[Files]
;Source: "G:\dev\python\pytn\win7x86\Windows6.1-KB2533623-x86.msu"; DestDir: "{tmp}"; Flags: ignoreversion ;
;Source: "G:\dev\python\pytn\win7x86\Windows6.1-KB2999226-x86.msu"; DestDir: "{tmp}"; Flags: ignoreversion ; 
  Source: "python-{#PythonVersion}-{#arch}.exe"; DestDir: "{tmp}"; Flags: ignoreversion ; Components: "python_installer"
Source: "RefreshEnv.cmd"; DestDir: "{tmp}";
Source: "depsx64\*.whl" ; DestDir: "{tmp}\deps\";
;Source: "G:\dev\python\pytn\win7x86\designer\*.*" ; DestDir: "{localappdata}\Programs\Python\Python311-32\Lib\site-packages\PyQt5\Qt5\bin\"    ; Components: "bac_sc"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
[Tasks]
Name: "ThonnyDesktopIcon"; Description: "Créer icone bureau pour Thonny"   ; Components: "editors"
Name: "DesignerDesktopIcon"; Description: "Créer icone bureau pour Designer"   ; Components: "bac_sc"
Name: "LabDesktopIcon"; Description: "Créer icone bureau pour Jupyter Lab"   ; Components: "bac_eco\jupyter_lab"
Name: "NotebookDesktopIcon"; Description: "Créer icone bureau pour Jupyter Notebook Clasique"   ; Components: "bac_eco\jupyter_notebook"
[Icons]
Name: "{group}\PyTn\Thonny"; Filename: "{#PythonLocalInstallDir}\Scripts\thonny.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\thonny\res\thonny.ico" ; Components: "editors"
;test : relying on the system vars 
;Name: "{group}\PyTn\Thonny2"; Filename: "thonny.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\thonny\res\thonny.ico" ; Components: "editors"  
Name: "{group}\PyTn\QT Designer"; Filename: "{#PythonLocalInstallDir}\Lib\site-packages\PyQt5\Qt5\bin\designer.exe" ; Components: "bac_sc" 
;test : relying on the system vars 
;Name: "{group}\PyTn\QT Designer2"; Filename: "pyqt5_qt5_designer.exe" ; Components: "bac_sc" 
Name: "{autodesktop}\Thonny"; Filename: "{#PythonLocalInstallDir}\Scripts\thonny.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\thonny\res\thonny.ico" ; Tasks: "ThonnyDesktopIcon" 
Name: "{autodesktop}\Qt Designer"; Filename: "{#PythonLocalInstallDir}\Scripts\pyqt5_qt5_designer.exe";IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\PyQt5\Qt5\bin\Designer.exe"; Tasks: "DesignerDesktopIcon"
Name: "{group}\PyTn\Jupyter Lab"; Filename: "{#PythonLocalInstallDir}\Scripts\jupyter-lab.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\jupyter_server\static\favicon.ico " ;WorkingDir:"C:\bac2024\"; Components: "bac_eco"
Name: "{group}\PyTn\Jupyter Notebook Clasique"; Filename: "{#PythonLocalInstallDir}\Scripts\jupyter-nbclassic.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\jupyter_server\static\favicons\favicon-notebook.ico " ;WorkingDir:"C:\bac2024\"; Components: "bac_eco"
Name: "{autodesktop}\Jupyter Lab"; Filename: "{#PythonLocalInstallDir}\Scripts\jupyter-lab.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\jupyter_server\static\favicon.ico " ;WorkingDir:"C:\bac2024\"; Tasks: "LabDesktopIcon"
Name: "{autodesktop}\Jupyter Notebook Clasique"; Filename: "{#PythonLocalInstallDir}\Scripts\jupyter-nbclassic.exe"; IconFilename: "{#PythonLocalInstallDir}\Lib\site-packages\jupyter_server\static\favicons\favicon-notebook.ico " ;WorkingDir:"C:\bac2024\"; Tasks: "NotebookDesktopIcon"

[Registry]
;Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
;Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
;Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
;Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
;Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""
[Run]
  
Filename:"{tmp}\python-{#PythonVersion}-{#arch}.exe" ;Parameters:  "/passive PrependPath=1  Include_launcher=1"  ; StatusMsg:"Installation Python ... "; Description: "Description Installation Python ...  "; Components:    "python_installer"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Thonny ... && {tmp}\RefreshEnv.cmd &&  py.exe -m pip install thonny esptool --no-index --find-links {tmp}\deps --prefer-binary" ;StatusMsg:"Installation de Thonny ... "; Components: "editors"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Bibliothèques Bac Scientifiques ... && {tmp}\RefreshEnv.cmd &&  py.exe -m pip install pyqt5 numpy --no-index --find-links {tmp}\deps --prefer-binary" ;StatusMsg:"Installation de Bibliothèques Bac Scientifiques ... "; Components: "bac_sc"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Qt5 Designer ... && {tmp}\RefreshEnv.cmd &&  py.exe -m pip install pyqt5_qt5_designer --no-index --find-links {tmp}\deps --prefer-binary" ;StatusMsg:"Installation de Designer ... "; Components: "bac_sc"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Bibilithèques Bac Economie  ... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install pandas matplotlib xlrd xlsxwriter xlwt openpyxl --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Bibilithèques Bac Economie  ... "; Components: "bac_eco"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Jupyter Lab  ... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install pandas matplotlib xlrd xlsxwriter xlwt openpyxl jupyterlab notebook --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Jupyter Lab  ... "; Components: "bac_eco\jupyter_lab"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Jupyter Notebook Classique... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install notebook --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Jupyter Notebook Classique  ... "; Components: "bac_eco\jupyter_notebook"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title ÇáÃÞÕì áäÇ æßá ÝáÓØíä áäÇ  &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install thonny_palestine_flag --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Palestine Flag pour Thonny  ... "; Components: "editors\ps_flag_thonny"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Thonny Autosave... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install thonny-autosave --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Thonny Autosave  ... "; Components: "editors\thonny_autosave"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Thonny loadui autocomplete ... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install thonny-loaduiautocomplete --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Thonny loadui autocomplete   ... "; Components: "editors\thonny_loaduiautocomplete"
Filename:"cmd.exe" ;Parameters: "/q /c mode 80,5 && title Installation de Thonny PyQt5 helper(thonny-tunisiaschools) ... &&{tmp}\RefreshEnv.cmd &&  py.exe -m pip install thonny-tunisiaschools --no-index --prefer-binary --find-links {tmp}\deps" ;StatusMsg:"Installation de Thonny PyQt5 helper(thonny-tunisiaschools)   ... "; Components: "editors\thonny_tunisiaschools"

[Code]
procedure InitializeWizard;

begin
  //Pour afficher correctement le license(ascii art)
  WizardForm.LicenseMemo.Font.Name:='Consolas'
end;
