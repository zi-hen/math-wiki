
---
citekey: steinFourierAnalysisIntroduction2003a
title: "Fourier Analysis: An Introduction"
authors: ["Stein, Elias M.", "Shakarchi, Rami"]
year: 2003
publication: ""
volume: ""
pages: ""
doi: 
type: raw-paper
status: unverified
ingested: 2026-08-12
tags: []
---

# Fourier Analysis: An Introduction

> **Citekey**: `steinFourierAnalysisIntroduction2003a` · **Type**: book
> **Authors**: Stein, Elias M.; Shakarchi, Rami
> **Year**: 2003 · **Publication**:  , 
> **DOI**:  · **Zotero URI**: http://zotero.org/users/21153529/items/8KPS7238

## Abstract



## Metadata

- Item type: book
- Date added: 1786431367000
- Tags: 

## PDF Annotations

### p.12 · highlight

> Fourier series. At this early stage it is not appropriate to introduce measure theory and Lebesgue integration. For this reason our treatment of Fourier series in the first four chapters is carried out in the context of Riemann integrable functions. Even with this restriction, a substantial part of the theory can be developed, detailing convergence and summability; also, a variety of connections with other problems in mathematics can be illustrated.  • Fourier transform. For the same reasons, instead of undertaking  the theory in a general setting, we confine ourselves in Chapters 5 and 6 largely to the framework of test functions. Despite these limitations, we can learn a number of basic and interesting facts about Fourier analysis in Rd and its relation to other areas, including the wave equation and the Radon transform.
### p.13 · highlight

> Finite Fourier analysis. This is an introductory subject par excellence, because limits and integrals are not explicitly present. Nevertheless, the subject has several striking applications, including the proof of the infinitude of primes in arithmetic progression.
### p.18 · highlight

> We will do this initially in the context of the problem of the vibrating string, and we will proceed in three steps. First, we describe several physical (empirical) concepts which motivate corresponding mathematical ideas of importance for our study. These are: the role of the functions cos t, sin t, and eit suggested by simple harmonic motion; the use of separation of variables, derived from the phenomenon of standing waves; and the related concept of linearity, connected to the superposition of tones. Next, we derive the partial differential equation which governs the motion of the vibrating string. Finally, we will use what we learned about the physical nature of the problem (expressed mathematically) to solve the equation.
### p.20 · highlight

> We make two observations regarding our examination of simple harmonic motion. The first is that the mathematical description of the most elementary oscillatory system, namely simple harmonic motion, involves
### p.21 · highlight

> the most basic trigonometric functions cos t and sin t.
### p.21 · highlight

> The second observation is that simple harmonic motion is determined as a function of time by two initial conditions, one determining the position, and the other the velocity (specified, for example, at time t = 0). This property is shared by more general oscillatory systems, as we shall see below
### p.21 · highlight

> First, we consider standing waves. These are wavelike motions  described by the graphs y = u(x, t) developing in time t as shown in Figure 3.  In other words, there is an initial profile y = φ(x) representing the wave at time t = 0, and an amplifying factor ψ(t), depending on t, so that y = u(x, t) with  u(x, t) = φ(x)ψ(t).  The nature of standing waves suggests the mathematical idea of “separation of variables,” to which we will return later.
### p.25 · highlight

> This has to do with scaling, or in the language of physics, a “change of units.” That is, we can think of the coordinate x as x = aX where a is an appropriate positive constant. Now, in terms of the new coordinate X, the interval 0 ≤ x ≤ L becomes 0 ≤ X ≤ L/a. Similarly, we can replace the time coordinate t by t = bT , where b is another positive constant. If we set U (X, T ) = u(x, t), then  ∂U ∂X = a∂u  ∂x, ∂2U  ∂X2 = a2 ∂2u  ∂x2 ,  and similarly for the derivatives in t. So if we choose a and b appropriately, we can transform the one-dimensional wave equation into  ∂2U ∂T 2 = ∂2U  ∂X2 ,  which has the effect of setting the velocity c equal to 1.
### p.25 · highlight

> • using traveling waves, • using the superposition of standing waves.
### p.25 · highlight

> However, as a consequence of Fourier’s ideas, it became clear that the problem could be worked either way for all initial conditions.
### p.28 · highlight

> The form of this solution is known as d’Alembert’s formula.
### p.28 · highlight

> The passage from t ≥ 0 to t ∈ R, and then back to t ≥ 0, which was made above, exhibits the time reversal property of the wave equation. In other words, a solution u to the wave equation for t ≥ 0, leads to a solution u− defined for negative time t < 0 simply by setting u−(x, t) = u(x, −t), a fact which follows from the invariance of the wave equation under the transformation t 7→ −t. The situation is quite different in the case of the heat equation.
### p.28 · highlight

> By our considerations of standing waves, we are led to look for special solutions to the wave equation which are of the form φ(x)ψ(t). This procedure, which works equally well in other contexts (in the case of the heat equation, for instance), is called separation of variables and constructs solutions that are called pure tones. Then by the linearity
### p.29 · highlight

> of the wave equation, we can expect to combine these pure tones into a more complex combination of sound. Pushing this idea further, we can hope ultimately to express the general solution of the wave equation in terms of sums of these particular solutions
### p.29 · highlight

> This observation provides another reason to look for solutions of the equation in the form u(x, t) = φ(x)ψ(t) (that is, to “separate variables”), the hope being to reduce a difficult partial differential equation into a system of simpler ordinary differential equations.
### p.31 · highlight

> We now return to the original problem. Recall that the wave equation is linear in the sense that if u and v solve the equation, so does αu + βv for any constants α and β. This allows us to construct more solutions by taking linear combinations of the standing waves um. This technique, called superposition, leads to our final guess for a solution of the wave equation (4) u(x, t) =  ∞ ∑  m=1  (Am cos mt + Bm sin mt) sin mx.  Note that the above sum is infinite, so that questions of convergence arise,
### p.31 · highlight

> Since the initial shape of the string can be any reasonable function f , we must ask the following basic question:  Given a function f on [0, π] (with f (0) = f (π) = 0), can we find coefficients Am so that (5) f (x) =  ∞ ∑  m=1  Am sin mx ?
### p.33 · highlight

> We can now reformulate the problem raised above:  Question: Given any reasonable function F on [−π, π], with Fourier coefficients defined above, is it true that  (7) F (x) =  ∞ ∑  m=−∞  ameimx ?  This formulation of the problem, in terms of complex exponentials, is the form we shall use the most in what follows.
### p.33 · highlight

> In other words, his idea was that any function is the linear combination (possibly infinite) of the most basic trigonometric functions sin mx and cos mx, where m ranges over the integers.4 Although this idea was implicit in earlier work, Fourier had the conviction that his predecessors lacked, and he used it in his study of heat diffusion; this began the subject of “Fourier analysis.” This discipline, which was first developed to solve certain physical problems, has proved to have many applications in mathematics and other fields as well, as we shall see later.
### p.35 · highlight

> As a final remark, we should note an unsatisfactory aspect of the solution to this problem, which however is in the nature of things. Since the initial data f (x) for the plucked string is not twice continuously differentiable, neither is the function u (given by (9)). Hence u is not truly a solution of the wave equation: while u(x, t) does represent the position of the plucked string, it does not satisfy the partial differential equation we set out to solve! This state of affairs may be understood properly only if we realize that u does solve the equation, but in an appropriate generalized sense. A better understanding of this phenomenon requires ideas relevant to the study of “weak solutions” and the theory of “distributions.”
### p.40 · highlight

> Historical Note: D’Alembert (in 1747) first solved the equation of the vibrating string using the method of traveling waves. This solution was elaborated by Euler a year later. In 1753, D. Bernoulli proposed the solution which for all intents and purposes is the Fourier series given by (4), but Euler was not entirely convinced of its full generality, since this could hold only if an “arbitrary” function could be expanded in Fourier series. D’Alembert and other mathematicians also had doubts. This viewpoint was changed by Fourier (in 1807) in his study of the heat equation, where his conviction and work eventually led others to a complete proof that a general function could be represented as a Fourier series.
### p.41 · highlight

> 4. For z ∈ C, we define the complex exponential by  ez =  ∞ ∑  n=0  zn n! .  (a) Prove that the above definition makes sense, by showing that the series  converges for every complex number z. Moreover, show that the convergence is uniform5 on every bounded subset of C. (b) If z1, z2 are two complex numbers, prove that ez1 ez2 = ez1+z2 . [Hint: Use  the binomial theorem to expand (z1 + z2)n, as well as the formula for the binomial coefficients.]
### p.42 · highlight

> (c) Show that if z is purely imaginary, that is, z = iy with y ∈ R, then  eiy = cos y + i sin y.  This is Euler’s identity. [Hint: Use power series.] (d) More generally,  ex+iy = ex(cos y + i sin y)  whenever x, y ∈ R, and show that  |ex+iy| = ex.  (e) Prove that ez = 1 if and only if z = 2πki for some integer k. (f) Show that every complex number z = x + iy can be written in the form  z = reiθ ,  where r is unique and in the range 0 ≤ r < ∞, and θ ∈ R is unique up to an integer multiple of 2π. Check that  r = |z| and θ = arctan(y/x)  whenever these formulas make sense. (g) In particular, i = eiπ/2. What is the geometric meaning of multiplying a  complex number by i? Or by eiθ for any θ ∈ R? (h) Given θ ∈ R, show that  cos θ = eiθ + e−iθ  2 and sin θ = eiθ − e−iθ  2i . These are also called Euler’s identities. (i) Use the complex exponential to derive trigonometric identities such as  cos(θ + θ) = cos θ cos θ − sin θ sin θ, and then show that  2 sin θ sin φ = cos(θ − φ) − cos(θ + φ) , 2 sin θ cos φ = sin(θ + φ) + sin(θ − φ).  This calculation connects the solution given by d’Alembert in terms of traveling waves and the solution in terms of superposition of standing waves.
### p.44 · highlight

> 10. Show that the expression of the Laplacian  4 = ∂2  ∂x2 + ∂2  ∂y2  is given in polar coordinates by the formula  4 = ∂2  ∂r2 + 1  r ∂ ∂r + 1  r2  ∂2 ∂θ2 .  Also, prove that  ∣∣∣∣ ∂u  ∂x  ∣∣∣∣  2  +  ∣∣∣∣ ∂u  ∂y  ∣∣∣∣  2  =  ∣∣∣∣ ∂u  ∂r  ∣∣∣∣  2  +1  r2  ∣∣∣∣ ∂u  ∂θ  ∣∣∣∣  2  .
### p.46 · highlight

> Are two functions with the same Fourier coefficients necessarily equal? Indeed, a simple argument shows that if both functions are continuous, then in fact they must agree.  Next, we take a closer look at the partial sums of a Fourier series. Using the formula for the Fourier coefficients (which involves an integration), we make the key observation that these sums can be written conveniently as integrals:  1 2π  ∫  DN (x − y)f (y) dy,  where {DN } is a family of functions called the Dirichlet kernels. The above expression is the convolution of f with the function DN . Convolutions will play a critical role in our analysis. In general, given a family of functions {Kn}, we are led to investigate the limiting properties as n tends to infinity of the convolutions  1 2π  ∫  Kn(x − y)f (y) dy.  We find that if the family {Kn} satisfies the three important properties of “good kernels,” then the convolutions above tend to f (x) as n → ∞ (at least when f is continuous). In this sense, the family {Kn} is an
### p.47 · highlight

> “approximation to the identity.” Unfortunately, the Dirichlet kernels DN do not belong to the category of good kernels, which indicates that the question of convergence of Fourier series is subtle.  Instead of pursuing at this stage the problem of convergence, we consider various other methods of summing the Fourier series of a function. The first method, which involves averages of partial sums, leads to convolutions with good kernels, and yields an important theorem of Fej ́er. From this, we deduce the fact that a continuous function on the circle can be approximated uniformly by trigonometric polynomials. Second, we may also sum the Fourier series in the sense of Abel and again encounter a family of good kernels. In this case, the results about convolutions and good kernels lead to a solution of the Dirichlet problem for the steady-state heat equation in the disc, considered at the end of the previous chapter
### p.50 · highlight

> There is a natural connection between 2π-periodic functions on R like the exponentials einθ, functions on an interval of length 2π, and functions on the unit circle. This connection arises as follows.  A point on the unit circle takes the form eiθ, where θ is a real number that is unique up to integer multiples of 2π. If F is a function on the circle, then we may define for each real number θ  f (θ) = F (eiθ),  and observe that with this definition, the function f is periodic on R of period 2π, that is, f (θ + 2π) = f (θ) for all θ. The integrability, continuity and other smoothness properties of F are determined by those of f . For instance, we say that F is integrable on the circle if f is integrable on every interval of length 2π. Also, F is continuous on the circle if f is continuous on R, which is the same as saying that f is continuous on any interval of length 2π. Moreover, F is continuously differentiable if f has a continuous derivative, and so forth.  Since f has period 2π, we may restrict it to any interval of length 2π, say [0, 2π] or [−π, π], and still capture the initial function F on the circle. We note that f must take the same value at the end-points of the interval since they correspond to the same point on the circle. Conversely, any function on [0, 2π] for which f (0) = f (2π) can be extended to a periodic function on R which can then be identified as a function on the circle. In particular, a continuous function f on the interval [0, 2π] gives rise to a continuous function on the circle if and only if f (0) = f (2π).  In conclusion, functions on R that 2π-periodic, and functions on an interval of length 2π that take on the same value at its end-points, are two equivalent descriptions of the same mathematical objects, namely, functions on the circle.
### p.51 · highlight

> If f is an integrable function given on an interval [a, b] of length L (that is, b − a = L), then the nth Fourier coefficient of f is defined by  fˆ(n) = 1  L  ∫b  a  f (x)e−2πinx/L dx, n ∈ Z.  The Fourier series of f is given formally3 by  ∑ ∞  n=−∞  fˆ(n)e2πinx/L.
### p.52 · highlight

> We may also consider the Fourier coefficients and Fourier series for a function defined on the circle. By our previous discussion, we may think of a function on the circle as a function f on R which is 2π-periodic. We may restrict the function f to any interval of length 2π, for instance [0, 2π] or [−π, π], and compute its Fourier coefficients. Fortunately, f is periodic and Exercise 1 shows that the resulting integrals are independent of the chosen interval. Thus the Fourier coefficients of a function on the circle are well defined.
### p.53 · highlight

> Example 1. Let f (θ) = θ for −π ≤ θ ≤ π. The calculation of the Fourier coefficients requires a simple integration by parts. First, if n 6= 0, then  fˆ(n) = 1  2π  ∫π  −π  θe−inθ dθ  =1  2π  [  −θ  in e−inθ  ]π  −π  +1  2πin  ∫π  −π  e−inθ dθ  = (−1)n+1  in ,  and if n = 0 we clearly have  fˆ(0) = 1  2π  ∫π  −π  θ dθ = 0.  Hence, the Fourier series of f is given by  f (θ) ∼ ∑  n6=0  (−1)n+1  in einθ = 2  ∑ ∞  n=1  (−1)n+1 sin nθ  n.
### p.53 · highlight

> Example 3. The Fourier series of the function  f (θ) = π  sin πα ei(π−θ)α on [0, 2π] is  f (θ) ∼  ∑ ∞  n=−∞  einθ n + α,
### p.54 · highlight

> Example 4. The trigonometric polynomial defined for x ∈ [−π, π] by  DN (x) =  N ∑ n=−N  einx  is called the N th Dirichlet kernel and is of fundamental importance in the theory (as we shall see later). Notice that its Fourier coefficients an have the property that an = 1 if |n| ≤ N and an = 0 otherwise. A closed form formula for the Dirichlet kernel is  DN (x) = sin((N + 1  2 )x)  sin(x/2) .
### p.54 · highlight

> Example 5. The function Pr(θ), called the Poisson kernel, is defined for θ ∈ [−π, π] and 0 ≤ r < 1 by the absolutely and uniformly convergent series  Pr(θ) =  ∑ ∞  n=−∞  r|n| einθ .  This function arose implicitly in the solution of the steady-state heat equation on the unit disc discussed in Chapter 1. Note that in calculating the Fourier coefficients of Pr(θ) we can interchange the order of integration and summation since the sum converges uniformly in θ for
### p.55 · highlight

> each fixed r, and obtain that the nth Fourier coefficient equals r|n|. One can also sum the series for Pr(θ) and see that  Pr(θ) = 1 − r2  1 − 2r cos θ + r2 .
### p.55 · highlight

> Suppose, for the sake of this discussion, that the function f (which is always assumed to be Riemann integrable) is defined on [−π, π]. The first question one might ask is whether the partial sums of the Fourier series of f converge to f pointwise. That is, do we have (1) lim  N→∞ SN (f )(θ) = f (θ) for every θ?
### p.55 · highlight

> We see quite easily that in general we cannot expect this result to be true at every θ, since we can always change an integrable function at one point without changing its Fourier coefficients. As a result, we might ask the same question assuming that f is continuous and periodic. For a long time it was believed that under these additional assumptions the answer would be “yes.” It was a surprise when Du Bois-Reymond showed that there exists a continuous function whose Fourier series diverges at a point.
### p.55 · highlight

> we might ask what happens if we add more smoothness conditions on f : for example, we might assume that f is continuously
### p.56 · highlight

> differentiable, or twice continuously differentiable.
### p.56 · highlight

