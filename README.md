# TinyMCEEditor-AL

## TinyMCEEditor
In order to work with Navision (2016, 2017, 2018 and BC), TinymceEditor is using the world's #1 JavaScript library for rich text editing [TinyMCE](https://www.tiny.cloud/) 

##

![Image](https://github.com/navaddins/TinyMCEEditor-AL/blob/main/Images/HtmlMode.png)

![Image](https://github.com/navaddins/TinyMCEEditor-AL/blob/main/Images/TextMode.png)
## FAQ

#### Does it work with BC?

Yes.

#### Where can i find for NAV 2016, 2017 and 2018 instead of BC?

[Here](https://github.com/navaddins/TinyMCEEditor-CAL) for NAV 2016, 2017 and 2018

#### Does it work with offline and online?

Yes, you can choose either offline or online to get latest tinymce js.

#### Which one is recommended?

I'll choose offline rather than online. No need internet connection and the loading is fast.

#### How do i know i'm using offline or online?

You call below method to check offline or online

```al
CurrPage.TinyMCEEditor.GetVersion();
```

#### How to define online?

In order to use as online, firstly, you need to register your domain and get the api key from TinyMCE. And then you can set tinymce js url as per below property.
```al
CurrPage.TinyMCEEditor.SetOnlineScriptUrl("https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js","Free License");
```

#### Where can i find the TinyMCE js link?

You can use below link. But you need to replace **"no-api-key"** with your api key after register from TinyMCE web site.


https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js


#### Why do i need to register the domain name and get api key?

If you do not register, you will get notification when you use.

#### Where do i get api key and register the domain?

You can register at tinymce web site to get [api key](https://www.tiny.cloud/auth/signup/).

#### Is it free?

Yes, it is. But, you can't use [premium plugin feature](https://www.tiny.cloud/apps/).

#### Can i use the js link from other site instead of TinyMCE?

Yes, you can use it as basic. It won't work for language or other plugin. It's better to get the link from TinyMCE.

#### Do i need to register my domain and get the api key for offline?

No.

#### In order to run with latest TinyMCE version (offline), can i build the control addin by myself?

Yes, open the powershell with Administrator and then run the "Create-AL-Package.ps1". It will auto download the latest version of TinyMCE package from TinyMCE web site and make the **"TinyMCEEditor_CAI.al"** file for you. **Please read the documentation from "Create-AL-Package.ps1" before build yourself.**

#### Can i move the "TinyMCEEditor" folder from "TinyMCEEditor AL\App\08_ControllAddin\"?

Yes, as long as "TinyMCEEditor" is under AL Project Folder.

#### Can i create my own skin and add to package?

Yes, you can make your own skin from [TinyMCE Skin tool](http://skin.tiny.cloud/t5/) and download the skin from TinyMCE Skin tool and save at "TinyMCEEditor AL\App\08_ControllAddin\TinyMCEEditor\skins" folder.

#### How can i set my own skin when i run from AL?

You can use below code to set the skin.

```al
CurrPage.TinyMCEEditor.SetSkinIconAndCss(SkinName,IconSize,CssName,CssCores)
```
#### How do i know which skins are avaiable from TinyMCEEditor?

You can use below code to get the avaiable skins.

```al
CurrPage.TinyMCEEditor.GetAvaiableSkin();
```

#### What is CssName?

It allows you to change the view, like document or writer or dark mode. Here is avaiable CSS Names

- default
- dark
- document
- writer
- your own skin name

#### Does it support localization?

Yes, it is. Visit to this [link](https://www.tiny.cloud/docs/configure/localization/) to view the supported language.

#### Do i need to download the language by myself for TinyMCEEditor?

No, TinyMCEEditor is already downloaded and added for you. But you can't find your langauge inside, you may need to add yourself and build it again.

#### How do i define the language?

You can find the language code at [here](https://www.tiny.cloud/docs/configure/localization/#language). And then you need to set the language code as per below

```al
CurrPage.TinyMCEEditor.SetLanguage('de'; 'ltr');
//or
CurrPage.TinyMCEEditor.SetLanguage('ar'; 'rtl');

```


#### Does TinyMCEEditor only support HTML?

No. you can switch between Html mode from Text mode or Text mode to Html mode when you are editing the document.

#### Can i fix Html mode only or Text mode only?

Yes.

```al
//For Html
CurrPage.TinyMCEEditor.InitContent(False, True);

//For Text
CurrPage.TinyMCEEditor.InitContent(True, True);
```

#### Can i change Html mode or Text mode OnAfterGetRec or OnAfterGetCurrRec?

Yes.

```al
//Set True or False between Html and Text
CurrPage.TinyMCEEditor.SetContent(True/False);
```

#### Can i set View mode or Readonly mode?

Yes.

```al
CurrPage.TinyMCEEditor.SetViewMode;
```

#### Does it work with editable or view on page trigger?
Yes.
```al
CurrPage.TinyMCEEditor.SetEditable(CurrPage.EDITABLE);
```

#### How do i get the content from TinyMCEEditor to AL?

Use below method and event to get content from TinyMCEEditor to AL

```al
CurrPage.TinyMCEEditor.GetContent();

trigger ContentText(Contents: Text; IsText: Boolean)
begin
    // Do Something
    /*
    if (IsControlAddInReady AND IsDocumentReady) then begin
    end;
    */    
end;
```

#### Can we set auto save?

Yes, you can to use below property for auto save.

```al
CurrPage.TinyMCEEditor.SetAutoSave(Second,ConfirmY/N);
```

#### Should i call SetDispose() method?

Yes, you should call SetDispose() method when you close the page. It will be released memory.

```al
CurrPage.TinyMCEEditor.SetDispose();
```

#### Do you have a Demo?

Yes. you can find at below section.

## Folder Structure

```text
TINYMCEEDITOR AL
│  app.json
│
├─.alpackages
│      Microsoft_Base Application_16.2.13509.13779.app
│      Microsoft_System Application_16.2.13509.13779.app
│      Microsoft_System_16.0.13440.13772.app
│
├─.snapshots
├─.vscode
│      launch.json
│      rad.json
│
├─App
│  ├─01_Table
│  │      TinyMCEEditorSettings_TBL.al
│  │
│  ├─02_Page
│  │      TinyMCEEditorDemo_PAG.al
│  │      TinyMCEEditorSettings_PAG.al
│  │
│  └─08_ControllAddin
│      └─TinyMCEEditor
│          │  Create-AL-Package.ps1
│          │  TinyMCEEditor_CAI.al
│          │
│          ├─image
│          │      Loader.gif
│          │
│          ├─script
│          │      jquery.min.js
│          │      TinyMCEEditor.js
│          │      TinyMCEEditorHelper.js
│          │      TinyMCEEditorStartUp.js
│          │
│          ├─skins
│          │      tinymceeditor-black.zip
│          │      tinymceeditor-blue.zip
│          │      tinymceeditor-dark-gray.zip
│          │      tinymceeditor-dark-green.zip
│          │      tinymceeditor-dark.zip
│          └─     tinymceeditor-gray.zip
│          
└─Images
        HtmlMode.png
        TextMode.png
```
## Avaiable Properties, Methods and Events

```al
    **Properties**

    SetSkinIconAndCss(pSkinName: Text; pIconSize: Text; pCssName: Text; pCssCores: Boolean);
    SetFonts(pFonts: Text);
    SetFontSize(pFontSize: Text);
    SetLanguage(pLanguage: Text; pDirectionality: Text);
    SetTokenProvider(pTokenProvider: Text);
    SetDropboxAppKey(pDropboxAppKey: Text);
    SetGoogleDriveKey(pGoogleDriveKey: Text);
    SetGoogleDriveClientId(pGoogleDriveClientid: Text);
    SetOnlineScriptUrl(pUrl: Text; pFreeLicense: Boolean);
    SetEditable(pEditable: Boolean);
    SetHtmlSchema(pSchema: Text);
    SetAutoSave(pSecond: Integer; pConfirm: Boolean);
    InitContent(pIsText: Boolean; pIsFixContentType: Boolean);
    SetContent(pContent: Text);
    SetContentBlock(pBlock: Text);    
    SetEnableContentEventOn(pInput: Boolean; pKeyup: Boolean; pChange: Boolean; pNodeChange: Boolean);
    SetContentType(pIsText: Boolean; pIsFixContentType: Boolean);
    SetContentStyle(pStyle: Text);
	
    **Methods**
    SetHideBrand();
    SetHideToolbar();
    SetDispose();
    SetViewMode();
    SetShowMenu();
    SetContentOnly();
    GetVersion();
    GetAvaiableSkin();
    SetEnablePremiumPlugin();
    GetDefaultFonts();
    GetDefaultFontSize();    
    GetContent();
    GetContentAs(pIsText: Boolean);

    **Events**
    ContentHasSaved();
    ContentTypeHasChanged();
    ContentHasChanged(EventName: Text);
    ContentText(Contents: Text; IsText: Boolean);
    ControlAddInReady(IsReady: Boolean);
    DocumentReady(IsReady: Boolean);
```
## Copyright and License Information

TinyMCEEditor is totally free and [unlicense](https://github.com/navaddins/TinyMCEEditor-AL/blob/main/LICENSE). But you must follow the TinyMCE and JQuery license terms and condition

- Tinymce [License](https://www.tiny.cloud/docs-3x/extras/TinyMCE3x@License)

- JQuery [License](https://jquery.org/license)
