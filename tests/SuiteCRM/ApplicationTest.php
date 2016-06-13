<?php
    namespace  SuiteCRM;
    use SuiteCRM\Application;

    class ApplicationTest extends \PHPUnit_Framework_TestCase
    {
        public function testexecute()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception other than headers output exception.
            try {
                $Application->execute();
            } catch (Exception $e) {
                $this->assertStringStartsWith('Cannot modify header information', $e->getMessage());
            }
        }

        public function testloadUser()
        {

            //cannot test this method as it uses die which stops execution of php unit as well
            /*
            error_reporting(E_ERROR | E_PARSE);

            $Application = new Application();
            $Application->controller = new SugarController();

            try {
                $Application->loadUser();
            }
            catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(TRUE);
            */
            $this->markTestIncomplete('Can Not be implemented');
        }

        public function testACLFilter()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->ACLFilter();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testsetupResourceManagement()
        {
            $Application = new Application();

            //execute the method with invalid input and test if it works and does not throws an exception.
            try {
                $Application->setupResourceManagement('');
            } catch (Exception $e) {
                $this->fail();
            }

            //execute the method with valid input and test if it works and does not throws an exception.
            try {
                $Application->setupResourceManagement('Users');
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testsetupPrint()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->setupPrint();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testpreProcess()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->preProcess();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testhandleOfflineClient()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->handleOfflineClient();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testhandleAccessControl()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            $result = $Application->handleAccessControl();

            //check that it returns Null
            $this->assertEquals(null, $result);

            //check that controller->hasAccess is true i-e default setting.
            $this->assertEquals(true, $Application->controller->hasAccess);
        }

        public function testpreLoadLanguages()
        {
            try {
                Application::preLoadLanguages();

                //check that method call got the current_language global variable set.
                $this->assertTrue(isset($GLOBALS['current_language']));

                //check that method call got the app_strings global variable set.
                $this->assertTrue(is_array($GLOBALS['app_strings']) && count($GLOBALS['app_strings']) > 0);
            } catch (Exception $e) {
                $this->fail();
            }
        }

        public function testloadLanguages()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            try {
                $Application->loadLanguages();

                //check that method call got the current_language global variable set.
                $this->assertTrue(isset($GLOBALS['current_language']));

                //check that method call got the app_strings global variable set.
                $this->assertTrue(is_array($GLOBALS['app_strings']) && count($GLOBALS['app_strings']) > 0);

                //check that method call got the app_list_strings global variable set.
                $this->assertTrue(is_array($GLOBALS['app_list_strings']) && count($GLOBALS['app_list_strings']) > 0);

                //check that method call got the mod_strings global variable set.
                $this->assertTrue(is_array($GLOBALS['mod_strings']) && count($GLOBALS['mod_strings']) > 0);
            } catch (Exception $e) {
                $this->fail();
            }
        }

        public function testcheckDatabaseVersion()
        {
            error_reporting(E_ERROR | E_PARSE);

            $Application = new Application();

            //execute the method with false parameter and check for false returned as it cannot connect to DB.
            //testing with true will allow it to use die() which stops phpunit execution as well.
            $result = $Application->checkDatabaseVersion(false);
            $this->assertFalse($result);
        }

        public function testloadDisplaySettings()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->loadDisplaySettings();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testloadLicense()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->loadLicense();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testloadGlobals()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->loadGlobals();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function teststartSession()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->startSession();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testendSession()
        {
            $Application = new Application();
            $Application->controller = new SugarController();

            //execute the method and test if it works and does not throws an exception.
            try {
                $Application->endSession();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testredirect()
        {
            //this method uses exit() which stops execution of phpunit as well so it cannot be tested without additional --process-isolation commandline parameter.
            /*
            $Application = new Application();

            //execute the method and check if it works and doesn't throws an exception
            try {
                ob_start();

                $Application->redirect();

                $renderedContent = ob_get_contents();
                ob_end_clean();
                $this->assertGreaterThan(0,strlen($renderedContent));

            } catch (Exception $e) {
                $this->fail();
            }
            */
            $this->markTestIncomplete('Can Not be implemented');
        }

        public function testappendErrorMessage()
        {
            //execute the method and check that the method adds the message to user_error_message array.
            //there should be one more array element after method execution.
            $user_error_message_count = count($_SESSION['user_error_message']);
            Application::appendErrorMessage('some error');
            $this->assertGreaterThan($user_error_message_count, count($_SESSION['user_error_message']));
        }

        public function testgetErrorMessages()
        {
            //execute the method and check if it returns a array.
            $errorMessages = Application::getErrorMessages();
            $this->assertTrue(is_array($errorMessages));
        }

        public function testsetCookie()
        {
            //execute the method and check that the method adds the key value pair to cookies array.
            Application::setCookie('key', 'value');
            $this->assertEquals('value', $_COOKIE['key']);
        }

        public function testcreateLoginVars()
        {
            $Application = new Application();

            //execute the method and test if it works and does not throws an exception.
            try {
                $vars = $Application->createLoginVars();
            } catch (Exception $e) {
                $this->fail();
            }

            $this->assertTrue(true);
        }

        public function testgetLoginVars()
        {
            $Application = new Application();

            //execute the method and test that it returns a array.
            $vars = $Application->getLoginVars();
            $this->assertTrue(is_array($vars));
        }

        public function testgetLoginRedirect()
        {
            $Application = new Application();

            //execute the method and test that it returns a plus length string
            $redirect = $Application->getLoginRedirect();
            $this->assertGreaterThan(0, strlen($redirect));
        }
    }