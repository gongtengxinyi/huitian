package com.huitian.util;


/**
 * 
 * @author lihome
 * 
 * A common issue when receiving data either electronically or from user input is verifying the integrity of the data. 
 * This work is repetitive and becomes even more complicated when different sets of validation rules need to be 
 * applied to the same set of data based on locale. 
 * Error messages may also vary by locale. This package addresses some of these issues to speed development and maintenance of validation rules.
 * 
 * Usage
 * In order to use the Validator, the following basic steps are required:

 * Create a new instance of the org.apache.commons.validator.Validator class. 
 * Currently Validator instances may be safely reused if the current ValidatorResources are the same, 
 * as long as you have completed any previous validation, 
 * and you do not try to utilize a particular Validator instance from more than one thread at a time.
 * Add any resources needed to perform the validations, such as the JavaBean to validate.
 * Call the validate method on org.apache.commons.validator.Validator.
 * 
 * @see org.apache.commons.lang3.Validate
 */
public class Validate extends org.apache.commons.lang3.Validate {
	//验证
}