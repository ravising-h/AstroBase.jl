import Base: convert

convert(::Type{State{F, T, C}}, s::State{F, T, C}) where {
    F<:Frame, T<:Timescale, C<:CelestialBody} = s

# F1 -> F2
function convert(::Type{State{F2, T, C}}, s::State{F1, T, C}) where {
    F1<:Frame, F2<:Frame, T<:Timescale, C<:CelestialBody}
    rot = Rotation(F1, F2, epoch(s))
    State(epoch(s), rot(s), F2, C)
end

# T1 -> T2
function convert(::Type{State{F, T2, C}}, s::State{F, T1, C}) where {
    F<:Frame, T1<:Timescale, T2<:Timescale, C<:CelestialBody}
    State(Epoch{T2}(epoch(s)), radius(s), velocity(s), F, C)
end

# C1 -> C2
function convert(::Type{State{F, T, C2}}, s::State{F, T, C1}) where {
    F<:Frame, T<:Timescale, C1<:CelestialBody, C2<:CelestialBody}
    ep = epoch(s)
    rot = Rotation(F, GCRF, epoch(s))
    body1 = state(ep, C1)
    body2 = state(ep, C2)

    rv = inv(rot)(rot(s) .+ body1 .- body2)
    State(ep, rv, F, C2)
end

# F1 -> F2, T1 -> T2
function convert(::Type{State{F2, T2, C}}, s::State{F1, T1, C}) where {
    F1<:Frame, F2<:Frame, T1<:Timescale, T2<:Timescale, C<:CelestialBody}
    rot = Rotation(F1, F2, epoch(s))

    State(Epoch{T2}(epoch(s)), rot(s), F2, C)
end

# F1 -> F2, C1 -> C2
function convert(::Type{State{F2, T, C2}}, s::State{F1, T, C1}) where {
    F1<:Frame, F2<:Frame, T<:Timescale, C1<:CelestialBody, C2<:CelestialBody}
    ep = epoch(s)
    rot1 = Rotation(F1, GCRF, ep)
    rot2 = Rotation(GCRF, F2, ep)
    body1 = state(ep, C1)
    body2 = state(ep, C2)

    rv = rot2(rot1(s) .+ body1 .- body2)
    State(ep, rv, F2, C2)
end

# T1 -> T2, C1 -> C2
function convert(::Type{State{F, T2, C2}}, s::State{F, T1, C1}) where {
    F<:Frame, T1<:Timescale, T2<:Timescale, C1<:CelestialBody, C2<:CelestialBody}
    ep = epoch(s)
    rot = Rotation(F, GCRF, epoch(s))
    body1 = state(ep, C1)
    body2 = state(ep, C2)

    rv = inv(rot)(rot(s) .+ body1 .- body2)
    State(Epoch{T2}(ep), rv, F, C2)
end

# F1 -> F2, T1 -> T2, C1 -> C2
function convert(::Type{State{F2,T2,C2}}, s::State{F1,T1,C1}) where {
    F1<:Frame, F2<:Frame, T1<:Timescale, T2<:Timescale,
    C1<:CelestialBody, C2<:CelestialBody}
    ep = epoch(s)
    rot1 = Rotation(F1, GCRF, ep)
    rot2 = Rotation(GCRF, F2, ep)
    body1 = state(ep, C1)
    body2 = state(ep, C2)

    rv = rot2(rot1(s) .+ body1 .- body2)
    State(Epoch{T2}(ep), rv, F2, C2)
end
