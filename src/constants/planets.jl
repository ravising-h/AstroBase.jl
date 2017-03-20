# Luzum, Brian, et al. "The IAU 2009 system of astronomical constants: the report of the IAU working group on numerical standards for Fundamental Astronomy." Celestial Mechanics and Dynamical Astronomy 110.4 (2011): 293-304.
# Archinal, Brent Allen, et al. "Report of the IAU working group on cartographic coordinates and rotational elements: 2009." Celestial Mechanics and Dynamical Astronomy 109.2 (2011): 101-135.
export PLANETS

const PLANETS = (
    :Mercury,
    :Venus,
    :Earth,
    :Mars,
    :Jupiter,
    :Saturn,
    :Uranus,
    :Neptune
)

for (i, planet) in enumerate(PLANETS)
    barycenter = Symbol(planet, "Barycenter")
    @eval begin
        struct $planet <: Planet end
        struct $barycenter <: Barycenter end
        export $planet, $barycenter

        naif_id(::Type{$barycenter}) = $i
        parent(::Type{$barycenter}) = SSB
    end
end

μ(::Type{Mercury}) = 2.2032e4km^3/s^2
j2(::Type{Mercury}) = 2.027e-4
mean_radius(::Type{Mercury}) = 2439.7km
equatorial_radius(::Type{Mercury}) = 2439.7km
polar_radius(::Type{Mercury}) = 2439.7km
deviation(::Type{Mercury}) = 1.0km
maximum_elevation(::Type{Mercury}) = 4.6km
maximum_depression(::Type{Mercury}) = 2.5km
naif_id(::Type{Mercury}) = 199
parent(::Type{Mercury}) = MercuryBarycenter
ra₀(::Type{Mercury}) = deg2rad(281.0097)
ra₁(::Type{Mercury}) = deg2rad(-0.0328)
ra₂(::Type{Mercury}) = 0.0
dec₀(::Type{Mercury}) = deg2rad(61.41430)
dec₁(::Type{Mercury}) = deg2rad(-0.0049)
dec₂(::Type{Mercury}) = 0.0
w₀(::Type{Mercury}) = deg2rad(329.5469)
w₁(::Type{Mercury}) = deg2rad(6.1385025)
w₂(::Type{Mercury}) = 0.0
a(::Type{Mercury}) = [0.0]
d(::Type{Mercury}) = [0.0]
w(::Type{Mercury}) = deg2rad.([0.00993822, -0.00104581, -0.00010280, -0.00002364, -0.00000532])
θ₀(::Type{Mercury}) = deg2rad.([174.791086, 349.582171, 164.373257, 339.164343, 153.955429])
θ₁(::Type{Mercury}) = deg2rad.([4.092335, 8.184670, 12.277005, 16.369340, 20.461675])*JULIAN_CENTURY

μ(::Type{Venus}) = 3.24859e5km^3/s^2
j2(::Type{Venus}) = 6e-5
mean_radius(::Type{Venus}) = 6051.8km
equatorial_radius(::Type{Venus}) = 6051.8km
polar_radius(::Type{Venus}) = 6051.8km
deviation(::Type{Venus}) = 1.0km
maximum_elevation(::Type{Venus}) = 11.0km
maximum_depression(::Type{Venus}) = 2.0km
naif_id(::Type{Venus}) = 299
parent(::Type{Venus}) = VenusBarycenter
ra₀(::Type{Venus}) = deg2rad(272.76)
ra₁(::Type{Venus}) = 0.0
ra₂(::Type{Venus}) = 0.0
dec₀(::Type{Venus}) = deg2rad(67.16)
dec₁(::Type{Venus}) = 0.0
dec₂(::Type{Venus}) = 0.0
w₀(::Type{Venus}) = deg2rad(160.20)
w₁(::Type{Venus}) = deg2rad(-1.4813688)
w₂(::Type{Venus}) = 0.0
a(::Type{Venus}) = [0.0]
d(::Type{Venus}) = [0.0]
w(::Type{Venus}) = [0.0]
θ₀(::Type{Venus}) = [0.0]
θ₁(::Type{Venus}) = [0.0]

