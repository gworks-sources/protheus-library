
/*/{Protheus.doc} ModelName
Ponto de entrada da rotina XPTO...
@type function
@version XPTO
@author XPTO
@since 12/12/2022
@return variant, retorno variável.
/*/
User Function ModelName() // troque o nome de ModelName pelo nome do modelo desejável.

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
            case ( cIdPonto_ == "MODELPRE"         ) ; xRet := .T. // Antes da alteração de qualquer campo do modelo.
            case ( cIdPonto_ == "MODELPOS"         ) ; xRet := .T. // Na validação total do modelo.
            case ( cIdPonto_ == "MODELVLDACTIVE"   ) ; xRet := .T. // Valida a abertura da tela.
            case ( cIdPonto_ == "FORMPRE"          ) ; xRet := .T. // Antes da alteração de qualquer campo do formulário.
            case ( cIdPonto_ == "FORMPOS"          ) ; xRet := .T. // Na validação total do formulário.
            case ( cIdPonto_ == "FORMLINEPRE"      ) ; xRet := .T. // Antes da alteração/deleção da linha do formulário FWFORMGRID.
            case ( cIdPonto_ == "FORMLINEPOS"      ) ; xRet := .T. // Na validação total da linha do formulário FWFORMGRID.
            case ( cIdPonto_ == "MODELCOMMITTTS"   ) ; xRet := nil // Após a gravação total do modelo e dentro da transação.
            case ( cIdPonto_ == "MODELCOMMITNTTS"  ) ; xRet := nil // Após a gravação total do modelo e fora da transação.
            case ( cIdPonto_ == "FORMCOMMITTTSPRE" ) ; xRet := nil // Antes da gravação da tabela do formulário.
            case ( cIdPonto_ == "FORMCOMMITTTSPOS" ) ; xRet := nil // Após a gravação da tabela do formulário.
            case ( cIdPonto_ == "MODELCANCEL"      ) ; xRet := .T. // Ação do botão fechar/cancelar do formulário.
            case ( cIdPonto_ == "BUTTONBAR"        ) ; xRet := nil // Para a inclusão de botões na ControlBar. ex.: { {'Salvar', 'SALVAR', { || Alert( 'Salvou' ) }, 'Este botão Salva' } }
        endcase

	EndIf

Return xRet
