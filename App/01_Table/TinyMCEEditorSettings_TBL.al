table 50100 "TinyMCEEditor Settings"
{
    Caption = 'TinyMCEEditor Settings';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Text[1])
        {
            Caption = 'PrimaryKey';
            DataClassification = ToBeClassified;
        }
        field(10; "Enable Online Script"; Boolean)
        {
            Caption = 'Enable Online Script';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Free License", "Enable Online Script");
            end;
        }
        field(11; "Online Script Url"; Text[150])
        {
            Caption = 'Online Script Url';
            DataClassification = ToBeClassified;
        }
        field(12; "Free License"; Boolean)
        {
            Caption = 'Free License';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Enable Premium Plugin" := false;
            end;
        }
        field(13; "Enable Premium Plugin"; Boolean)
        {
            Caption = 'Enable Premium Plugin';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Free License" := not "Enable Premium Plugin";
            end;
        }
        field(20; "Content Block"; Option)
        {
            Caption = 'Content Block';
            OptionMembers = "DIV","P","PRE";
            DataClassification = ToBeClassified;
        }
        field(21; "Content Type Fix"; Boolean)
        {
            Caption = 'Content Type Fix';
            DataClassification = ToBeClassified;
        }
        field(22; "Content Only"; Boolean)
        {
            Caption = 'Content Only';
            DataClassification = ToBeClassified;
        }
        field(23; "Skin Name"; Text[50])
        {
            Caption = 'Skin Name';
            DataClassification = ToBeClassified;
        }
        field(25; "Icon Size"; Text[30])
        {
            Caption = 'Icon Size';
            DataClassification = ToBeClassified;
        }
        field(27; "Css Name"; Text[50])
        {
            Caption = 'Css Name';
            DataClassification = ToBeClassified;
        }
        field(29; "Css Cores"; Boolean)
        {
            Caption = 'Css Cores';
            DataClassification = ToBeClassified;
        }
        field(30; "Content Style"; Text[250])
        {
            Caption = 'Content Style';
            DataClassification = ToBeClassified;
        }
        field(40; "Font Name"; Text[250])
        {
            Caption = 'Font Name';
            DataClassification = ToBeClassified;
        }
        field(41; "Font Size"; Text[250])
        {
            Caption = 'Font Size';
            DataClassification = ToBeClassified;
        }
        field(42; Language; Text[10])
        {
            Caption = 'Language';
            DataClassification = ToBeClassified;
        }
        field(43; Directionality; Text[10])
        {
            Caption = 'Directionality';
            DataClassification = ToBeClassified;
        }
        field(50; "View Mode"; Boolean)
        {
            Caption = 'View Mode';
            DataClassification = ToBeClassified;
        }
        field(51; "Show Menu"; Boolean)
        {
            Caption = 'Show Menu';
            DataClassification = ToBeClassified;
        }
        field(52; "Hide Toolbar"; Boolean)
        {
            Caption = 'Hide Toolbar';
            DataClassification = ToBeClassified;
        }
        field(53; "Hide Brand"; Boolean)
        {
            Caption = 'Hide Brand';
            DataClassification = ToBeClassified;
        }
        field(54; "Auto Save"; Boolean)
        {
            Caption = 'Auto Save';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Auto Save Interval" := 0;
                "Auto Save Confirm" := false;
                if "Auto Save" then begin
                    "Auto Save Interval" := 60;
                    "Auto Save Confirm" := true;

                    "Enable Content Event On" := false;
                    "On Input" := false;
                    "On Keyup" := false;
                    "On Change" := false;
                    "On NodeChange" := false;
                end;
            end;
        }
        field(55; "Auto Save Interval"; Integer)
        {
            Caption = 'Auto Save Interval (sec)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Auto Save Interval" <> 0 then
                    TestField("Auto Save");
            end;
        }
        field(56; "Auto Save Confirm"; Boolean)
        {
            Caption = 'Auto Save Confirm';
            DataClassification = ToBeClassified;
        }
        field(57; "Enable Content Event On"; Boolean)
        {
            Caption = 'Enable Content Event On';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Auto Save" := false;
                "Auto Save Interval" := 0;
                "Auto Save Confirm" := false;

                "On Input" := false;
                "On Keyup" := false;
                "On Change" := false;
                "On NodeChange" := false;
            end;
        }
        field(58; "On Input"; Boolean)
        {
            Caption = 'On Input';
            DataClassification = ToBeClassified;
        }
        field(59; "On Keyup"; Boolean)
        {
            Caption = 'On Keyup';
            DataClassification = ToBeClassified;
        }
        field(60; "On Change"; Boolean)
        {
            Caption = 'On Change';
            DataClassification = ToBeClassified;
        }
        field(61; "On NodeChange"; Boolean)
        {
            Caption = 'On NodeChange';
            DataClassification = ToBeClassified;
        }
        field(62; "Html Schema"; Text[10])
        {
            Caption = 'Html Schema';
            DataClassification = ToBeClassified;
        }
        field(70; "Token Provider"; Text[100])
        {
            Caption = 'Token Provider';
            DataClassification = ToBeClassified;
        }
        field(71; "Dropbox App Key"; Text[100])
        {
            Caption = 'Dropbox App Key';
            DataClassification = ToBeClassified;
        }
        field(72; "Google Drive Key"; Text[100])
        {
            Caption = 'Google Drive Key';
            DataClassification = ToBeClassified;
        }
        field(73; "Google Drive ClientId"; Text[100])
        {
            Caption = 'Google Drive ClientId';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }

    var
        TxtCssName: Label 'default';
        TxtLanguage: Label 'en';
        TxtLanguageDir: Label 'ltr';


    local procedure InitRecordsLoc()
    begin
        Reset();

        if Get() then
            exit;
        Init();
        "Css Name" := TxtCssName;
        Language := TxtLanguage;
        Directionality := TxtLanguageDir;
        "Content Block" := "Content Block"::"DIV";
        INSERT;
    end;

    procedure GetSampleHtml() ReturnValue: text
    begin
        ReturnValue := '<html>' +
