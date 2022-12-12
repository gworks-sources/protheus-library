
/*/{Protheus.doc} ModelName
Ponto de entrada da rotina XPTO...
@type function
@version XPTO
@author XPTO
@since 12/12/2022
@return variant, retorno vari�vel.
/*/
User Function ModelName() // troque o nome de ModelName pelo nome do modelo desej�vel.

    Local   aParam      := {}  as array
    Local   xRet        := .T. as logical

    Private cIdPonto_   := ""  as character
	Private cIdModel_   := ""  as character
	Private nOpc_       := 0   as logical
    Private lIsGrid_    := .F. as logical
    Private oObj_       := nil as object

    aParam := ParamIxb

	If (aParam <> nil)

        oObj_     := aParam[1]
		cIdPonto_ := aParam[2]
		cIdModel_ := aParam[3]
		lIsGrid_  := (Len(aParam) > 3)

		nOpc_ := oObj_:GetOperation()

	    do case
            case ( cIdPonto_ == "MODELPRE"         ) ; xRet := .T. // Antes da altera��o de qualquer campo do modelo.
            case ( cIdPonto_ == "MODELPOS"         ) ; xRet := .T. // Na valida��o total do modelo.
            case ( cIdPonto_ == "MODELVLDACTIVE"   ) ; xRet := .T. // Valida a abertura da tela.
            case ( cIdPonto_ == "FORMPRE"          ) ; xRet := .T. // Antes da altera��o de qualquer campo do formul�rio.
            case ( cIdPonto_ == "FORMPOS"          ) ; xRet := .T. // Na valida��o total do formul�rio.
            case ( cIdPonto_ == "FORMLINEPRE"      ) ; xRet := .T. // Antes da altera��o/dele��o da linha do formul�rio FWFORMGRID.
            case ( cIdPonto_ == "FORMLINEPOS"      ) ; xRet := .T. // Na valida��o total da linha do formul�rio FWFORMGRID.
            case ( cIdPonto_ == "MODELCOMMITTTS"   ) ; xRet := nil // Ap�s a grava��o total do modelo e dentro da transa��o.
            case ( cIdPonto_ == "MODELCOMMITNTTS"  ) ; xRet := nil // Ap�s a grava��o total do modelo e fora da transa��o.
            case ( cIdPonto_ == "FORMCOMMITTTSPRE" ) ; xRet := nil // Antes da grava��o da tabela do formul�rio.
            case ( cIdPonto_ == "FORMCOMMITTTSPOS" ) ; xRet := nil // Ap�s a grava��o da tabela do formul�rio.
            case ( cIdPonto_ == "MODELCANCEL"      ) ; xRet := .T. // A��o do bot�o fechar/cancelar do formul�rio.
            case ( cIdPonto_ == "BUTTONBAR"        ) ; xRet := nil // Para a inclus�o de bot�es na ControlBar. ex.: { {'Salvar', 'SALVAR', { || Alert( 'Salvou' ) }, 'Este bot�o Salva' } }
        endcase

	EndIf

Return xRet
