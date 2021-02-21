
module Relational.Typifier where

    import Collectional.Term
    import Collectional.Heap

    isTypical :: (Heap, Term, Term) -> Bool
    isTypical (h, y, e) = checking h y e
        -- case e of
        --     Idn x           -> idnT h y x
        --     Abn p b         -> abnT h y p b
        --     Apn f a         -> apnT h y f a
        --     Cpn (Ain v u) k -> cinT h y v u k
        --     _               -> error "error -- isTypical"
--

    -- π projection
    projection :: Heap -> Term -> Maybe Term
    projection h e =
        case h of
            Emn             -> Nothing
            Cpn (Ayn v w) h -> projection' v w h e

    projection' :: Term -> Term -> Heap -> Term -> Maybe Term
    projection' v w h e
        | v == e    = Just w
        | otherwise = projection h e

--

    -- τ inference
    inference :: Heap -> Term -> Maybe Term
    inference h e =
        case e of
            Idn x   -> projection h e
            Apn f a -> apnInference h f a
            Ayn v w -> error "wip -- inference €vw"
            _       -> error $ "error -- wtf: " ++ show e

    apnInference :: Heap -> Term -> Term -> Maybe Term
    apnInference h f a =
        case inference h f of
            Just (Trn s t) -> apnInference' h s t f a
            Nothing        -> Nothing

    apnInference' :: Heap -> Term -> Term -> Term -> Term -> Maybe Term
    apnInference' h s t f a
        | checking h s a = Just t
        | otherwise      = Nothing

--

    -- Τ checking
    checking :: Heap -> Term -> Term -> Bool
    checking h y e =
        case e of
            Abn p b -> abnChecking h y p b
            _       -> epnChecking h y e

    abnChecking :: Heap -> Term -> Term -> Term -> Bool
    abnChecking h y p b =
        case y of
            Trn s t -> checking (Cpn (Ayn p s) h) t b
            _       -> False

    epnChecking :: Heap -> Term -> Term -> Bool
    epnChecking h y e =
        case inference h e of
            Just w  -> w == y
            Nothing -> False

--
