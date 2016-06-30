unit uPM_Modify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMotherForm, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ADODB,
  DB, ExtCtrls,TypInfo,uFrmMain,DateUtils, Spin;
type TdateFormat = (YYWW, YWW, YMD, YYMMDD, YYYYMMDD, MD, YMMDD, MMDD,WW);

type
  TfrmPMModify = class(TfrmMotherForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit17: TEdit;
    ListBox1: TListBox;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label18: TLabel;
    Label12: TLabel;
    Edit18: TEdit;
    Button2: TButton;
    BitBtn2: TBitBtn;
    Edit12: TEdit;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    NORMALFONT: TFontDialog;
    JGFont: TFontDialog;
    Label4: TLabel;
    ListBox2: TListBox;
    SpinEdit1: TSpinEdit;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
    FUNCTION CHECKSN(STRSN:STRING):INTEGER;
    procedure MyformatDatetime(DateStr:String;DateRule:String);
    function Get_Ymd(C_NOW: string): string;
  public
    { Public declarations }
    procedure ADOQryOPEN(AdoQryTemp1:TADOQuery;SQLSTR:STRING);
    procedure LISTADD;
    function Incc(currentNo, ruleString: string): string;
    function Indd(currentNo, ruleString: string): string;
    procedure ComboxADD;
  end;
  var SNSTRS:TStrings;
      MO_NUMBER:STRING;
var
  frmPMModify: TfrmPMModify;

implementation

{$R *.dfm}
procedure TfrmPMModify.ComboxADD;
VAR SQLSTR:STRING;
var tmpadqury:TADOQuery;
begin
    SQLSTR:='SELECT DISTINCT(GROUP_NAME) FROM SFIS1.C_GROUP_CONFIG_T';
    AdoQryTemp:=TADOQuery.Create(NIL);
    ADOQryOPEN(AdoQryTemp,sqlstr);

    WHILE NOT AdoQryTemp.Eof DO BEGIN
      Combobox1.Items.Add(AdoQryTemp.FieldBYName('GROUP_NAME').asstring);
      AdoQryTemp.NEXT
    END;
    AdoQryTemp.First;
    
    WHILE NOT AdoQryTemp.Eof DO BEGIN
      Combobox2.Items.Add(AdoQryTemp.FieldBYName('GROUP_NAME').asstring);
      AdoQryTemp.NEXT
    END;
    AdoQryTemp.Free;
end;
procedure TfrmPMModify.LISTADD;
VAR SQLSTR:STRING;
var tmpadqury:TADOQuery;
BEGIN
  SQLSTR:='SELECT * FROM R_MO_BASE_T WHERE MO_SCHEDULE_DATE=to_date('''+datetostr(date())+''',''yyyy/mm/dd'')';
  AdoQryTemp:=TADOQuery.Create(NIL);
  ADOQryOPEN(AdoQryTemp,sqlstr);

  WHILE NOT AdoQryTemp.Eof DO BEGIN
    LISTBOX1.Items.Add(AdoQryTemp.FieldBYName('MO_NUMBER').asstring);
    AdoQryTemp.NEXT
  END;
  AdoQryTemp.Free;

  SQLSTR:='SELECT * FROM R_MO_BASE_T WHERE MO_SCHEDULE_DATE=to_date('''+datetostr(date()+1)+''',''yyyy/mm/dd'')';
  AdoQryTemp:=TADOQuery.Create(NIL);
  ADOQryOPEN(AdoQryTemp,sqlstr);

  WHILE NOT AdoQryTemp.Eof DO BEGIN
    LISTBOX2.Items.Add(AdoQryTemp.FieldBYName('MO_NUMBER').asstring);
    AdoQryTemp.NEXT
  END;
  AdoQryTemp.Free;
END;
procedure TfrmPMModify.ADOQryOPEN(AdoQryTemp1:TADOQuery;SQLSTR:STRING);
BEGIN
  AdoQryTemp1.Close;
  AdoQryTemp1.Connection:=frmMain.DBConnection;;
  AdoQryTemp1.SQL.Clear;
  AdoQryTemp1.SQL.Add(sqlstr);
  AdoQryTemp1.Open;
END;
{
0  正常
1 關鍵碼不正確
2 與上個工令跳碼
3 條碼日期不正確
}
FUNCTION TfrmPMModify.CHECKSN(STRSN:STRING):INTEGER;
var sqlstr:string;
var AdoQryTemp1,AdoQryTemp:TADOQuery;
var tmpsn_1,tmpsn_2:string;// tmpsn_1 獲取當前條碼關鍵值   tmpsn_2   獲取條碼規則關鍵值
var keystart,keyend:integer;
var i:integer;//臨時循環值
var TmpModelName:string;
VAR S:STRING;
BEGIN
   sqlstr:='SELECT * FROM SFIS1.C_BC_CHECK_RULE_T WHERE MODEL_NAME='''+EDIT2.Text+''' AND BC_TYPE=''SN'' AND REV='''+EDIT3.Text+'''';
   AdoQryTemp:=TADOQuery.Create(NIL);
   AdoQryTemp1:=TADOQuery.Create(NIL);
   ADOQryOPEN(AdoQryTemp,sqlstr);
   tmpsn_2:=AdoQryTemp.FIELDBYNAME('KEY_WORD').AsString;
   keystart:=AdoQryTemp.FIELDBYNAME('KEY_START').AsInteger;
   keyend:=AdoQryTemp.FIELDBYNAME('KEY_END').AsInteger;
   CHECKSN:=0;
   tmpsn_1:=COPY(STRSN,AdoQryTemp.FieldByName('KEY_START').AsInteger,AdoQryTemp.FieldByName('KEY_END').AsInteger-AdoQryTemp.FieldByName('KEY_START').AsInteger+1);
   IF tmpsn_1<>tmpsn_2 THEN BEGIN
      CHECKSN:=1;
      AdoQryTemp.Free;
      EXIT;
   END;
   SqlStr:='select * from SFIS1.C_BARCODE_RULE_T where RULE_ID IN (';
   SqlStr:=SqlStr+'SELECT RULE_ID FROM SFIS1.C_MODEL_RULE_T WHERE MODEL_NAME='''+EDIT2.Text+''' AND RULE_TYPE=''SN'' AND REV='''+EDIT3.Text+''') ORDER BY SEG_NO ASC';
   ADOQryOPEN(AdoQryTemp,SqlStr);
   //showmessage(inttostr(AdoQryTemp.RecordCount)+AdoQryTemp.fieldbyname('RULE_ID').AsString);
   //-----------------遍曆條碼規則，生成新條碼------------------//
   tmpsn_1:='';
   while not AdoQryTemp.Eof Do
   Begin
      If AdoQryTemp.FieldByName('SEG_TYPE').AsString='FIXED' Then
      Begin
        tmpsn_1:=tmpsn_1 + AdoQryTemp.FieldByName('SEG_VALUE').AsString;
      End
      Else If AdoQryTemp.FieldByName('SEG_TYPE').AsString='PARAM' Then
      Begin
         If AdoQryTemp.FieldByName('SEG_PARAM').AsString='CUST PART NO' Then Begin
           SqlStr:='select * from SFIS1.C_MODEL_DESC_T where CUST_PN ='''+EDIT2.Text+'''';
           ADOQryOPEN(AdoQryTemp1,SqlStr);
           tmpsn_1:=tmpsn_1 + AdoQryTemp1.FieldByName('CUST_PN').AsString;
         End;
         If AdoQryTemp.FieldByName('SEG_PARAM').AsString='DATE' Then Begin
            MyformatDatetime(formatdatetime('YYYYMMDDHHMMSS',strtodate(Edit11.Text)),AdoQryTemp.FieldByName('SEG_VALUE').AsString);
         End;
      End;
      AdoQryTemp.Next;
   End;
   AdoQryTemp1.Free;
   AdoQryTemp.Free;
END;


procedure TfrmPMModify.BitBtn1Click(Sender: TObject);
VAR SqlStr : STRING;
begin
  inherited;
   ADOQuery1.SQL.Clear;
   if trim(edit1.Text)<>'' then BEGIN
       SqlStr:='select * from R_MO_BASE_T where mo_number='''+trim(edit1.Text)+'''';
       ADOQuery1.SQL.Add(SqlStr);
       ADOQuery1.Close;
       ADOQuery1.Open;
   END;
   IF ADOQuery1.RecordCount>0 THEN BEGIN
      Button1.Enabled:=TRUE;
      DBGrid1.Enabled:=TRUE;
      EDIT1.Text:=DBGRID1.Fields[0].Text;
     EDIT2.Text:=DBGRID1.Fields[1].Text;
     EDIT3.Text:=DBGRID1.Fields[9].Text;
     SpinEdit1.Text:=DBGRID1.Fields[5].Text;
     EDIT8.Text:=DBGRID1.Fields[6].Text;
     EDIT11.Text:=DBGRID1.Fields[16].Text;
     EDIT17.Text:=DBGRID1.Fields[7].Text;
     ComboBox1.Text:=DBGRID1.Fields[11].Text;
     ComboBox2.Text:=DBGRID1.Fields[12].Text;
     EDIT14.Text:=DBGRID1.Fields[2].Text;
     EDIT13.Text:=DBGRID1.Fields[3].Text;
     EDIT10.Text:=DBGRID1.Fields[15].Text;
   END
   ELSE BEGIN
      Button1.Enabled:=FALSE;
      DBGrid1.Enabled:=FALSE;
      ShowNGMsg('此工令號不存在！');
      Edit1.SetFocus;
   END;
end;

procedure TfrmPMModify.Button1Click(Sender: TObject);
var SqlStr,SnRule,CurrentNo:string;
var AdoQryTemp:TADOQuery;
var tmpsn_head_len,i:integer;
begin
  inherited;
    if MessageDlg('確認刪除此工令嗎?', mtConfirmation, [mbYes, mbNo], 1) = mrYES then BEGIN
      MO_NUMBER:=Edit1.text;
      AdoQryTemp:=TADOQuery.Create(NIL);
      //-------------截取條碼頭與流水號-------------//
      SqlStr:='select * from SFIS1.C_BARCODE_RULE_T where RULE_ID IN (';
      SqlStr:=SqlStr+'SELECT RULE_ID FROM SFIS1.C_MODEL_RULE_T WHERE MODEL_NAME='''+EDIT2.Text+''' AND RULE_TYPE=''SN'' AND REV='''+EDIT3.Text+''') ORDER BY SEG_NO ASC';
      ADOQryOPEN(AdoQryTemp,SqlStr);
      tmpsn_head_len:=0;
      FOR I:=0 TO AdoQryTemp.RecordCount-1 DO   //不截取流水號長度
      Begin
        if AdoQryTemp.fieldbyname('SEG_PARAM').AsString='ID' then break;
        tmpsn_head_len:=tmpsn_head_len+AdoQryTemp.fieldbyname('SEG_LENGTH').AsInteger;
        AdoQryTemp.Next;
      End;
      EDIT18.Text:=COPY(EDIT14.Text,1,tmpsn_head_len);
      CurrentNo:= COPY(EDIT14.Text,tmpsn_head_len+1,AdoQryTemp.fieldbyname('SEG_LENGTH').AsInteger);//記錄起始條碼流水號
      SnRule:=AdoQryTemp.fieldbyname('SEG_VALUE').Text;//記錄條碼流水號規則
      Button2.Click;
      SqlStr:='select * from R_SN_MAXID_T where SN_HEAD='''+EDIT18.Text+''' AND CURRENT_MAXID='''+COPY(EDIT13.Text,tmpsn_head_len+1,AdoQryTemp.fieldbyname('SEG_LENGTH').AsInteger)+'''';
      ADOQryOPEN(AdoQryTemp,SqlStr);

      IF AdoQryTemp.RecordCount=0 THEN BEGIN
        ShowNGMsg('該工令結束條碼後還存在另外工令，不能刪除！');
        EXIT;
      END;
      //-------------END-------------//


      //-------------截取條碼頭與流水號-------------//
      SqlStr:='select * from R_MO_BASE_T where INPUT_QTY=0 AND MO_NUMBER='''+EDIT1.Text+'''';
      ADOQryOPEN(AdoQryTemp,SqlStr);
      IF AdoQryTemp.RecordCount=0 THEN BEGIN
        ShowNGMsg('該工令已投產，不能刪除！');
        EXIT;
      END;
      //-------------END-------------//

      EDIT12.Text:=Indd(CurrentNo,SnRule);   //獲取當前工令起始碼的前一碼

      //-------------刪除工令表數據-------------//

      SqlStr:='DELETE FROM R_MO_BASE_T WHERE MO_NUMBER='''+MO_NUMBER+'''';
      AdoQryTemp.Connection:=frmMain.DBConnection;
      AdoQryTemp.SQL.Clear;
      AdoQryTemp.SQL.Add(SqlStr);
      AdoQryTemp.ExecSQL;
      //-------------END-------------//

      //-------------刪除條碼TRACKING表數據-------------//
      SqlStr:='DELETE FROM R_WIP_TRACKING_T WHERE MO_NUMBER='''+MO_NUMBER+'''';
      AdoQryTemp.Connection:=frmMain.DBConnection;
      AdoQryTemp.SQL.Clear;
      AdoQryTemp.SQL.Add(SqlStr);
      AdoQryTemp.ExecSQL;
      //-------------END-------------//
      ShowPassMsg('此工令相關條碼表數據刪除成功！請切換至MAXID頁面修改流水號！');
      ADOQuery1.Close;
      ADOQuery1.Open;     
      AdoQryTemp.Free;
      tabsheet2.Show;
    end;
end;

procedure TfrmPMModify.DBGrid1CellClick(Column: TColumn);
var SqlStr:string;
var AdoQryTemp:TADOQuery;
var cksnresult:integer;
begin
  inherited;
  if ADOQuery1.RecordCount=0 then
    button1.Enabled:=false
  else
    button1.Enabled:=true;
   EDIT1.Text:=DBGRID1.Fields[0].Text;
   EDIT2.Text:=DBGRID1.Fields[1].Text;
   EDIT3.Text:=DBGRID1.Fields[9].Text;
   SpinEdit1.Text:=DBGRID1.Fields[5].Text;
   EDIT8.Text:=DBGRID1.Fields[6].Text;
   EDIT11.Text:=DBGRID1.Fields[16].Text;
   EDIT17.Text:=DBGRID1.Fields[7].Text;
   ComboBox1.Text:=DBGRID1.Fields[11].Text;
   ComboBox2.Text:=DBGRID1.Fields[12].Text;
   EDIT14.Text:=DBGRID1.Fields[2].Text;
   EDIT13.Text:=DBGRID1.Fields[3].Text;
   EDIT10.Text:=DBGRID1.Fields[15].Text;
   SqlStr:='select * from R_WIP_TRACKING_T where MO_NUMBER='''+EDIT1.Text+'''';
   AdoQryTemp:=TADOQuery.Create(NIL);
   AdoQryTemp.Connection:=frmMain.DBConnection;
   AdoQryTemp.SQL.Clear;
   AdoQryTemp.SQL.Add(SqlStr);
   AdoQryTemp.Open;
   if AdoQryTemp.RecordCount=0 then  BEGIN
      EDIT7.Text:='工令建立但沒有上線';
      EDIT7.Font:=NORMALFONT.Font
      END
   else if (AdoQryTemp.RecordCount<>0) and (AdoQryTemp.RecordCount<>strtoint(edit8.Text)) then begin
      EDIT7.Text:='工令目標數量與條碼數量不符，可能跳碼';
      EDIT7.Font:=JGFont.Font;
      EXIT;
   end

   else BEGIN
      EDIT7.Text:='工令已上線';
      EDIT7.Font:=NORMALFONT.Font;
    END;
{    if NOT (((EDIT16.Text='ASSY') AND (EDIT15.Text='PACKING') AND (EDIT6.Text='4')) OR ((EDIT16.Text='PACKING') AND (EDIT15.Text='PACKING') AND (EDIT6.Text='2'))) THEN BEGIN
      EDIT7.Text:='工令起始工站異常';
      EDIT7.Font:=JGFont.Font;
      EXIT
   END;

   {根據cksnresult判斷SN異常狀況
    cksnresult:=CHECKSN(EDIT14.Text);
    case cksnresult of
    1:BEGIN
      EDIT7.Text:='工令與上個工令跳碼';
      EDIT7.Font:=JGFont.Font;
      EXIT
    END;
    2:BEGIN
      EDIT7.Text:='工令關鍵碼不正確';
      EDIT7.Font:=JGFont.Font;
      EXIT
    END
END;             }
end;

procedure TfrmPMModify.ListBox1Click(Sender: TObject);
begin
  inherited;
  edit1.Text:=listbox1.Items.Strings[listbox1.ItemIndex]
end;

procedure TfrmPMModify.Button2Click(Sender: TObject);
VAR SqlStr : STRING;
begin
  inherited;
   if trim(edit18.Text)<>'' then begin
       ADOQuery2.SQL.Clear;
       if trim(edit18.Text)<>'' then BEGIN
           SqlStr:='select * from R_SN_MAXID_T where SN_HEAD='''+trim(edit18.Text)+'''';
           ADOQuery2.SQL.Add(SqlStr);
           ADOQuery2.Close;
           ADOQuery2.Open;
       END;
       IF  ADOQuery2.RecordCount>0 THEN BEGIN
            Button2.Enabled:=TRUE;
            DBGrid2.Enabled:=TRUE;
            EDIT12.Text:=DBGRID2.Fields[1].Text;
       END
       ELSE BEGIN
        Button2.Enabled:=FALSE;
        DBGrid2.Enabled:=FALSE;
       END;
   end
   else
   begin
      ShowNGMsg('請輸入條碼前綴！');
      Edit18.SetFocus;
   end;
end;


procedure TfrmPMModify.BitBtn2Click(Sender: TObject);
begin
  inherited;
  EDIT12.Enabled:=TRUE;
end;

procedure TfrmPMModify.BitBtn3Click(Sender: TObject);
var SqlStr:string;
var AdoQryTemp:TADOQuery;
begin
  inherited;
  if trim(edit12.Text)<>'' then begin
    SqlStr:='UPDATE R_SN_MAXID_T SET CURRENT_MAXID='''+EDIT12.Text+''' where SN_HEAD='''+trim(edit18.Text)+'''';
    AdoQryTemp:=TADOQuery.Create(NIL);
    AdoQryTemp.Connection:=frmMain.DBConnection;
    AdoQryTemp.SQL.Add(SqlStr);
    AdoQryTemp.Close;
    AdoQryTemp.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.Open;
    Edit12.Enabled:=false;
  end
    else
      ShowNGMsg('請輸入當前最大值！');

end;
function TfrmPMModify.Get_Ymd(C_NOW: string): string;
var
  MONTH_YEAR, DAY_MONTH: INTEGER;
  YN, DM: string;
  YEAR_NOW: string;
begin
  // MONTH_YEAR:=MonthOfTheYear(C_NOW);
 // DAY_MONTH:=DayOfTheMonth(C_NOW);
  //YEAR_NOW:=COPY
  month_year := STRTOint(copy(C_NOW, 5, 2));
  day_month := strtoint(copy(c_now, 7, 2));
  YEAR_NOW := copy(c_now, 4, 1);
  case MONTH_YEAR of
    10: YN := 'A';
    11: YN := 'B';
    12: YN := 'C';
  else YN := inttostr(MONTH_YEAR);
  end;
  case DAY_MONTH of
    10: DM := 'A';
    11: DM := 'B';
    12: DM := 'C';
    13: DM := 'D';
    14: DM := 'E';
    15: DM := 'F';
    16: DM := 'G';
    17: DM := 'H';
    18: DM := 'I';
    19: DM := 'J';
    20: DM := 'K';
    21: DM := 'L';
    22: DM := 'M';
    23: DM := 'N';
    24: DM := 'O';
    25: DM := 'P';
    26: DM := 'Q';     //////////////////////// ///////////////////////////////////////////////////////
    27: DM := 'R';     ///////////////////////////////////////////////////////////////////////////////////
    28: DM := 'S';    /////////////////////////////////////////
    29: DM := 'T';   ////////////////////////////////
    30: DM := 'U';  /////////////////////////////////////
    31: DM := 'V'; /////////////////////////////////

  else DM := inttostr(DAY_MONTH);
  end;
  RESULT := YEAR_NOW + YN + DM;
end;

procedure TfrmPMModify.MyformatDatetime(DateStr:String;DateRule:String);
var
  week: string;
  year: string;
  quarter: string;
  //month : string;
 // day : string;
  tempdate: string;
  QueryTemp:TADOQuery;
begin
  if length(DateStr) <> 14 then
  begin
    showmessage ('Error!日期長度不夠14位!請找資訊');
    abort;
  end;
  tempdate := copy(DateStr, 1, 8);
  QueryTemp.close;
  QueryTemp.SQL.Clear;
  QueryTemp.SQL.Add(' SELECT YEAR, QUARTER, to_char(WEEK,''09'') W ');
  QueryTemp.SQL.Add(' FROM SFIS1.C_WEEK_CONFIG_T ');
  QueryTemp.SQL.Add(' WHERE :t between start_date and end_date');
  QueryTemp.Parameters[0].Value := tempdate;
  QueryTemp.Open;
  if QueryTemp.RecordCount = 1 then
  begin
    year := trim(QueryTemp.fieldbyname('year').AsString);
    week := trim(QueryTemp.fieldbyname('W').AsString);
    quarter := QueryTemp.fieldbyname('QUARTER').AsString;
    if GetEnumValue(TypeInfo(TdateFormat), DateRule) = -1 then
    begin
      showmessage ( 'Date format error!');
      abort;
    end;

    if DateRule = 'YWW' then DateStr := copy(year, 4, 1) + week;
    if DateRule = 'YYWW' then DateStr := copy(year, 3, 2) + week;


    if DateRule = 'YMD' then
{    begin
      if frmpm_woms.cbxCustomer.Text='LENOVO' then
         begin
           DateStr := get_ymdl(tempdate)
         end
         else
         begin }
        DateStr := get_ymd(tempdate);
 {        end;
    end;        }
    if DateRule = 'MD' then DateStr := copy(get_ymd(tempdate), 2, 2);
    if DateRule = 'YYYYMMDD' then DateStr := COPY(tempdate, 1, 8);
    if DateRule = 'YYMMDD' then DateStr := copy(tempdate, 3, 6);
    if DateRule = 'YMMDD' then DateStr:= copy(tempdate, 4, 5);
    if DateRule = 'MMDD' then DateStr:= COPY(tempdate, 5, 4);
  end else
  begin
    showmessage('Error!日期' + tempdate + '在週別表C_WEEK_CONFIG_T裡面沒資料,請找資訊!');
    abort;
  end;
end;
procedure TfrmPMModify.FormShow(Sender: TObject);
begin
  inherited;
  ADOQuery1.Connection:=frmMain.DBConnection;
  ADOQUERY1.Open;
  ADOQuery2.Connection:=frmMain.DBConnection;
  ADOQUERY2.Open;
  LISTADD;
  ComboxADD;
end;

procedure TfrmPMModify.Edit1Change(Sender: TObject);
begin
  inherited;
   IF TRIM(EDIT1.Text)='' THEN begin
      BitBtn1.Enabled:=FALSE;
      Button1.Enabled:=FALSE;
   end
   ELSE begin
      BitBtn1.Enabled:=TRUE;
      Button1.Enabled:=TRUE
   end;
end;

procedure TfrmPMModify.ListBox2Click(Sender: TObject);
begin
  inherited;
  edit1.Text:=listbox2.Items.Strings[listbox2.ItemIndex];
end;

procedure TfrmPMModify.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
   EDIT12.Text:=DBGRID2.Fields[1].Text;
   EDIT18.Text:=DBGRID2.Fields[0].Text;

end;
function TfrmPMModify.Incc(currentNo, ruleString: string): string;
var
  i, j, k: integer;
  nextString: string;
begin
  nextString := '';
  i := length(currentNo);
  j := length(ruleString);
  while i > 0 do
  begin
    if currentNo[i] = ruleString[j] then begin
      currentNo[i] := ruleString[1];
      Incc(copy(currentNo, 1, length(currentNo) - 1), ruleString);
      i := i - 1;
    end
    else begin
      for k := 1 to j do
        if currentNo[i] <> ruleString[k] then continue
        else begin
          currentNo[i] := ruleString[k + 1];
          i := 0;
          break;
        end;
    end;
  end;
  for k := 1 to length(currentNo) do
  begin
    nextString := nextString + currentNo[k];
  end;
  result := nextString;
end;
function TfrmPMModify.Indd(currentNo, ruleString: string): string;
var
  i, j, k: integer;
  nextString: string;
begin
  nextString := '';
  i := length(currentNo);
  j := length(ruleString);
  while i > 0 do
  begin
    if currentNo[i] = ruleString[1] then begin     //   ruleString[j]
      currentNo[i] := ruleString[j];                //   ruleString[1]
      Indd(copy(currentNo, 1, length(currentNo) - 1), ruleString);
      i := i - 1;
    end
    else begin
      for k := 1 to j do
        if currentNo[i] <> ruleString[k] then continue
        else begin
          currentNo[i] := ruleString[k - 1];    //ruleString[k + 1];
          i := 0;
          break;
        end;
    end;
  end;
  for k := 1 to length(currentNo) do
  begin
    nextString := nextString + currentNo[k];
  end;
  result := nextString;
end;


procedure TfrmPMModify.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not (key in ['2','4']) then
      key:=#0;

end;

procedure TfrmPMModify.SpinEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not (key in ['2','4']) then
      key:=#0;
end;

procedure TfrmPMModify.SpinEdit1Change(Sender: TObject);
begin
  inherited;
  if strtoint(SpinEdit1.Text)>4 then
     abort;
  if SpinEdit1.Text='4' then begin
      Combobox1.Text:='ASSY';
      Combobox2.Text:='PACKING';
  end
  else if SpinEdit1.Text='2' then begin
      Combobox1.Text:='PACKING';
      Combobox2.Text:='PACKING';
  end;
end;

procedure TfrmPMModify.Button3Click(Sender: TObject);
begin
  inherited;
  Edit2.Enabled:=true;
  Edit3.Enabled:=true;
  SpinEdit1.Enabled:=true;
  ComboBox2.Enabled:=true;
  ComboBox1.Enabled:=true;
  button3.Enabled:=false;
  button4.Enabled:=true;
end;

procedure TfrmPMModify.Button4Click(Sender: TObject);
var SqlStr,SnRule,CurrentNo:string;
    AdoQryTemp:TADOQuery;
begin
  inherited;
  if MessageDlg('確認保存修改的工令嗎?', mtConfirmation, [mbYes, mbNo], 1) = mrYES then BEGIN
      MO_NUMBER:=Edit1.text;
      AdoQryTemp:=TADOQuery.Create(NIL);
      //-------------修改工令表數據-------------//

      SqlStr:='UPDATE R_MO_BASE_T SET MODEL_NAME='''+Edit2.Text+''',REV='''+Edit3.Text+''',ROUTE_CODE='''+SpinEdit1.Text+''',START_GROUP='''+ComboBox1.Text+''',END_GROUP='''+ComboBox2.Text+''' WHERE MO_NUMBER='''+MO_NUMBER+'''';
      AdoQryTemp.Connection:=frmMain.DBConnection;
      AdoQryTemp.SQL.Clear;
      AdoQryTemp.SQL.Add(SqlStr);
      AdoQryTemp.ExecSQL;
      //-------------END-------------//

      //-------------修改條碼TRACKING表數據-------------//
      SqlStr:='UPDATE R_WIP_TRACKING_T SET MODEL_NAME='''+Edit2.Text+''',REV='''+Edit3.Text+''',ROUTE_CODE='''+SpinEdit1.Text+''' WHERE MO_NUMBER='''+MO_NUMBER+'''';
      AdoQryTemp.Connection:=frmMain.DBConnection;
      AdoQryTemp.SQL.Clear;
      AdoQryTemp.SQL.Add(SqlStr);
      AdoQryTemp.ExecSQL;
      //-------------END-------------//
      ShowPassMsg('此工令相關條碼表數據修改成功！');
      ADOQuery1.Close;
      ADOQuery1.Open;     
      AdoQryTemp.Free;
      Edit2.Enabled:=false;
      Edit3.Enabled:=false;
      SpinEdit1.Enabled:=false;
      ComboBox2.Enabled:=false;
      ComboBox1.Enabled:=false;
      button3.Enabled:=true;
      button4.Enabled:=false;
  end;
end;

end.
