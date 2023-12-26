<?php
 class  TestModel extends CI_Model{
    function getTest(){
        $this->db->select("*");
        $this->db->from("test");
        $this->db->order_by('RAND()');
        $this->db->limit(1);
        
        $query=$this->db->get();
        if($query->num_rows() > 0){
          return $query->row();
        }else{
          return false;
        } 
    }
    
    function getPractice(){
        
        $this->db->select("*");
        $this->db->from("typing_lessons");
        $this->db->order_by('RAND()');
        $this->db->limit(1);
        $query=$this->db->get();
        if($query->num_rows() > 0){
          return $query->row();
        }else{
          return false;
        }  
    } 
    function getPracticeType($type){
  
      $this->db->where('type', $type);
      $this->db->from('typing_lessons');
      // $this->db->order_by('RAND()');
      $this->db->limit(1);
      
      $query=$this->db->get();
      if($query->num_rows() > 0){
        return $query->row_array();
      }else{
        return false;
      }  
  } 
  
  function getcompition(){
    $this->db->select("*");
    $this->db->from("test");
    $this->db->where('test_type','compition');
    $this->db->order_by('RAND()');
    $this->db->limit(1);
    $query=$this->db->get();
    if($query->num_rows() > 0){
      return $query->row_array();
    }else{
      return false;
    }  
  }

    function insertTestResults($data){
        $this->db->insert('test_results',$data);
    }
    function getTestResults(){
      $query = $this->db->get('test_results', 1, $this->db->count_all('test_results')-1);
      $result = $query->result();
      $last_row_data = $result[0];
      return $last_row_data;
    }

    function insert_compition_id($data){
      $this->db->insert('compition',$data);
      return true;
    } 

    function progressUpdate($data){
      $this->db->where('comption_id',$data['comption_id']);
      $this->db->update('compition',$data);
      return true;
  }
  function getProgress($id = 0){
    $this->db->select("*")
    ->from("compition ut")
    ->join("user u","u.id = ut.user_id","left")
    ->where("comption_id",$id);
    // ->where("status",'1');
    $query=$this->db->get();
    if($query->num_rows() > 0){
      return $query->result_array();
    }else{
      return false;
    } 

}

function register($data) {
  $this->db->insert('user',$data);
  return true;
}

public function auth($user) {
  $this->db->select("*");
  $this->db->from('user');
  $this->db->where('name',$user['name']);
  $this->db->where('password',md5($user['password']));
  // $this->db->where('user_password',md5($user['user_password']));
  $query = $this->db->get();
  if($query->num_rows() > 0){
      return $query->row_array();
  }else{
      return false;
  }
}
}
