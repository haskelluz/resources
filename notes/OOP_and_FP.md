# OOP va FP dushman emas. Hech qachon bo'lmagan ham.

## Kirish

Dasturlash olamida ko'p tortishuvlar mavjud. Eng ziddiyatli mavzulardan biri OOP va FP qarshiligi. Dasturchilar ikki guruhga bo'linib olib bir biriga tosh otishdan charchashmaydi. Biri OOP ni "axlat" desa, boshqasi FP ni "akademik" yohud "amaliyotga yaroqsiz" deydi.

Aslida esa OOP va FP bir biriga qarshi emas. Hech qachon bo'lmagan ham. Keltirib o'tirgan ziddiyatim ham odamlarni johilligi va tarafkashlik mahsuli.

## G'oya

Asosiy g'oya shundan iboratki, FP da biz "data" bilan ishlaymiz. Bunga yaqqol misol Haskell'dagi "ADT" (Algebraic Data Type) lar:

```hs
data List a
  = Cons a (List a)
  | Nil

sum :: List Int -> Int
sum Nil = 0
sum (Cons x xs) = x + sum xs
```

OOP da esa biz "codata" bilan ishlaymiz. Bunga yaqqol misol Agda'dagi ["Coinductive Record"](https://agda.readthedocs.io/en/latest/language/coinduction.html) lar:

```agda
record Stream (A : Set) : Set where
  coinductive
  field
    head : A
    tail : Stream A

ones : Stream Nat
ones .head = 1
ones .tail = ones
```

> [!NOTE]
> Chuqurroq qaraydigan bo'lsak, OOP va FP orasidagi farq kategoriya nazariyasidagi algebra va koalgebra o'rtasidagi ikkilikka (duality) borib taqaladi. FP dagi "data" - bu algebraik tuzilma, OOP dagi "codata" esa koalgebraik tuzilma.

Yuqoridagi misollarga qarasak, Haskell'dagi `List`:

1. Chekli
2. Strukturaviy rekursiya (structural recursion) orqali **iste'mol qilinadi** (consume)

Agda'dagi `Stream` esa:

1. Cheksiz
2. Korekursiya (corecursion) orqali **ishlab chiqariladi** (produce)

Albatta bu OOP haqidagi hamma narsa emas, shuning uchun, batafsil ma'lumot olmoqchi bo'lsangiz bu maqolani o'qishni maslahat beramiz:

- [Deriving Dependently-Typed OOP from First Principles](https://dl.acm.org/doi/pdf/10.1145/3649846)

> [!WARNING]
> OOP deganda hammani hayoliga, qaysi tillar bilan tanishligiga qarab har hil fikrlar keladi. "Qaysi tilda OOP to'g'ri Java'dami, JavaScript'dami, [Erlang][erlang-interview]'dami, [Smalltalk][smalltalk]'dami yoki Common Lisp'dagi [CLOS][clos]'dami?" degan kabi savollar tug'ilishi oddiy hol. Hech qaysi tildagi OOP ga suyanmasdan OOP konseptini o'zini o'rganishni maslahat berib qolamiz. Chunki ba'zi tillardagi bor narsalar boshqalarida yo'q bo'lisi mumkin. Qaysidir implementatsiyaga bog'lanib qolish yana tarafkashlikka olib keladi.

Sof OOP konseptini o'rganmoqchi bo'lsangiz ajoyib universitet kursi ham mavjud:

- [Object-Oriented Programming Languages: Application and Interpretation](https://users.dcc.uchile.cl/~etanter/ooplai/)

## Xulosa

Tanlov OOP **yoki** FP emas, balkim OOP **va** FP. Har bir vazifa uchun mos vositani tanlang. Leopold aytganiday:

$$
\textbf{Bolalar, kelinglar inoq do'st bo'lib yashaylik!}
$$

[erlang-interview]: https://www.infoq.com/interviews/johnson-armstrong-oop/
[smalltalk]: https://en.wikipedia.org/wiki/Smalltalk
[clos]: https://en.wikipedia.org/wiki/Common_Lisp_Object_System
