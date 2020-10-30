# Copyright ©  2020                                                                                      #
# Developer : NavAddIn                                                                                   #
# EMail : navaddins@outlook.com                                                                          #
# Date : 2020-09-09                                                                                      #
# Download the file from TinyMCE and Create the Control Addin file (TinyMCEEditor_CAI.al)                #
# Remarks                                                                                                #
#   You need to set version no. at $TinyMCEVer before start run the powershell with admin mode           #
#   Of course you can set $false to $DownLoadAndPackage to avoid auto download. But your downloaded      #
#   file name must be tinymce_version.zip and tinymce_languages.zip                                      #
#   You can check the latest version no. at https://www.tiny.cloud/get-tiny/self-hosted/                 #
#   You can check the langauge at https://www.tiny.cloud/get-tiny/language-packages/. You can add        #
#   additional language to $AvaiableLangs if this is out of date                                         #

Clear-Host
$PSScriptRt = $PSScriptRoot
if ($PSScriptRt.Length -eq 0) {
    $PSScriptRt = (Get-Item -Path .\).FullName
}

$TinyMCEEditorJSPath = $PSScriptRt

$ALFile = Join-Path $TinyMCEEditorJSPath -ChildPath "TinyMCEEditor_CAI.al";
$ALControlAddInFld = '';

$TinyMCEVer = ""
$DownLoadAndPackage = $true;

$TinyMCEJsZip = "tinymce_" + $TinyMCEVer + ".zip"
$TinyMCELangsZip = "tinymce_languages.zip"
$TinyMCESKinsZip = ""

$TinyMCEJsUrl = "https://download.tiny.cloud/tinymce/community/tinymce_" + $TinyMCEVer + ".zip"
$TinyMCELangsUrl = "https://www.tiny.cloud/tinymce-services-azure/1/i18n/download/?langs="

$TinyMCEJsZipPath = (Join-Path -Path $TinyMCEEditorJSPath -ChildPath $TinyMCEJsZip)
$TinyMCELangsZipPath = (Join-Path -Path $TinyMCEEditorJSPath -ChildPath $TinyMCELangsZip)
$TinyMCESKinsZipPath = (Join-Path -Path $TinyMCEEditorJSPath -ChildPath "skins")
$TinyMCEUnZipPath = (Join-Path $TinyMCEEditorJSPath -ChildPath "tinymce_unzip")
$TinyMCESource = (Join-Path $TinyMCEUnZipPath -ChildPath "tinymce\js\tinymce")
$TinyMCECopyFrom = (Join-Path $TinyMCEUnZipPath -ChildPath "tinymce\js\*")
$TinyMCECopyTo = (Join-Path $TinyMCEEditorJSPath -ChildPath "tinymce")
$TinyMCESkinToolJson = (Join-Path -Path $TinyMCESource -ChildPath "skintool.json")

