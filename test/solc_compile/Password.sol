contract Password {     bytes32 Seed;      bytes32[] public Identifiers;      function create(address _user_address, bytes32 _identifier, bytes32 _seed){         if (sha3(_user_address,_seed) == Seed){             Identifiers[Identifiers.length++] = _identifier;             returnHash(_user_address, _seed, _identifier);         }     }          function get_password(address _user_address, bytes32 _identifier, bytes32 _seed){         if (sha3(_user_address, _seed) == Seed){             for (uint i=0; i<Identifiers.length; i++){                 if (Identifiers[i] == _identifier){                     returnHash(_user_address, _seed, _identifier);                 }             }         }     }                   function returnHash(address _user_address, bytes32 _seed, bytes32 _identifier) returns (bytes32 hash){         return sha3(_user_address, _seed, _identifier);     }       function fReturn(string to_return) returns (string) {         return to_return;     }      } 