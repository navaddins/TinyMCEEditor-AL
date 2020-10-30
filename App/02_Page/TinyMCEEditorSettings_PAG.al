page 50100 "TinyMCEEditor Settings"
{

    Caption = 'TinyMCEEditor Settings';
    PageType = Card;
    SourceTable = "TinyMCEEditor Settings";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Enable Online Script"; Rec."Enable Online Script")
                {
                    ApplicationArea = All;
                }
                field("Online Script Url"; Rec."Online Script Url")
                {
                    ApplicationArea = All;
                }
                field("Free License"; Rec."Free License")
                {
                    ApplicationArea = All;
                }
                field("Enable Premium Plugin"; Rec."Enable Premium Plugin")
                {
                    ApplicationArea = All;
                }
            }
            group(Css)
            {
                field("Skin Name"; Rec."Skin Name")
                {
                    ApplicationArea = All;
                }
                field("Icon Size"; Rec."Icon Size")
                {
                    ApplicationArea = All;
                }
                field("Css Name"; Rec."Css Name")
                {
                    ApplicationArea = All;
                }
                field("Css Cores"; Rec."Css Cores")
                {
                    ApplicationArea = All;
                }
                field("Content Style"; Rec."Content Style")
                {
                    ApplicationArea = All;
                }
            }
            group("Font and Language")
            {
                field("Font Name"; Rec."Font Name")
                {
                    ApplicationArea = All;
                }
                field("Font Size"; Rec."Font Size")
                {
                    ApplicationArea = All;
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = All;
                }
                field(Directionality; Rec.Directionality)
                {
                    ApplicationArea = All;
                }
            }
            group(Options)
            {
                field("Content Type Fix"; Rec."Content Type Fix")
                {
                    ApplicationArea = All;
                }
                field("Content Block"; Rec."Content Block")
                {
                    ApplicationArea = All;
                }
                field("Content Only"; Rec."Content Only")
                {
                    ApplicationArea = All;
                }
                field("View Mode"; Rec."View Mode")
                {
                    ApplicationArea = All;
                }
                field("Show Menu"; Rec."Show Menu")
                {
                    ApplicationArea = All;
                }
                field("Hide Toolbar"; Rec."Hide Toolbar")
                {
                    ApplicationArea = All;
                }
                field("Hide Brand"; Rec."Hide Brand")
                {
                    ApplicationArea = All;
                }
            }

            group("Data Capture")
            {
                field("Auto Save"; Rec."Auto Save")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        EnableAutoSave := "Auto Save";
                        EnableEvent := false;
                    end;
                }

                group("Group Auto Save")
                {
                    Enabled = EnableAutoSave;
                    Caption = '';
                    field("Auto Save Interval"; Rec."Auto Save Interval")
                    {
                        ApplicationArea = All;
                    }
                    field("Auto Save Confirm"; Rec."Auto Save Confirm")
                    {
                        ApplicationArea = All;
                    }
                    field("Blank_1"; '')
                    {
                        Caption = '';
                        ApplicationArea = All;
                    }
                    field("Blank_2"; '')
                    {
                        Caption = '';
                        ApplicationArea = All;
                    }
                }
                field("Enable Content Event On"; Rec."Enable Content Event On")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        EnableAutoSave := false;
                        EnableEvent := "Enable Content Event On";
                    end;
                }
                group("Group Enable Content Event On")
                {
                    Enabled = EnableEvent;
                    Caption = '';
                    field("On Input"; Rec."On Input")
                    {
                        ApplicationArea = All;
                    }
                    field("On Keyup"; Rec."On Keyup")
                    {
                        ApplicationArea = All;
                    }
                    field("On Change"; Rec."On Change")
                    {
                        ApplicationArea = All;
                    }
                    field("On NodeChange"; Rec."On NodeChange")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group("Html Content")
            {
                field("Html Schema"; Rec."Html Schema")
                {
                    ApplicationArea = All;
                }
            }
            group(Drive)
            {
                field("Token Provider"; Rec."Token Provider")
                {
                    ApplicationArea = All;
                }
                field("Dropbox App Key"; Rec."Dropbox App Key")
                {
                    ApplicationArea = All;
                }
                field("Google Drive Key"; Rec."Google Drive Key")
                {
                    ApplicationArea = All;
                }
                field("Google Drive ClientId"; Rec."Google Drive ClientId")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ShowDemo)
            {
                Caption = 'Show Demo';
                ApplicationArea = All;

                trigger OnAction();
                var
                    PAGTDemo: Page "TinyMCEEditorDemo";
                begin
                    PAGTDemo.Run();
                end;
            }
        }
    }
    var
        EnableAutoSave: Boolean;
        EnableEvent: Boolean;

    trigger OnInit()
    var
    begin
        InitRecords();
    end;
}
