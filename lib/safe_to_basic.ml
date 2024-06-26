let rec to_basic : t -> Basic.t = function
  | (`Null | `Bool _ | `Int _ | `Float _ | `String _) as x -> x
  | `Intlit s -> `String s
  | `List l -> `List (List.rev (List.rev_map to_basic l))
  | `Assoc l ->
      `Assoc (List.rev (List.rev_map (fun (k, v) -> (k, to_basic v)) l))
