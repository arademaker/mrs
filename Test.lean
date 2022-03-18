
/- 
   Examples from 
   https://github.com/delph-in/docs/wiki/MatrixMrsTestSuiteEn 
-/


/- 
SENT: It rained.

[  LTOP: h0
  INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
   RELS: < [ _rain_v_1<3:9> LBL: h1 ARG0: e2 ] >
  HCONS: < h0 qeq h1 >
  ICONS: < > ]
-/

section FOF
 variable (u : Type)
 variable (_rain_v_1 : u → Prop)

 #check ∃ e2, _rain_v_1 e2
end FOF


section TFF
 variable (e : Type) 
 variable (_rain_v_1 : e → Prop)

 #check ∃ e2, _rain_v_1 e2

end TFF


/-
SENT: Abrams barked.
[ LTOP: h0
 INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
  RELS: < [ proper_q<0:6>   LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
          [ named<0:6>      LBL: h7 CARG: "Abrams" ARG0: x3 ]
          [ _bark_v_1<7:13> LBL: h1 ARG0: e2 ARG1: x3 ] >
 HCONS: < h0 qeq h1 h5 qeq h7 >
 ICONS: < > ]
-/

section FOF
 variable (u : Type)
 variable (_bark_v_1 : u → u → Prop)
 variable (named : u → Prop)  /- string? -/

 #check ∃ e2, ∃ x3, _bark_v_1 e2 x3 ∧ named x3
end FOF


section TFF
 variable (e : Type) (x : Type)
 variable (_bark_v_1 : e → x → Prop)
 variable (named : String → x → Prop)

 #check ∃ e2 : e, ∃ x3 : x, _bark_v_1 e2 x3 ∧ named "Abrams" x3
end TFF


/-
SENT: The dog arrived barking.
[ LTOP: h0
 INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
  RELS: < [ _the_q<0:3>       LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
          [ _dog_n_1<4:7>     LBL: h7 ARG0: x3 ]
          [ _arrive_v_1<8:15> LBL: h8 ARG0: e2 ARG1: x3 ]
          [ subord<16:24>     LBL: h1 ARG0: e9 [ e SF: prop ] ARG1: h10 ARG2: h11 ]
          [ _bark_v_1<16:23>  LBL: h12 ARG0: e13 [ e SF: prop TENSE: untensed MOOD: indicative PROG: + PERF: - ] ARG1: i14 ] >
HCONS: < h0 qeq h1 h5 qeq h7 h10 qeq h8 h11 qeq h12 >
ICONS: < > ]
-/


section TFF
 variable (e : Type) (x : Type) (i : Type)
 variable (_dog_n_1 : x → Prop)
 variable (_arrive_v_1 : e → x → Prop)
 variable (subord : e → Prop → Prop → Prop)
 variable (_bark_v_1 : e → i → Prop)  /- how to deal with uninstantiated? -/

 #check ∃ e2, ∃ x3, _arrive_v_1 e2 x3 ∧ _dog_n_1 x3
 #check ∃ e13, ∃ i14, _bark_v_1 e13 i14
 #check ∃ e9, subord e9 (∃ e9, ∃ e13, ∃ i14, _bark_v_1 e13 i14) (∃ e2, ∃ x3, _arrive_v_1 e2 x3 ∧ _dog_n_1 x3)
end TFF



/-
SENT: Any farmer who owns a donkey beats it
[ LTOP: h0
 INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: - PERF: - ]
  RELS: < [ _any_q<0:3>        LBL:  h4 ARG0: x3 RSTR: h5 BODY: h6 ]
          [ _farmer_n_1<4:10>  LBL:  h7 ARG0: x3 ]
          [ _own_v_1<15:19>    LBL:  h7 ARG0: e8 ARG1: x3 ARG2: x9 ]
          [ _a_q<20:21>        LBL: h10 ARG0: x9 RSTR: h11 BODY: h12 ]
          [ _donkey_n_1<22:28> LBL: h13 ARG0: x9 ]
          [ _beat_v_to<29:34>  LBL:  h1 ARG0: e2 ARG1: x3 ARG2: x14 ]
          [ pron<35:37>        LBL: h15 ARG0: x14 ]
          [ pronoun_q<35:37>   LBL: h16 ARG0: x14 RSTR: h17 BODY: h18 ] >
HCONS: < h0 qeq h1 h5 qeq h7 h11 qeq h13 h17 qeq h15 >
ICONS: < > ]

h1: _beat_v_to x3 x14

h4: any_q x3                                     any_q v P Q  =>  ∀ v, P → Q 
  h5 = h7: _farmer_n_1 x3 ∧ _own_v_1 e8 x3 x9
  h6: ?                                          h1=h18 and h6=h16  or h6=h1 and h18=h4 

h10: a_q x9                                      a_q v P Q  =>  ∃ v, P ∧ Q
  h11 = h13: _donkey_n_1 x9
  h12: h4                                        because x9 used in h5 

h16: pronoun_q x14                               pronoun_q v P Q  =>  ∃ v, P ∧ Q
  h17 = h15: pron x14
  h18: ?                                         h1=h18 and h6=h16  or h6=h1 and h18=h4 
-/

section FOF
 variable (u : Type)
 variable (_farmer_n_1 : u → Prop)
 variable (_own_v_1 : u → u → u → Prop)
 variable (_donkey_n_1 : u → Prop)
 variable (_beat_v_to : u → u → u → Prop)
 variable (pron : u → Prop)

 #check ∃ e8 e2, (∃ x9, (_donkey_n_1 x9) ∧ (∀ x3, (_farmer_n_1 x3 ∧ _own_v_1 e8 x3 x9) → (∃ x14, pron x14 ∧ _beat_v_to e2 x3 x14)))
end FOF

section MTT 

  abbrev CN := Type

  variable (_farmer_n_1 : CN)
  variable (_donkey_n_1 : CN)
  variable (_own_v_1 : _farmer_n_1 → _donkey_n_1 → Type)
  variable (_beat_v_to : _farmer_n_1 → _donkey_n_1 → Prop)

  #check ∀ z : (Σ x : _farmer_n_1, Σ y : _donkey_n_1, _own_v_1 x y), _beat_v_to z.1 z.2.1
 
end MTT


section 
 variable (entity : Type)

 variable (rich : entity → Type)
 variable (linguist : entity → Type)

 variable (john : entity)
 variable (w : linguist john) 

 variable (v : ∀ x : (@Sigma entity linguist), rich x.1)

 theorem test : rich john := 
  by have h₁ := v (Sigma.mk john w)
     exact h₁ 
end








          
    
    
 