μ(::Type{Earth}) = 3.986004418e5km^3/s^2
j2(::Type{Earth}) = 1.08262668e-3
mean_radius(::Type{Earth}) = 6371.0084km
equatorial_radius(::Type{Earth}) = 6378.1366km
polar_radius(::Type{Earth}) = 6356.7519km
deviation(::Type{Earth}) = 3.57km
maximum_elevation(::Type{Earth}) = 8.85km
maximum_depression(::Type{Earth}) = 11.52km
naif_id(::Type{Earth}) = 399
parent(::Type{Earth}) = EarthBarycenter
ra₀(::Type{Earth}) = 0.0
ra₁(::Type{Earth}) = deg2rad(-0.641)
ra₂(::Type{Earth}) = 0.0
dec₀(::Type{Earth}) = deg2rad(90)
dec₁(::Type{Earth}) = deg2rad(-0.557)
dec₂(::Type{Earth}) = 0.0
w₀(::Type{Earth}) = deg2rad(190.147)
w₁(::Type{Earth}) = deg2rad(360.9856235)
w₂(::Type{Earth}) = 0.0
a(::Type{Earth}) = [0.0]
d(::Type{Earth}) = [0.0]
w(::Type{Earth}) = [0.0]
θ₀(::Type{Earth}) = [0.0]
θ₁(::Type{Earth}) = [0.0]

μ(::Type{Mars}) = 4.282837e4km^3/s^2
j2(::Type{Mars}) = 1.964e-3
mean_radius(::Type{Mars}) = 3389.5km
equatorial_radius(::Type{Mars}) = 3396.19km
polar_radius(::Type{Mars}) = 3376.20km
deviation(::Type{Mars}) = 3.0km
maximum_elevation(::Type{Mars}) = 22.64km
maximum_depression(::Type{Mars}) = 7.55km
naif_id(::Type{Mars}) = 499
parent(::Type{Mars}) = MarsBarycenter
ra₀(::Type{Mars}) = deg2rad(317.68143)
ra₁(::Type{Mars}) = deg2rad(-0.1061)
ra₂(::Type{Mars}) = 0.0
dec₀(::Type{Mars}) = deg2rad(52.886500)
dec₁(::Type{Mars}) = deg2rad(-0.0609)
dec₂(::Type{Mars}) = 0.0
w₀(::Type{Mars}) = deg2rad(176.630)
w₁(::Type{Mars}) = deg2rad(350.89198226)
w₂(::Type{Mars}) = 0.0
a(::Type{Mars}) = [0.0]
d(::Type{Mars}) = [0.0]
w(::Type{Mars}) = [0.0]
θ₀(::Type{Mars}) = [0.0]
θ₁(::Type{Mars}) = [0.0]

μ(::Type{Jupiter}) = 1.26686534e8km^3/s^2
j2(::Type{Jupiter}) = 1.475e-2
mean_radius(::Type{Jupiter}) = 69911.0km
equatorial_radius(::Type{Jupiter}) = 71492.0km
polar_radius(::Type{Jupiter}) = 66854.0km
deviation(::Type{Jupiter}) = 62.1km
maximum_elevation(::Type{Jupiter}) = 31.0km
maximum_depression(::Type{Jupiter}) = 102.0km
naif_id(::Type{Jupiter}) = 599
parent(::Type{Jupiter}) = JupiterBarycenter
ra₀(::Type{Jupiter}) = deg2rad(268.056595)
ra₁(::Type{Jupiter}) = deg2rad(-0.006499)
ra₂(::Type{Jupiter}) = 0.0
dec₀(::Type{Jupiter}) = deg2rad(64.4953030)
dec₁(::Type{Jupiter}) = deg2rad(0.002413)
dec₂(::Type{Jupiter}) = 0.0
w₀(::Type{Jupiter}) = deg2rad(284.95)
w₁(::Type{Jupiter}) = deg2rad(870.536)
w₂(::Type{Jupiter}) = 0.0
a(::Type{Jupiter}) = deg2rad.([0.000117, 0.000938, 0.001432, 0.00003, 0.002150])
d(::Type{Jupiter}) = deg2rad.([0.00005, 0.000404, 0.000617, -0.000013, 0.000926])
w(::Type{Jupiter}) = [0.0]
θ₀(::Type{Jupiter}) = deg2rad.([99.360714, 175.895369, 300.323162, 114.012305, 49.511251])
θ₁(::Type{Jupiter}) = deg2rad.([4850.4046, 1191.9605, 262.5475, 6070.2476, 64.3])

