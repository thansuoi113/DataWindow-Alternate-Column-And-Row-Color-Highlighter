$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_4 from statictext within w_main
end type
type dw_1 from datawindow within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type dw_columnrow from datawindow within w_main
end type
type dw_column from datawindow within w_main
end type
type dw_row from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3081
integer height = 2880
boolean titlebar = true
string title = "Alternate Column And Row Color Highlighter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_4 st_4
dw_1 dw_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_columnrow dw_columnrow
dw_column dw_column
dw_row dw_row
end type
global w_main w_main

type variables
String is_colold, is_colold2
end variables

on w_main.create
this.st_4=create st_4
this.dw_1=create dw_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_columnrow=create dw_columnrow
this.dw_column=create dw_column
this.dw_row=create dw_row
this.Control[]={this.st_4,&
this.dw_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_columnrow,&
this.dw_column,&
this.dw_row}
end on

on w_main.destroy
destroy(this.st_4)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_columnrow)
destroy(this.dw_column)
destroy(this.dw_row)
end on

type st_4 from statictext within w_main
integer x = 1573
integer y = 64
integer width = 1138
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Current/Alternate Column Color Highlighter"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_main
integer x = 1536
integer y = 160
integer width = 1463
integer height = 1184
integer taborder = 10
string title = "none"
string dataobject = "d_dataex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Long ll_columns,ll_i, ll_colidx
String ls_colName, ls_type, ls_visible
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	ls_type = This.Describe(ls_colName + ".type")
	ls_visible = This.Describe(ls_colName + ".visible")
	If ls_type = "column" And ls_visible = "1" Then
		ll_colidx++
		If Mod(ll_colidx, 2) = 0 Then
			This.Modify(ls_colName+".Background.Color='15204327'")
		Else
			This.Modify(ls_colName+".Background.Color='16777215'")
		End If
	End If
Next



end event

event itemfocuschanged;Long ll_columns,ll_i, ll_colidx
String ls_colName, ls_type, ls_visible
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	ls_type = This.Describe(ls_colName + ".type")
	ls_visible = This.Describe(ls_colName + ".visible")
	If ls_type = "column" And ls_visible = "1" Then
		ll_colidx++
		If (ls_colName = String(dwo.Name)) Then
			This.Modify(ls_colName+".Background.Color='11665407'")
		Else
			If Mod(ll_colidx, 2) = 0 Then
				This.Modify(ls_colName+".Background.Color='15204327'")
			Else
				This.Modify(ls_colName+".Background.Color='16777215'")
			End If
		End If
	End If
Next

end event

type st_3 from statictext within w_main
integer x = 1573
integer y = 1408
integer width = 1367
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Curent/Alternate Column And Row Color Highlighter"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 73
integer y = 1408
integer width = 919
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Current Column Color Highlighter"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 73
integer y = 64
integer width = 1056
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Current/Alternate Row Color Highlighter"
boolean focusrectangle = false
end type

type dw_columnrow from datawindow within w_main
integer x = 1536
integer y = 1504
integer width = 1463
integer height = 1184
integer taborder = 20
string title = "none"
string dataobject = "d_dataex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;/*
Long ll_columns,ll_i
String ls_colName
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	If (ls_colName = String(dwo.Name)) Then
		This.Modify(ls_colName+".Background.Color='11665407'")
	Else
		This.Modify(ls_colName+".Background.Color='255~t if(Getrow() = currentRow(),11665407,if(mod(getrow(),2 ) =0,rgb(231, 255, 231),rgb(255,255,255)))'")
	End If
Next
*/
end event

event constructor;Long ll_columns, ll_i
String ls_colName

ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	This.Modify(ls_colName+".Background.Color='255~t if(Getrow() = currentRow(),11665407,if(mod(getrow(),2 ) =0,rgb(231, 255, 231),rgb(255,255,255)))'")
Next

