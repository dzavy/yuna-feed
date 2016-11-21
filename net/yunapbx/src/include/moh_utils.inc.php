<?php

function delete_file($PK_File) {
    global $mysqli;
    $errors = array();

    $query = " 
		SELECT 
			`PK_File`, 
			`Order`, 
			`Fileext`, 
			`FK_Group` 
		FROM 
			Moh_Files 
		WHERE 
			PK_File = '" . $mysqli->real_escape_string($PK_File) . "'"
    ;

    $result = $mysqli->query($query) or die($mysqli->error . $query);
    $File_Src = $result->fetch_assoc();

    $query = "	
		SELECT 
			`Order`, `PK_File`, `Fileext`  
		FROM 
			Moh_Files
		WHERE
			`FK_Group` = '" . intval($File_Src['FK_Group']) . "'
		AND `Order` >" . intval($File_Src['Order'])
    ;
    $result = $mysqli->query($query) or die($mysqli->error . $query);
    while ($row = $result->fetch_assoc()) {
        $src_filename = moh_filename($row['PK_File'], $File_Src['FK_Group'], $row['Order'], $row['Fileext']);
        $dst_filename = moh_filename($row['PK_File'], $File_Src['FK_Group'], $row['Order'] - 1, $row['Fileext']);

        if (!rename($src_filename, $dst_filename)) {
            $errors['Delete']['ReorderFiles'] = true;
            return $errors;
        }
    }
    
    $query = "
		UPDATE
			Moh_Files 
		SET 
			`Order` = `Order`- 1
		WHERE 
			`Order` >'" . intval($File_Src['Order']) . "'
		AND  
			FK_Group = '" . intval($File_Src['FK_Group']) . "'";

    $mysqli->query($query) or die($mysqli->error . $query);

    $del_file = moh_filename($PK_File, $File_Src['FK_Group'], $File_Src['Order'], $File_Src['Fileext']);
    if (file_exists($del_file)) {
        $result = unlink($del_file);
        if (!$result) {
            $error['Delete']['File'] = true;
            return $error;
        }
    }

    $query = "DELETE FROM Moh_Files WHERE PK_File = '" . intval($PK_File) . "'";
    $mysqli->query($query) or die($mysqli->error . $query);

    return $errors;
}

function move_file($PK_File, $dst_PK_Group) {
    global $mysqli;
    $errors = array();

    $query = " 
		SELECT 
			`PK_File`, 
			`Filename`, 
			`Order`, 
			`Fileext`, 
			`FK_Group` 
		FROM 
			Moh_Files 
		WHERE 
			PK_File = '" . $mysqli->real_escape_string($PK_File) . "'"
    ;

    $result = $mysqli->query($query) or die($mysqli->error . $query);
    $File_Src = $result->fetch_assoc();

    if ($File_Src['FK_Group'] == $dst_PK_Group) {
        $errors['Move']['InSameGroup'] = true;
        return $errors;
    }

    $query = "SELECT MAX(`Order`) FROM Moh_Files WHERE FK_Group = '" . intval($dst_PK_Group) . "'";
    $result = $mysqli->query($query) or die($mysqli->error);
    $row = $result->fetch_row();
    $dst_order = $row['0'] + 1;

    $query = "
		SELECT 
			COUNT(*) 
		FROM 
			Moh_Files
		WHERE 
			`Filename` = '" . $mysqli->real_escape_string($File_Src['Filename']) . "'
			AND 
			`Fileext` = '" . $mysqli->real_escape_string($File_Src['Fileext']) . "'
			AND 
			`FK_Group` = '" . $mysqli->real_escape_string($dst_PK_Group) . "'
	";

    $result = $mysqli->query($query) or die($mysqli->error);
    $rec = $result->fetch_row();
    if ($rec['0']) {
        $errors['Move']['DuplicateFile'] = true;
        return $errors;
    }


    $query = "
		UPDATE
			Moh_Files 
		SET 
			`Order` = " . $dst_order . ",
			`FK_Group` = " . $dst_PK_Group . "
		WHERE 
			`PK_File` ='" . intval($PK_File) . "'";

    $mysqli->query($query) or die($mysqli->error . $query);

    $query = "	
		SELECT 
			`Order`, `PK_File`, `Fileext`  
		FROM 
			Moh_Files
		WHERE
			`FK_Group` = '" . intval($File_Src['FK_Group']) . "'
		AND `Order` >'" . intval($File_Src['Order']) . "'"
    ;
    $result = $mysqli->query($query) or die($mysqli->error . $query);

    $query = "
		UPDATE
			Moh_Files 
		SET 
			`Order` = `Order`- 1
		WHERE 
			`Order` >'" . intval($File_Src['Order']) . "'
		AND  
			FK_Group = '" . intval($File_Src['FK_Group']) . "'";
    $mysqli->query($query) or die($mysqli->error . $query);


    $src_filename = moh_filename($File_Src['PK_File'], $File_Src['FK_Group'], $File_Src['Order'], $File_Src['Fileext']);
    $dst_filename = moh_filename($File_Src['PK_File'], $dst_PK_Group, $dst_order, $File_Src['Fileext']);

    $move_result = rename($src_filename, $dst_filename);

    if (!$move_result) {
        $errors['Move']['File'] = true;
        return $errors;
    }

    while ($row = $result->fetch_assoc()) {
        $src_filename = moh_filename($row['PK_File'], $File_Src['FK_Group'], $row['Order'], $row['Fileext']);
        $dst_filename = moh_filename($row['PK_File'], $File_Src['FK_Group'], $row['Order'] - 1, $row['Fileext']);

        if (!rename($src_filename, $dst_filename)) {
            $errors['Delete']['ReorderFiles'] = true;
            return $errors;
        }
    }

    return $errors;
}