'<head><title>This is a title</title></head>' +
'<body style="font-family: ''Arial'', sans-serif; font-size:12pt">' +
'<p style="text-align: center; font-size: 15px;">' +
' <img title="TinyMCE Logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcToppr2AtGlktji8wDLp_ECP-yOtgong87xWQ&usqp=CAU" alt="TinyMCE Logo" width="110" height="97" />' +
'</p>' +
'<h2 style="text-align: center;">Welcome to the TinyMCE Cloud demo!</h2>' +
'<h5 style="text-align: center;">Note, this includes some "enterprise/premium" features.<br>Visit the <a href="https://www.tiny.cloud/pricing">pricing page</a> to learn more about our premium plugins.</h5>' +
'<p>Please try out the features provided in this full featured example.</p>' +
'<h2>Got questions or need help?</h2>' +
'<ul>' +
' <li>Our <a class="mceNonEditable" href="//www.tiny.cloud/docs/">documentation</a> is a great resource for learning how to configure TinyMCE.</li>' +
' <li>Have a specific question? Try the <a href="https://stackoverflow.com/questions/tagged/tinymce" target="_blank" rel="noopener"><code>tinymce</code> tag at Stack Overflow</a>.</li>' +
' <li>We also offer enterprise grade support as part of <a href="https://www.tiny.cloud/pricing">TinyMCE premium subscriptions</a>.</li>' +
'</ul>' +
'<h2>A simple table to play with</h2>' +
'<table style="border-collapse: collapse; width: 100%;" border="1">' +
' <thead>' +
'   <tr>' +
'     <th>Product</th>' +
'     <th>Cost</th>' +
'     <th>Really?</th>' +
'   </tr>' +
' </thead>' +
' <tbody>' +
'   <tr>' +
'     <td>TinyMCE Cloud</td>' +
'     <td>Get started for free</td>' +
'     <td>YES!</td>' +
'   </tr>' +
'   <tr>' +
'     <td>Plupload</td>' +
'     <td>Free</td>' +
'     <td>YES!</td>' +
'   </tr>' +
' </tbody>' +
'</table>' +
'<h2>Found a bug?</h2>' +
'<p>If you think you have found a bug please create an issue on the <a href="https://github.com/tinymce/tinymce/issues">GitHub repo</a> to report it to the developers.</p>' +
'<h2>Finally ...</h2>' +
'<p>Don''t forget to check out our other product <a href="http://www.plupload.com" target="_blank">Plupload</a>, your ultimate upload solution featuring HTML5 upload support.</p>' +
'<p>Thanks for supporting TinyMCE! We hope it helps you and your users create great content.<br>All the best from the TinyMCE team.</p>' +
'</body>' +
'</html>';
    end;

    procedure InitRecords()
    begin
        InitRecordsLoc();
    end;
}
