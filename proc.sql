DELIMITER $$
CREATE OR REPLACE PROCEDURE ydzc_cust_bk_borrow_p (IN this_cust_id INT, IN this_bkcpy_id INT)
BEGIN
START TRANSACTION;
	UPDATE ydzc_bkcpy SET bkcpy_stat="N" WHERE bkcpy_id=this_bkcpy_id;
	INSERT INTO ydzc_rent VALUES (NULL, "B", CURRENT_DATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 30 DAY), NULL, this_bkcpy_id, this_cust_id);
	COMMIT;
END $$
DELIMITER ;