> We will also interpret the limit (1) by showing that the Fourier series sums, in the sense of Ces`aro or Abel, to the function f at all of its points of continuity. This approach involves appropriate averages of the partial sums of the Fourier series of f .  Finally, we can also define the limit (1) in the mean square sense. In the next chapter, we will show that if f is merely integrable, then  1 2π  ∫π  −π  |SN (f )(θ) − f (θ)|2 dθ → 0 as N → ∞.  It is of interest to know that the problem of pointwise convergence of Fourier series was settled in 1966 by L. Carleson, who showed, among other things, that if f is integrable in our sense,4 then the Fourier series of f converges to f except possibly on a set of “measure 0.” The proof of this theorem is difficult and beyond the scope of this book.
### p.56 · highlight

> If we were to assume that the Fourier series of functions f converge to f in an appropriate sense, then we could infer that a function is uniquely determined by its Fourier coefficients. This would lead to the following statement: if f and g have the same Fourier coefficients, then f and g are necessarily equal. By taking the difference f − g, this proposition  can be reformulated as: if fˆ(n) = 0 for all n ∈ Z, then f = 0. As stated, this assertion cannot be correct without reservation, since calculating Fourier coefficients requires integration, and we see that, for example, any two functions which differ at finitely many points have the same Fourier series.
### p.56 · highlight

> Theorem 2.1 Suppose that f is an integrable function on the circle with  fˆ(n) = 0 for all n ∈ Z. Then f (θ0) = 0 whenever f is continuous at the point θ0.  Thus, in terms of what we know about the set of discontinuities of integrable functions,5 we can conclude that f vanishes for “most” values of θ.
### p.57 · highlight

> The idea now is to construct a family of trigonometric polynomials {pk} that “peak” at 0, and so that  ∫ pk(θ)f (θ) dθ → ∞ as k → ∞.
### p.58 · highlight

> The idea  of constructing a family of functions (trigonometric polynomials in this case) which peak at the origin, together with other nice properties, will play an important role in this book. Such families of functions will be taken up later in Section 4 in connection with the notion of convolution. For now, note that the above theorem implies the following.  Corollary 2.2 If f is continuous on the circle and fˆ(n) = 0 for all n ∈ Z, then f = 0
### p.58 · highlight

> Corollary 2.3 Suppose that f is a continuous function on the circle and  that the Fourier series of f is absolutely convergent, ∑∞  n=−∞ |fˆ(n)| < ∞.  Then, the Fourier series converges uniformly to f , that is,  lim  N→∞ SN (f )(θ) = f (θ) uniformly in θ.
### p.59 · highlight

> What conditions on f would guarantee the absolute convergence of its  Fourier series? As it turns out, the smoothness of f is directly related to the decay of the Fourier coefficients, and in general, the smoother the function, the faster this decay. As a result, we can expect that relatively smooth functions equal their Fourier series.
### p.59 · highlight

> Corollary 2.4 Suppose that f is a twice continuously differentiable function on the circle. Then  fˆ(n) = O(1/|n|2) as |n| → ∞,  so that the Fourier series of f converges absolutely and uniformly to f .
### p.60 · highlight

> Incidentally, we have also established the following important identity:  ̂f ′(n) = infˆ(n), for all n ∈ Z.
### p.60 · highlight

> So if f is differentiable and f ∼ ∑ aneinθ, then f ′ ∼ ∑ anineinθ.  Also, if f is twice continuously differentiable, then f ′′ ∼ ∑ an(in)2einθ, and so on. Further smoothness conditions on f imply even better decay of the Fourier coefficients
### p.61 · highlight

> Given two 2π-periodic integrable functions f and g on R, we define their convolution f ∗ g on [−π, π] by (2) (f ∗ g)(x) = 1  2π  ∫π  −π  f (y)g(x − y) dy.  The above integral makes sense for each x, since the product of two integrable functions is again integrable.
### p.61 · highlight

> Loosely speaking, convolutions correspond to “weighted averages.” For instance, if g = 1 in (2), then f ∗ g is constant and equal to 1  2π  ∫π  −π f (y) dy,  which we may interpret as the average value of f on the circle. Also, the convolution (f ∗ g)(x) plays a role similar to, and in some sense replaces, the pointwise product f (x)g(x) of the two functions f and g.
### p.62 · highlight

> So we observe that the problem of understanding SN (f ) reduces to the understanding of the convolution f ∗ DN .
### p.62 · highlight

> Proposition 3.1 Suppose that f , g, and h are 2π-periodic integrable functions. Then:  (i) f ∗ (g + h) = (f ∗ g) + (f ∗ h). (ii) (cf ) ∗ g = c(f ∗ g) = f ∗ (cg) for any c ∈ C. (iii) f ∗ g = g ∗ f . (iv) (f ∗ g) ∗ h = f ∗ (g ∗ h). (v) f ∗ g is continuous. (vi) ̂f ∗ g(n) = fˆ(n)gˆ(n).
### p.64 · highlight

> Lemma 3.2 Suppose f is integrable on the circle and bounded by B. Then there exists a sequence {fk}k∞=1 of continuous functions on the  circle so that  sup  x∈[−π,π]  |fk(x)| ≤ B for all k = 1, 2, . . . ,  and ∫ π  −π  |f (x) − fk(x)| dx → 0 as k → ∞.
### p.65 · highlight

> A family of kernels {Kn(x)}n∞=1 on the circle is said to be a family of good kernels if it satisfies the following properties: (a) For all n ≥ 1,  1 2π  ∫π  −π  Kn(x) dx = 1.  (b) There exists M > 0 such that for all n ≥ 1,  ∫π  −π  |Kn(x)| dx ≤ M.  (c) For every δ > 0,  ∫  δ≤|x|≤π  |Kn(x)| dx → 0, as n → ∞.
### p.65 · highlight

> We may interpret the kernels Kn(x) as weight distributions on the circle: property (a) says that Kn assigns unit mass to the whole circle [−π, π], and (c) that this mass concentrates near the origin as n becomes large.6
### p.65 · highlight

> 6In the limit, a family of good kernels represents the “Dirac delta function.” This terminology comes from physic
### p.66 · highlight

> Theorem 4.1 Let {Kn}n∞=1 be a family of good kernels, and f an integrable function on the circle. Then  nli→m∞(f ∗ Kn)(x) = f (x)  whenever f is continuous at x. If f is continuous everywhere, then the above limit is uniform.  Because of this result, the family {Kn} is sometimes referred to as an approximation to the identity
### p.66 · highlight

> approximation to the identity.  We have previously interpreted convolutions as weighted averages. In this context, the convolution  (f ∗ Kn)(x) = 1  2π  ∫π  −π  f (x − y)Kn(y) dy  is the average of f (x − y), where the weights are given by Kn(y). However, the weight distribution Kn concentrates its mass at y = 0 as n becomes large. Hence in the integral, the value f (x) is assigned the full mass as n → ∞.
### p.67 · highlight

> Indeed, an estimate shows that DN violates the second property; more precisely, one has (see Problem 2)  ∫π  −π  |DN (x)| dx ≥ c log N, as N → ∞.  However, we should note that the formula for DN as a sum of exponentials immediately gives  1 2π  ∫π  −π  DN (x) dx = 1,  so the first property of good kernels is actually verified. The fact that the mean value of DN is 1, while the integral of its absolute value is large,
### p.68 · highlight

> is a result of cancellations. Indeed, Figure 5 shows that the function DN (x) takes on positive and negative values and oscillates very rapidly as N gets large.
### p.68 · highlight

> This observation suggests that the pointwise convergence of Fourier series is intricate, and may even fail at points of continuity.
### p.69 · highlight

> We give a precise meaning to this by defining the average of the first N partial sums by  σN = s0 + s1 + · · · + sN−1  N.  The quantity σN is called the N th Ces`aro mean7 of the sequence {sk} or the N th Ces`aro sum of the series ∑∞  k=0 ck.  If σN converges to a limit σ as N tends to infinity, we say that the  series ∑ cn is Cesa`ro summable to σ. In the case of series of functions, we shall understand the limit in the sense of either pointwise or uniform convergence, depending on the situation.
### p.70 · highlight

> We mentioned earlier that the Dirichlet kernels fail to belong to the family of good kernels. Quite surprisingly, their averages are very well behaved functions, in the sense that they do form a family of good kernel
### p.70 · highlight

> Since Sn(f ) = f ∗ Dn, we find that  σN (f )(x) = (f ∗ FN )(x),
### p.70 · highlight

> Lemma 5.1 We have  FN (x) = 1  N  sin2(N x/2) sin2(x/2) ,  and the Feje ́r kernel is a good kernel
### p.70 · highlight

> Theorem 5.2 If f is integrable on the circle, then the Fourier series of f is Ces`aro summable to f at every point of continuity of f .  Moreover, if f is continuous on the circle, then the Fourier series of f is uniformly Ces`aro summable to f .
### p.71 · highlight

> Corollary 5.3 If f is integrable on the circle and fˆ(n) = 0 for all n, then f = 0 at all points of continuity of f .
### p.71 · highlight

> Corollary 5.4 Continuous functions on the circle can be uniformly approximated by trigonometric polynomials.
### p.71 · highlight

> A series of complex numbers ∑∞  k=0 ck is said to be Abel summable  to s if for every 0 ≤ r < 1, the series  A(r) =  ∞ ∑  k=0  ck rk  converges, and  rli→m1 A(r) = s.  The quantities A(r) are called the Abel means of the series
### p.72 · highlight

> Lemma 5.5 If 0 ≤ r < 1, then  Pr(θ) = 1 − r2  1 − 2r cos θ + r2 .
### p.73 · highlight

> The Poisson kernel is a good kernel,8 as r tends to 1 from below.
### p.73 · highlight

> Theorem 5.6 The Fourier series of an integrable function on the circle is Abel summable to f at every point of continuity. Moreover, if f is continuous on the circle, then the Fourier series of f is uniformly Abel summable to f .
### p.73 · highlight

> We now return to a problem discussed in Chapter 1, where we sketched the solution of the steady-state heat equation 4u = 0 in the unit disc with boundary condition u = f on the circle. We expressed the Laplacian in terms of polar coordinates, separated variables, and expected that a solution was given by (5) u(r, θ) =  ∑ ∞  m=−∞  am r|m| eimθ ,  where am was the mth Fourier coefficient of f . In other words, we were led to take  u(r, θ) = Ar(f )(θ) = 1  2π  ∫π  −π  f (φ)Pr(θ − φ) dφ.  We are now in a position to show that this is indeed the case.
### p.73 · highlight

> In this case, the family of kernels is indexed by a continuous parameter 0 ≤ r < 1, rather than the discrete n considered previously. In the definition of good kernels, we simply replace n by r and take the limit in property (c) appropriately, for example r → 1 in this case.
### p.74 · highlight

> Theorem 5.7 Let f be an integrable function defined on the unit circle. Then the function u defined in the unit disc by the Poisson integral  (6) u(r, θ) = (f ∗ Pr)(θ)  has the following properties:  (i) u has two continuous derivatives in the unit disc and satisfies  4u = 0.  (ii) If θ is any point of continuity of f , then  rli→m1 u(r, θ) = f (θ).  If f is continuous everywhere, then this limit is uniform.  (iii) If f is continuous, then u(r, θ) is the unique solution to the steadystate heat equation in the disc which satisfies conditions (i) and (ii).
### p.76 · highlight

> 6. Let f be the function defined on [−π, π] by f (θ) = |θ|.
### p.77 · highlight

> (a) Draw the graph of f . (b) Calculate the Fourier coefficients of f , and show that  fˆ(n) =     π  2 if n = 0,  −1 + (−1)n  πn2 if n 6= 0.  (c) What is the Fourier series of f in terms of sines and cosines? (d) Taking θ = 0, prove that  ∑  n odd ≥1  1  n2 = π2  8 and  ∞ ∑  n=1  1  n2 = π2  6.
### p.77 · highlight

> 7. Suppose {an}nN=1 and {bn}nN=1 are two finite sequences of complex numbers.  Let Bk = ∑k  n=1 bn denote the partial sums of the series ∑ bn with the convention  B0 = 0.  (a) Prove the summation by parts formula  N ∑ n=M  anbn = aN BN − aM BM−1 −  N −1  ∑  n=M  (an+1 − an)Bn. (b) Deduce from this formula Dirichlet’s test for convergence of a series: if the  partial sums of the series ∑ bn are bounded, and {an} is a sequence of real numbers that decreases monotonically to 0, then ∑ anbn converges.
### p.77 · highlight

> 8. Verify that 1  2i  ∑  n6=0  einx n is the Fourier series of the 2π-periodic sawtooth  function illustrated in Figure 6, defined by f (0) = 0, and  f (x) =     −π  2−x  2 if −π < x < 0,  π  2−x  2 if 0 < x < π.  Note that this function is not continuous. Show that nevertheless, the series converges for every x (by which we mean, as usual, that the symmetric partial sums of the series converge). In particular, the value of the series at the origin, namely 0, is the average of the values of f (x) as x approaches the origin from the left and the right.
### p.78 · highlight