μ(::Type{Saturn}) = 3.7931187e7km^3/s^2
j2(::Type{Saturn}) = 1.645e-2
mean_radius(::Type{Saturn}) = 58232.0km
equatorial_radius(::Type{Saturn}) = 60268.0km
polar_radius(::Type{Saturn}) = 54364.0km
deviation(::Type{Saturn}) = 102.9km
maximum_elevation(::Type{Saturn}) = 8.0km
maximum_depression(::Type{Saturn}) = 205.0km
naif_id(::Type{Saturn}) = 699
parent(::Type{Saturn}) = SaturnBarycenter
ra₀(::Type{Saturn}) = deg2rad(40.589)
ra₁(::Type{Saturn}) = deg2rad(-0.036)
ra₂(::Type{Saturn}) = 0.0
dec₀(::Type{Saturn}) = deg2rad(83.5370)
dec₁(::Type{Saturn}) = deg2rad(-0.004)
dec₂(::Type{Saturn}) = 0.0
w₀(::Type{Saturn}) = deg2rad(38.90)
w₁(::Type{Saturn}) = deg2rad(810.7939024)
w₂(::Type{Saturn}) = 0.0
a(::Type{Saturn}) = [0.0]
d(::Type{Saturn}) = [0.0]
w(::Type{Saturn}) = [0.0]
θ₀(::Type{Saturn}) = [0.0]
θ₁(::Type{Saturn}) = [0.0]

μ(::Type{Uranus}) = 5.793939e6km^3/s^2
j2(::Type{Uranus}) = 1.2e-2
mean_radius(::Type{Uranus}) = 25362.0km
equatorial_radius(::Type{Uranus}) = 25559.0km
polar_radius(::Type{Uranus}) = 24973.0km
deviation(::Type{Uranus}) = 16.8km
maximum_elevation(::Type{Uranus}) = 28.0km
maximum_depression(::Type{Uranus}) = 0.0km
naif_id(::Type{Uranus}) = 799
parent(::Type{Uranus}) = UranusBarycenter
ra₀(::Type{Uranus}) = deg2rad(257.311)
ra₁(::Type{Uranus}) = 0.0
ra₂(::Type{Uranus}) = 0.0
dec₀(::Type{Uranus}) = deg2rad(-15.1750)
dec₁(::Type{Uranus}) = 0.0
dec₂(::Type{Uranus}) = 0.0
w₀(::Type{Uranus}) = deg2rad(203.81)
w₁(::Type{Uranus}) = deg2rad(-501.1600928)
w₂(::Type{Uranus}) = 0.0
a(::Type{Uranus}) = [0.0]
d(::Type{Uranus}) = [0.0]
w(::Type{Uranus}) = [0.0]
θ₀(::Type{Uranus}) = [0.0]
θ₁(::Type{Uranus}) = [0.0]

μ(::Type{Neptune}) = 6.836529e6km^3/s^2
j2(::Type{Neptune}) = 4e-3
mean_radius(::Type{Neptune}) = 24622.0km
equatorial_radius(::Type{Neptune}) = 24764.0km
polar_radius(::Type{Neptune}) = 24341.0km
deviation(::Type{Neptune}) = 8.0km
maximum_elevation(::Type{Neptune}) = 14.0km
maximum_depression(::Type{Neptune}) = 0.0km
naif_id(::Type{Neptune}) = 899
parent(::Type{Neptune}) = NeptuneBarycenter
ra₀(::Type{Neptune}) = deg2rad(299.36)
ra₁(::Type{Neptune}) = 0.0
ra₂(::Type{Neptune}) = 0.0
dec₀(::Type{Neptune}) = deg2rad(43.460)
dec₁(::Type{Neptune}) = 0.0
dec₂(::Type{Neptune}) = 0.0
w₀(::Type{Neptune}) = deg2rad(253.18)
w₁(::Type{Neptune}) = deg2rad(536.3128492)
w₂(::Type{Neptune}) = 0.0
a(::Type{Neptune}) = deg2rad.([0.7])
d(::Type{Neptune}) = deg2rad.([-0.51])
w(::Type{Neptune}) = deg2rad.([-0.48])
θ₀(::Type{Neptune}) = deg2rad.([357.85])
θ₁(::Type{Neptune}) = deg2rad.([52.316])
