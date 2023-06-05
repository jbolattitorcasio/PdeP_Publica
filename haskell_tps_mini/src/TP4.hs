module TP4 where
import ContenidoAudiovisual

tieneHashtag :: String -> Video -> Bool
tieneHashtag hashtag video = elem hashtag (hashtags video)

minutosTotalesConHashtag :: String -> Playlist -> Int
-- Funcion solucion 1: minutosTotalesConHashtag hashtag (Playlist _ video) = foldl (\cantMin video -> cantMin + minutos video) 0 (filter (tieneHashtag hashtag) video)
-- Funcion solucion 2: minutosTotalesConHashtag hashtag (Playlist _ videos) = sum (map minutos (filter (tieneHashtag hashtag) videos))
-- Primera idea de solucion 3: minutosTotalesConHashtag hashtag playlist = sum (map minutos (filter (tieneHashtag hashtag) (videos playlist)))
minutosTotalesConHashtag hashtag playlist = sum.map minutos.filter (tieneHashtag hashtag) $ videos playlist

estanRelacionados :: Video -> Video -> Bool
-- Funcion solucion 1: estanRelacionados video1 video2 = any (\hashtag -> tieneHashtag hashtag video1) (hashtags video2) 
estanRelacionados video1 video2 = any (flip tieneHashtag video1) (hashtags video2)

recomendable :: Video -> Playlist -> Bool
-- Funcion solucion 1: recomendable video (Playlist _ videos) = length (filter (estanRelacionados video) videos) >= 2
-- Primera solucion 2: recomendable video (Playlist _ videos) = ((>= 2).length.filter (estanRelacionados video)) videos
-- Funcion solucion 2: recomendable video (Playlist _ videos) = (>= 2).length.filter (estanRelacionados video) $ videos
recomendable video playlist = (>= 2).length.filter (estanRelacionados video) $ videos playlist

agregarVideosRecomendados :: [Video] -> Playlist -> Playlist
-- Funcion solucion 1: agregarVideosRecomendados videos playlist = foldr (\video nuevaPlaylist -> agregarAPlaylistSoloSi recomendable video nuevaPlaylist) playlist videos
-- Funcion solucion 2: agregarVideosRecomendados videos playlist = foldr (\video -> agregarAPlaylistSoloSi recomendable video) playlist videos
agregarVideosRecomendados videos playlist = foldr (agregarAPlaylistSoloSi recomendable) playlist videos