> 9. Let f (x) = χ[a,b](x) be the characteristic function of the interval [a, b] ⊂ [−π, π], that is,  χ[a,b](x) =  { 1 if x ∈ [a, b],  0 otherwise. (a) Show that the Fourier series of f is given by  f (x) ∼ b − a  2π + ∑  n6=0  e−ina − e−inb  2πin einx. The sum extends over all positive and negative integers excluding 0. (b) Show that if a 6= −π or b 6= π and a 6= b, then the Fourier series does not  converge absolutely for any x. [Hint: It suffices to prove that for many values of n one has | sin nθ0| ≥ c > 0 where θ0 = (b − a)/2.] (c) However, prove that the Fourier series converges at every point x. What  happens if a = −π and b = π?
### p.78 · highlight

> 10. Suppose f is a periodic function of period 2π which belongs to the class Ck. Show that  fˆ(n) = O(1/|n|k) as |n| → ∞.  This notation means that there exists a constant C such |fˆ(n)| ≤ C/|n|k. We  could also write this as |n|kfˆ(n) = O(1), where O(1) means bounded. [Hint: Integrate by parts.]
### p.78 · highlight

> 11. Suppose that {fk}k∞=1 is a sequence of Riemann integrable functions on the  interval [0, 1] such that  ∫1  0  |fk(x) − f (x)| dx → 0 as k → ∞.
### p.79 · highlight

> Show that fˆk(n) → fˆ(n) uniformly in n as k → ∞.
### p.80 · highlight

> 15. Prove that the Fej ́er kernel is given by  FN (x) = 1  N  sin2(N x/2) sin2(x/2) . [Hint: Remember that N FN (x) = D0(x) + · · · + DN−1(x) where Dn(x) is the Dirichlet kernel. Therefore, if ω = eix we have  N FN (x) =  N −1  ∑  n=0  ω−n − ωn+1  1 − ω .]
### p.80 · highlight

> 16. The Weierstrass approximation theorem states: Let f be a continuous function on the closed and bounded interval [a, b] ⊂ R. Then, for any ≤ > 0, there exists a polynomial P such that  sup  x∈[a,b]  |f (x) − P (x)| < ≤.  Prove this by applying Corollary 5.4 of Fej ́er’s theorem and using the fact that the exponential function eix can be approximated by polynomials uniformly on any interval.
### p.80 · highlight

> 17. In Section 5.4 we proved that the Abel means of f converge to f at all points of continuity, that is,  rli→m1 Ar(f )(θ) = rli→m1(Pr ∗ f )(θ) = f (θ), with 0 < r < 1,  whenever f is continuous at θ. In this exercise, we will study the behavior of Ar(f )(θ) at certain points of discontinuity.  An integrable function is said to have a jump discontinuity at θ if the two limits  hli→ m0 h>0  f (θ + h) = f (θ+) and hli→ m0  h>0  f (θ − h) = f (θ−)  exist. (a) Prove that if f has a jump discontinuity at θ, then  rli→m1 Ar(f )(θ) = f (θ+) + f (θ−)  2 , with 0 ≤ r < 1. [Hint: Explain why 1  2π  ∫0  −π Pr(θ) dθ = 1  2π  ∫π  0 Pr(θ) dθ = 1  2 , then modify  the proof given in the text.]
### p.81 · highlight

> (b) Using a similar argument, show that if f has a jump discontinuity at θ,  the Fourier series of f at θ is Ces`aro summable to f(θ+)+f(θ−)  2.
### p.82 · highlight

> 1. One can construct Riemann integrable functions on [0, 1] that have a dense set of discontinuities as follows.  (a) Let f (x) = 0 when x < 0, and f (x) = 1 if x ≥ 0. Choose a countable dense  sequence {rn} in [0, 1]. Then, show that the function  F (x) =  ∞ ∑  n=1  1  n2 f (x − rn)  is integrable and has discontinuities at all points of the sequence {rn}. [Hint: F is monotonic and bounded.] (b) Consider next  F (x) =  ∞ ∑  n=1  3−ng(x − rn),  where g(x) = sin 1/x when x 6= 0, and g(0) = 0. Then F is integrable, discontinuous at each x = rn, and fails to be monotonic in any subinterval of [0, 1]. [Hint: Use the fact that 3−k > ∑  n>k 3−n.]
### p.83 · highlight

> (c) The original example of Riemann is the function  F (x) =  ∞ ∑  n=1  (nx)  n2 ,  where (x) = x for x ∈ (−1/2, 1/2] and (x) is continued to R by periodicity, that is, (x + 1) = (x). It can be shown that F is discontinuous whenever x = m/2n, where m, n ∈ Z with m odd and n 6= 0.
### p.83 · highlight

> 2. Let DN denote the Dirichlet kernel  DN (θ) =  N ∑ k=−N  eikθ = sin((N + 1/2)θ)  sin(θ/2) , and define  LN = 1  2π  ∫π  −π  |DN (θ)| dθ.  (a) Prove that  LN ≥ c log N  for some constant c > 0. [Hint: Show that |DN (θ)| ≥ c sin((N+1/2)θ)  |θ| , change  variables, and prove that  LN ≥ c  ∫ Nπ  π  | sin θ| |θ| dθ + O(1).  Write the integral as a sum ∑N−1  k=1  ∫ (k+1)π  kπ . To conclude, use the fact that  ∑n  k=1 1/k ≥ c log n.] A more careful estimate gives  LN = 4  π2 log N + O(1).  (b) Prove the following as a consequence: for each n ≥ 1, there exists a continuous function fn such that |fn| ≤ 1 and |Sn(fn)(0)| ≥ c′ log n. [Hint: The function gn which is equal to 1 when Dn is positive and −1 when Dn is negative has the desired property but is not continuous. Approximate gn in the integral norm (in the sense of Lemma 3.2) by continuous functions hk satisfying |hk| ≤ 1.]
### p.86 · highlight

> The first is “global” and concerns the overall behavior of a function f over the entire interval [0, 2π]. The result we have in mind is “meansquare convergence”: if f is integrable on the circle, then  1 2π  ∫ 2π  0  |f (θ) − SN (f )(θ)|2 dθ → 0 as N → ∞.  At the heart of this result is the fundamental notion of “orthogonality”; this idea is expressed in terms of vector spaces with inner products, and their related infinite dimensional variants, the Hilbert spaces. A connected result is the Parseval identity which equates the mean-square “norm” of the function with a corresponding norm of its Fourier coefficients. Orthogonality is a fundamental mathematical notion which has many applications in analysis.  The second viewpoint is “local” and concerns the behavior of f near a given point. The main question we consider is the problem of pointwise convergence: does the Fourier series of f converge to the value f (θ) for a given θ? We first show that this convergence does indeed hold whenever f is differentiable at θ. As a corollary, we obtain the Riemann localization principle, which states that the question of whether or not SN (f )(θ) → f (θ) is completely determined by the behavior of f in an
### p.87 · highlight

> arbitrarily small interval about θ. This is a remarkable result since the Fourier coefficients, hence the Fourier series, of f depend on the values of f on the whole interval [0, 2π].  Even though convergence of the Fourier series holds at points where f is differentiable, it may fail if f is merely continuous. The chapter concludes with the presentation of a continuous function whose Fourier series does not converge at a given point, as promised earlier.
### p.87 · highlight

> Theorem 1.1 Suppose f is integrable on the circle. Then  1 2π  ∫ 2π  0  |f (θ) − SN (f )(θ)|2 dθ → 0 as N → ∞.
### p.89 · highlight

> (i) The Pythagorean theorem: if X and Y are orthogonal, then  ‖X + Y ‖2 = ‖X‖2 + ‖Y ‖2.  (ii) The Cauchy-Schwarz inequality: for any X, Y ∈ V we have  |(X, Y )| ≤ ‖X‖ ‖Y ‖.  (iii) The triangle inequality: for any X, Y ∈ V we have  ‖X + Y ‖ ≤ ‖X‖ + ‖Y ‖.
### p.90 · highlight

> For (ii), we first dispose of the case when ‖Y ‖ = 0 by showing that this implies (X, Y ) = 0 for all X. Indeed, for all real t we have  0 ≤ ‖X + tY ‖2 = ‖X‖2 + 2t Re(X, Y )  and Re(X, Y ) 6= 0 contradicts the inequality if we take t to be large and positive (or negative). Similarly, by considering ‖X + itY ‖2, we find that Im(X, Y ) = 0.  If ‖Y ‖ 6= 0, we may set c = (X, Y )/(Y, Y ); then X − cY is orthogonal to Y , and therefore also to cY . If we write X = X − cY + cY and apply the Pythagorean theorem, we get  ‖X‖2 = ‖X − cY ‖2 + ‖cY ‖2 ≥ |c|2‖Y ‖2.  Taking square roots on both sides gives the result. Note that we have equality in the above precisely when X = cY
### p.90 · highlight

> The vector space `2(Z) over C is the set of all (two-sided) infinite sequences of complex numbers  (. . . , a−n, . . . , a−1, a0, a1, . . . , an, . . .) such that  ∑  n∈Z  |an|2 < ∞;
### p.91 · highlight

> that is, the series converges. Addition is defined componentwise, and so is scalar multiplication. The inner product between the two vectors A = (. . . , a−1, a0, a1, . . .) and B = (. . . , b−1, b0, b1, . . .) is defined by the absolutely convergent series  (A, B) = ∑  n∈Z  anbn.  The norm of A is then given by  ‖A‖ = (A, A)1/2 =  (∑  n∈Z  |an|2  )1/2  .  We must first check that `2(Z) is a vector space. This requires that if A and B are two elements in `2(Z), then so is the vector A + B. To see this, for each integer N > 0 we let AN denote the truncated element  AN = (. . . , 0, 0, a−N , . . . , a−1, a0, a1, . . . , aN , 0, 0, . . .),  where we have set an = 0 whenever |n| > N . We define the truncated element BN similarly. Then, by the triangle inequality which holds in a finite dimensional Euclidean space, we have  ‖AN + BN ‖ ≤ ‖AN ‖ + ‖BN ‖ ≤ ‖A‖ + ‖B‖.  Thus  ∑  |n|≤N  |an + bn|2 ≤ (‖A‖ + ‖B‖)2,  and letting N tend to infinity gives ∑  n∈Z |an + bn|2 < ∞. It also follows that ‖A + B‖ ≤ ‖A‖ + ‖B‖, which is the triangle inequality. The Cauchy-Schwarz inequality, which states that the sum ∑  n∈Z anbn converges absolutely and that |(A, B)| ≤ ‖A‖ ‖B‖, can be deduced in the same way from its finite analogue.
### p.91 · highlight

> (ii) The vector space is complete, which by definition means that  every Cauchy sequence in the norm converges to a limit in the vector space.
### p.92 · highlight

> An inner product space with these two properties is called a Hilbert space. We see that Rd and Cd are examples of finite-dimensional Hilbert spaces, while `2(Z) is an example of an infinite-dimensional Hilbert space
### p.92 · highlight

> Let R denote the set of complex-valued Riemann integrable functions on [0, 2π] (or equivalently, integrable functions on the circle). This is a vector space over C. Addition is defined pointwise by  (f + g)(θ) = f (θ) + g(θ). Naturally, multiplication by a scalar λ ∈ C is given by  (λf )(θ) = λ · f (θ). An inner product is defined on this vector space by (1) (f, g) = 1  2π  ∫ 2π  0  f (θ)g(θ) dθ.  The norm of f is then  ‖f ‖ =  (1  2π  ∫ 2π  0  |f (θ)|2 dθ  )1/2  .  One needs to check that the analogue of the Cauchy-Schwarz and triangle inequalities hold in this example; that is, |(f, g)| ≤ ‖f ‖ ‖g‖ and ‖f + g‖ ≤ ‖f ‖ + ‖g‖. While these facts can be obtained as consequences of the corresponding inequalities in the previous examples, the argument is a little elaborate and we prefer to proceed differently.  We first observe that 2AB ≤ (A2 + B2) for any two real numbers A and B. If we set A = λ1/2|f (θ)| and B = λ−1/2|g(θ)| with λ > 0, we get  |f (θ)g(θ)| ≤ 1  2 (λ|f (θ)|2 + λ−1|g(θ)|2). We then integrate this in θ to obtain  |(f, g)| ≤ 1  2π  ∫ 2π  0  |f (θ)| |g(θ)| dθ ≤ 1  2 (λ‖f ‖2 + λ−1‖g‖2).  Then, put λ = ‖g‖/‖f ‖ to get the Cauchy-Schwarz inequality. The triangle inequality is then a simple consequence, as we have seen above.
### p.93 · highlight

> In R, condition (i) for a Hilbert space fails, since ‖f ‖ = 0 implies only that f vanishes at its points of continuity. This is not a very serious problem since in the appendix we show that an integrable function is continuous except for a “negligible” set, so that ‖f ‖ = 0 implies that f vanishes except on a set of “measure zero.” One can get around the difficulty that f is not identically zero by adopting the convention that such functions are actually the zero function, since for the purpose of integration, f behaves precisely like the zero function.  A more essential difficulty is that the space R is not complete. One way to see this is to start with the function  f (θ) =  {0 for θ = 0, log(1/θ) for 0 < θ ≤ 2π.  Since f is not bounded, it does not belong to the space R. Moreover, the sequence of truncations fn defined by  fn(θ) =  {0 for 0 ≤ θ ≤ 1/n, f (θ) for 1/n < θ ≤ 2π  can easily be seen to form a Cauchy sequence in R (see Exercise 5). However, this sequence cannot converge to an element in R, since that limit, if it existed, would have to be f ;
### p.93 · highlight

> The construction and identification of this completion, the Lebesgue class L2([0, 2π]), represents an important turning point in the development of analysis (somewhat akin to the much earlier completion of the rationals, that is, the passage from Q to R).
### p.94 · highlight

> For each integer n, let en(θ) = einθ, and observe that the family {en}n∈Z is orthonormal; that is,  (en, em) =  {1 if n = m 0 if n 6= m.  Let f be an integrable function on the circle, and let an denote its Fourier coefficients. An important observation is that these Fourier coefficients are represented by inner products of f with the elements in the orthonormal set {en}n∈Z:  (f, en) = 1  2π  ∫ 2π  0  f (θ)e−inθ dθ = an.  In particular, SN (f ) = ∑  |n|≤N anen. Then the orthonormal property of  the family {en} and the fact that an = (f, en) imply that the difference  f −∑  |n|≤N anen is orthogonal to en for all |n| ≤ N . Therefore, we must  have (2) (f − ∑  |n|≤N  anen) ⊥ ∑  |n|≤N  bnen  for any complex numbers bn.
### p.95 · highlight

> Lemma 1.2 (Best approximation) If f is integrable on the circle with Fourier coefficients an, then  ‖f − SN (f )‖ ≤ ‖f − ∑  |n|≤N  cnen‖  for any complex numbers cn. Moreover, equality holds precisely when cn = an for all |n| ≤ N .
### p.95 · highlight

> This lemma has a clear geometric interpretation. It says that the trigonometric polynomial of degree at most N which is closest to f in the norm ‖ · ‖ is the partial sum SN (f ). This geometric property of the partial sums is depicted in Figure 1, where the orthogonal projection of f in the plane spanned by {e−N , . . . , e0, . . . , eN } is simply SN (f ).
### p.97 · highlight

> This identity provides an important connection between the norms in the two vector spaces `2(Z) and R.
### p.97 · highlight

> Theorem 1.3 Let f be an integrable function on the circle with  f ∼ ∑∞  n=−∞ aneinθ. Then we have:  (i) Mean-square convergence of the Fourier series  1 2π  ∫ 2π  0  |f (θ) − SN (f )(θ)|2 dθ → 0 as N → ∞.  (ii) Parseval’s identity  ∑ ∞  n=−∞  |an|2 = 1  2π  ∫ 2π  0  |f (θ)|2 dθ.  Remark 1. If {en} is any orthonormal family of functions on the circle, and an = (f, en), then we may deduce from the relation (3) that  ∞ ∑  n=−∞  |an|2 ≤ ‖f ‖2.  This is known as Bessel’s inequality. Equality holds (as in Parseval’s identity) precisely when the family {en} is also a “basis,” in the sense that ‖ ∑  |n|≤N anen − f ‖ → 0 as N → ∞.  Remark 2. We may associate to every integrable function the sequence {an} formed by its Fourier coefficients. Parseval’s identity guarantees that {an} ∈ `2(Z). Since `2(Z) is a Hilbert space, the failure of R to be complete, discussed earlier, may be understood as follows: there exist sequences {an}n∈Z such that ∑  n∈Z |an|2 < ∞, yet no Riemann integrable function F has nth Fourier coefficient equal to an for all n. An example is given in Exercise 6.
### p.97 · highlight

> Since the terms of a converging series tend to 0, we deduce from Parseval’s identity or Bessel’s inequality the following result.
### p.97 · highlight

> Theorem 1.4 (Riemann-Lebesgue lemma) If f is integrable on the  circle, then fˆ(n) → 0 as |n| → ∞.
### p.97 · highlight

> An equivalent reformulation of this proposition is that if f is integrable on [0, 2π], then  ∫ 2π  0  f (θ) sin(N θ) dθ → 0 as N → ∞
### p.98 · highlight

> and  ∫ 2π  0  f (θ) cos(N θ) dθ → 0 as N → ∞.  To conclude this section, we give a more general version of the Parseval identity which we will use in the next chapter.  Lemma 1.5 Suppose F and G are integrable on the circle with  F ∼ ∑ aneinθ and G ∼ ∑ bneinθ.  Then  1 2π  ∫ 2π  0  F (θ)G(θ) dθ =  ∑ ∞  n=−∞  anbn.
### p.98 · highlight

> The mean-square convergence theorem does not provide further insight into the problem of pointwise convergence. Indeed, Theorem 1.1 by itself does not guarantee that the Fourier series converges for any θ
### p.98 · highlight

> However, if a function is differentiable at a point θ0, then its Fourier series converges at θ0. After proving this result, we give an example of a continuous function with diverging Fourier series at one point. These phenomena are indicative of the intricate nature of the problem of pointwise convergence in the theory of Fourier series.
### p.98 · highlight

> Theorem 2.1 Let f be an integrable function on the circle which is differentiable at a point θ0. Then SN (f )(θ0) → f (θ0) as N tends to infinity.
### p.99 · highlight

> A striking consequence of this theorem is the localization principle of Riemann. This result states that the convergence of SN (f )(θ0) depends only on the behavior of f near θ0. This is not clear at first, since forming the Fourier series requires integrating f over the whole circle.
### p.100 · highlight

> Theorem 2.2 Suppose f and g are two integrable functions defined on the circle, and for some θ0 there exists an open interval I containing θ0 such that  f (θ) = g(θ) for all θ ∈ I.  Then SN (f )(θ0) − SN (g)(θ0) → 0 as N tends to infinity
### p.100 · highlight

> The principle that is involved here will be referred to as “symmetrybreaking.”1 The symmetry that we have in mind is the symmetry between the frequencies einθ and e−inθ which appear in the Fourier expansion of a function. For example, the partial sum operator SN is defined in a way that reflects this symmetry. Also, the Dirichlet, Feje`r, and Poisson kernels are symmetric in this sense. When we break the symmetry, that is, when we split the Fourier series ∑∞  n=−∞ aneinθ into the two  pieces ∑  n≥0 aneinθ and ∑  n<0 aneinθ, we introduce new and far-reaching  phenomena
### p.105 · highlight

> 2. Prove that the vector space `2(Z) is complete.  [Hint: Suppose Ak = {ak,n}n∈Z with k = 1, 2, . . . is a Cauchy sequence. Show that for each n, {ak,n}k∞=1 is a Cauchy sequence of complex numbers, therefore it converges to a limit, say bn. By taking partial sums of ‖Ak − Ak′ ‖ and letting  k′ → ∞, show that ‖Ak − B‖ → 0 as k → ∞, where B = (. . . , b−1, b0, b1, . . .).  Finally, prove that B ∈ `2(Z).]
### p.105 · highlight

> 3. Construct a sequence of integrable functions {fk} on [0, 2π] such that  kli→m∞  1 2π  ∫ 2π  0  |fk(θ)|2 dθ = 0  but limk→∞ fk(θ) fails to exist for any θ.  [Hint: Choose a sequence of intervals Ik ⊂ [0, 2π] whose lengths tend to 0, and so that each point belongs to infinitely many of them; then let fk = χIk .]
### p.105 · highlight

> 4. Recall the vector space R of integrable functions, with its inner product and norm  ‖f ‖ =  (1  2π  ∫ 2π  0  |f (x)|2 dx  )1/2  .  (a) Show that there exist non-zero integrable functions f for which ‖f ‖ = 0. (b) However, show that if f ∈ R with ‖f ‖ = 0, then f (x) = 0 whenever f is  continuous at x. (c) Conversely, show that if f ∈ R vanishes at all of its points of continuity,  then ‖f ‖ = 0.
### p.105 · highlight

> 5. Let  f (θ) =  {  0 for θ = 0 log(1/θ) for 0 < θ ≤ 2π, and define a sequence of functions in R by  fn(θ) =  {  0 for 0 ≤ θ ≤ 1/n f (θ) for 1/n < θ ≤ 2π. Prove that {fn}n∞=1 is a Cauchy sequence in R. However, f does not belong to  R.
### p.106 · highlight

> [Hint: Show that ∫ b  a (log θ)2 dθ → 0 if 0 < a < b and b → 0, by using the fact that  the derivative of θ(log θ)2 − 2θ log θ + 2θ is equal to (log θ)2.]
### p.106 · highlight

> 6. Consider the sequence {ak}k∞=−∞ defined by  ak =  { 1/k if k ≥ 1  0 if k ≤ 0.  Note that {ak} ∈ `2(Z), but that no Riemann integrable function has kth Fourier coefficient equal to ak for all k.
### p.106 · highlight

> 8. Exercise 6 in Chapter 2 dealt with the sums  ∑  n odd ≥1  1  n2 and  ∞ ∑  n=1  1  n2 .  Similar sums can be derived using the methods of this chapter. (a) Let f be the function defined on [−π, π] by f (θ) = |θ|. Use Parseval’s  identity to find the sums of the following two series:  ∞ ∑  n=0  1 (2n + 1)4 and  ∞ ∑  n=1  1  n4 .  In fact, they are π4/96 and π4/90, respectively. (b) Consider the 2π-periodic odd function defined on [0, π] by f (θ) = θ(π − θ).  Show that  ∞ ∑  n=0  1 (2n + 1)6 = π6  960 and  ∞ ∑  n=1  1  n6 = π6  945 .  Remark. The general expression when k is even for ∑∞  n=1 1/nk in terms of πk  is given in Problem 4. However, finding a formula for the sum ∑∞  n=1 1/n3, or  more generally ∑∞  n=1 1/nk with k odd, is a famous unresolved question.
### p.107 · highlight

> 9. Show that for α not an integer, the Fourier series of  π  sin πα ei(π−x)α on [0, 2π] is given by  ∞ ∑  n=−∞  einx n + α.  Apply Parseval’s formula to show that  ∞ ∑  n=−∞  1 (n + α)2 = π2  (sin πα)2 .
### p.107 · highlight

> 10. Consider the example of a vibrating string which we analyzed in Chapter 1. The displacement u(x, t) of the string at time t satisfies the wave equation  1 c2  ∂2u ∂t2 = ∂2u  ∂x2 , c2 = τ /ρ.  The string is subject to the initial conditions  u(x, 0) = f (x) and ∂u  ∂t (x, 0) = g(x),  where we assume that f ∈ C1 and g is continuous. We define the total energy of the string by  E(t) = 1  2ρ  ∫L  0  ( ∂u ∂t  )2  dx + 1  2τ  ∫L  0  ( ∂u ∂x  )2  dx.  The first term corresponds to the “kinetic energy” of the string (in analogy with (1/2)mv2, the kinetic energy of a particle of mass m and velocity v), and the second term corresponds to its “potential energy.”  Show that the total energy of the string is conserved, in the sense that E(t) is constant. Therefore,  E(t) = E(0) = 1  2ρ  ∫L  0  g(x)2 dx + 1  2τ  ∫L  0  f ′(x)2 dx.
### p.107 · highlight

> 11. The inequalities of Wirtinger and Poincar ́e establish a relationship between the norm of a function and that of its derivative.
### p.108 · highlight

> (a) If f is T -periodic, continuous, and piecewise C1 with ∫ T  0 f (t) dt = 0, show  that  ∫T  0  |f (t)|2 dt ≤ T 2  4π2  ∫T  0  |f ′(t)|2 dt,  with equality if and only if f (t) = A sin(2πt/T ) + B cos(2πt/T ). [Hint: Apply Parseval’s identity.] (b) If f is as above and g is just C1 and T -periodic, prove that  ∣∣∣∣ ∫T  0  f (t)g(t) dt  ∣∣∣∣  2  ≤ T2  4π2  ∫T  0  |f (t)|2 dt  ∫T  0  |g′(t)|2 dt.  (c) For any compact interval [a, b] and any continuously differentiable function  f with f (a) = f (b) = 0, show that  ∫b  a  |f (t)|2 dt ≤ (b − a)2  π2  ∫b  a  |f ′(t)|2 dt.  Discuss the case of equality, and prove that the constant (b − a)2/π2 cannot be improved. [Hint: Extend f to be odd with respect to a and periodic of period T = 2(b − a) so that its integral over an interval of length T is 0. Apply part a) to get the inequality, and conclude that equality holds if and only if f (t) = A sin(π t−a  b−a )].
### p.108 · highlight

> 12. Prove that  ∫∞  0  sin x  x dx = π  2.  [Hint: Start with the fact that the integral of DN (θ) equals 2π, and note that the difference (1/ sin(θ/2)) − 2/θ is continuous on [−π, π]. Apply the RiemannLebesgue lemma.]  13. Suppose that f is periodic and of class Ck. Show that  fˆ(n) = o(1/|n|k),  that is, |n|kfˆ(n) goes to 0 as |n| → ∞. This is an improvement over Exercise 10 in Chapter 2. [Hint: Use the Riemann-Lebesgue lemma.]  14. Prove that the Fourier series of a continuously differentiable function f on the circle is absolutely convergent. [Hint: Use the Cauchy-Schwarz inequality and Parseval’s identity for f ′.]
### p.108 · highlight

> 15. Let f be 2π-periodic and Riemann integrable on [−π, π].
### p.109 · highlight

> (a) Show that  fˆ(n) = − 1  2π  ∫π  −π  f (x + π/n)e−inx dx  hence  fˆ(n) = 1  4π  ∫π  −π  [f (x) − f (x + π/n)]e−inx dx. (b) Now assume that f satisfies a H ̈older condition of order α, namely  |f (x + h) − f (x)| ≤ C|h|α  for some 0 < α ≤ 1, some C > 0, and all x, h. Use part a) to show that  fˆ(n) = O(1/|n|α).  (c) Prove that the above result cannot be improved by showing that the function  f (x) =  ∞ ∑  k=0  2−kα ei2k x , where 0 < α < 1, satisfies  |f (x + h) − f (x)| ≤ C|h|α,  and fˆ(N ) = 1/N α whenever N = 2k. [Hint: For (c), break up the sum as follows f (x + h) − f (x) = ∑  2k≤1/|h| +  ∑  2k>1/|h|. To estimate the first sum use the fact that |1 − eiθ| ≤ |θ| whenever θ is small. To estimate the second sum, use the obvious inequality |eix − eiy| ≤ 2.]
### p.109 · highlight

