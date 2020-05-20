<?php require_once 'header.php' ?>
<?php require_once 'functions.php'?>


  <div class="bg">

      <?php
      if(!empty($_POST)){

          $errors = array();
          require_once 'db/DB.php';


       // USERNAME
          if (empty ($_POST['username']) || !preg_match('/^[a-z0-9_A-Z]+$/', $_POST['username'])) {
              $errors['username'] = "Pseudo incorrect ou champs vide.";
          } else {
              $request = $pdo -> prepare('SELECT id FROM users WHERE username = ?');
              $request -> execute([$_POST['username']]);
              $user = $request -> fetch();

              if ($user) {
                  $errors['username'] = "Ce pseudo est déjà pris, veuillez en sélectionner un autre...";
              }
          }

       // EMAIL
          $email = $_POST['email'];

          if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
              $errors['email'] =  "Email incorrect ou champs vide.";
          } else {
              $request = $pdo->prepare('SELECT id FROM users WHERE email = ?');
              $request->execute([$_POST['email']]);
              $user = $request->fetch();

              if ($user) {
                  $errors['email'] = "Cette adresse mail est déjà prise, veuillez en sélectionner une autre...";

                }
              }


              // PASSWORD || PASSWORD CONFIRM
              if (empty($_POST['password']) || $_POST['password'] != $_POST['password_confirm']) {
                  $errors['password'] = "Votre mot de passe est incorrect.";
              }

              // CONFIRM REGISTRATION
              if (empty($errors)) {

                  $request = $pdo->prepare("INSERT INTO users SET username = ?, password = ?, email = ?, confirmation_token = ?");
                  $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

               //  Create function || token - email
                  $token = string_random (70);

               // And ... SQL request
                  $request->execute([$_POST['username'], $password, $_POST['email'], $token]);
                  $user_id = $pdo -> lastInsertId();
                  $state = sendMail($_POST['email'],'Confirmation de votre compte',"Afin de valider votre compte...Merci de cliquer sur ce lien : \n\n http://localhost/inscriptionconfirm.php?id=$user_id&token=$token");
                  $_SESSION['flash']['success'] = "L'inscription a bien été validé ! Vous devriez recevoir un email sur votre adresse pour valider votre compte : $email !";

                  // [A DEVELOPPER] Page d'attente et non utilisation du index.php
                 if($state){
                  header('Location: index.php');
                 }else{
                    die('Erreur lors du send');
                 }
                    exit();
              }
           }

      ?>

    <h1 style="color: aliceblue; position: relative; top: 15%; margin-left: 10px;">Inscription</h1>



    <div class="container" style="position: relative; top: 30%;">
      
      <form action="" method="POST">

          <?php if(!empty($errors)): ?>

              <div class="alert alert-danger" style = "background-color : red; color : white;">
                  <p> Désolé mais ... </p>
                  <ul>
                      <?php foreach ($errors as $error): ?>
                          <li> <?= $error; ?> </li>
                      <?php endforeach; ?>
                  </ul>

              </div>
          <?php endif; ?>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="pseudoLOG1">PSEUDO</label>
            <input type="text" class="form-control" id="pseudoLOG1" placeholder="Pas d'insulte ;)" name="username"/>
          </div>

          <div class="form-group col-md-6">
            <label for="mailLOG1">E-Mail</label>
            <input type="text" class="form-control" id="mailLOG1" placeholder="Votre adresse mail..." name="email" />  <!-- on ne met pas le type email mais text pour le faire directement en php !-->
          </div>
        </div>

        <div class="form-group">
          <label for="passwordLOG1">Mot de Passe</label>
          <input type="password" class="form-control" id="passwordLOG1" placeholder="Mot de passe ..." name="password" />
        </div>
        <div class="form-group">
          <label for="passwordLOG2">Répétez votre mot de passe</label>
          <input type="password" class="form-control" id="passwordLOG2" placeholder="HOP HOP HOP on le répète !" name="password_confirm"/>
        </div>
       
        <div class="form-group">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
               CONDITIONS GÉNÉRALES D'UTILISATION 
            </label>
          </div>
        </div>
        <button type="submit" class="btn btn-primary">S'INSCRIRE</button>
      </form>


      </div>
  
  


    </div>


      <!-- SCRIPTS -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/popper.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- wow DOGGO -->
  <script type="text/javascript">
    new WOW().init();
  </script>

  </body>
  </html>