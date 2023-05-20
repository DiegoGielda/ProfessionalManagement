unit uTypeMonth;

interface

type
  TTypeMonth = (mJaneiro, mFevereiro, mMarco, mAbril, mMaio, mJunho, mJulho, mAgosto, mSetembro, mOutubro, mNovembro, mDezembro, mNenhum);

  TTypeMonthHelper = record helper for TTypeMonth
  public const
    CS_ARRAY_DESCRIPTION : array[TTypeMonth] of string =
      ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro', '');
    CS_ARRAY_VALUE : array[TTypeMonth] of Integer =
      (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0);
    CS_MESSAGE_ERROR = 'Mês inválido';

  public
    function GetValue: integer;
    function GetDescription: string;
  end;

implementation

{ TTypeMonthHelper }

function TTypeMonthHelper.GetDescription: string;
begin
  Result := CS_ARRAY_DESCRIPTION[Self];
end;

function TTypeMonthHelper.GetValue: integer;
begin
  Result := CS_ARRAY_VALUE[Self];
end;

end.
