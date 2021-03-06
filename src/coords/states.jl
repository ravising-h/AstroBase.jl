export State, KeplerianState, array, epoch, scale, frame, body, epoch_type, pos_type, vel_type

#################
# AbstractState #
#################

export AbstractState, epoch, frame

abstract type AbstractState{Scale, Frame, Body} end

function epoch end

scale(s::AbstractState{Scale}) where {Scale} = Scale
frame(s::AbstractState{_S, Frame}) where {_S, Frame} = Frame
body(s::AbstractState{_S, _F, Body}) where {_S, _F, Body} = Body
array(s::AbstractState) = vcat(state(s)...)

function period(s::AbstractState)
    μ = grav_param(body(s))
    a, _ = keplerian(s)
    return period(a, μ)
end

struct State{Scale, Frame, Body, T, TP, TV} <: AbstractState{Scale, Frame, Body}
    epoch::Epoch{Scale, T}
    pos::SVector{3, TP}
    vel::SVector{3, TV}
    function State(epoch::Epoch{Scale, T}, pos, vel;
                   frame::Frame=icrf, body::Body=earth) where {Scale, Frame, Body, T}
        TP = eltype(pos)
        TV = eltype(vel)
        new{Scale::TimeScale, frame::AbstractFrame, body::CelestialBody, T, TP, TV}(epoch, pos, vel)
    end
end

function (==)(s1::State, s2::State)
    s1.epoch == s2.epoch && s1.pos == s2.pos && s1.vel == s2.vel
end

function Base.isapprox(s1::State, s2::State)
    s1.epoch ≈ s2.epoch && s1.pos ≈ s2.pos && s1.vel ≈ s2.vel
end

epoch_type(s::State{_S, _F, _B, T}) where {_S, _F, _B, T} = T
pos_type(s::State{_S, _F, _B, _T, TP}) where {_S, _F, _B, _T, TP} = TP
vel_type(s::State{_S, _F, _B, _T, _TP, TV}) where {_S, _F, _B, _T, _TP, TV} = TV

epoch(s::State) = s.epoch
position(s::State) = s.pos
velocity(s::State) = s.vel
state(s::State) = (s.pos, s.vel)
keplerian(s::State) = keplerian(position(s), velocity(s), grav_param(body(s)))

struct KeplerianState{Scale, Frame, Body, T} <: AbstractState{Scale, Frame, Body}
    epoch::Epoch{Scale, T}
    a::T
    e::T
    i::T
    Ω::T
    ω::T
    ν::T
    function KeplerianState(epoch::Epoch{Scale, T}, a, e, i, Ω, ω, ν;
                            frame::Frame=icrf, body::Body=earth) where {Scale, Frame, Body, T}
        new{Scale::TimeScale, frame::AbstractFrame, body::CelestialBody, T}(epoch, a, e, i, Ω, ω, ν)
    end
end

function (==)(s1::KeplerianState, s2::KeplerianState)
    return s1.epoch == s2.epoch &&
        s1.a == s2.a &&
        s1.e == s2.e &&
        s1.i == s2.i &&
        s1.Ω == s2.Ω &&
        s1.ω == s2.ω &&
        s1.ν == s2.ν
end

function Base.isapprox(s1::KeplerianState, s2::KeplerianState)
    return s1.epoch ≈ s2.epoch &&
        s1.a ≈ s2.a &&
        s1.e ≈ s2.e &&
        s1.i ≈ s2.i &&
        s1.Ω ≈ s2.Ω &&
        s1.ω ≈ s2.ω &&
        s1.ν ≈ s2.ν
end

Base.eltype(::KeplerianState{_S, _F, _B, T}) where {_S, _F, _B, T} = T

epoch(s::KeplerianState) = s.epoch
position(s::KeplerianState) = cartesian(s.a, s.e, s.i, s.Ω, s.ω, s.ν, grav_param(body(s)))[1]
velocity(s::KeplerianState) = cartesian(s.a, s.e, s.i, s.Ω, s.ω, s.ν, grav_param(body(s)))[2]
state(s::KeplerianState) = cartesian(s.a, s.e, s.i, s.Ω, s.ω, s.ν, grav_param(body(s)))
keplerian(s::KeplerianState) = (s.a, s.e, s.i, s.Ω, s.ω, s.ν)

KeplerianState(s::AbstractState) = KeplerianState(epoch(s), keplerian(s)...; frame=frame(s), body=body(s))
State(s::KeplerianState) = State(epoch(s), state(s)...; frame=frame(s), body=body(s))

# struct ThreeBodyState{
#         F<:Frame,
#         T,
#         C1<:CelestialBody,
#         C2<:CelestialBody,
#     } <: AbstractState
#     ep::Epoch{T}
#     r::SVector{3,Float64}
#     v::SVector{3,Float64}
#
#     function ThreeBodyState(
#         ep::Epoch{T}, r, v, frame::Type{F}=GCRF,
#         primary::Type{C1}=Sun, secondary::Type{C2}=Earth
#     ) where {T,F<:Frame,C1<:CelestialBody,C2<:CelestialBody}
#         new{F, T, C1, C2}(ep, r, v)
#     end
# end
#
# frame(::ThreeBodyState{F}) where F<:Frame = F
# timescale(::ThreeBodyState{<:Frame, T}) where T = T
# primary(::ThreeBodyState{<:Frame,,C}) where C<:CelestialBody = C
# secondary(::ThreeBodyState{<:Frame,,<:CelestialBody,C}) where {
#     C<:CelestialBody} = C