> 16. Let f be a 2π-periodic function which satisfies a Lipschitz condition with constant K; that is,  |f (x) − f (y)| ≤ K|x − y| for all x, y.  This is simply the H ̈older condition with α = 1, so by the previous exercise, we  see that fˆ(n) = O(1/|n|). Since the harmonic series ∑ 1/n diverges, we cannot say anything (yet) about the absolute convergence of the Fourier series of f . The outline below actually proves that the Fourier series of f converges absolutely and uniformly.
### p.110 · highlight

> (a) For every positive h we define gh(x) = f (x + h) − f (x − h). Prove that  1 2π  ∫ 2π  0  |gh(x)|2 dx =  ∑ ∞  n=−∞  4| sin nh|2|fˆ(n)|2, and show that  ∞ ∑  n=−∞  | sin nh|2|fˆ(n)|2 ≤ K2h2.  (b) Let p be a positive integer. By choosing h = π/2p+1, show that  ∑  2p−1 <|n|≤2p  |fˆ(n)|2 ≤ K2π2  22p+1 . (c) Estimate ∑  2p−1<|n|≤2p |fˆ(n)|, and conclude that the Fourier series of f converges absolutely, hence uniformly. [Hint: Use the Cauchy-Schwarz inequality to estimate the sum.]  (d) In fact, modify the argument slightly to prove Bernstein’s theorem: If f  satisfies a H ̈older condition of order α > 1/2, then the Fourier series of f converges absolutely.
### p.110 · highlight

> 17. If f is a bounded monotonic function on [−π, π], then  fˆ(n) = O(1/|n|).  [Hint: One may assume that f is increasing, and say |f | ≤ M . First check that the Fourier coefficients of the characteristic function of [a, b] satisfy O(1/|n|). Now show that a sum of the form  N ∑ k=1  αk χ[ak ,ak+1 ] (x)  with −π = a1 < a2 < · · · < aN < aN+1 = π and −M ≤ α1 ≤ · · · ≤ αN ≤ M has Fourier coefficients that are O(1/|n|) uniformly in N . Summing by parts one gets  a telescopic sum ∑(αk+1 − αk) which can be bounded by 2M . Now approximate f by functions of the above type.]  18. Here are a few things we have learned about the decay of Fourier coefficients:  (a) if f is of class Ck, then fˆ(n) = o(1/|n|k); (b) if f is Lipschitz, then fˆ(n) = O(1/|n|);
### p.111 · highlight

> (c) if f is monotonic, then fˆ(n) = O(1/|n|); (d) if f is satisfies a H ̈older condition with exponent α where 0 < α < 1, then  fˆ(n) = O(1/|n|α);  (e) if f is merely Riemann integrable, then ∑ |fˆ(n)|2 < ∞ and therefore  fˆ(n) = o(1).  Nevertheless, show that the Fourier coefficients of a continuous function can tend to 0 arbitrarily slowly by proving that for every sequence of nonnegative real numbers {≤n} converging to 0, there exists a continuous function f such that |fˆ(n)| ≥ ≤n for infinitely many values of n. [Hint: Choose a subsequence {≤nk } so that ∑  k ≤nk < ∞.]
### p.111 · highlight

> 20. Let f (x) denote the sawtooth function defined by f (x) = (π − x)/2 on the interval (0, 2π) with f (0) = 0 and extended by periodicity to all of R. The Fourier series of f is  f (x) ∼ 1  2i  ∑  |n|6=0  einx n=  ∞ ∑  n=1  sin nx  n,  and f has a jump discontinuity at the origin with  f (0+) = π  2 , f (0−) = − π  2 , and hence f (0+) − f (0−) = π. Show that  max  0<x≤π/N SN (f )(x) − π  2=  ∫π  0  sin t  t dt − π  2,  which is roughly 9% of the jump π. This result is a manifestation of Gibbs’s phenomenon which states that near a jump discontinuity, the Fourier series of a function overshoots (or undershoots) it by approximately 9% of the jump. [Hint: Use the expression for SN (f ) given in Exercise 19.]
### p.112 · highlight

> 2. An important fact we have proved is that the family {einx}n∈Z is orthonormal in R and it is also complete, in the sense that the Fourier series of f converges to f in the norm. In this exercise, we consider another family possessing these same properties.  On [−1, 1] define  Ln(x) = dn  dxn (x2 − 1)n, n = 0, 1, 2, . . ..  Then Ln is a polynomial of degree n which is called the nth Legendre polynomial.
### p.113 · highlight

> (a) Show that if f is indefinitely differentiable on [−1, 1], then  ∫1  −1  Ln(x)f (x) dx = (−1)n  ∫1  −1  (x2 − 1)nf (n)(x) dx. In particular, show that Ln is orthogonal to xm whenever m < n. Hence  {Ln}n∞=0 is an orthogonal family.  (b) Show that  ‖Ln‖2 =  ∫1  −1  |Ln(x)|2 dx = (n!)222n+1  2n + 1 . [Hint: First, note that ‖Ln‖2 = (−1)n(2n)! ∫ 1  −1(x2 − 1)n dx. Write  (x2 − 1)n = (x − 1)n(x + 1)n and integrate by parts n times to calculate this last integral.] (c) Prove that any polynomial of degree n that is orthogonal to 1, x, x2, . . . , xn−1  is a constant multiple of Ln. (d) Let Ln = Ln/‖Ln‖, which are the normalized Legendre polynomials. Prove  that {Ln} is the family obtained by applying the “Gram-Schmidt process”  to {1, x, . . . , xn, . . .}, and conclude that every Riemann integrable function f on [−1, 1] has a Legendre expansion  ∞ ∑  n=0  〈f, Ln〉Ln  which converges to f in the mean-square sense.
### p.113 · highlight

> 3. Let α be a complex number not equal to an integer.  (a) Calculate the Fourier series of the 2π-periodic function defined on [−π, π]  by f (x) = cos(αx). (b) Prove the following formulas due to Euler:  ∞ ∑  n=1  1  n2 − α2 = 1  2α2 − π  2α tan(απ) . For all u ∈ C − πZ,  cot u = 1  u +2  ∞ ∑  n=1  u u2 − n2π2 .
### p.114 · highlight

> (c) Show that for all α ∈ C − Z we have  απ  sin(απ) = 1 + 2α2  ∞ ∑  n=1  (−1)n−1  n2 − α2 .  (d) For all 0 < α < 1, show that  ∫∞  0  tα−1 t + 1 dt = π  sin(απ) . [Hint: Split the integral as ∫ 1  0 +∫∞  1 and change variables t = 1/u in the  second integral. Now both integrals are of the form  ∫1  0  tγ−1  1 + t dt, 0 < γ < 1, which one can show is equal to ∑∞  k=0  (−1)k  k+γ . Use part (c) to conclude the proof.]
### p.117 · highlight

> I. Among all simple closed curves of length ` in the plane R2, which  one encloses the largest area? II. Given an irrational number γ, what can be said about the distribution of the fractional parts of the sequence of numbers nγ, for n = 1, 2, 3, . . .? III. Does there exist a continuous function that is nowhere differentiable?
### p.120 · highlight

> Theorem 1.1 Suppose that Γ is a simple closed curve in R2 of length `, and let A denote the area of the region enclosed by this curve. Then  A ≤ `2  4π ,  with equality if and only if Γ is a circle.
### p.120 · highlight

> The first observation is that we can rescale the problem. This means that we can change the units of measurement by a factor of δ > 0 as follows. Consider the mapping of the plane R2 to itself, which sends the point (x, y) to (δx, δy). A look at the formula defining the length of a curve shows that if Γ is of length `, then its image under this mapping has length δ`. So this operation magnifies or contracts lengths by a factor of δ depending on whether δ ≥ 1 or δ ≤ 1. Similarly, we see that
### p.121 · highlight

> the mapping magnifies (or contracts) areas by a factor of δ2. By taking δ = 2π/`, we see that it suffices to prove that if ` = 2π then A ≤ π, with equality only if Γ is a circle.
### p.122 · highlight

> The solution given above (due to Hurwitz in 1901) is indeed very elegant, but clearly leaves some important issues unanswered. We list these as follows. Suppose Γ is a simple closed curve. (i) How is the “region enclosed by Γ” defined? (ii) What is the geometric definition of the “area” of this region? Does  this definition accord with (1)? (iii) Can these results be extended to the most general class of simple closed curves relevant to the problem—those curves which are “rectifiable”—that is, those to which we can ascribe a finite length?  It turns out that the clarifications of the problems raised are connected to a number of other significant ideas in analysis. We shall return to these questions in succeeding books of this series.
### p.123 · highlight

> Here are some simple observations: (i) If γ is rational, then only finitely many numbers appearing in 〈nγ〉  are distinct. (ii) If γ is irrational, then the numbers 〈nγ〉 are all distinct.
### p.124 · highlight

> In fact, it can be shown that if γ is irrational, then 〈nγ〉 is dense in the interval [0, 1), a result originally proved by Kronecker. In other words, the sequence 〈nγ〉 hits every sub-interval of [0, 1) (and hence it does so infinitely many times).
### p.124 · highlight

> A sequence of numbers ξ1, ξ2, . . . , ξn, . . . in [0, 1) is said to be equidistributed if for every interval (a, b) ⊂ [0, 1),  lim  N →∞  #{1 ≤ n ≤ N : ξn ∈ (a, b)}  N =b−a  where #A denotes the cardinality of the finite set A. This means that for large N , the proportion of numbers ξn in (a, b) with n ≤ N is equal to the ratio of the length of the interval (a, b) to the length of the interval [0, 1). In other words, the sequence ξn sweeps out the whole interval evenly, and every sub-interval gets its fair share. Clearly, the ordering of the sequence is very important, as the next two examples illustrate
### p.124 · highlight

> Theorem 2.1 If γ is irrational, then the sequence of fractional parts 〈γ〉, 〈2γ〉, 〈3γ〉, . . . is equidistributed in [0, 1).  In particular, 〈nγ〉 is dense in [0, 1), and we get Kronecker’s theorem as a corollary.
### p.125 · highlight

> Fix (a, b) ⊂ [0, 1) and let χ(a,b)(x) denote the characteristic function of the interval (a, b), that is, the function equal to 1 in (a, b) and 0 in [0, 1) − (a, b). We may extend this function to R by periodicity (period 1), and still denote this extension by χ(a,b)(x). Then, as a consequence of the definitions, we find that  #{1 ≤ n ≤ N : 〈nγ〉 ∈ (a, b)} =  N ∑ n=1  χ(a,b)(nγ),  and the theorem can be reformulated as the statement that  1 N  N ∑ n=1  χ(a,b)(nγ) →  ∫1  0  χ(a,b)(x) dx, as N → ∞.
### p.125 · highlight

> This step removes the difficulty of working with fractional parts and reduces the number theory to analysis.
### p.125 · highlight

> Lemma 2.2 If f is continuous and periodic of period 1, and γ is irrational, then  1 N  N ∑ n=1  f (nγ) →  ∫1  0  f (x) dx as N → ∞.
### p.127 · highlight

> Corollary 2.3 The conclusion of Lemma 2.2 holds for every function f which is Riemann integrable in [0, 1], and periodic of period 1.
### p.128 · highlight

> There is an interesting interpretation of the lemma and its corollary, in terms of a simple dynamical system. In this example, the underlying space is the circle parametrized by the angle θ. We also consider a mapping of this space to itself: here, we choose a rotation ρ of the circle by the angle 2πγ, that is, the transformation ρ : θ 7→ θ + 2πγ.  We want next to consider how this space, with its underlying action ρ, evolves in time. In other words, we wish to consider the iterates of ρ, namely ρ, ρ2, ρ3, . . ., ρn where  ρn = ρ ◦ ρ ◦ · · · ◦ ρ : θ 7→ θ + 2πnγ,  and where we think of the action ρn taking place at the time t = n.  To each Riemann integrable function f on the circle, we can also associate the corresponding effects of the rotation ρ, and obtain a sequence of functions  f (θ), f (ρ(θ)), f (ρ2(θ)), . . . , f (ρn(θ)), . . .  with f (ρn(θ)) = f (θ + 2πnγ). In this special context, the ergodicity of this system is then the statement that the “time average”  lim  N →∞  1 N  N ∑ n=1  f (ρn(θ))  exists for each θ and equals the “space average”  1 2π  ∫ 2π  0  f (θ) dθ,  whenever γ is irrational. In fact, this assertion is merely a rephrasing of Corollary 2.3, once we make the change of variables θ = 2πx.
### p.129 · highlight

> Weyl’s criterion. A sequence of real numbers ξ1, ξ2 . . . in [0, 1) is equidistributed if and only if for all integers k 6= 0 one has  1 N  N ∑ n=1  e2πikξn → 0, as N → ∞.
### p.129 · highlight

> In particular, we find that to understand the equidistributive properties of a sequence ξn, it suffices to estimate the size of the corresponding “exponential sum” ∑N  n=1 e2πikξn . For example, it can be shown using Weyl’s criterion that the sequence 〈n2γ〉 is equidistributed whenever γ is irrational.
### p.131 · highlight

> Theorem 3.1 If 0 < α < 1, then the function  fα(x) = f (x) =  ∑ ∞  n=0  2−nαei2nx  is continuous but nowhere differentiable.
### p.131 · highlight

> The crucial property of f which we need is that it has many vanishing Fourier coefficients. A Fourier series that skips many terms, like the one given above, or like W (x), is called a lacunary Fourier series.
### p.131 · highlight

> A third method, clearly connected with the second, involves the delayed means defined by  4N (g) = 2σ2N (g) − σN (g).  Hence 4N (g) = g ∗ [2F2N − FN ]. These methods can best be visualized as in Figure 5.  Suppose g(x) ∼ ∑ aneinx. Then:  • SN arises by multiplying the term aneinx by 1 if |n| ≤ N , and 0 if  |n| > N . • σN arises by multiplying aneinx by 1 − |n|/N for |n| ≤ N and 0 for  |n| > N . • 4N arises by multiplying aneinx by 1 if |n| ≤ N , by 2(1 − |n|/(2N ))  for N ≤ |n| ≤ 2N , and 0 for |n| > 2N .
### p.133 · highlight

> The delayed means have two important features. On the one hand, their properties are closely related to the (good) features of the Ces`aro means. On the other hand, for series that have lacunary properties like those of f , the delayed means are essentially equal to the partial sums. In particular, note that for our function f = fα (6) SN (f ) = 4N′ (f ),  where N ′ is the largest integer of the form 2k with N ′ ≤ N . This is clear by examining Figure 5 and the definition of f .
### p.137 · highlight

