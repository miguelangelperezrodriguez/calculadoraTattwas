unit uanyotattwas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  ttattwa = (adi,anupadaka,akasha,vayu,tejas,apas,prithivi);
  tpeticion = record
    maxgrupoinicial :      integer;
    grupo1,grupo2,grupo3 : integer;
  end;

  tresultado = record
    res1,res2,res3 : ttattwa;
    // Maestros de cada dato
    maest1,maest2,maest3 : integer;
  end;

procedure IniciarPeticiones();
function DefinirPeticion (max : string; g1,g2,g3 : string) : boolean;
procedure CalcularAnyo();
function ConvertirTattwaStr (tat : ttattwa) : string;

var
  peticioncalculo : tpeticion;
  resultadott : tresultado;

implementation

var
  v1,v2,v3 : ttattwa;
  maest1,maest2,maest3 : integer;
  gruporecorrido : integer;
  tamgrupo : integer;
  idxgrupo : 1..2;
  bgrupoactivo : boolean;

function ConvertirTattwaStr (tat : ttattwa) : string;
begin
  case tat of
    adi : Result:='Adi';
    anupadaka : Result:='Anupadaka';
    akasha : Result:='Akasha';
    vayu : Result:='Vayu';
    tejas : Result:='Tejas';
    apas : Result:='Apas';
    prithivi : Result:='Prithivi';
  end;
end;

procedure IniciarPeticiones();
begin
  tamgrupo:=2;
  idxgrupo:=1;
  bgrupoactivo:=true;
  gruporecorrido:=0;

  maest1:=0;
  maest2:=0;
  maest3:=0;
end;

function DefinirPeticion (max : string; g1,g2,g3 : string) : boolean;
var
  bok : boolean;
  aux : integer;
begin
  // Max Adi
  bok:=TryStrToInt(max,aux);
  if (not bok) then
  begin
    Result:=false;
    Exit;
  end
  else
    peticioncalculo.maxgrupoinicial:=aux;

  // Max G1
  bok:=TryStrToInt(g1,aux);
  if (not bok) then
  begin
    Result:=false;
    Exit;
  end
  else
    peticioncalculo.grupo1:=aux;

  // Max G2
  bok:=TryStrToInt(g2,aux);
  if (not bok) then
  begin
    Result:=false;
    Exit;
  end
  else
    peticioncalculo.grupo2:=aux;

  // Max G3
  bok:=TryStrToInt(g3,aux);
  if (not bok) then
  begin
    Result:=false;
    Exit;
  end
  else
    peticioncalculo.grupo3:=aux;

  Result:=true;

end;

procedure CalcularAnyo();
var
  elementoactual : ttattwa;
  i : integer;
begin
  for i:=1 to peticioncalculo.grupo1 do
  begin
     // Recorremos los grupos adi-anupadaka
     if bgrupoactivo then
       if idxgrupo=1 then
       begin
         v1:=adi;
         idxgrupo:=2;
         Inc(gruporecorrido);
         if (gruporecorrido=tamgrupo) then
         begin
           gruporecorrido:=0;
           bgrupoactivo:=false;
           maest1:=i;
         end;
         Continue;
       end
       else
       begin
          v1:=anupadaka;
          idxgrupo:=1;
          Inc(gruporecorrido);
          if (gruporecorrido=tamgrupo) then
          begin
            gruporecorrido:=0;
            bgrupoactivo:=false;
            maest1:=i;
          end;
          Continue;
       end;

       case v1 of
         adi :
           elementoactual:=anupadaka;
         anupadaka :
           elementoactual:=akasha;
         akasha :
           elementoactual:=vayu;
         vayu :
           elementoactual:=tejas;
         tejas :
           elementoactual:=apas;
         apas :
           begin
             elementoactual:=prithivi;
             bgrupoactivo:=true;
             tamgrupo:=tamgrupo+2;
             if tamgrupo>peticioncalculo.maxgrupoinicial then
             begin
               tamgrupo:=2;
             end;
           end;
       end;
       v1:=elementoactual;
  end;
  // Copiamos los resultados
  resultadott.res1:=v1;
  resultadott.maest1:=maest1;

  for i:=1 to peticioncalculo.grupo2 do
  begin
     // Recorremos los grupos adi-anupadaka
     if bgrupoactivo then
       if idxgrupo=1 then
       begin
         v2:=adi;
         idxgrupo:=2;
         Inc(gruporecorrido);
         if (gruporecorrido=tamgrupo) then
         begin
           gruporecorrido:=0;
           bgrupoactivo:=false;
           maest2:=i;
         end;
         Continue;
       end
       else
       begin
          v2:=anupadaka;
          idxgrupo:=1;
          Inc(gruporecorrido);
          if (gruporecorrido=tamgrupo) then
          begin
            gruporecorrido:=0;
            bgrupoactivo:=false;
            maest2:=i;
          end;
          Continue;
       end;

       case v2 of
         adi :
           elementoactual:=anupadaka;
         anupadaka :
           elementoactual:=akasha;
         akasha :
           elementoactual:=vayu;
         vayu :
           elementoactual:=tejas;
         tejas :
           elementoactual:=apas;
         apas :
           begin
             elementoactual:=prithivi;
             bgrupoactivo:=true;
             tamgrupo:=tamgrupo+2;
             if tamgrupo>peticioncalculo.maxgrupoinicial then
             begin
               tamgrupo:=2;
             end;
           end;
       end;
       v2:=elementoactual;
  end;
  // Copiamos los resultados
  resultadott.res2:=v2;
  resultadott.maest2:=maest2;

  for i:=1 to peticioncalculo.grupo3 do
  begin
     // Recorremos los grupos adi-anupadaka
     if bgrupoactivo then
       if idxgrupo=1 then
       begin
         v3:=adi;
         idxgrupo:=2;
         Inc(gruporecorrido);
         if (gruporecorrido=tamgrupo) then
         begin
           gruporecorrido:=0;
           bgrupoactivo:=false;
           maest3:=i;
         end;
         Continue;
       end
       else
       begin
          v3:=anupadaka;
          idxgrupo:=1;
          Inc(gruporecorrido);
          if (gruporecorrido=tamgrupo) then
          begin
            gruporecorrido:=0;
            bgrupoactivo:=false;
            maest3:=i;
          end;
          Continue;
       end;

       case v3 of
         adi :
           elementoactual:=anupadaka;
         anupadaka :
           elementoactual:=akasha;
         akasha :
           elementoactual:=vayu;
         vayu :
           elementoactual:=tejas;
         tejas :
           elementoactual:=apas;
         apas :
           begin
             elementoactual:=prithivi;
             bgrupoactivo:=true;
             tamgrupo:=tamgrupo+2;
             if tamgrupo>peticioncalculo.maxgrupoinicial then
             begin
               tamgrupo:=2;
             end;
           end;
       end;
       v3:=elementoactual;
  end;
  // Copiamos los resultados
  resultadott.res3:=v3;
  resultadott.maest3:=maest3;

end;

end.