If ll_columns > 0 then
	is_colold2 = This.Describe( "#1.Name" )
	This.Modify(is_colold2+".Background.Color='11665407'")
End If
end event

event itemfocuschanged;/*
Long ll_columns,ll_i
String ls_colName
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	If (ls_colName = String(dwo.Name)) Then
		This.Modify(ls_colName+".Background.Color='11665407'")
	Else
		This.Modify(ls_colName+".Background.Color='255~t if(Getrow() = currentRow(),11665407,if(mod(getrow(),2 ) =0,rgb(231, 255, 231),rgb(255,255,255)))'")
	End If
Next
*/

String ls_colName

ls_colName =  String(dwo.Name)
If IsNull(ls_colName) Or Len(Trim(ls_colName)) = 0 Then Return
If is_colold2 = ls_colName Then Return

If IsNull(is_colold2) Or Len(Trim(is_colold2)) = 0 Then
	This.Modify(ls_colName+".Background.Color='11665407'")
Else
	//This.Modify(is_colold+".Background.Color='16777215'")
	This.Modify(is_colold2+".Background.Color='255~t if(Getrow() = currentRow(),11665407,if(mod(getrow(),2 ) =0,rgb(231, 255, 231),rgb(255,255,255)))'")
	This.Modify(ls_colName+".Background.Color='11665407'")
End If
is_colold2 = ls_colName

end event

type dw_column from datawindow within w_main
integer x = 37
integer y = 1504
integer width = 1463
integer height = 1184
integer taborder = 10
string title = "none"
string dataobject = "d_dataex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Long ll_columns
String ls_colName
ll_columns = Long(This.Object.DataWindow.Column.Count)
If ll_columns > 0 then
	ls_colName = This.Describe( "#1.Name" )
	is_colold = ls_colName
	This.Modify(ls_colName+".Background.Color='11665407'")
End If

end event

event clicked;/*
Long ll_columns,ll_i
String ls_colName
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	If (ls_colName = String(dwo.Name)) Then
		This.Modify(ls_colName+".Background.Color='11665407'")
	Else
		This.Modify(ls_colName+".Background.Color='16777215'")
	End If
Next
*/

/*
String ls_colName
ls_colName =  String(dwo.Name)
If IsNull(ls_colName) Or Len(Trim(ls_colName)) = 0 Then Return
If ls_colName = "datawindow" Then Return
If dwo.band <> "detail" Then Return

If IsNull(is_colold) Or Len(Trim(is_colold)) = 0 Then
	This.Modify(ls_colName+".Background.Color='11665407'")
Else
	This.Modify(is_colold+".Background.Color='16777215'")
	This.Modify(ls_colName+".Background.Color='11665407'")
End If
is_colold = ls_colName
*/

end event

event itemfocuschanged;String ls_colName

ls_colName =  String(dwo.Name)
If IsNull(ls_colName) Or Len(Trim(ls_colName)) = 0 Then Return
If is_colold = ls_colName Then Return

If IsNull(is_colold) Or Len(Trim(is_colold)) = 0 Then
	This.Modify(ls_colName+".Background.Color='11665407'")
Else
	This.Modify(is_colold+".Background.Color='16777215'")
	This.Modify(ls_colName+".Background.Color='11665407'")
End If
is_colold = ls_colName
end event

type dw_row from datawindow within w_main
integer x = 37
integer y = 160
integer width = 1463
integer height = 1184
integer taborder = 10
string title = "none"
string dataobject = "d_dataex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Long ll_columns,ll_i
String ls_colName
ll_columns = Long(This.Object.DataWindow.Column.Count)

For ll_i = 1 To ll_columns
	ls_colName = This.Describe( "#" + String( ll_i ) + ".Name" )
	This.Modify(ls_colName+".Background.Color='255~t if(Getrow() = currentRow(),11665407,if(mod(getrow(),2 ) =0,rgb(231, 255, 231),rgb(255,255,255)))'")
Next


end event

