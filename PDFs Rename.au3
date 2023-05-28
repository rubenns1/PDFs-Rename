#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         Rubens Gomes

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <File.au3>

$nomeApp = "Rename *PDFs"

$Form1 = GUICreate($nomeApp, 522, 268, 500, 357)
$btnSair = GUICtrlCreateButton("Sair", 408, 216, 75, 25)
$aLista = GUICtrlCreateList("", 32, 48, 337, 188)
$btnProcurar = GUICtrlCreateButton("Procurar", 296, 16, 75, 25)
$pastaInput = GUICtrlCreateInput("", 32, 16, 257, 25)
$pastaInput2 = GUICtrlCreateInput("", 0, 0, 0, 0)
GUISetState(@SW_SHOW)

Local $aConfigs, $aPasta, $listaPDF

While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $btnProcurar
            $aPasta = FileSelectFolder ("Procurar", @ScriptDir)
                GUICtrlSetData ($pastaInput, $aPasta)
                $listaPDF = _FileListToArray ($aPasta, "*.PDF", $FLTA_FILES)
				$pastaSalvar = FileSelectFolder("Procurar", @ScriptDir)
				GUICtrlSetData($pastaInput2, $pastaSalvar)
            For $i = 1 To $listaPDF[0]
				GUICtrlSetData($aLista, $listaPDF[$i])
				appRename()
				If @error Then
					MsgBox(16, $nomeApp, "Falha")
				Else
					MsgBox(64, $nomeApp, "Finalizado")
				EndIf
			Next
		Case $btnSair
			Exit
        Case $GUI_EVENT_CLOSE
			Exit
    EndSwitch
WEnd

Func appRename()
		FileMove($aPasta & "\" & $listaPDF[$i], $pastaSalvar & "\$000" & $i & ".pdf")
Endfunc

