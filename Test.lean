
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
  RELS: < [ proper_q<0:6> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
          [ named<0:6> LBL: h7 CARG: "Abrams" ARG0: x3 ]
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
  RELS: < [ _the_q<0:3> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
          [ _dog_n_1<4:7> LBL: h7 ARG0: x3 ]
          [ _arrive_v_1<8:15> LBL: h8 ARG0: e2 ARG1: x3 ]
          [ subord<16:24> LBL: h1 ARG0: e9 [ e SF: prop ] ARG1: h10 ARG2: h11 ]
          [ _bark_v_1<16:23> LBL: h12 ARG0: e13 [ e SF: prop TENSE: untensed MOOD: indicative PROG: + PERF: - ] ARG1: i14 ] >
HCONS: < h0 qeq h1 h5 qeq h7 h10 qeq h8 h11 qeq h12 >
ICONS: < > ]
-/


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








    
        
    
    
 
