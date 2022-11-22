// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.0;

contract college{
    struct Student {
        int RollNo;
        string Name;
        string Department;
    }
    Student[] students;
    function addStudent(int roll, string memory name, string memory dept) public {
        Student memory s = Student(roll, name, dept);
        students.push(s);
    }
    function getSingleStudents(int roll) public view returns(string memory,string memory) { 
        for(uint i=0;i<students.length;i++){
            if(students[i].RollNo == roll){
                return (students[i].Name,students[i].Department);
            }
        }
    }
}
