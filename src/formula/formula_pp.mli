(**************************************************************************)
(*  This file is part of BINSEC.                                          *)
(*                                                                        *)
(*  Copyright (C) 2016-2021                                               *)
(*    CEA (Commissariat à l'énergie atomique et aux énergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version 2.1                 *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

(** Formula printer *)

(** This module aim at generating well formatted smtlib2
    formulas, taking in account some solvers differences
    (e.g: boolector not supporting function have arrays
    in parameters). All the strings generated by this
    module are smtlib 2 compliant. *)

open Formula

val pp_status : Format.formatter -> status -> unit
(** pretty print the [smt_result] with a given color *)

val print_status : status -> string
(** @return the string associated with a [smt_result] *)

val print_bv_unop : bv_unop -> string
(** @return the string of an unary bitvector expression *)

val print_bv_bnop : bv_bnop -> string
(** @return the string of a binary bitvector expression *)

val print_bv_comp : bv_comp -> string
(** @return the string of a binary bitvector expression *)

val print_bv_term : bv_term -> string
(** @return the string of a bitvector expression. *)

val print_ax_term : ax_term -> string
(** see print_bv_term *)

val print_bl_term : bl_term -> string
(** see print_bv_term *)

val print_varset : VarSet.t -> string
(** @return the string formatting every input variable on
    a new line *)

val pp_varset : Format.formatter -> VarSet.t -> unit

val print_header : unit -> string
(** @return the preformatted header *)

val pp_header : Format.formatter -> unit -> unit

val pp_as_comment :
  (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a -> unit

val pp_bl_term : Format.formatter -> Formula.bl_term -> unit

val pp_bv_term : Format.formatter -> Formula.bv_term -> unit

val pp_ax_term : Format.formatter -> Formula.ax_term -> unit

val pp_term : Format.formatter -> Formula.term -> unit

val pp_entry : Format.formatter -> Formula.entry -> unit

val pp_formula : Format.formatter -> Formula.formula -> unit
