<!--#include file="Conexion.asp"-->
<%
	Response.Charset= "ISO-8859-1" 
	annio=Request.QueryString("annio")
	SQL="sp_lista_consistencias_er '"&annio& "' " 'Lista los registros solicitados
	Set rs = Server.CreateObject("ADODB.Recordset")	
	rs.CursorLocation=3
	rs.Open SQL, con 

	Response.Write("<tr class='a1'> Cantidad de registros encontrados: "&rs.RecordCount&"</tr>") ' Registros encontrados

	x=rs.Fields.Count-1

	if rs.RecordCount=1 then
		Response.Write(rs.RecordCount) 'No se encontraron registros!
		Response.End
	End if
	
	response.write("<table bgcolor='#FFFFFF' width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td width='50%' valign='top'><table  class='tabla1' width='100%' border='0'>")
	response.write("<tr bgcolor='#787a82' style='color:#E3EEF7'>")
	response.write("<td width='8%' rowspan='3'><div align='center'>RUC</div></td>")
	response.write("<td width='25%' rowspan='3'>RAZ&Oacute;N SOCIAL</td>")
	response.write("<td width='5%' rowspan='3'><div align='center'>C&Oacute;DIGO <br />SICON</div></td>")
	response.write("<td width='5%' rowspan='3'><div align='center'>SECTOR <br />SICON</div></td>")
	response.write("<td width='5%' rowspan='3'><div align='center'>CIIU</div></td>")
	response.write("<td width='5%' rowspan='3'><div align='center'>AE</div></td>")
	response.write("<td colspan='6' bgcolor='#314576'><div align='center'>A&Ntilde;O&nbsp;"&annio& "</div></td>")
	response.write("</tr>")
	response.write("<tr bgcolor='#314576' style='color:#E3EEF7'>")
	response.write("<td colspan=5><div align='center'>BALANCE DE COMPROBACI&Oacute;N</div></td>")
	response.write("<td><div align='center'>ESTADO FINANCIERO (ESTADO DE RESULTADOS)</div></td>")
	response.write("</tr>")
	response.write("<tr bgcolor='#314576' style='color:#E3EEF7'>")
	response.write("<td width='2%' height='89'><div align='center'>UTILIDAD (P&Eacute;RDIDA) (ER)</div></td>")
	response.write("<td width='2%'><div align='center'>RESULTADO DEL EJERCICIO (ESF)</div></td>")
	response.write("<td width='2%'><div align='center'>INGRESOS (I)</div></td>")
	response.write("<td width='2%'><div align='center'>GASTOS (G)</div></td>")
	response.write("<td width='2%'><div align='center'>RESULTADO DEL EJERCICIO (I-G)</div></td>")
	response.write("<td width='2%' height='89'><div align='center'>GANANCIA (P&Eacute;RDIDA) NETA DEL EJERCICIO</div></td>")
	response.write("</tr>")

	'-----------------------------------------------------------------------------------------------------------------------------------------------------
	j=0
	while not rs.eof
		if j=0 then bg="bgcolor='#FFFFFF'" else bg="" End if
		Response.Write("<tr "&bg&">")
	
		for i=k to x
			if (i>=6 and i<=x) then alig="left" else if (i=0) then alig="left" else alig="left" End if End if
		Response.Write("<td  align="&alig&">"&Rs(i)&"</td>")
	
		next
		Response.Write("</tr>")
		rs.MoveNext
		j=j+1
	wend
	Response.Write("</table>")

	rs.close

%>