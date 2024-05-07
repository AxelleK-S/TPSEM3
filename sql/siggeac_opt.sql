CREATE OR REPLACE FUNCTION Affectation_comp_DECL()
  RETURNS TRIGGER
  LANGUAGE plpgsql
AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM Affectation a
    LEFT JOIN Competence c ON a.sigle = c.sigle AND a.matriculeP = c.matriculeP
    WHERE c.sigle IS NULL
  ) THEN
    RAISE EXCEPTION 'Affectation_comp_DECL : Affectation non conforme à la compétence.';
  END IF;
   RETURN NEW;
END;
$$;
