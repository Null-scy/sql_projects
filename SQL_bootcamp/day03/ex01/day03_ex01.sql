SELECT id AS menu_id
fROM public.menu
EXCEPT 
SELECT menu_id
FROM public.person_order
ORDER BY 1