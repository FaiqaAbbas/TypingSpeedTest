<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends CI_Controller {
	public function __construct() {
    	parent::__construct();
    	$this->load->database();
		$this->load->helper('url');
    	$this->load->model('TestModel');
	}
	function index(){
		$data['test']=$this->TestModel->getTest();
        $this->load->view('testView',$data);			
	}
	function insertTestResults(){
		$data=$this->input->post();
		$this->TestModel->insertTestResults($data);	
	}
	function showResults(){
		$data['data']=$this->TestModel->getTestResults();
		$this->load->view('resultsView',$data);		

	}
	function loadPracticeView(){

		$data['practice']=$this->TestModel->getPractice();
        $this->load->view('practiceView',$data);				
	}
	function loadPracticeType(){
		$type = $this->input->post('type');
		$row = $this->TestModel->getPracticeType($type);
		var_dump($row['practiceParagraph']);
		$data['practiceType'] = $row;
		$this->load->view('practiceView',$row['practiceParagraph']);				
	}
	function loadcompetitionView(){
		
		$this->load->view('competitionView');		
	}

	function compition(){
		if($this->session->userdata('user')){
		$data['compitions'] = $this->TestModel->getcompition();

		$id = array(
			'user_id' => $this->session->userdata('user')['id'],
			'comption_id' => $data['compitions']['id']
		);
		
		$this->TestModel->insert_compition_id($id);
		$this->load->view('competitionView',$data);	
	  }	else{
		redirect(base_url('login'));
	  }
	}

	function progressStatus(){
		$data  = array();
		json_decode('progres_status');
		$status = $this->input->post();
		$id = $status['comption_id'];
		$this->TestModel->progressUpdate($status);
		$data = $this->TestModel->getProgress($id);
		echo json_encode($data);
		
	}

	function login(){
			
			if($this->input->post()) {
				
				$this->form_validation->set_rules('name',"User name","required");
				$this->form_validation->set_rules('password',"User assword","required");
				if($this->form_validation->run() === true) {
					$user = $this->input->post();
					$is_auth =  $this->TestModel->auth($user);
					if($is_auth) {
						$this->session->set_userdata('user',$is_auth);
						// var_dump($this->session->userdata('user'));die;
						$this->session->set_flashdata('login'," Welcome | succfull login" );
						redirect(base_url('Competition'));
						
					}else {
						$this->session->set_flashdata('login',"Login Failed..." );
					}
				}
				else {
					$this->load->view('login');
				}
				
			}
			$this->load->view('login');
		
	}
	
	function register() {
		if($this->input->post()) {
			$register_form = $this->input->post();
            $register_data = array(
				'name'=>$register_form['name'],
				'gmail'=>$register_form['email'],
                'password'=>md5($register_form['password']),
				'type'=>$register_form['type'],
            );
			// var_dump($register_data);die;
        
			$this->form_validation->set_rules('name',"First Name","required");
			$this->form_validation->set_rules('email',"Email","required");
			$this->form_validation->set_rules('password',"password","required");
			if($this->form_validation->run() == false) {
				// $data['errors'] = $this->form_validation->error_array();
				// var_dump($data);die;
				// $this->load->view('dashboard');
			}else {
				$this->TestModel->register($register_data);
				$this->session->set_flashdata('user_register'," Succfull register . Please login right now !" );
				// redirect(base_url('user'));
				
			}
			redirect(base_url('login'));
		}

		redirect(base_url('login'));

    }

	function logout() {
		$this->session->unset_userdata('user');
        redirect(base_url('login'));
	}
}
?>
