page 50130 TinyMCEEditorDemo
{
    Caption = 'TinyMCEEditor Demo';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Editable"; EditableOn)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if (IsControlAddInReady AND IsDocumentReady) then
                            CurrPage.TinyMCEEditor.SetEditable(EditableOn);

                    end;
                }

                field("Event On"; EventOn)
                {
                    ApplicationArea = All;
                }

                field("Change Type"; ChangeType)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        IsTextFormat := ChangeType = ChangeType::Text;
                        if IsControlAddInReady AND IsDocumentReady then
                            CurrPage.TinyMCEEditor.SetContentType(IsTextFormat, IsFixContentType);

                    end;
                }
            }
            group(Ctl)
            {
                Caption = '';
                field("TxtGetAvaSkin"; TxtGetAvaSkin)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    begin
                        if IsControlAddInReady and IsDocumentReady then
                            CurrPage.TinyMCEEditor.GetAvaiableSkin();
                    end;
                }

                field("TxtGetFont"; TxtGetFont)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    begin
                        if IsControlAddInReady and IsDocumentReady then
                            CurrPage.TinyMCEEditor.GetDefaultFonts();
                    end;
                }

                field("TxtGetFontSize"; TxtGetFontSize)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    begin
                        if IsControlAddInReady and IsDocumentReady then
                            CurrPage.TinyMCEEditor.GetDefaultFontSize();
                    end;
                }

                field("TxtGetVersion"; TxtGetVersion)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    begin
                        if IsControlAddInReady and IsDocumentReady then
                            CurrPage.TinyMCEEditor.GetVersion();
                    end;
                }

                field("TxtGetContentAs"; TxtGetContentAs)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    var
                        intSelected: Integer;
                    begin
                        intSelected := STRMENU(TxtContentAs, 1, TxtContentAsChoose);
                        if intSelected = 0 then
                            exit;
                        IsGetContentAs := true;
                        if IsControlAddInReady AND IsDocumentReady then begin
                            if intSelected = 1 then
                                CurrPage.TinyMCEEditor.GetContentAs(TRUE)
                            else
                                CurrPage.TinyMCEEditor.GetContentAs(FALSE);
                        end;
                    end;
                }

                field("TxtGetContent"; TxtGetContent)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    DrillDown = true;
                    trigger OnDrillDown();
                    begin
                        if IsControlAddInReady and IsDocumentReady then
                            CurrPage.TinyMCEEditor.GetContent();
                    end;
                }
            }
            // The control add-in can be placed on the page using usercontrol keyword.
            group("TinyMCE Editor")
            {
                usercontrol(TinyMCEEditor; TinyMCEEditor)
                {

                    ApplicationArea = All;

                    trigger ControlAddInReady(IsReady: Boolean)

                    begin
                        IsControlAddInReady := IsReady;
                        if (not IsControlAddInReady) then
                            exit;

                        SetDialogSettingsLoc;
                        CurrPage.TinyMCEEditor.InitContent(IsTextFormat, IsFixContentType);
                    end;

                    trigger DocumentReady(IsReady: Boolean)
                    begin
                        IsDocumentReady := IsReady;
                        if (IsControlAddInReady and IsDocumentReady) and not IsTextFormat then
                            CurrPage.TinyMCEEditor.SetContent(HtmlText);
                    end;

                    trigger ContentTypeHasChanged()
                    begin
                        if (IsControlAddInReady AND IsDocumentReady) then
                            CurrPage.TinyMCEEditor.GetContent;
                    end;

                    trigger ContentHasChanged(EventName: Text)
                    begin
                        if (IsControlAddInReady AND IsDocumentReady) then
                            CurrPage.TinyMCEEditor.GetContent;
                        EventOn := EventName;
                    end;

                    trigger ContentHasSaved()
                    begin
                        if (IsControlAddInReady AND IsDocumentReady) then
                            if Confirm('Content has saved.\Do you want to update the data?') then
                                CurrPage.TinyMCEEditor.GetContent;
                    end;

                    trigger ContentText(Contents: Text; IsText: Boolean)
                    begin
                        // Do Something
                        /*
                        if (IsControlAddInReady AND IsDocumentReady) then begin

                        end;
                        */
                        if IsText and not IsGetContentAs then
                            ChangeType := ChangeType::Text
                        else
                            ChangeType := ChangeType::Html;
                        IsGetContentAs := false;
                        MESSAGE('Is Text Content Type? %1\\%2', IsText, Contents);
                    end;
                }
            }
        }
    }

    var
        IsControlAddInReady: Boolean;
        IsDocumentReady: Boolean;
        IsTextFormat: Boolean;
        IsFixContentType: Boolean;
        EditableOn: Boolean;
        IsGetContentAs: Boolean;
        EventOn: Text;
        HtmlText: Text;
        ChangeType: Option "Text","Html";
        TxtGetFont: Label 'Fonts';
        TxtGetFontSize: Label 'Font Size';
        TxtGetAvaSkin: Label 'Avaiable Skin';
        TxtGetVersion: Label 'Version';
        TxtGetContent: Label 'Current Content';
        TxtGetContentAs: Label 'Content As';
        TxtContentAs: Label 'Text,Html';
        TxtContentAsChoose: Label 'Choose one of the following options:';

    trigger OnOpenPage()
    begin
        EditableOn := true;
        IsTextFormat := false;
        ChangeType := ChangeType::Html;
    end;

    trigger OnAfterGetRecord()
    begin
        OnAfterGetRecordLoc();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        OnAfterGetCurrRecordLoc();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if IsControlAddInReady AND IsDocumentReady then
            CurrPage.TinyMCEEditor.SetDispose; //Release Memory
    end;

    local procedure OnAfterGetRecordLoc()
    begin
        // Do Something
        if (IsControlAddInReady AND IsDocumentReady) then begin
            //{=== Change the layout for real world ===}
            /*
            if xRec."Plain Text" <> "Plain Text" then // eg. using on mail
                CurrPage.TinyMCEEditor.SetContentType("Plain Text", IsFixContentType)
            else
                CurrPage.TinyMCEEditor.SetContent(HtmlOrPlainText);
            */
        end;
    end;

    local procedure OnAfterGetCurrRecordLoc()
    begin
        //{=== Change the editable for real world ===}
        /*
        if (IsControlAddInReady and IsDocumentReady) then
            CurrPage.TinyMCEEditor.SetEditable(CurrPage.EDITABLE);
        */
    end;

    local procedure SetDialogSettingsLoc()
    var
        TinyMCEEditorSettings: Record "TinyMCEEditor Settings";
    begin

        TinyMCEEditorSettings.Get();

        if TinyMCEEditorSettings."Enable Online Script" then
            CurrPage.TinyMCEEditor.SetOnlineScriptUrl(TinyMCEEditorSettings."Online Script Url",
                TinyMCEEditorSettings."Free License");

        if TinyMCEEditorSettings."Enable Premium Plugin" then
            CurrPage.TinyMCEEditor.SetEnablePremiumPlugin;

        CurrPage.TinyMCEEditor.SetContentStyle(TinyMCEEditorSettings."Content Style");
        CurrPage.TinyMCEEditor.SetContentBlock(FORMAT(TinyMCEEditorSettings."Content Block"));
        IsFixContentType := TinyMCEEditorSettings."Content Type Fix";

        if TinyMCEEditorSettings."Content Only" then
            CurrPage.TinyMCEEditor.SetContentOnly;

        CurrPage.TinyMCEEditor.SetSkinIconAndCss(TinyMCEEditorSettings."Skin Name", TinyMCEEditorSettings."Icon Size",
            TinyMCEEditorSettings."Css Name", TinyMCEEditorSettings."Css Cores");
        CurrPage.TinyMCEEditor.SetFonts(TinyMCEEditorSettings."Font Name");
        CurrPage.TinyMCEEditor.SetFontSize(TinyMCEEditorSettings."Font Size");
        CurrPage.TinyMCEEditor.SetLanguage(TinyMCEEditorSettings.Language,
            TinyMCEEditorSettings.Directionality);

        if TinyMCEEditorSettings."View Mode" then
            CurrPage.TinyMCEEditor.SetViewMode;

        if TinyMCEEditorSettings."Show Menu" then
            CurrPage.TinyMCEEditor.SetShowMenu;

        if TinyMCEEditorSettings."Hide Toolbar" then
            CurrPage.TinyMCEEditor.SetHideToolbar;

        if TinyMCEEditorSettings."Hide Brand" then
            CurrPage.TinyMCEEditor.SetHideBrand;

        if TinyMCEEditorSettings."Auto Save" then
            CurrPage.TinyMCEEditor.SetAutoSave(TinyMCEEditorSettings."Auto Save Interval",
                TinyMCEEditorSettings."Auto Save Confirm");

        if (TinyMCEEditorSettings."On Input" OR
            TinyMCEEditorSettings."On Keyup" OR
            TinyMCEEditorSettings."On Change" OR
            TinyMCEEditorSettings."On NodeChange") then
            CurrPage.TinyMCEEditor.SetEnableContentEventOn(TinyMCEEditorSettings."On Input",
                TinyMCEEditorSettings."On Keyup",
                TinyMCEEditorSettings."On Change",
                TinyMCEEditorSettings."On NodeChange");

        CurrPage.TinyMCEEditor.SetHtmlSchema(TinyMCEEditorSettings."Html Schema");
        CurrPage.TinyMCEEditor.SetTokenProvider(TinyMCEEditorSettings."Token Provider");
        CurrPage.TinyMCEEditor.SetDropboxAppKey(TinyMCEEditorSettings."Dropbox App Key");
        CurrPage.TinyMCEEditor.SetGoogleDriveKey(TinyMCEEditorSettings."Google Drive Key");
        CurrPage.TinyMCEEditor.SetGoogleDriveClientId(TinyMCEEditorSettings."Google Drive ClientId");

        HtmlText := TinyMCEEditorSettings.GetSampleHtml();
    end;
}