> 2. Suppose γ : [a, b] → R2 is a parametrization for a closed curve Γ, with γ(t) = (x(t), y(t)).
### p.138 · highlight

> (a) Show that  1 2  ∫b  a  (x(s)y′(s) − y(s)x′(s)) ds =  ∫b  a  x(s)y′(s) ds = −  ∫b  a  y(s)x′(s) ds.  (b) Define the reverse parametrization of γ by γ− : [a, b] → R2 with  γ−(t) = γ(b + a − t). The image of γ− is precisely Γ, except that the points γ−(t) and γ(t) travel in opposite directions. Thus γ− “reverses” the orientation of the curve. Prove that  ∫  γ  (x dy − y dx) = −  ∫  γ−  (x dy − y dx). In particular, we may assume (after a possible change in orientation) that  A= 1  2  ∫b  a  (x(s)y′(s) − y(s)x′(s)) ds =  ∫b  a  x(s)y′(s) ds.
### p.139 · highlight

> 4. Observe that with the definition of ` and A given in the text, the isoperimetric inequality continues to hold (with the same proof) even when Γ is not simple.  Show that this stronger version of the isoperimetric inequality is equivalent to Wirtinger’s inequality, which says that if f is 2π-periodic, of class C1, and satisfies ∫ 2π  0 f (t) dt = 0, then  ∫ 2π  0  |f (t)|2 dt ≤  ∫ 2π  0  |f ′(t)|2 dt  with equality if and only if f (t) = A sin t + B cos t (Exercise 11, Chapter 3).  [Hint: In one direction, note that if the length of the curve is 2π and γ is an appropriate arc-length parametrization, then  2(π − A) =  ∫ 2π  0  [x′(s) + y(s)]2 ds +  ∫ 2π  0  (y′(s)2 − y(s)2) ds. A change of coordinates will guarantee ∫ 2π  0 y(s) ds = 0. For the other direction,  start with a real-valued f satisfying all the hypotheses of Wirtinger’s inequality, and construct g, 2π-periodic and so that the term in brackets above vanishes.]
### p.139 · highlight

> 6. Let θ = p/q be a rational number where p and q are relatively prime integers (that is, θ is in lowest form). We assume without loss of generality that q > 0. Define a sequence of numbers in [0, 1) by ξn = 〈nθ〉 where 〈·〉 denotes the
### p.140 · highlight

> fractional part. Show that the sequence {ξ1, ξ2, . . .} is equidistributed on the points of the form  0, 1/q, 2/q, . . . , (q − 1)/q. In fact, prove that for any 0 ≤ a < q, one has  #{n : 1 ≤ n ≤ N, 〈nθ〉 = a/q}  N =1  q +O  (1  N  ) .  [Hint: For each integer k ≥ 0, there exists a unique integer n with kq ≤ n < (k + 1)q and so that 〈nθ〉 = a/q. Why can one assume k = 0? Prove the existence of n by using the fact1 that if p and q are relatively prime, there exist integers x, y such that xp + yq = 1. Next, divide N by q with remainder, that is, write N = `q + r where 0 ≤ ` and 0 ≤ r < q. Establish the inequalities  ` ≤ #{n : 1 ≤ n ≤ N, 〈nθ〉 = a/q} ≤ ` + 1.]
### p.140 · highlight

> 7. Prove the second part of Weyl’s criterion: if a sequence of numbers ξ1, ξ2, . . . in [0, 1) is equidistributed, then for all k ∈ Z − {0}  1 N  N ∑ n=1  e2πikξn → 0 as N → ∞.  [Hint: It suffices to show that 1  N  ∑N  n=1 f (ξn) → ∫ 1  0 f (x) dx for all continuous f .  Prove this first when f is the characteristic function of an interval.]
### p.141 · highlight

> 11. Show that if u(x, t) = (f ∗ Ht)(x) where Ht is the heat kernel, and f is Riemann integrable, then  ∫1  0  |u(x, t) − f (x)|2 dx → 0 as t → 0
### p.143 · highlight

> 4. An elementary construction of a continuous but nowhere differentiable function is obtained by “piling up singularities,” as follows.  On [−1, 1] consider the function  φ(x) = |x|  and extend φ to R by requiring it to be periodic of period 2. Clearly, φ is continuous on R and |φ(x)| ≤ 1 for all x so the function f defined by  f (x) =  ∞ ∑  n=0  (3  4  )n  φ(4nx)  is continuous on R.
### p.144 · highlight

> (a) Fix x0 ∈ R. For every positive integer m, let δm = ± 1  2 4−m where the  sign is chosen so that no integer lies in between 4mx0 and 4m(x0 + δm). Consider the quotient  γn = φ(4n(x0 + δm)) − φ(4nx0)  δm  .  Prove that if n > m, then γn = 0, and for 0 ≤ n ≤ m one has |γn| ≤ 4n with |γm| = 4m. (b) From the above observations prove the estimate  ∣∣∣∣ f (x0 + δm) − f (x0)  δm  ∣∣∣∣ ≥ 1  2 (3m + 1), and conclude that f is not differentiable at x0.
### p.144 · highlight

> 5. Let f be a Riemann integrable function on the interval [−π, π]. We define the generalized delayed means of the Fourier series of f by  σN,K = SN + · · · + SN+K−1  K.  Note that in particular  σ0,N = σN , σN,1 = SN and σN,N = ∆N ,  where ∆N are the specific delayed means used in Section 3. (a) Show that  σN,K = 1  K ((N + K)σN+K − N σN ) ,  and  σN,K = SN + ∑  N +1≤|ν|≤N +K−1  (  1 − |ν| − N  K  )  fˆ(ν )eiν θ .  From this last expression for σN,K conclude that  |σN,K − SM | ≤ ∑  N +1≤|ν|≤N +K−1  |fˆ(ν)|  for all N ≤ M < N + K.
### p.145 · highlight

> (d) Suppose that fˆ(ν) = O(1/|ν|). Prove that if f is continuous at θ then  SN (f )(θ) → f (θ) as N → ∞,  and if f has a jump discontinuity at θ then  SN (f )(θ) → f (θ+) + f (θ−)  2 as N → ∞. Also, show that if f is continuous on [−π, π], then SN (f ) → f uniformly.
### p.145 · highlight

> (b) Use one of the above formulas and Fej ́er’s theorem to show that with  N = kn and K = n, then  σkn,n(f )(θ) → f (θ) as n → ∞  whenever f is continuous at θ, and also  σkn,n(f )(θ) → f (θ+) + f (θ−)  2 as n → ∞  at a jump discontinuity (refer to the preceding chapters and their exercises for the appropriate definitions and results). In the case when f is continuous on [−π, π], show that σkn,n(f ) → f uniformly as n → ∞. (c) Using part (a), show that if fˆ(ν) = O(1/|ν|) and kn ≤ m < (k + 1)n, we  get  |σkn,n − Sm| ≤ C  k for some constant C > 0.  (d) Suppose that fˆ(ν) = O(1/|ν|). Prove that if f is continuous at θ then  SN (f )(θ) → f (θ) as N → ∞,  and if f has a jump discontinuity at θ then  SN (f )(θ) → f (θ+) + f (θ−)  2 as N → ∞. Also, show that if f is continuous on [−π, π], then SN (f ) → f uniformly. (e) The above arguments show that if ∑ cn is Ces`aro summable to s and cn =  O(1/n), then ∑ cn converges to s. This is a weak version of Littlewood’s theorem (Problem 3, Chapter 2).
### p.145 · highlight

> 6. Dirichlet’s theorem states that the Fourier series of a real continuous periodic function f which has only a finite number of relative maxima and minima converges everywhere to f (and uniformly).  Prove this theorem by showing that such a function satisfies fˆ(n) = O(1/|n|).  [Hint: Argue as in Exercise 17, Chapter 3; then use conclusion (d) in Problem 5 above.]
### p.146 · highlight

> On the one hand, recall that the Fourier series of a periodic function associates a sequence of numbers, namely the Fourier coefficients, to that function; on the other hand, given a suitable function f on R, the  analogous object associated to f will in fact be another function fˆ on R which is called the Fourier transform of f . Since the Fourier transform of a function on R is again a function on R, one can observe a symmetry between a function and its Fourier transform, whose analogue is not as apparent in the setting of Fourier series.  Roughly speaking, the Fourier transform is a continuous version of the Fourier coefficients.
### p.147 · highlight

> The validity of the Fourier inversion formula is also suggested by the following simple observation. Suppose f is supported in a finite interval contained in I = [−L/2, L/2], and we expand f in a Fourier series on I. Then, letting L tend to infinity, we are led to (4)
### p.148 · highlight

> We make a final comment about the approach we have chosen. In our study of Fourier series, we found it useful to consider Riemann integrable functions on the circle. In particular, this generality assured us that even functions that had certain discontinuities could be treated by the theory. In contrast, our exposition of the elementary properties of the Fourier transform is stated in terms of the Schwartz space S of testing functions. These are functions that are indefinitely differentiable and that, together with their derivatives, are rapidly decreasing at infinity. The reliance on this space of functions is a device that allows us to come quickly to the main conclusions, formulated in a direct and transparent fashion. Once this is carried out, we point out some easy extensions to a somewhat wider setting. The more general theory of Fourier transforms (which must necessarily be based on Lebesgue integration) will be treated in Book III.
### p.149 · highlight

> We shall denote by M(R) the set of functions of moderate decrease on R. As an exercise, the reader can check that under the usual addition of functions and multiplication by scalars, M(R) forms a vector space over C.
### p.149 · highlight

> We next see that whenever f belongs to M(R), then we may define (5)  ∫∞  −∞  f (x) dx = lim  N →∞  ∫N  −N  f (x) dx,  where the limit now exists. Indeed, for each N the integral IN =  ∫N  −N f (x) dx is well defined because f is continuous
### p.149 · highlight

> At this  point, we remark that we may replace the exponent 2 in the definition of moderate decrease by 1 + ≤ where ≤ > 0; that is,  |f (x)| ≤ A  1 + |x|1+≤ for all x ∈ R.  This definition would work just as well for the purpose of the theory developed in this chapter. We chose ≤ = 1 merely as a matter of convenience.
### p.149 · highlight

> Proposition 1.1 The integral of a function of moderate decrease defined by (5) satisfies the following properties:
### p.150 · highlight

> (i) Linearity: if f, g ∈ M(R) and a, b ∈ C, then  ∫∞  −∞  (af (x) + bg(x)) dx = a  ∫∞  −∞  f (x) dx + b  ∫∞  −∞  g(x) dx.  (ii) Translation invariance: for every h ∈ R we have  ∫∞  −∞  f (x − h) dx =  ∫∞  −∞  f (x) dx.  (iii) Scaling under dilations: if δ > 0, then  δ  ∫∞  −∞  f (δx) dx =  ∫∞  −∞  f (x) dx.  (iv) Continuity: if f ∈ M(R), then  ∫∞  −∞  |f (x − h) − f (x)| dx → 0 as h → 0.
### p.151 · highlight

> The choice of the Schwartz space is motivated by an important principle which ties the decay of fˆ to the continuity and differentiability  properties of f (and vice versa)
### p.151 · highlight

> The Schwartz space on R consists of the set of all indefinitely differentiable functions f so that f and all its derivatives f ′, f ′′, . . . , f (`), . . .,
### p.152 · highlight

