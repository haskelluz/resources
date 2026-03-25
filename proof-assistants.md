# Isbot assistentlari

Isbot assistenti (inglizcha: "proof assistant"), yoxud (interaktiv) teorema isbotlovchi (inglizcha: "(interactive) theorem prover"), [formal isbot](./formal-proof.md)lar ustida ishlashga yordam beradigan dasturdir.
Bunga [Agda](#agda), [Lean](#lean), [Rocq (sobiq Coq)](#rocq), [Isabelle](#isabelle) va boshqalar misol bo'la oladi.

## Lean

- [Veb-sahifa](https://lean-lang.org/)

Lean — klassik sof matematika uchun moslashgan isbot assistentidir.
Lean'da **mathlib** nomli juda katta formallashtirilgan matematika kutubxonasi bor.
Lean'da eng kuchli makros tizimlaridan biri bor va isbotlar asosan taktikalar (tactics) yordamida yoziladi.

### Kitoblar

- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)
- [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)

### Interaktiv kurslar

- [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4)

## Rocq

- [Veb-sahifa](https://rocq-prover.org/)

Rocq tarixiy jihatdan eng mashhur isbot assistentlaridan biri bo'lib, ko'p hollarda "dasturlarni tekshirish" (software verification) uchun ishlatiladi.
Masalan, Rocq'da **SSReflect** kutubxonasi, Iris freymvorki va xatosiz C kompilyatori (CompCert) yozilgan.
SSReflect kutubxonasi diskret matematika uchun mo'ljallangan.
Rocq'ning qiziqarli jihatlaridan biri — Rocq'da yozilgan kodni OCaml va Haskell'ga **extract** qilish mumkin.

### Kitoblar

- [Programs and Proofs](https://github.com/ilyasergey/pnp) — kichik, amaliy va zich kitob
- [Modeling and Proving in Computational Type Theory](https://github.com/uds-psl/MPCTT) — Rocq asoslari haqida
- [Software Foundations](https://softwarefoundations.cis.upenn.edu/)
- [Iris tutorial](https://github.com/logsem/iris-tutorial) — Iris orqali concurrent dasturlarning xavfsizligini isbotlash haqida

## Agda

- [Veb-sahifa](https://wiki.portal.chalmers.se/agda/pmwiki.php)

Agda — funksional dasturlash tili bo'lib, unda isbot yozish dastur yozish bilan bir xil.
U o'zining "interaktiv tahrirlash" (interactive editing) uslubi bilan mashhur bo'lib, unda siz kodingizda "teshiklar" qoldirasiz va tiplarga asoslanib Agda'dan ularni to'ldirishda yordam so'raysiz.
Cubical kutubxonasi orqali Agda [HoTT](https://homotopytypetheory.org/book/)ni yaxshi qo'llab-quvvatlaydi.
Agda'da boshqa tillarda uchramaydigan ekzotik xususiyatlar ko'p.
Konstruktiv mantiq haqida o'rganmoqchi bo'lsangiz, Agda yaxshi tanlov.

### Kitoblar

- [Programming Language Foundations in Agda](https://plfa.github.io/)

### Interaktiv kurslar

- [Let's play Agda](https://lets-play-agda.quasicoherent.io/)
- [The HoTT Game](https://thehottgameguide.readthedocs.io/en/latest/)

## Isabelle

- [Veb-sahifa](https://isabelle.in.tum.de/)
