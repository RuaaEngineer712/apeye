import java.util.Scanner;
import java.util.ArrayList;

public class Products extends Product{
    public static void main(String [] args){
        Product product = new Product();

        Scanner scan = new Scanner(System.in);


        //menu >>>>>>>
        System.out.println("Choose : \n1-Insert \n2-Update \n3-Delete \n4-View");
        int choice = scan.nextInt();
        switch(choice){
            case 1:{
                System.out.println("Enter id:");
                id = scan.nextInt();
                System.out.println("Enter name:");
                name = scan.nextLine();

                Insert(id, name);
                break;
            }
            case 2:{
                System.out.println("Enter id:");
                int update_id = scan.nextInt();
                System.out.println("Enter new name:");
                String update_name = scan.nextInt();

                Update(update_id, update_name);
                break;
            }
            case 3:{
                System.out.println("Enter id:");
                int delete_id = scan.nextInt();
                Delete(id);
                break;
            }
            case 4:{
                for(int i = 0; i<= productArray.size(); i++){
                    System.out.println(productArray.get(i)); 
                }
                break;
            }
            default:{
                System.out.println("Try again....");
            }
        }
    }
    
    //insert >>>>>>>>>
    public void Insert(int id,String name){
        int id  = id;
        String name = name;
        
        ArrayList<Product> productArray = new ArrayList<Product>();
        for(int i = 0; i<= productArray.size(); i++){
            productArray.add(i) = Product(id, name);
        }

    } 
        

        //Update >>>>>>>
        public void Insert(int id,String name){
            int id  = id;
            String name = name;

            for(int i = 0; i<= productArray.size(); i++){
                if (i == id){
                    productArray.set(i, name);
                }
                
            } 
        }


        //delete >>>>>>
        public void Delete(int id){
        int id  = id;
        
        productArray.remove(delete_id);
        

    } 
        
        

        
    }
}
import java.util.Date;
public class Product{
    Product(int id, String name){
        int id;
        String name;
        Date date = new Date();
    }
}