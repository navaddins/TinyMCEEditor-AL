// TinyMCE Version (5.5.1)
// The controladdin type declares the new add-in.
controladdin TinyMCEEditor
{
    // The Scripts property can reference both external and local scripts.
    Scripts =
'App/08_ControllAddin/TinyMCEEditor/script/jquery.min.js',
'App/08_ControllAddin/TinyMCEEditor/script/TinyMCEEditor.js',
'App/08_ControllAddin/TinyMCEEditor/script/TinyMCEEditorHelper.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/icons/default/icons.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ar.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/bg_BG.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/bn_BD.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ca.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/cs.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/cy.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/da.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/de.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/el.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/eo.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/es.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/es_ES.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/es_MX.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/et.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/eu.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/fa.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/fa_IR.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/fi.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/fr_FR.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/gl.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/he_IL.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/hr.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/hu_HU.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/hy.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/id.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/it.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/it_IT.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ja.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/kab.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/kk.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ko_KR.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ku.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/lt.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/nb_NO.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/nl.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/pl.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/pt_BR.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/pt_PT.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/readme.md',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ro.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ro_RO.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ru.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/sk.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/sl.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/sl_SI.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/sv_SE.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ta.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/ta_IN.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/th_TH.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/tr.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/tr_TR.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/uk.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/vi.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/zh_CN.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/langs/zh_TW.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/advlist/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/anchor/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/autolink/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/autoresize/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/autosave/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/bbcode/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/charmap/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/code/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/codesample/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/colorpicker/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/contextmenu/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/directionality/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/emoticons/js/emojis.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/emoticons/js/emojis.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/emoticons/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/fullpage/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/fullscreen/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/help/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/hr/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/image/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/imagetools/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/importcss/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/insertdatetime/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/legacyoutput/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/link/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/lists/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/media/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/nonbreaking/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/noneditable/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/pagebreak/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/paste/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/preview/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/print/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/quickbars/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/save/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/searchreplace/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/spellchecker/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/tabfocus/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/table/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/template/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/textcolor/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/textpattern/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/toc/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/visualblocks/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/visualchars/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/plugins/wordcount/plugin.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/themes/mobile/theme.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/themes/silver/theme.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/jquery.tinymce.min.js',
'App/08_ControllAddin/TinyMCEEditor/tinymce/license.txt',
'App/08_ControllAddin/TinyMCEEditor/tinymce/tinymce.d.ts',
'App/08_ControllAddin/TinyMCEEditor/tinymce/tinymce.min.js';

    // The StartupScript is a special script that the web client calls once the page is loaded.
    StartupScript =
'App/08_ControllAddin/TinyMCEEditor/script/TinyMCEEditorStartUp.js';

    // Specifies the StyleSheets that are included in the control add-in.
    StyleSheets =
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/dark/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/default/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/document/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-black/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-black/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-blue/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-blue/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark-gray/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark-gray/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark-green/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-dark-green/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-gray/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/tinymceeditor-gray/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/content/writer/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/oxide-dark/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-black/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-blue/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-gray/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-dark-green/skin.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/fonts/tinymce-mobile.woff',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.inline.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.inline.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/content.mobile.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/skin.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/skin.min.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/skin.mobile.css',
'App/08_ControllAddin/TinyMCEEditor/tinymce/skins/ui/tinymceeditor-gray/skin.mobile.min.css';

    // Specifies the Images that are included in the control add-in.
    Images =
'App/08_ControllAddin/TinyMCEEditor/image/Loader.gif';

    // Sizing of the control add-in.
    RequestedHeight = 500;
    RequestedWidth = 320;
    MinimumHeight = 180;
    MinimumWidth = 200;
    //MaximumHeight = ???;
    //MaximumWidth = ???;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;

    // The procedure declarations specify what JavaScript methods could be called from AL.
    procedure SetSkinIconAndCss(pSkinName: Text; pIconSize: Text; pCssName: Text; pCssCores: Boolean);
    procedure SetFonts(pFonts: Text);
    procedure SetFontSize(pFontSize: Text);
    procedure SetLanguage(pLanguage: Text; pDirectionality: Text);
    procedure SetTokenProvider(pTokenProvider: Text);
    procedure SetDropboxAppKey(pDropboxAppKey: Text);
    procedure SetGoogleDriveKey(pGoogleDriveKey: Text);
    procedure SetGoogleDriveClientId(pGoogleDriveClientid: Text);
    procedure SetOnlineScriptUrl(pUrl: Text; pFreeLicense: Boolean);
    procedure SetEditable(pEditable: Boolean);
    procedure SetHtmlSchema(pSchema: Text);
    procedure SetAutoSave(pSecond: Integer; pConfirm: Boolean);
    procedure InitContent(pIsText: Boolean; pIsFixContentType: Boolean);
    procedure SetContent(pContent: Text);
    procedure SetContentBlock(pBlock: Text);
    procedure GetContentAs(pIsText: Boolean);
    procedure SetEnableContentEventOn(pInput: Boolean; pKeyup: Boolean; pChange: Boolean; pNodeChange: Boolean);
    procedure SetContentType(pIsText: Boolean; pIsFixContentType: Boolean);
    procedure SetContentStyle(pStyle: Text);
    procedure SetEnablePremiumPlugin();
    procedure GetDefaultFonts();
    procedure GetDefaultFontSize();
    procedure SetDispose();
    procedure SetViewMode();
    procedure SetShowMenu();
    procedure GetVersion();
    procedure GetAvaiableSkin();
    procedure SetHideBrand();
    procedure SetHideToolbar();
    procedure SetContentOnly();
    procedure GetContent();

    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:
    event ContentHasSaved();
    event ContentTypeHasChanged();
    event ContentHasChanged(EventName: Text);
    event ContentText(Contents: Text; IsText: Boolean);
    event ControlAddInReady(IsReady: Boolean);
    event DocumentReady(IsReady: Boolean);
}