> are rapidly decreasing, in the sense that  sup  x∈R  |x|k|f (`)(x)| < ∞ for every k, ` ≥ 0.  We denote this space by S = S(R), and again, the reader should verify that S(R) is a vector space over C. Moreover, if f ∈ S(R), we have  f ′(x) = df  dx ∈ S(R) and xf (x) ∈ S(R).
### p.152 · highlight

> A simple example of a function in S(R) is the Gaussian defined by  f (x) = e−x2 ,  which plays a central role in the theory of the Fourier transform, as well as other fields (for example, probability theory and physics).
### p.153 · highlight

> The Fourier transform of a function f ∈ S(R) is defined by  fˆ(ξ) =  ∫∞  −∞  f (x)e−2πixξ dx.  Some simple properties of the Fourier transform are gathered in the following proposition. We use the notation  f (x) −→ fˆ(ξ)  to mean that fˆ denotes the Fourier transform of f .  Proposition 1.2 If f ∈ S(R) then:  (i) f (x + h) −→ fˆ(ξ)e2πihξ whenever h ∈ R. (ii) f (x)e−2πixh −→ fˆ(ξ + h) whenever h ∈ R. (iii) f (δx) −→ δ−1fˆ(δ−1ξ) whenever δ > 0. (iv) f ′(x) −→ 2πiξfˆ(ξ). (v) −2πixf (x) −→ d  dξ fˆ(ξ).
### p.153 · highlight

> In particular, except for factors of 2πi, the Fourier transform interchanges differentiation and multiplication by x. This is the key property that makes the Fourier transform a central object in the theory of differential equations.
### p.154 · highlight

> Theorem 1.3 If f ∈ S(R), then fˆ ∈ S(R).
### p.154 · highlight

> In fact, note that if f ∈  S(R), its Fourier transform fˆ is bounded; then also, for each pair of non-negative integers ` and k, the expression  ξk  (d  dξ  )` fˆ(ξ)  is bounded, since by the last proposition, it is the Fourier transform of  1 (2πi)k  (d  dx  )k  [(−2πix)`f (x)].
### p.155 · highlight

> Theorem 1.4 If f (x) = e−πx2, then fˆ(ξ) = f (ξ).
### p.156 · highlight

> The scaling properties of the Fourier transform under dilations yield the following important transformation law, which follows from (iii) in Proposition 1.2 (with δ replaced by δ−1/2).  Corollary 1.5 If δ > 0 and Kδ(x) = δ−1/2e−πx2/δ, then ̂Kδ(ξ) = e−πδξ2 .
### p.156 · highlight

> We have now constructed a family of good kernels on the real line, analogous to those on the circle considered in Chapter 2. Indeed, with  Kδ(x) = δ−1/2e−πx2/δ,  we have: (i) ∫ ∞  −∞ Kδ(x) dx = 1.  (ii) ∫ ∞  −∞ |Kδ(x)| dx ≤ M .  (iii) For every η > 0, we have ∫  |x|>η |Kδ(x)| dx → 0 as δ → 0.
### p.156 · highlight

> Theorem 1.6 The collection {Kδ}δ>0 is a family of good kernels as δ → 0.
### p.156 · highlight

> If f, g ∈ S(R), their convolution is defined by (7) (f ∗ g)(x) =  ∫∞  −∞  f (x − t)g(t) dt.
### p.157 · highlight

> Corollary 1.7 If f ∈ S(R) , then  (f ∗ Kδ)(x) → f (x) uniformly in x as δ → 0.
### p.157 · highlight

> Proposition 1.8 If f, g ∈ S(R), then  ∫∞  −∞  f (x)gˆ(x) dx =  ∫∞  −∞  fˆ(y)g(y) dy.
### p.158 · highlight

> Theorem 1.9 (Fourier inversion) If f ∈ S(R), then  f (x) =  ∫∞  −∞  fˆ(ξ)e2πixξ dξ.
### p.159 · highlight

> Corollary 1.10 The Fourier transform is a bijective mapping on the Schwartz space.
### p.159 · highlight

> Proposition 1.11 If f, g ∈ S(R) then:  (i) f ∗ g ∈ S(R). (ii) f ∗ g = g ∗ f . (iii) (̂ f ∗ g)(ξ) = fˆ(ξ)gˆ(ξ).
### p.160 · highlight

> Theorem 1.12 (Plancherel) If f ∈ S(R) then ‖fˆ‖ = ‖f ‖.
### p.161 · highlight

> In the previous sections, we have limited our assertion of the Fourier inversion and Plancherel formulas to the case when the function involved belonged to the Schwartz space. It does not really involve further ideas to extend these results to functions of moderate decrease, once we make the additional assumption that the Fourier transform of the function under consideration is also of moderate decrease. Indeed, the key observation, which is easy to prove, is that the convolution f ∗ g of two functions f and g of moderate decrease is again a function of moderate decrease (Exercise 7); also ̂f ∗ g = fˆgˆ. Moreover, the multiplication formula continues to hold, and we deduce the Fourier inversion and Plancherel formulas when f and fˆ are both of moderate decrease.  This generalization, although modest in scope, is nevertheless useful in some circumstances.
### p.161 · highlight

> Theorem 1.13 Let f be a continuous function on the closed and bounded interval [a, b] ⊂ R. Then, for any ≤ > 0, there exists a polynomial P such that  sup  x∈[a,b]  |f (x) − P (x)| < ≤.  In other words, f can be uniformly approximated by polynomials.
### p.163 · highlight

> Theorem 2.1 Given f ∈ S(R), let  u(x, t) = (f ∗ Ht)(x) for t > 0  where Ht is the heat kernel. Then:  (i) The function u is C2 when x ∈ R and t > 0, and u solves the heat  equation
### p.164 · highlight

> (ii) u(x, t) → f (x) uniformly in x as t → 0. Hence if we set u(x, 0) =  f (x), then u is continuous on the closure of the upper half-plane  R2+ = {(x, t) : x ∈ R, t ≥ 0}.  (iii) ∫ ∞  −∞ |u(x, t) − f (x)|2 dx → 0 as t → 0.
### p.164 · highlight

> Corollary 2.2 u(·, t) belongs to S(R) uniformly in t, in the sense that for any T > 0  (9) sup  x∈R 0<t<T  |x|k  ∣∣∣∣∣  ∂` ∂x` u(x, t)  ∣∣∣∣∣ < ∞ for each k, ` ≥ 0.
### p.165 · highlight

> Theorem 2.3 Suppose u(x, t) satisfies the following conditions:  (i) u is continuous on the closure of the upper half-plane. (ii) u satisfies the heat equation for t > 0. (iii) u satisfies the boundary condition u(x, 0) = 0. (iv) u(·, t) ∈ S(R) uniformly in t, as in (9).  Then, we conclude that u = 0.
### p.167 · highlight

> Lemma 2.4 The following two identities hold:  ∫∞  −∞  e−2π|ξ|ye2πiξx dξ = Py(x),  ∫∞  −∞  Py(x)e−2πixξ dx = e−2π|ξ|y.
### p.167 · highlight

> Lemma 2.5 The Poisson kernel is a good kernel on R as y → 0.
### p.168 · highlight

> Theorem 2.6 Given f ∈ S(R), let u(x, y) = (f ∗ Py)(x). Then:  (i) u(x, y) is C2 in R2+ and 4u = 0. (ii) u(x, y) → f (x) uniformly as y → 0. (iii) ∫ ∞  −∞ |u(x, y) − f (x)|2 dx → 0 as y → 0.  (iv) If u(x, 0) = f (x), then u is continuous on the closure R2+ of the  upper half-plane, and vanishes at infinity in the sense that  u(x, y) → 0 as |x| + y → ∞.
### p.168 · highlight

> Theorem 2.7 Suppose u is continuous on the closure of the upper halfplane R2+, satisfies 4u = 0 for (x, y) ∈ R2+, u(x, 0) = 0, and u(x, y) vanishes at infinity. Then u = 0.
### p.169 · highlight

> Lemma 2.8 (Mean-value property) Suppose Ω is an open set in R2 and let u be a function of class C2 with 4u = 0 in Ω. If the closure of the disc centered at (x, y) and of radius R is contained in Ω, then  u(x, y) = 1  2π  ∫ 2π  0  u(x + r cos θ, y + r sin θ) dθ  for all 0 ≤ r ≤ R.
### p.170 · highlight

> The definition of the Fourier transform was motivated by the desire for a continuous version of Fourier series, applicable to functions defined on the real line. We now show that there exists a further remarkable connection between the analysis of functions on the circle and related functions on R.  Given a function f ∈ S(R) on the real line, we can construct a new function on the circle by the recipe  F1(x) =  ∑ ∞  n=−∞  f (x + n).  Since f is rapidly decreasing, the series converges absolutely and uniformly on every compact subset of R, so F1 is continuous. Note that F1(x + 1) = F1(x) because passage from n to n + 1 in the above sum merely shifts the terms on the series defining F1(x). Hence F1 is periodic with period 1. The function F1 is called the periodization of f .  There is another way to arrive at a “periodic version” of f , this time by Fourier analysis. Start with the identity  f (x) =  ∫∞  −∞  fˆ(ξ)e2πiξx dξ,
### p.171 · highlight

> and consider its discrete analogue, where the integral is replaced by a sum  F2(x) =  ∑ ∞  n=−∞  fˆ(n)e2πinx.  Once again, the sum converges absolutely and uniformly since fˆ belongs to the Schwartz space, hence F2 is continuous. Moreover, F2 is also periodic of period 1 since this is the case for each one of the exponentials  e2πinx.  The fundamental fact is that these two approaches, which produce F1 and F2, actually lead to the same function.  Theorem 3.1 (Poisson summation formula) If f ∈ S(R), then  ∞ ∑  n=−∞  f (x + n) =  ∑ ∞  n=−∞  fˆ(n)e2πinx.  In particular, setting x = 0 we have  ∞ ∑  n=−∞  f (n) =  ∑ ∞  n=−∞  fˆ(n).  In other words, the Fourier coefficients of the periodization of f are given precisely by the values of the Fourier transform of f on the integers.
### p.172 · highlight

> It turns out that the operation of periodization is important in a number of questions, even when the Poisson summation formula does not apply. We give an example by considering the elementary function  f (x) = 1/x, x 6= 0. The result is that ∑∞  n=−∞ 1/(x + n), when summed  symmetrically, gives the partial fraction decomposition of the cotangent function. In fact this sum equals π cot πx, when x is not an integer. Similarly with f (x) = 1/x2, we get ∑∞  n=−∞ 1/(x + n)2 = π2/(sin πx)2,  whenever x ∈/ Z
### p.172 · highlight

> Theorem 3.2 s−1/2θ(1/s) = θ(s) whenever s > 0.
### p.173 · highlight

> Theorem 3.3 The heat kernel on the circle is the periodization of the heat kernel on the real line:  Ht(x) =  ∑ ∞  n=−∞  Ht(x + n).
### p.174 · highlight

> Corollary 3.4 The kernel Ht(x) is a good kernel for t → 0.
### p.175 · highlight

> Theorem 3.5 Pr(2πx) = ∑  n∈Z Py(x + n) where r = e−2πy.
### p.175 · highlight

> The mathematical thrust of the principle can be formulated in terms of a relation between a function and its Fourier transform. The basic underlying law, formulated in its vaguest and most general form, states that a function and its Fourier transform cannot both be essentially localized. Somewhat more precisely, if the “preponderance” of the mass of a function is concentrated in an interval of length L, then the preponderance of the mass of its Fourier transform cannot lie in an interval of length essentially smaller than L−1. The exact statement is as follows.  Theorem 4.1 Suppose ψ is a function in S(R) which satisfies the normalizing condition ∫ ∞  −∞ |ψ(x)|2 dx = 1. Then (∫ ∞  −∞  x2|ψ(x)|2 dx  ) (∫ ∞  −∞  ξ2|ψˆ(ξ)|2 dξ  )  ≥1  16π2 ,  and equality holds if and only if ψ(x) = Ae−Bx2 where B > 0 and |A|2 =  √2B/π.  In fact, we have  (∫ ∞  −∞  (x − x0)2|ψ(x)|2 dx  ) (∫ ∞  −∞  (ξ − ξ0)2|ψˆ(ξ)|2 dξ  )  ≥1  16π2
### p.176 · highlight

> The precise assertion contained in Theorem 4.1 first came to light in the study of quantum mechanics. It arose when one considered the extent to which one could simultaneously locate the position and momentum of a particle. Assuming we are dealing with (say) an electron that travels along the real line, then according to the laws of physics, matters are governed by a “state function” ψ, which we can assume to be in S(R), and which is normalized according to the requirement that (11)  ∫∞  −∞  |ψ(x)|2 dx = 1.  The position of the particle is then determined not as a definite point x; instead its probable location is given by the rules of quantum mechanics as follows:  • The probability that the particle is located in the interval (a, b) is  ∫b  a |ψ(x)|2 dx.  According to this law we can calculate the probable location of the particle with the aid of ψ: in fact, there may be only a small probability that the particle is located in a given interval (a′, b′), but nevertheless it is somewhere on the real line since ∫ ∞  −∞ |ψ(x)|2 dx = 1.
### p.177 · highlight

> pectation of where the particle might be. This expectation is the best guess of the position of the particle, given its probability distribution determined by |ψ(x)|2dx, and is the quantity defined by (12) x =  ∫∞  −∞  x|ψ(x)|2 dx.  Why is this our best guess? Consider the simpler (idealized) situation where we are given that the particle can be found at only finitely many different points, x1, x2, . . . , xN on the real axis, with pi the probability that the particle is at xi, and p1 + p2 + · · · + pN = 1. Then, if we knew nothing else, and were forced to make one choice as to the position of the particle, we would naturally take x = ∑N  i=1 xipi, which is the appropriate  weighted average of the possible positions. The quantity (12) is clearly the general (integral) version of this.  We next come to the notion of variance, which in our terminology is the uncertainty attached to our expectation. Having determined that the expected position of the particle is x (given by (12)), the resulting uncertainty is the quantity (13)  ∫∞  −∞  (x − x)2|ψ(x)|2 dx.  Notice that if ψ is highly concentrated near x, it means that there is a high probability that x is near x, and so (13) is small, because most of the contribution to the integral takes place for values of x near x. Here we have a small uncertainty. On the other hand, if ψ(x) is rather flat (that is, the probability distribution |ψ(x)|2dx is not very concentrated), then the integral (13) is rather big, because large values of (x − x)2 will come into play, and as a result the uncertainty is relatively large.  It is also worthwhile to observe that the expectation x is that choice for which the uncertainty ∫ ∞  −∞(x − x)2|ψ(x)|2 dx is the smallest. Indeed,  if we try to minimize this quantity by equating to 0 its derivative with respect to x, we find that 2 ∫ ∞  −∞(x − x)|ψ(x)|2 dx = 0, which gives (12).  So far, we have discussed the “expectation” and “uncertainty” related to the position of the particle. Of equal relevance are the corresponding notions regarding its momentum. The corresponding rule of quantum mechanics is:  • The probability that the momentum ξ of the particle belongs to  the interval (a, b) is ∫ b  a |ψˆ(ξ)|2 dξ where ψˆ is the Fourier transform  of ψ.
### p.178 · highlight

> Combining these two laws with Theorem 4.1 gives 1/16π2 as the lower bound for the product of the uncertainty of the position and the uncertainty of the momentum of a particle. So the more certain we are about the location of the particle, the less certain we can be about its momentum, and vice versa. However, we have simplified the statement of the two laws by rescaling to change the units of measurement. Actually, there enters a fundamental but small physical number ħ called Planck’s constant. When properly taken into account, the physical conclusion is  (uncertainty of position)×(uncertainty of momentum) ≥ ħ/16π2.
### p.178 · highlight

> 1. Corollary 2.3 in Chapter 2 leads to the following simplified version of the Fourier inversion formula. Suppose f is a continuous function supported on an  interval [−M, M ], whose Fourier transform fˆ is of moderate decrease. (a) Fix L with L/2 > M , and show that f (x) = ∑ an(L)e2πinx/L where  an(L) = 1  L  ∫ L/2  −L/2  f (x)e−2πinx/L dx = 1  L fˆ(n/L).  Alternatively, we may write f (x) = δ ∑∞  n=−∞ fˆ(nδ)e2πinδx with δ = 1/L.  (b) Prove that if F is continuous and of moderate decrease, then  ∫∞  −∞  F (ξ) dξ = δli→m0  δ>0  δ  ∑ ∞  n=−∞  F (δn).  (c) Conclude that f (x) =  ∫∞  −∞  fˆ(ξ)e2πixξ dξ.  [Hint: For (a), note that the Fourier series of f on [−L/2, L/2] converges absolutely. For (b), first approximate the integral by ∫ N  −N F and the sum by  δ∑  |n|≤N/δ F (nδ). Then approximate the second integral by Riemann sums.]
### p.179 · highlight

> 3. The following exercise illustrates the principle that the decay of fˆ is related to the continuity properties of f .  (a) Suppose that f is a function of moderate decrease on R whose Fourier  transform fˆ is continuous and satisfies  fˆ(ξ) = O  (1  |ξ|1+α  )  as |ξ| → ∞  for some 0 < α < 1. Prove that f satisfies a H ̈older condition of order α, that is, that  |f (x + h) − f (x)| ≤ M |h|α for some M > 0 and all x, h ∈ R.  (b) Let f be a continuous function on R which vanishes for |x| ≥ 1, with  f (0) = 0, and which is equal to 1/ log(1/|x|) for all x in a neighborhood  of the origin. Prove that fˆ is not of moderate decrease. In fact, there is no ≤ > 0 so that fˆ(ξ) = O(1/|ξ|1+≤) as |ξ| → ∞. [Hint: For part (a), use the Fourier inversion formula to express f (x + h) − f (x)  as an integral involving fˆ, and estimate this integral separately for ξ in the two ranges |ξ| ≤ 1/|h| and |ξ| ≥ 1/|h|.]
### p.179 · highlight

> 4. Bump functions. Examples of compactly supported functions in S(R) are very handy in many applications in analysis. Some examples are:  (a) Suppose a < b, and f is the function such that f (x) = 0 if x ≤ a or x ≥ b  and  f (x) = e−1/(x−a)e−1/(b−x) if a < x < b.  Show that f is indefinitely differentiable on R. (b) Prove that there exists an indefinitely differentiable function F on R such  that F (x) = 0 if x ≤ a, F (x) = 1 if x ≥ b, and F is strictly increasing on [a, b]. (c) Let δ > 0 be so small that a + δ < b − δ. Show that there exists an indefinitely differentiable function g such that g is 0 if x ≤ a or x ≥ b, g is 1 on [a + δ, b − δ], and g is strictly monotonic on [a, a + δ] and [b − δ, b]. [Hint: For (b) consider F (x) = c ∫ x  −∞ f (t) dt where c is an appropriate constant.]
### p.179 · highlight

> 5. Suppose f is continuous and of moderate decrease.  (a) Prove that fˆ is continuous and fˆ(ξ) → 0 as |ξ| → ∞.
### p.180 · highlight

> b) Show that if fˆ(ξ) = 0 for all ξ, then f is identically 0. [Hint: For part (a), show that fˆ(ξ) = 1  2  ∫∞  −∞[f (x) − f (x − 1/(2ξ))]e−2πixξ dx.  For part (b), verify that the multiplication formula ∫ f (x)gˆ(x) dx = ∫ fˆ(y)g(y) dy still holds whenever g ∈ S(R).]
### p.180 · highlight

> 6. The function e−πx2 is its own Fourier transform. Generate other functions that (up to a constant multiple) are their own Fourier transforms. What must  the constant multiples be? To decide this, prove that F4 = I. Here F(f ) = fˆ is the Fourier transform, F4 = F ◦ F ◦ F ◦ F , and I is the identity operator (If )(x) = f (x) (see also Problem 7).
### p.180 · highlight

> 7. Prove that the convolution of two functions of moderate decrease is a function of moderate decrease.  [Hint: Write  ∫  f (x − y)g(y) dy =  ∫  |y|≤|x|/2  +  ∫  |y|≥|x|/2  .  In the first integral f (x − y) = O(1/(1 + x2)) while in the second integral g(y) = O(1/(1 + x2)).]  8. Prove that f is continuous, of moderate decrease, and ∫ ∞  −∞f (y)e−y2 e2xydy = 0  for all x ∈ R, then f = 0. [Hint: Consider f ∗ e−x2 .]
### p.182 · highlight

> 15. This exercise provides another example of periodization.  (a) Apply the Poisson summation formula to the function g in Exercise 2 to  obtain  ∞ ∑  n=−∞  1 (n + α)2 = π2  (sin πα)2 whenever α is real, but not equal to an integer. (b) Prove as a consequence that  (15)  ∞ ∑  n=−∞  1 (n + α) = π  tan πα  whenever α is real but not equal to an integer. [Hint: First prove it when 0 < α < 1. To do so, integrate the formula in (b). What is the precise meaning of the series on the left-hand side of (15)? Evaluate at α = 1/2.]
### p.184 · highlight

> 20. The following results are relevant in information theory when one tries to recover a signal from its samples.  Suppose f is of moderate decrease and that its Fourier transform fˆ is supported in I = [−1/2, 1/2]. Then, f is entirely determined by its restriction to Z. This means that if g is another function of moderate decrease whose Fourier transform is supported in I and f (n) = g(n) for all n ∈ Z, then f = g. More precisely: (a) Prove that the following reconstruction formula holds:  f (x) =  ∞ ∑  n=−∞  f (n)K(x − n) where K(y) = sin πy  πy .  Note that K(y) = O(1/|y|) as |y| → ∞. (b) If λ > 1, then  f (x) =  ∞ ∑  n=−∞  1  λf  (n  λ  )  Kλ  (  x− n  λ  )  where Kλ(y) = cos πy − cos πλy  π2(λ − 1)y2 .  Thus, if one samples f “more often,” the series in the reconstruction formula converges faster since Kλ(y) = O(1/|y|2) as |y| → ∞. Note that Kλ(y) → K(y) as λ → 1. (c) Prove that  ∫∞  −∞  |f (x)|2 dx =  ∞ ∑  n=−∞  |f (n)|2.  [Hint: For part (a) show that if χ is the characteristic function of I, then  fˆ(ξ) = χ(ξ) ∑∞  n=−∞ f (n)e−2πinξ. For (b) use the function in Figure 2 instead  of χ(ξ).]
### p.184 · highlight

> 21. Suppose that f is continuous on R. Show that f and fˆ cannot both be compactly supported unless f = 0. This can be viewed in the same spirit as the uncertainty principle.
### p.185 · highlight

> [Hint: Assume f is supported in [0, 1/2]. Expand f in a Fourier series in the interval [0, 1], and note that as a result, f is a trigonometric polynomial.]  22. The heuristic assertion stated before Theorem 4.1 can be made precise as follows. If F is a function on R, then we say that the preponderance of its mass is contained in an interval I (centered at the origin) if  (16)  ∫  I  x2|F (x)|2 dx ≥ 1  2  ∫  R  x2|F (x)|2 dx.  Now suppose f ∈ S, and (16) holds with F = f and I = I1; also with F = fˆ and I = I2. Then if Lj denotes the length of Ij, we have  L1L2 ≥ 1  2π .  A similar conclusion holds if the intervals are not necessarily centered at the origin.  23. The Heisenberg uncertainty principle can be formulated in terms of the  operator L = − d2  dx2 + x2, which acts on Schwartz functions by the formula  L(f ) = − d2f  dx2 + x2f.  This operator, sometimes called the Hermite operator, is the quantum analogue of the harmonic oscillator. Consider the usual inner product on S given by  (f, g) =  ∫∞  −∞  f (x)g(x) dx whenever f, g ∈ S.
### p.186 · highlight

> (a) Prove that the Heisenberg uncertainty principle implies  (Lf, f ) ≥ (f, f ) for all f ∈ S. This is usually denoted by L ≥ I. [Hint: Integrate by parts.] (b) Consider the operators A and A∗ defined on S by  A(f ) = df  dx + xf and A∗(f ) = − df  dx + xf.  The operators A and A∗ are sometimes called the annihilation and creation operators, respectively. Prove that for all f, g ∈ S we have (i) (Af, g) = (f, A∗g), (ii) (Af, Af ) = (A∗Af, f ) ≥ 0, (iii) A∗A = L − I. In particular, this again shows that L ≥ I. (c) Now for t ∈ R, let  At(f ) = df  dx + txf and At∗(f ) = − df  dx + txf.  Use the fact that (At∗Atf, f ) ≥ 0 to give another proof of the Heisenberg uncertainty principle which says that whenever ∫ ∞  −∞ |f (x)|2 dx = 1 then  (∫ ∞  −∞  x2|f (x)|2 dx  ) (∫ ∞  −∞  ∣∣∣∣ df  dx  ∣∣∣∣  2  dx  )  ≥ 1/4.  [Hint: Think of (At∗Atf, f ) as a quadratic polynomial in t.]
### p.189 · highlight

> Theorem. Suppose that u(x, t) is a real-valued solution of the heat equation in the upper half-plane, which is continuous on its closure. Let R denote the rectangle  R = {(x, y) ∈ R2 : a ≤ x ≤ b, 0 ≤ t ≤ c}  and ∂′R be the part of the boundary of R which consists of the two vertical sides and its base on the line t = 0 (see Figure 3). Then  min  (x,t)∈∂′R u(x, t) = min  (x,t)∈R u(x, t) and max  (x,t)∈∂′R u(x, t) = max  (x,t)∈R u(x, t).
### p.189 · highlight

> The steps leading to a proof of this result are outlined below. (a) Show that it suffices to prove that if u ≥ 0 on ∂′R, then u ≥ 0 in R. (b) For ≤ > 0, let  v(x, t) = u(x, t) + ≤t.  Then, v has a minimum on R, say at (x1, t1). Show that x1 = a or b, or else t1 = 0. To do so, suppose on the contrary that a < x1 < b and 0 < t1 ≤ c, and prove that vxx(x1, t1) − vt(x1, t1) ≤ −≤. However, show also that the left-hand side must be non-negative. (c) Deduce from (b) that u(x, t) ≥ ≤(t1 − t) for any (x, t) ∈ R and let ≤ → 0.
### p.190 · highlight

> 7.∗ The Hermite functions hk(x) are defined by the generating identity  ∑ ∞  k=0  hk(x) tk  k! = e−(x2/2−2tx+t2).  (a) Show that an alternate definition of the Hermite functions is given by the  formula  hk(x) = (−1)kex2/2  (d  dx  )k  e−x2 .  [Hint: Write e−(x2/2−2tx+t2) = ex2/2e−(x−t)2 and use Taylor’s formula.] Conclude from the above expression that each hk(x) is of the form  Pk(x)e−x2/2, where Pk is a polynomial of degree k. In particular, the Hermite functions belong to the Schwartz space and h0(x) = e−x2/2,  h1(x) = 2xe−x2/2.  (b) Prove that the family {hk}k∞=0 is complete in the sense that if f is a  Schwartz function, and  (f, hk) =  ∫∞  −∞  f (x)hk(x) dx = 0 for all k ≥ 0,  then f = 0. [Hint: Use Exercise 8.] (c) Define h∗k(x) = hk((2π)1/2x). Then  ̂h∗k(ξ) = (−i)kh∗k(ξ).  Therefore, each h∗k is an eigenfunction for the Fourier transform. (d) Show that hk is an eigenfunction for the operator defined in Exercise 23,  and in fact, prove that  Lhk = (2k + 1)hk.  In particular, we conclude that the functions hk are mutually orthogonal for the L2 inner product on the Schwartz space. (e) Finally, show that ∫ ∞  −∞[hk(x)]2 dx = π1/22kk!. [Hint: Square the generating relation.]
### p.194 · highlight

> A rotation in Rd is a linear transformation R : Rd → Rd which preserves the inner product. In other words,  • R(ax + by) = aR(x) + bR(y) for all x, y ∈ Rd and a, b ∈ R. • R(x) · R(y) = x · y for all x, y ∈ Rd.
### p.195 · highlight

> A continuous complex-valued function f on Rd is said to be rapidly decreasing if for every multi-index α the function |xαf (x)| is bounded. Equivalently, a continuous function is of rapid decrease if  sup  x∈Rd  |x|k |f (x)| < ∞ for every k = 0, 1, 2, . . ..
### p.196 · highlight

> (i)  ∫  Rd  f (x + h) dx =  ∫  Rd  f (x) dx for all h ∈ Rd,  (ii) δd  ∫  Rd  f (δx) dx =  ∫  Rd  f (x) dx for all δ > 0,  (iii)  ∫  Rd  f (R(x)) dx =  ∫  Rd  f (x) dx for every rotation R.
### p.197 · highlight

> In general, it is possible to write any point in Rd − {0} uniquely as  x = rγ  where γ lies on the unit sphere Sd−1 ⊂ Rd and r > 0. Indeed, take r = |x| and γ = x/|x|. Thus one may proceed as in the cases d = 2 or d = 3 to define spherical coordinates. The formula we shall use is  ∫  Rd  f (x) dx =  ∫  Sd−1  ∫∞  0  f (rγ) rd−1 dr dσ(γ),  whenever f is of moderate decrease. Here dσ(γ) denotes the surface element on the sphere Sd−1 obtained from the spherical coordinates.
### p.197 · highlight

> The Schwartz space S(Rd) (sometimes abbreviated as S) consists of all indefinitely differentiable functions f on Rd such that  sup  x∈Rd  ∣∣∣∣∣xα  (∂  ∂x  )β  f (x)  ∣∣∣∣∣ < ∞,  for every multi-index α and β. In other words, f and all its derivatives are required to be rapidly decreasing.
### p.198 · highlight

> The Fourier transform of a Schwartz function f is defined by  fˆ(ξ) =  ∫  Rd  f (x)e−2πix·ξ dx, for ξ ∈ Rd.
### p.198 · highlight

> Proposition 2.1 Let f ∈ S(Rd).  (i) f (x + h) −→ fˆ(ξ)e2πiξ·h whenever h ∈ Rd. (ii) f (x)e−2πixh −→ fˆ(ξ + h) whenever h ∈ Rd. (iii) f (δx) −→ δ−dfˆ(δ−1ξ) whenever δ > 0. (iv)  (∂  ∂x  )α  f (x) −→ (2πiξ)αfˆ(ξ).  (v) (−2πix)αf (x) −→  (∂  ∂ξ  )α fˆ(ξ).  (vi) f (Rx) −→ fˆ(Rξ) whenever R is a rotation.
### p.198 · highlight

> Corollary 2.2 The Fourier transform maps S(Rd) to itself.
### p.199 · highlight

> Corollary 2.3 The Fourier transform of a radial function is radial.
### p.199 · highlight

> Theorem 2.4 Suppose f ∈ S(Rd). Then  f (x) =  ∫  Rd  fˆ(ξ)e2πix·ξ dξ.  Moreover  ∫  Rd  |fˆ(ξ)|2 dξ =  ∫  Rd  |f (x)|2 dx.
### p.214 · highlight

> A natural problem is to determine a relation between f0 and F0.  This problem has a simple answer in dimensions one and three. If d = 1 the relation we seek is (9) F0(ρ) = 2  ∫∞  0  cos(2πρr)f0(r) dr.
### p.215 · highlight

> In general, there are corresponding formulas relating f0 and F0 in Rd in terms of Bessel functions of order d/2 − 1 (see Problem 2). In even dimensions, these are the Bessel functions we have defined above. For odd dimensions, we need a more general definition of Bessel functions to encompass half-integral orders. Note that the formulas for the Fourier transform of radial functions give another illustration of the differences between odd and even dimensions. When d = 1 or d = 3 (as well as d > 3, d odd) the formulas are in terms of elementary functions, but this is not the case when d is even.
### p.217 · highlight

> We define the X-ray transform (or Radon transform in R2) of ρ by  X(ρ)(L) =  ∫  L  ρ.
### p.218 · highlight

> In fact, by using the heuristic argument above of counting the number of degrees of freedom, we see that for functions ρ in R3 the number is three, while the number of parameters determining a line L in R3 is four (for example, two for the intercept in the (x1, x2) plane, and two more for the direction of the line). Thus in this sense, the problem is over-determined.
### p.218 · highlight

> If P is such a plane, we define the Radon transform R(f ) by  R(f )(P) =  ∫  P  f.
### p.220 · highlight

> Proposition 5.1 If f ∈ S(R3), then for each γ the definition of ∫  Pt,γ f  is independent of the choice of e1 and e2. Moreover  ∫∞  −∞  (∫  Pt,γ  f  )  dt =  ∫  R3  f (x) dx.
### p.220 · highlight

> Remark. We digress to point out that the X-ray transform determines the Radon transform, since two-dimensional integrals can be expressed as iterated one-dimensional integrals. In other words, the knowledge of the integral of a function over all lines determines the integral of that function over any plane.
### p.220 · highlight

> The Radon transform of a function f ∈ S(R3) is defined by  R(f )(t, γ) =  ∫  Pt,γ  f.
### p.221 · highlight

> Uniqueness problem: If R(f ) = R(g), then f = g. Reconstruction problem: Express f in terms of R(f ).
### p.221 · highlight

> Lemma 5.2 If f ∈ S(R3), then R(f )(t, γ) ∈ S(R) for each fixed γ. Moreover,  ̂R(f )(s, γ) = fˆ(sγ).
### p.222 · highlight

> Corollary 5.3 If f, g ∈ S(R3) and R(f ) = R(g), then f = g.
### p.222 · highlight

> Given a function F on R × S2, we define its dual Radon transform by (13) R∗(F )(x) =  ∫  S2  F (x · γ, γ) dσ(γ).
### p.223 · highlight

> heorem 5.4 If f ∈ S(R3), then  4(R∗R(f )) = −8π2f.  We recall that 4 = ∂2  ∂x21 + ∂2  ∂x22 + ∂2  ∂x23 is the Laplacian
### p.225 · highlight

> 3. Recall the formula  ∫  Rd  F (x) dx =  ∫  S d−1  ∫∞  0  F (rγ)rd−1 dr dσ(γ).  Apply this to the special case when F (x) = g(r)f (γ), where x = rγ, to prove that for any rotation R, one has  ∫  Sd−1  f (R(γ)) dσ(γ) =  ∫  S d−1  f (γ) dσ(γ),  whenever f is a continuous function on the sphere Sd−1.
### p.225 · highlight

> 4. Let Ad and Vd denote the area and volume of the unit sphere and unit ball  in Rd, respectively. (a) Prove the formula  Ad = 2πd/2  Γ(d/2) so that A2 = 2π, A3 = 4π, A4 = 2π2, . . .. Here Γ(x) = ∫ ∞  0 e−ttx−1 dt is  the Gamma function. [Hint: Use polar coordinates and the fact that  ∫  Rd e−π|x|2 dx = 1.]
### p.226 · highlight

> (b) Show that d Vd = Ad, hence  Vd = πd/2  Γ(d/2 + 1) . In particular V2 = π, V3 = 4π/3, . . ..  5. Let A be a d × d positive definite symmetric matrix with real coefficients. Show that ∫  Rd  e−π(x,A(x)) dx = (det(A))−1/2.  This generalizes the fact that ∫  Rd e−π|x|2 dx = 1, which corresponds to the case  where A is the identity.  [Hint: Apply the spectral theorem to write A = RDR−1 where R is a rotation and, D is diagonal with entries λ1, . . . , λd, where {λi} are the eigenvalues of A.]
### p.226 · highlight

> 6. Suppose ψ ∈ S(Rd) satisfies ∫ |ψ(x)|2 dx = 1. Show that  (∫  Rd  |x|2|ψ(x)|2 dx  ) (∫  Rd  |ξ|2|ψˆ(ξ)|2 dξ  )  ≥ d2  16π2 . This is the statement of the Heisenberg uncertainty principle in d dimensions.
### p.228 · highlight

> 12. Establish the identity (14) about the dual transform given in the text. In other words, prove that  (16)  ∫  R  ∫  S2  R(f )(t, γ)F (t, γ)dσ(γ) dt =  ∫  R3  f (x)R∗(F )(x) dx  where f ∈ S(R3), F ∈ S(R × S2), and  R(f ) =  ∫  Pt,γ  f and R∗(F )(x) =  ∫  S2  F (x · γ, γ) dσ(γ).  [Hint: Consider the integral  ∫∫∫  f (tγ + u1e2 + u2e2)F (t, γ) dt dσ(γ) du1 du2.  Integrating first in u gives the left-hand side of (16), while integrating in u and t and setting x = tγ + u1e2 + u2e2 gives the right-hand side.]
### p.228 · highlight

> 13. For each (t, θ) with t ∈ R and |θ| ≤ π, let L = Lt,θ denote the line in the (x, y)-plane given by  x cos θ + y sin θ = t.  This is the line perpendicular to the direction (cos θ, sin θ) at “distance” t from the origin (we allow negative t). For f ∈ S(R2) the X-ray transform or twodimensional Radon transform of f is defined by  X(f )(t, θ) =  ∫  Lt,θ  f=  ∫∞  −∞  f (t cos θ + u sin θ, t sin θ − u cos θ) du.
### p.229 · highlight

> Calculate the X-ray transform of the function f (x, y) = e−π(x2+y2).  14. Let X be the X-ray transform. Show that if f ∈ S and X(f ) = 0, then f = 0, by taking the Fourier transform in one variable.  15. For F ∈ S(R × S1), define the dual X-ray transform X∗(F ) by integrating F over all lines that pass through the point (x, y) (that is, those lines Lt,θ with x cos θ + y sin θ = t):  X∗(F )(x, y) =  ∫  F (x cos θ + y sin θ, θ) dθ.  Check that in this case, if f ∈ S(R2) and F ∈ S(R × S1), then  ∫∫  X(f )(t, θ)F (t, θ) dt dθ =  ∫∫  f (x, y)X∗(F )(x, y) dx dy.
### p.229 · highlight

> 1. Let Jn denote the nth order Bessel function, for n ∈ Z. Prove that  (a) Jn(ρ) is real for all real ρ. (b) J−n(ρ) = (−1)nJn(ρ). (c) 2J ′n(ρ) = Jn−1(ρ) − Jn+1(ρ). (d)  ( 2n ρ )  Jn(ρ) = Jn−1(ρ) + Jn+1(ρ).  (e) (ρ−nJn(ρ))′ = −ρ−nJn+1(ρ). (f) (ρnJn(ρ))′ = ρnJn−1(ρ). (g) Jn(ρ) satisfies the second order differential equation  J ′n′(ρ) + ρ−1J ′n(ρ) + (1 − n2/ρ2)Jn(ρ) = 0.  (h) Show that  Jn(ρ) =  (ρ  2  )n ∞ ∑  m=0  (−1)m ρ2m  22mm!(n + m)! . (i) Show that for all integers n and all real numbers a and b we have  Jn(a + b) = ∑  `∈Z  J`(a)Jn−`(b).
### p.230 · highlight

> 2. Another formula for Jn(ρ) that allows one to define Bessel functions for non-integral values of n, (n > −1/2) is  Jn(ρ) = (ρ/2)n  Γ(n + 1/2)√π  ∫1  −1  eiρt(1 − t2)n−(1/2) dt.  (a) Check that the above formula agrees with the definition of Jn(ρ) for integral n ≥ 0. [Hint: Verify it for n = 0 and then check that both sides satisfy the recursion formula (e) in Problem 1.] (b) Note that J1/2(ρ) =  √  2  π ρ−1/2 sin ρ.  (c) Prove that  lim  n→−1/2 Jn(ρ) =  √2  π ρ−1/2 cos ρ.  (d) Observe that the formulas we have proved in the text giving F0 in terms  of f0 (when describing the Fourier transform of a radial function) take the form (17) F0(ρ) = 2πρ−(d/2)+1  ∫∞  0  J(d/2)−1(2πρr)f0(r)rd/2 dr,  for d = 1, 2, and 3, if one uses the formulas above with the understanding that J−1/2(ρ) = limn→−1/2 Jn(ρ). It turns out that the relation between F0 and f0 given by (17) is valid in all dimensions d.
### p.234 · highlight

> 7. For every real number a > 0, define the operator (−4)a by the formula  (−4)af (x) =  ∫  Rd  (2π|ξ|)2afˆ(ξ)e2πiξ·x dξ whenever f ∈ S(Rd). (a) Check that (−4)a agrees with the usual definition of the ath power of  −4 (that is, a compositions of minus the Laplacian) when a is a positive integer.  (b) Verify that (−4)a(f ) is indefinitely differentiable. (c) Prove that if a is not an integer, then in general (−4)a(f ) is not rapidly  decreasing.
### p.234 · highlight

> 8.∗ The reconstruction formula for the Radon transform in Rd is as follows:  (a) When d = 2,  (−4)1/2  4π R∗(R(f )) = f, where (−4)1/2 is defined in Problem 7. (b) If the Radon transform and its dual are defined by analogy to the cases  d = 2 and d = 3, then for general d,  (2π)1−d  2 (−4)(d−1)/2R∗(R(f )) = f.
### p.236 · highlight

> We denote the set of all N th roots of unity by Z(N ). The fact that this set gives a uniform partition of the circle is clear from its definition. Note that the set Z(N ) satisfies the following properties: (i) If z, w ∈ Z(N ), then zw ∈ Z(N ) and zw = wz. (ii) 1 ∈ Z(N ). (iii) If z ∈ Z(N ), then z−1 = 1/z ∈ Z(N ) and of course zz−1 = 1.
### p.238 · highlight

> The association  R(k) ←→ e2πik/N  gives a correspondence between the two abelian groups, Z/N Z and Z(N ). Since the operations are respected, in the sense that addition of integers modulo N becomes multiplication of complex numbers, we shall also denote the group of integers modulo N by Z(N ). Observe that 0 ∈ Z/N Z corresponds to 1 on the unit circle.  Let V and W denote the vector spaces of complex-valued functions on the group of integers modulo N and the N th roots of unity, respectively. Then, the identification given above carries over to V and W as follows:  F (k) ←→ f (e2πik/N ),  where F is a function on the integers modulo N and f is a function on the N th roots of unity.  From now on, we write Z(N ) but think of either the group of integers modulo N or the group of N th roots of unity
### p.239 · highlight

> (i) {en}n∈Z is an orthonormal set for the inner product (1) (in Chapter 3) on the space of Riemann integrable functions on the circle. (ii) Finite linear combinations of the en’s (the trigonometric polynomials) are dense in the space of continuous functions on the circle. (iii) en(x + y) = en(x)en(y).
### p.239 · highlight

> Lemma 1.1 The family {e0, . . . , eN−1} is orthogonal. In fact,  (em, e`) =  { N if m = `,  0 if m 6= `.
### p.240 · highlight

> If we define the nth Fourier coefficient of F by  an = 1  N  N −1  ∑  k=0  F (k)e−2πikn/N ,
### p.240 · highlight

> Theorem 1.2 If F is a function on Z(N ), then  F (k) =  N −1  ∑  n=0  ane2πink/N .  Moreover,  N −1  ∑  n=0  |an|2 = 1  N  N −1  ∑  k=0  |F (k)|2.
### p.240 · highlight

> Remark. It is possible to recover the Fourier inversion on the circle for sufficiently smooth functions (say C2) by letting N → ∞ in the finite model Z(N )
### p.241 · highlight

> Theorem 1.3 Given ωN = e−2πi/N with N = 2n, it is possible to calculate the Fourier coefficients of a function on Z(N ) with at most  4 · 2nn = 4N log2(N ) = O(N log N )  operations.
### p.247 · highlight

> Let G be a finite abelian group (with the multiplicative notation) and S1 the unit circle in the complex plane. A character on G is a complexvalued function e : G → S1 which satisfies the following condition: (2) e(a · b) = e(a)e(b) for all a, b ∈ G.  In other words, a character is a homomorphism from G to the circle group. The trivial or unit character is defined by e(a) = 1 for all a ∈ G.
### p.248 · highlight

> Lemma 2.1 The set Gˆ is an abelian group under multiplication defined by  (e1 · e2)(a) = e1(a)e2(a) for all a ∈ G.
### p.249 · highlight

> Note that the dimension of V is |G|, the order of G. We define a Hermitian inner product on V by (3) (f, g) = 1  |G|  ∑  a∈G  f (a)g(a), whenever f, g ∈ V .
### p.249 · highlight

> Theorem 2.3 The characters of G form an orthonormal family with respect to the inner product defined above.
### p.249 · highlight

> Lemma 2.4 If e is a non-trivial character of the group G, then  ∑  a∈G e(a) = 0.
### p.250 · highlight

> Theorem 2.5 The characters of a finite abelian group G form a basis for the vector space of functions on G.
### p.252 · highlight

> Theorem 2.7 Let G be a finite abelian group. The characters of G form an orthonormal basis for the vector space V of functions on G equipped with the inner product  (f, g) = 1  |G|  ∑  a∈G  f (a)g(a).  In particular, any function f on G is equal to its Fourier series  f=∑  e∈Gˆ  fˆ(e)e.
### p.253 · highlight

> Theorem 2.8 If f is a function on G, then ‖f ‖2 = ∑  e∈Gˆ  |fˆ(e)|2.
### p.253 · highlight

> 1. Let f be a function on the circle. For each N ≥ 1 the discrete Fourier coefficients of f are defined by  aN (n) = 1  N  N ∑ k=1  f (e2πik/N )e−2πikn/N , for n ∈ Z.  We also let  a(n) =  ∫1  0  f (e2πix)e−2πinx dx  denote the ordinary Fourier coefficients of f . (a) Show that aN (n) = aN (n + N ). (b) Prove that if f is continuous, then aN (n) → a(n) as N → ∞.
### p.254 · highlight

> 4. Let e be a character on G = Z(N ), the additive group of integers modulo N . Show that there exists a unique 0 ≤ ` ≤ N − 1 so that  e(k) = e`(k) = e2πi`k/N for all k ∈ Z(N ).  Conversely, every function of this type is a character on Z(N ). Deduce that  e` 7→ ` defines an isomorphism from Gˆ to G. [Hint: Show that e(1) is an N th root of unity.]  5. Show that all characters on S1 are given by  en(x) = e2πinx with n ∈ Z,  and check that en 7→ n defines an isomorphism from ̂S1 to Z. [Hint: If F is continuous and F (x + y) = F (x)F (y), then F is differentiable. To see this, note that if F (0) 6= 0, then for appropriate δ, c = ∫ δ  0 F (y) dy 6= 0, and  cF (x) = ∫ δ+x  x F (y) dy. Differentiate to conclude that F (x) = eAx for some A.]  6. Prove that all characters on R take the form  eξ(x) = e2πiξx with ξ ∈ R,  and that eξ 7→ ξ defines an isomorphism from ̂R to R. The argument in Exercise 5 applies here as well
### p.255 · highlight

> 8. Suppose that P (x) =  N ∑ n=1  ane2πinx.  (a) Show by using the Parseval identities for the circle and Z(N ), that  ∫1  0  |P (x)|2 dx = 1  N  N ∑ j=1  |P (j/N )|2.  (b) Prove the reconstruction formula  P (x) =  N ∑ j=1  P (j/N )K(x − (j/N ))  where  K(x) = e2πix  N  1 − e2πiNx 1 − e2πix = 1  N (e2πix + e2πi2x + · · · + e2πiNx).  Observe that P is completely determined by the values P (j/N ) for 1 ≤ j ≤ N . Note also that K(0) = 1, and K(j/N ) = 0 whenever j is not congruent to 0 modulo N .
### p.255 · highlight

> 9. To prove the following assertions, modify the argument given in the text.  (a) Show that one can compute the Fourier coefficients of a function on Z(N )  when N = 3n with at most 6N log3 N operations. (b) Generalize this to N = αn where α is an integer > 1.
### p.255 · highlight

> 12. Suppose that G is a finite abelian group and e : G → C is a function that satisfies e(x · y) = e(x)e(y) for all x, y ∈ G. Prove that either e is identically 0, or e never vanishes. In the second case, show that for each x, e(x) = e2πir for some r ∈ Q of the form r = p/q, where q = |G|.
### p.256 · highlight

> 13. In analogy with ordinary Fourier series, one may interpret finite Fourier expansions using convolutions as follows. Suppose G is a finite abelian group, 1G its unit, and V the vector space of complex-valued functions on G.  (a) The convolution of two functions f and g in V is defined for each a ∈ G  by  (f ∗ g)(a) = 1  |G|  ∑  b∈G  f (b)g(a · b−1).  Show that for all e ∈ Gˆ one has (̂ f ∗ g)(e) = fˆ(e)gˆ(e). (b) Use Theorem 2.5 to show that if e is a character on G, then  ∑  e∈Gˆ  e(c) = 0 whenever c ∈ G and c 6= 1G.  (c) As a result of (b), show that the Fourier series Sf (a) = ∑  e∈Gˆ fˆ(e)e(a) of  a function f ∈ V takes the form  Sf = f ∗ D,  where D is defined by (4) D(c) = ∑  e∈Gˆ  e(c) =  { |G| if c = 1G,  0 otherwise.  Since f ∗ D = f , we recover the fact that Sf = f . Loosely speaking, D corresponds to a “Dirac delta function”; it has unit mass  1 |G|  ∑  c∈G  D(c) = 1,  and (4) says that this mass is concentrated at the unit element in G. Thus D has the same interpretation as the “limit” of a family of good kernels. (See Section 4, Chapter 2.)
### p.256 · highlight

> Prove that if n and m are two positive integers that are relatively prime, then  Z(nm) ≈ Z(n) × Z(m).
### p.257 · highlight

> 2.∗ Every finite abelian group G is isomorphic to a direct product of cyclic groups. Here are two more precise formulations of this theorem.  • If p1, . . . , ps are the distinct primes appearing in the factorization of the order of G, then  G ≈ G(p1) × · · · × G(ps),  where each G(p) is of the form G(p) = Z(pr1 ) × · · · × Z(pr` ), with 0 ≤ r1 ≤ · · · ≤ r` (this sequence of integers depends on p of course). This decomposition is unique.  • There exist unique integers d1, . . . , dk such that  d1|d2, d2|d3, · · · , dk−1|dk  and  G ≈ Z(d1) × · · · × Z(dk).  Deduce the second formulation from the first.
### p.257 · highlight

> 3. Let Gˆ denote the collection of distinct characters of the finite abelian group G.  (a) Note that if G = Z(N ), then Gˆ is isomorphic to G. (b) Prove that Ĝ 1 × G2 = Gˆ1 × Gˆ2. (c) Prove using Problem 2 that if G is a finite abelian group, then Gˆ is isomorphic to G.
### p.302 · highlight

> Proposition 1.4 Let f be a bounded function on the compact interval [a, b]. If c ∈ (a, b), and if for all small δ > 0 the function f is integrable on the intervals [a, c − δ] and [c + δ, b], then f is integrable on [a, b].
### p.302 · highlight

> Lemma 1.5 Suppose f is integrable on the circle and f is bounded by B. Then there exists a sequence {fk}k∞=1 of continuous functions on the  circle so that  sup  x∈[−π,π]  |fk(x)| ≤ B for all k = 1, 2, . . .,  and  ∫π  −π  |f (x) − fk(x)| dx → 0 as k → ∞.
### p.304 · highlight

> a subset E of R is said to have measure 0 if for every ≤ > 0 there exists a countable family of open intervals {Ik}k∞=1 such that (i) E ⊂ ⋃∞  k=1 Ik,  (ii) ∑∞  k=1 |Ik| < ≤, where |Ik| denotes the length of the interval Ik.
### p.304 · highlight

> The first condition says that the union of the intervals covers E, and the second that this union is small. The reader will have no difficulty proving that any finite set of points has measure 0. A more subtle argument is needed to prove that a countable set of points has measure 0. In fact, this result is contained in the following lemma.
### p.304 · highlight

> Lemma 1.6 The union of countably many sets of measure 0 has measure 0.
### p.304 · highlight

> Theorem 1.7 A bounded function f on [a, b] is integrable if and only if its set of discontinuities has measure 0.
### p.308 · highlight

> Theorem 2.1 Let f be a continuous function defined on a closed rectangle R ⊂ Rd. Suppose R = R1 × R2 where R1 ⊂ Rd1 and R2 ⊂ Rd2  with d = d1 + d2. If we write x = (x1, x2) with xi ∈ Rdi, then F (x1) =  ∫  R2 f (x1, x2) dx2 is continuous on R1, and we have  ∫  R  f (x) dx =  ∫  R1  (∫  R2  f (x1, x2) dx2  )  dx1.
### p.309 · highlight

> Theorem 2.2 Suppose A and B are compact subsets of Rd and g : A → B is a diffeomorphism of class C1. If f is continuous on B, then ∫  g(A)  f (x) dx =  ∫  A  f (g(y)) | det(Dg)(y)| dy.
### p.310 · highlight

> More generally, the spherical coordinates system in Rd is given by x = g(r, θ1, . . . , θd−1) where     x1 = r sin θ1 sin θ2 · · · sin θd−2 cos θd−1, x2 = r sin θ1 sin θ2 · · · sin θd−2 sin θd−1,  ...  xd−1 = r sin θ1 sin θ2, xd = r cos θ1,  with 0 ≤ θi ≤ π for 1 ≤ i ≤ d − 2 and 0 ≤ θd−1 ≤ 2π. The determinant of the Jacobian of this transformation is given by  rd−1 sind−2 θ1 sind−3 θ2 · · · sin θd−2.  Any point in x ∈ Rd − {0} can be written uniquely as rγ with γ ∈ Sd−1 the unit sphere in Rd. If we define  ∫  Sd−1  f (γ) dσ(γ) =  ∫π  0  ∫π  0  ···  ∫ 2π  0  f (g(r, θ)) sind−2 θ1 sind−3 θ2 · · · sin θd−2 dθd−1 · · · dθ1,
### p.310 · highlight

> In fact, we define the area of the unit sphere Sd−1 ⊂ Rd as  ωd =  ∫  Sd−1  dσ(γ).
### p.312 · highlight

> Theorem 3.1 Suppose f is continuous on R2 and of moderate decrease. Then  F (x1) =  ∫  R  f (x1, x2) dx2  is of moderate decrease on R, and  ∫  R2  f (x) dx =  ∫  R  (∫  R  f (x1, x2) dx2  )  dx1.
### p.314 · highlight

> If f is of moderate decrease, then for each fixed γ ∈ Sd−1, the function of f given by f (rγ)rd−1 is also of moderate decrease on R. Indeed, we have  ∣∣∣f (rγ)rd−1∣∣∣ ≤ A rd−1  1 + |rγ|d+1 ≤ B  1 + r2 . As a result, by letting R → ∞ in (3) we obtain the formula  ∫  Rd  f (x) dx =  ∫  Sd−1  ∫∞  0  f (rγ) rd−1 dr dσ(γ).  As a consequence, if we combine the fact that  ∫  Rd  f (R(x)) dx =  ∫  Rd  f (x) dx,  whenever R is a rotation, with the identity (3), then we obtain that (4)  ∫  S d−1  f (R(γ)) dσ(γ) =  ∫  S d−1  f (γ) dσ(γ) .


## Attachments



---

> 本文件由 Zotero Integration 自动生成，属 **raw/ 层**，不可手改。
> 摄取时 LLM 读取本文件，在 wiki/sources/steinFourierAnalysisIntroduction2003a.md 写摘要，并更新相关实体页。
