unit desafio.model.interfaces.category;

interface

type

iCategory = interface

    function searchCategory(aValue : integer) : iCategory;

    function getId   : Integer;
    function getDescription : String;

    procedure setId(aValue : Integer) ;
    procedure setDescription(aValue : String) ;


  end;


implementation

end.
