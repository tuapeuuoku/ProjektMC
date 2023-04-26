<?php
class Vote {
    /*
    Deklarujemy sobie w bazie tabelę, 3 kolumny - id, post_id, value, user_id gdzie:
    id - int autoincrement
    post_id - int, klucz zewnętrzny - post do którego należy głos
    score - int (-1,1)
    user_id - int, klucz obcy do user.id
    */

    public static function upVote(int $post_ID, int $user_ID) : bool {
        //kod do dodawania upvotów
        global $db;
        $query = $db->prepare("INSERT INTO vote VALUES (NULL, ?, 1, ?)");
        $query->bind_param('ii', $post_ID, $user_ID);
        if($query->execute())
            return true;
        return false;
    }
    public static function downVote(int $post_ID, int $user_ID) : bool {
        global $db;
        $query = $db->prepare("INSERT INTO vote VALUES (NULL, ?, -1, ?)");
        $query->bind_param('ii', $post_ID, $user_ID);
        if($query->execute())
            return true;
        return false;
    }
    public static function getScore(int $post_ID) : int {
        global $db;
        //zwróć sumę głosów dla danego posta
        $query = $db->prepare("SELECT SUM(score) FROM vote WHERE post_ID = ?");
        $query->bind_param('i', $post_ID);
        if($query->execute()){
            $result = $query->get_result();
            if($result->num_rows > 0) {	
                $row = $result->fetch_row();	
                if($row[0] == NULL) {	
                    //zwracane jeśli nie ma oddanych głosów	
                    return 0;	
                } else 	
                    return $row[0];	
            }	
                	
            else return 0;
        }
        return 0;
    }
    public static function getVote(int $post_ID, int $user_ID) : int {
        //funkcja zwraca (-1,0,1) w zależności od teo czy użytkownik oddał już głos na tego mema
        global $db;
        $query = $db->prepare("SELECT score FROM vote WHERE post_id = ? AND user_id = ?");
        $query->bind_param('ii', $post_ID, $user_ID);
        if($query->execute()) {
            $result = $query->get_result();	
            if($result->num_rows > 0)	
                return $result->fetch_row()[0];	
            else return 0 ;
        }
        return 0;
    }
    
}
?>
