//
//  ViewController.m
//  highStakes
//
//  Created by Buwaneka Galpoththawela on 10/21/15.
//  Copyright © 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()


@property (nonatomic,weak) IBOutlet UILabel *firstNameLabel;
@property (nonatomic,weak) IBOutlet UITextField *firstNameTextField;
@property (nonatomic,weak) IBOutlet UILabel *lastNameLabel;
@property (nonatomic,weak) IBOutlet UITextField *lastNameTextField;
@property (nonatomic,weak) IBOutlet UILabel *streetLabel;
@property (nonatomic,weak) IBOutlet UITextField *streetNameTextField;
@property (nonatomic,weak) IBOutlet UILabel *cityLabel;
@property (nonatomic,weak) IBOutlet UITextField *cityTextField;
@property (nonatomic,weak) IBOutlet UILabel *stateLabel;
@property (nonatomic,weak) IBOutlet UITextField *stateTextField;
@property (nonatomic,weak) IBOutlet UILabel *zipLabel;
@property (nonatomic,weak) IBOutlet UITextField *zipTextField;
@property (nonatomic,weak) IBOutlet UILabel *phoneNumberLabel;
@property (nonatomic,weak) IBOutlet UITextField *phoneNumerTextField;
@property (nonatomic,weak) IBOutlet UILabel *emailLabel;
@property (nonatomic,weak) IBOutlet UITextField *emailTextField;
@property (nonatomic,weak) IBOutlet UIButton *submit;

@end

@implementation ViewController

#pragma mark - restrictive method




-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSCharacterSet *myCharSet;
    if (textField == _phoneNumerTextField) {
        myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789.-() "];
        
    } else if (textField == _zipTextField) {
        myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    } else if (textField == _stateTextField ) {
        myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
    }
    NSCharacterSet *invalidSet = [myCharSet invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidSet] componentsJoinedByString:@""];
    
    if (textField == _zipTextField) {
        if ([string length] == 0 && range.length > 0) {
            return true;
        }
        if ([_zipTextField.text length] > 4) {
            return false;
        }
    }
    
    if (textField == _phoneNumerTextField) {
        NSCharacterSet *numbersCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        NSCharacterSet *invalidSet = [numbersCharSet invertedSet];
        NSString *filteredPhone = [[_phoneNumerTextField.text componentsSeparatedByCharactersInSet:invalidSet] componentsJoinedByString:@""];
        if ([string length] == 0 && range.length >0) {
            return true;
        }
        if ([filteredPhone length] > 9) {
            return false;
        }
    }
    
    if (textField == _stateTextField) {
        if ([string length]== 0 && range.length>0) {
            return true;
            
        }
        if ([_stateTextField.text length] > 1) {
            return false;
        }
    }
    
    
    return [string isEqualToString:filtered];
}




#pragma parse method

-(void)submitRecords{
    PFObject *submitLog = [PFObject objectWithClassName:@"PeopleLog"];
    NSString *temp = _firstNameTextField.text;
    submitLog [@"firstName"] = temp;
    
    
    
    submitLog [@"lastName"] = _lastNameTextField.text;
    submitLog [@"streetName"] = _streetNameTextField.text;
    submitLog [@"city"]  = _cityTextField.text;
    submitLog [@"state"] = _stateTextField.text;
    submitLog [@"zip"]  = _zipTextField.text;
    submitLog [@"email"] = _emailTextField.text ;
   submitLog [@"phoneNumber"] = _phoneNumerTextField.text;
    //personsLog1 [@"dateEntered"] = [NSDate date];
    //submitLog [@"won"] = [NSNumber numberWithInt:0];
    
    [submitLog saveInBackground];
    

}





-(IBAction)submitButtonPressed:(id)sender{
    
    [self submitRecords];
    NSLog(@"firstname%@ \nlastname%@ \nstate%@ \nzip%@ \nphone%@",_firstNameTextField.text,_lastNameTextField.text,_stateTextField.text,_zipTextField.text,_phoneNumerTextField.text);
    _firstNameTextField.text = @"";
    _lastNameTextField.text =@"";
    _streetNameTextField.text = @"";
    _cityTextField.text=@"";
    _stateTextField.text = @"";
    _zipTextField.text = @"";
    _phoneNumerTextField.text = @"";
    _emailTextField.text = @"";
    
    
    
    
}

