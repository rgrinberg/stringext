(* Exercise each function in Stringext. *)

let go () =
  Printf.printf "After the space: %S\n"
    (Stringext.string_after "Mozart" 3);
  Printf.printf "Like Str.quote (but without Str): %S\n"
    (Stringext.quote "Some specials *+*+");
  Printf.printf "Split makes %i splits\n"
    (List.length (Stringext.split "Mary had a little lamb" ~on:' '));
  Printf.printf "Full split makes %i splits\n"
    (List.length (Stringext.full_split "Mary had a little lamb" ~on:' '));
  Printf.printf "Trimming: %S\n"
    (Stringext.trim_left "    <--- to here");
  Printf.printf "split_trim_left: ";
    let strings = Stringext.split_trim_left "+one +two -three" ~on:" " ~trim:"+-" in
      List.iter (Printf.printf "%S ") strings;
      Printf.printf "\n";
  Printf.printf "'a' with of_char is: %S\n"
    (Stringext.of_char 'a');
  Printf.printf "of_list makes: %S\n"
    (Stringext.of_list (Stringext.to_list "chimpanzee"));
  Printf.printf "of_array and to_array makes: %S\n"
    (Stringext.of_array (Stringext.to_array "marzipan"));
  Printf.printf "find_from: %s\n"
    begin match Stringext.find_from ~start:5 "again and again" ~pattern:"again" with
    | None -> ""
    | Some x -> string_of_int x
    end;
  Printf.printf "replace_all: %S\n"
    (Stringext.replace_all "Again. And again. And again." ~pattern:"." ~with_:"!!");
  Printf.printf "replace_all_assoc: %S\n"
    (Stringext.replace_all_assoc
       "Again. And again. And again" [(".", "!!"); ("And", "Yet")]);
  begin match Stringext.cut "cut<-->here" ~on:"<-->" with
  | Some (l, r) -> Printf.printf "cut: %S %S\n" l r
  | None -> ()
  end;
  begin match Stringext.rcut "cut<-->here" ~on:"<-->" with
  | Some (l, r) -> Printf.printf "rcut: %S %S\n" l r
  | None -> ()
  end;
  Printf.printf "chop_prefix: %S\n"
    begin match Stringext.chop_prefix "- list item" ~prefix:"- " with
    | None -> "" (* returns none if prefix not found *)
    | Some x -> x
    end;
  Printf.printf "drop: %S\n"
    (Stringext.drop "-------->" 5);
  Printf.printf "take: %S\n"
    (Stringext.take "-------->" 5);
  Printf.printf "trim_left_sub: %S\n"
    (Stringext.trim_left_sub "-23-56+89+" ~pos:0 ~len:10 ~chars:"+-")

let () =
  match Sys.argv with
  | [|_|] -> go ()
  | _ -> Printf.eprintf "stringext example: unknown command line\n"
