--projectList
CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	SELECT 	project_name, team_lead, income
	FROM 	Projects
	ORDER BY internal_id;
END