function copy_file($PK_File, $dest_PK_Group) {
    global $mysqli;
    $errors = array();

    $query = "
		SELECT
			PK_File,
			`Order`, 
			`Fileext`, 
			`Filename`, 
			`FK_Group`
		FROM 
			Moh_Files 
		WHERE 
			PK_File = '" . $mysqli->real_escape_string($PK_File) . "'
	";
    $result = $mysqli->query($query) or die($mysqli->error . $query);
    $File_Src = $result->fetch_assoc();

    if ($File_Src['FK_Group'] == $dest_PK_Group) {
        $errors['Copy']['SameDirectory'] = true;
        return $errors;
    }

    $query = "
		SELECT 
			COUNT(*) 
		FROM 
			Moh_Files
		WHERE 
			`Filename` = '" . $mysqli->real_escape_string($File_Src['Filename']) . "'
			AND 
			`Fileext` = '" . $mysqli->real_escape_string($File_Src['Fileext']) . "'
			AND 
			`FK_Group` = '" . $mysqli->real_escape_string($dest_PK_Group) . "'
	";
    $result = $mysqli->query($query) or die($mysqli->error);
    $rec = $result->fetch_row();
    if ($rec['0']) {
        $errors['Copy']['DuplicateFile'] = true;
        return $errors;
    }

    $query = " SELECT MAX(`Order`) FROM Moh_Files WHERE FK_Group = '" . $mysqli->real_escape_string($dest_PK_Group) . "'";
    $result = $mysqli->query($query) or die($mysqli->error);
    $row = $result->fetch_row();
    $copy_order = $row['0'] + 1;

    $query = "
		INSERT INTO	
			Moh_Files
		SET
			`Filename` = '" . $mysqli->real_escape_string($File_Src['Filename']) . "',
			`Fileext`  = '" . $mysqli->real_escape_string($File_Src['Fileext']) . "',
			`FK_Group` = '" . intval($dest_PK_Group) . "',
			`Order`    = " . intval($copy_order) . "
	";
    $result = $mysqli->query($query) or die($mysqli->error . $query);
    $copy_PK_File = $mysqli->insert_id;

    $src_filename = moh_filename($File_Src['PK_File'], $File_Src['FK_Group'], $File_Src['Order'], $File_Src['Fileext']);
    $dst_filename = moh_filename($copy_PK_File, $dest_PK_Group, $copy_order, $File_Src['Fileext']);

    $result = copy($src_filename, $dst_filename);
    if (!$result) {
        $errors['Copy']['FileToDisk'] = true;
        return $errors;
    }
    return $errors;
}

function moh_filename($PK_File, $PK_Group = '', $Order = '', $Extension = '') {
    global $mysqli;
    global $conf;

    if ("{$PK_Group}{$Order}{$Extension}" == "") {
        $query = "SELECT * FROM Moh_Files WHERE PK_File = '" . intval($PK_File) . "' LIMIT 1";
        $result = $mysqli->query($query) or die($mysqli->error . $query);
        $row = $result->fetch_assoc();

        $PK_Group = $row['FK_Group'];
        $Order = $row['Order'];
        $Extension = $row['Fileext'];
    }

    $filename .= "group_" . str_pad($PK_Group, 10, "0", STR_PAD_LEFT);
    $filename .= "/file_" . str_pad($Order, 6, "0", STR_PAD_LEFT);
    $filename .= "_" . str_pad($PK_File, 9, "0", STR_PAD_LEFT);
    $filename .= ".wav";

    return $conf['dirs']['moh'] . "/$filename";
}