try {
    if ($TinyMCEVer -eq '') {
        Write-Host "TinyMCE Version cannot be blank" -ForegroundColor Red
        return
    }

    $AvaiableLangs = @("ar",
        "hy",
        "eu",
        "bn_BD",
        "bg_BG",
        "ca",
        "zh_CN",
        "zh_TW",
        "hr",
        "cs",
        "da",
        "nl",
        "eo",
        "et",
        "fi",
        "fr_FR",
        "gl",
        "de",
        "el",
        "he_IL",
        "hu_HU",
        "id",
        "it",
        "it_IT",
        "ja",
        "kab",
        "kk",
        "ko_KR",
        "ku",
        "lt",
        "nb_NO",
        "fa",
        "fa_IR",
        "pl",
        "pt_BR",
        "pt_PT",
        "ro",
        "ro_RO",
        "ru",
        "ru_RU",
        "sk",
        "sl",
        "sl_SI",
        "es",
        "es_MX",
        "es_ES",
        "sv_SE",
        "ta",
        "ta_IN",
        "th_TH",
        "tr",
        "tr_TR",
        "uk",
        "vi",
        "cy")

    $LangsQuery = ''
    foreach ($Lang in $AvaiableLangs) {
        $LangsQuery += $Lang + ","
    }

    $TinyMCELangsUrl += $LangsQuery.TrimEnd(",")
    
    if ($DownLoadAndPackage) {
        Invoke-WebRequest $TinyMCEJsUrl -OutFile $TinyMCEJsZipPath -ErrorAction Stop
        Invoke-WebRequest $TinyMCELangsUrl -OutFile $TinyMCELangsZipPath -ErrorAction Stop
    }

    Expand-Archive -LiteralPath $TinyMCEJsZipPath -DestinationPath $TinyMCEUnZipPath -Force
    Expand-Archive -LiteralPath $TinyMCELangsZipPath -DestinationPath $TinyMCESource -Force

    $TinyMCESKinsZips = Get-ChildItem ($TinyMCESKinsZipPath) -Filter "*.zip"
    foreach ($TinyMCESKinsZip in $TinyMCESKinsZips) {
        Expand-Archive -LiteralPath $TinyMCESKinsZip.FullName -DestinationPath $TinyMCESource -Force
    }

    Remove-Item -Path $TinyMCESkinToolJson -Force -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCECopyTo -Recurse -Force -ErrorAction SilentlyContinue

    Copy-Item -Path $TinyMCECopyFrom -Destination $TinyMCECopyTo -Recurse -Force

    Remove-Item -Path $TinyMCEJsZipPath -Force -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCELangsZipPath -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCEUnZipPath -Recurse -Force -ErrorAction SilentlyContinue

    $TinyMCEEditorJSPath = $TinyMCEEditorJSPath.TrimEnd('\') + '\'
    $FullNames = Get-ChildItem $TinyMCEEditorJSPath -Recurse -File -Exclude @('*.zip', '*.xml', '*.ps1', '*.al', '*.json') | Select-Object -ExpandProperty FullName
    
    $Scripts = '';
    $StartupScript = '';
    $StyleSheets = '';
    $Images = '';
    $Contents = '';

    $found = $false;
    $parentDir = $PSScriptRt;
    DO {
        $appJson = Get-ChildItem $parentDir -Filter "app.json"
        $found = ($null -ne $appJson)
        if ($found -eq $false) {
            $parentDir = (Get-Item $parentDir).Parent.FullName
        }
    
    }While (($found -eq $false) -and ($null -ne $parentDir))

    if ($found) {
        $ALControlAddInFld = $PSScriptRt.Substring($parentDir.Length) -replace "\\", "/"
    }

    if ($ALControlAddInFld.Trim() -ne '') {
        $ALControlAddInFld = $ALControlAddInFld.TrimStart("/").TrimEnd("/") + "/";
    }

    foreach ($FullName in $FullNames) {
        $FileInfo = New-Object System.IO.FileInfo($FullName)
        $FileName = $FileInfo.Name
        $FilePath = $FullName.Substring($TinyMCEEditorJSPath.Length) -replace "\\", "/"
        
        Switch ($FileInfo.Extension.ToLower()) {       
            { ($_ -eq ".js") -or ($_ -eq '.txt') -or ($_ -eq '.md') -or ($_ -eq '.ts') } {
                $Script = "'" + $ALControlAddInFld + $FilePath + "'" + ",";
                if ($FileName.ToLower() -eq "TinyMCEEditorStartUp.js".ToLower()) {
                    $StartupScript = $StartupScript + $Script + "`r`n";
                    Write-Host "StartupScript : $StartupScript "
                }
                else {
                    $Scripts = $Scripts + $Script + "`r`n";
                    Write-Host "Script : $Script"
                }
                break;
            }
            ".css" {
                $StyleSheet = "'" + $ALControlAddInFld + $FilePath + "'" + ",";
                $StyleSheets = $StyleSheets + $StyleSheet + "`r`n";
                Write-Host "StyleSheet : $StyleSheet"
                break; 
            }
            ".woff" { 
                $StyleSheet = "'" + $ALControlAddInFld + $FilePath + "'" + ",";
                $StyleSheets = $StyleSheets + $StyleSheet + "`r`n";
                Write-Host "StyleSheet : $StyleSheet"
                break; 
            }       
            ".gif" {
                if ($FileInfo.Name -eq 'Loader.gif') { 
                    $Image = "'" + $ALControlAddInFld + $FilePath + "'" + ",";
                    $Images = $Images + $Image + "`r`n";
                    Write-Host "Image : $Image"
                }
                else {
                    $StyleSheet = "'" + $ALControlAddInFld + $FilePath + "'" + ",";
                    $StyleSheets = $StyleSheets + $StyleSheet + "`r`n";
                    Write-Host "StyleSheet : $StyleSheet"
                }
                break;
            }
            default: {
                break;
            }
        }
    }

    $Scripts = $Scripts.TrimEnd("`r`n");
    $StartupScript = $StartupScript.TrimEnd("`r`n");
    $StyleSheets = $StyleSheets.TrimEnd("`r`n");
    $Images = $Images.TrimEnd("`r`n");

    $Scripts = "`r`n" + $Scripts.TrimEnd(",") + ";";
    $StartupScript = "`r`n" + $StartupScript.TrimEnd(",") + ";";
    $StyleSheets = "`r`n" + $StyleSheets.TrimEnd(",") + ";";
    $Images = "`r`n" + $Images.TrimEnd(",") + ";";

    $Contents += "// TinyMCE Version ($TinyMCEVer)"
    $Contents += "`r`n"

    $Contents += "// The controladdin type declares the new add-in.`r`n"
    $Contents += "controladdin TinyMCEEditor`r`n"

    $Contents += "{"
    $Contents += "`r`n"
    $Contents += "    // The Scripts property can reference both external and local scripts.`r`n"
    $Contents += "    Scripts = $Scripts"
    $Contents += "`r`n`r`n"

    $Contents += "    // The StartupScript is a special script that the web client calls once the page is loaded.`r`n"
    $Contents += "    StartupScript = $StartupScript"
    $Contents += "`r`n`r`n"

    $Contents += "    // Specifies the StyleSheets that are included in the control add-in.`r`n"
    $Contents += "    StyleSheets = $StyleSheets"
    $Contents += "`r`n`r`n"

    $Contents += "    // Specifies the Images that are included in the control add-in.`r`n"
    $Contents += "    Images = $Images"
    $Contents += "`r`n`r`n"

    $Contents += "    // Sizing of the control add-in.`r`n"
    $Contents += "    RequestedHeight = 320;`r`n"
    $Contents += "    RequestedWidth = 320;`r`n"
    $Contents += "    MinimumHeight = 180;`r`n"
    $Contents += "    MinimumWidth = 200;`r`n"
    $Contents += "    //MaximumHeight = ???;`r`n"
    $Contents += "    //MaximumWidth = ???;`r`n"
    $Contents += "    VerticalStretch = true;`r`n"
    $Contents += "    HorizontalStretch = true;`r`n"
    $Contents += "    VerticalShrink = true;`r`n"
    $Contents += "    HorizontalShrink = true;"
    $Contents += "`r`n`r`n"

    $Contents += "    // The procedure declarations specify what JavaScript methods could be called from AL.`r`n"    
    $Contents += "    procedure SetSkinIconAndCss(pSkinName: Text; pIconSize: Text; pCssName: Text; pCssCores: Boolean);`r`n"
    $Contents += "    procedure SetFonts(pFonts: Text);`r`n"
    $Contents += "    procedure SetFontSize(pFontSize: Text);`r`n"
    $Contents += "    procedure SetLanguage(pLanguage: Text; pDirectionality: Text);`r`n"
    $Contents += "    procedure SetTokenProvider(pTokenProvider: Text);`r`n"
    $Contents += "    procedure SetDropboxAppKey(pDropboxAppKey: Text);`r`n"
    $Contents += "    procedure SetGoogleDriveKey(pGoogleDriveKey: Text);`r`n"
    $Contents += "    procedure SetGoogleDriveClientId(pGoogleDriveClientid: Text);`r`n"
    $Contents += "    procedure SetOnlineScriptUrl(pUrl: Text; pFreeLicense: Boolean);`r`n"
    $Contents += "    procedure SetEditable(pEditable: Boolean);`r`n"
    $Contents += "    procedure SetHtmlSchema(pSchema: Text);`r`n"
    $Contents += "    procedure SetAutoSave(pSecond: Integer; pConfirm: Boolean);`r`n"
    $Contents += "    procedure InitContent(pIsText: Boolean; pIsFixContentType: Boolean);`r`n"
    $Contents += "    procedure SetContent(pContent: Text);`r`n"
    $Contents += "    procedure SetContentBlock(pBlock: Text);`r`n"
    $Contents += "    procedure GetContentAs(pIsText: Boolean);`r`n"
    $Contents += "    procedure SetEnableContentEventOn(pInput: Boolean; pKeyup: Boolean; pChange: Boolean; pNodeChange: Boolean);`r`n"
    $Contents += "    procedure SetContentType(pIsText: Boolean; pIsFixContentType: Boolean);`r`n"
    $Contents += "    procedure SetContentStyle(pStyle: Text);`r`n"
    $Contents += "    procedure SetEnablePremiumPlugin();`r`n"
    $Contents += "    procedure GetDefaultFonts();`r`n"
    $Contents += "    procedure GetDefaultFontSize();`r`n"
    $Contents += "    procedure SetDispose();`r`n"
    $Contents += "    procedure SetViewMode();`r`n"
    $Contents += "    procedure SetShowMenu();`r`n"
    $Contents += "    procedure GetVersion();`r`n"
    $Contents += "    procedure GetAvaiableSkin();`r`n"
    $Contents += "    procedure SetHideBrand();`r`n"
    $Contents += "    procedure SetHideToolbar();`r`n"
    $Contents += "    procedure SetContentOnly();`r`n"
    $Contents += "    procedure GetContent();"
    $Contents += "`r`n`r`n"

    $Contents += "    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:`r`n"    
    $Contents += "    event ContentHasSaved();`r`n"
    $Contents += "    event ContentTypeHasChanged();`r`n"
    $Contents += "    event ContentHasChanged(EventName: Text);`r`n"
    $Contents += "    event ContentText(Contents: Text; IsText: Boolean);`r`n"
    $Contents += "    event ControlAddInReady(IsReady: Boolean);`r`n"
    $Contents += "    event DocumentReady(IsReady: Boolean);`r`n"
    $Contents += "}"

    New-Item $ALFile -Force;
    if (Test-Path $ALFile) {
        Set-Content $ALFile $Contents
    }
    Invoke-Item $ALFile
}
catch { 
    $ErrorMessage = $_.Exception.Message
    Write-Host $ErrorMessage -ForegroundColor Red
    Remove-Item -Path $TinyMCECopyTo -Recurse -Force -ErrorAction SilentlyContinue 
}
finally {
    Remove-Item -Path $TinyMCESkinToolJson -Force -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCEJsZipPath -Force -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCELangsZipPath -ErrorAction SilentlyContinue
    Remove-Item -Path $TinyMCEUnZipPath -Recurse -Force -ErrorAction SilentlyContin
}