- (IBAction)textFieldDidChange:(UITextField *)textField {
    
    _submit.enabled = [self isValidData];
}



- (BOOL)isValidData {
    return ([self isValidZip] && [self isValidState] &&[self isValidCity] &&[self isValidStreet] && [self isValidFirstName] && [self isValidLastName]) && ([self isValidEmail:_emailTextField.text] || [self isValidPhone]);
   
}

- (BOOL)isValidZip {
    if ([_zipTextField.text length ] <=5) {
        return true;
    }else
        
        return false;
}

-(BOOL)isValidState {
    if ([_stateTextField.text length]==2) {
        return true;
    }else
        return false;
}


-(BOOL)isValidCity {
    if ([_cityTextField.text length]>0) {
        return true;
    }else
        return false;
}

-(BOOL)isValidStreet {
    if ([_streetNameTextField.text length]>0) {
        return true;
    }else
        return false;
}

-(BOOL)isValidFirstName {
    if ([_firstNameTextField.text length]>0) {
        return true;
    }else
        return false;
}


-(BOOL)isValidLastName {
    if ([_lastNameTextField.text length]>0) {
        return true;
    }else
        return false;
}




-(BOOL)isValidEmail:(NSString *)checkString {
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString];
    return [emailTest evaluateWithObject:checkString];
}





- (BOOL)isValidPhone {
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *invalidSet = [myCharSet invertedSet];
    NSString *filtered = [[_phoneNumerTextField.text componentsSeparatedByCharactersInSet:invalidSet] componentsJoinedByString:@""];
    if ([filtered length] == 10){
        return true;
    } else {
        return false;
    }
        
    
}




-(void)tempAddRecords {
    PFObject *personsLog1 = [PFObject objectWithClassName:@"PeopleLog"];
    personsLog1 [@"firstName"] = @"Bob";
    personsLog1 [@"lastName"] = @"Smith";
    personsLog1 [@"city"]  = @"Tent City";
    personsLog1 [@"state"] = @"JZ";
    personsLog1 [@"zip"]  = @"23023";
    personsLog1 [@"email"] = @"bs@gmail.com";
    personsLog1 [@"phoneNumber"] = @"0012324356";
    //personsLog1 [@"dateEntered"] = [NSDate date];
    personsLog1 [@"won"] = [NSNumber numberWithInt:0];
    
    [personsLog1 saveInBackground];
    
    
    
    PFObject *personsLog2 = [PFObject objectWithClassName:@"PeopleLog"];
    personsLog2 [@"firstName"] = @"Ben";
    personsLog2 [@"lastName"] = @"Frank";
    personsLog2 [@"city"]  = @"Ron City";
    personsLog2 [@"state"] = @"RD";
    personsLog2 [@"zip"]  = @"45067";
    personsLog2 [@"email"] = @"bf@gmail.com";
    personsLog2 [@"phoneNumber"] = @"0013434567";
    //personsLog2 [@"dateEntered"] = [NSDate date];
    personsLog2 [@"won"] = [NSNumber numberWithInt:0];
    
    [personsLog2 saveInBackground];
    

    PFObject *personsLog3 = [PFObject objectWithClassName:@"PeopleLog"];
    personsLog3 [@"firstName"] = @"Ken";
    personsLog3 [@"lastName"] = @"Blockk";
    personsLog3 [@"city"]  = @"Bee City";
    personsLog3 [@"state"] = @"BC";
    personsLog3 [@"zip"]  = @"75089";
    personsLog3 [@"email"] = @"KB@gmail.com";
    personsLog3 [@"phoneNumber"] = @"0014567890";
   // personsLog3 [@"dateEntered"] = [NSDate date];
    personsLog3 [@"won"] = [NSNumber numberWithInt:0];

    [personsLog3 saveInBackground];

   
}


#pragma life cycle method

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self tempAddRecords];
    
   // PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
   // testObject[@"foo1"] = @"bar1";
   // testObject[@"say"] = @"what";
    
   // PFObject *say = [PFObject objectWithClassName:@"TestObject"];
   // say [@"unitTest"] = @"ten";
    
   // [testObject saveInBackground];
  //  [say saveInBackground];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
