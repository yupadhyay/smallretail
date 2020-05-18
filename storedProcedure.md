### This Document describes various objects created for the projects there relationship and contribution of each team member towards the project.

 
# Object: Sequences

Use:  Sequences are used to implement unique ID for each entity. 
With the use of Sequences there is no need for the user to enter the unique ID the sequences will automatically create a unique ID thus avoiding the Unique Key violation constraint. 

```sql
create sequence emp increment by 1 start with 1020 nocache nocycle; 
create sequence prod increment by 1 start with 1020 nocache nocycle;
create sequence cus increment by 1 start with 1020 nocache nocycle;
create sequence pur increment by 1 start with 1020 nocache nocycle; 
create sequence supp increment by 1 start with 1020 nocache nocycle;```         
 
  
# Object: Package & Procedures 

To display all tuples in the tables. The procedures are used to display all tuple in the table. In the front end we have used these procedure to display all tuples  from different tables by clicking on generate reports.
           
```sql          
create or replace package show_details as
procedure show_employees();
procedure show_products();
procedure show_product_discount();
procedure show_suppliers();
procedure show_customers();
procedure show_purchases();
end;
/
show errors
 create or replace package body show_details as

/*---------------------------------------------------------*/

procedure show_employees(ref out ref_cursor) is
begin /*begin procedure*/
declare
cursor c1 is
select * from yupadhyay1.employees2;
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from employees2;
if(not c1%isopen) then
        open c1;
end if;
fetch c1 into c1_rec;
 dbms_output.put_line('eid'||'  '||'ename'||'  '||'city'||'  '||'telephone#');
while c1%found loop
        dbms_output.put_line(c1_rec.eid||'  '||c1_rec.ename||'  '||c1_rec.city||'  '||c1_rec.telephone#);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/

/*--------------------------------------------------------------------*/

/*start of procedure show_products */
procedure show_products(ref out ref_cursor) is
begin /*begin procedure*/
declare
cursor c1 is
select * from yupadhyay1.products2;
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from products2;
if(not c1%isopen) then
    open c1;
end if;
fetch c1 into c1_rec;
        dbms_output.put_line('pid'||'  '||'pname'||'  '||'qoh'||'  '||'qoh_threshold'||'  '||
        'orig_price'||'  '||'c1_rec.disc_category'||'  '||'sid');

while c1%found loop   
        dbms_output.put_line(c1_rec.pid||'  '||c1_rec.pname||'  '||c1_rec.qoh||'  '||c1_rec.qoh_threshold||'  '||
        c1_rec.orig_price||'  '||c1_rec.disc_category||'  '||c1_rec.sid);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/

/*--------------------------------------------------------------------*/
/*start of procedure show_products_discount */
procedure show_product_discount(ref out ref_cursor) is
begin /*begin procedure*/
         
                declare
cursor c1 is
select * from yupadhyay1.product_discount2;
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from yupadhyay1.product_discount2;
if(not c1%isopen) then
        open c1;  
end if;
fetch c1 into c1_rec;
        dbms_output.put_line('disc_category'||'  '||'disc_rate');
while c1%found loop
        dbms_output.put_line(c1_rec.disc_category||'  '||c1_rec.disc_rate);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/
/*--------------------------------------------------------------------*/
/*start of procedure show_suppliers */
procedure show_suppliers(ref out ref_cursor) is
begin /*begin procedure*/
declare
cursor c1 is
select * from yupadhyay1.suppliers2;
c1_rec c1%rowtype;
begin /*begin cursor*/   
open ref for select * from yupadhyay1.suppliers2;
if(not c1%isopen) then
        open c1;
end if;
fetch c1 into c1_rec; 
        dbms_output.put_line('sid'||'  '||'sname'||'  '||'city'||'  '||'telephone#');
while c1%found loop   
        dbms_output.put_line(c1_rec.sid||'  '||c1_rec.sname||'  '||c1_rec.city||'  '||c1_rec.telephone#);
        fetch c1 into c1_rec;
end loop;
 close c1;
end; /*end of cursor*/
end; /*end of procedue*/


/*--------------------------------------------------------------------*/
/*start of procedure show_customers */
procedure show_customers(ref out ref_cursor) is
begin /*begin procedure*/
declare
cursor c1 is
select * from yupadhyay1.customers2;
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from yupadhyay1.customers2;
if(not c1%isopen) then
        open c1;
end if;
fetch c1 into c1_rec;
dbms_output.put_line('cid'||'  '||'cname'||'  '||'telephone#'||'  '||'visits_made');
while c1%found loop   
        dbms_output.put_line(c1_rec.cid||'  '||c1_rec.cname||'  '||c1_rec.telephone#||'  '||c1_rec.visits_made);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/

/*--------------------------------------------------------------------*/
/*start of procedure show_purchases */
procedure show_purchases(ref out ref_cursor) is
begin /*begin procedure*/
declare
cursor c1 is
select * from yupadhyay1.purchases2;
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from yupadhyay1.purchases2;
if(not c1%isopen) then
        open c1;      
end if;
fetch c1 into c1_rec;
        dbms_output.put_line('pur#'||'  '||'eid'||'  '||'cid'||'  '||'pid'||'  '||'qty'||'  '||'total_price'||'   '||'pdate');
while c1%found loop
        dbms_output.put_line(c1_rec.pur#||'  '||c1_rec.eid||'  '||c1_rec.cid
        ||'  '||c1_rec.pid||'  '||c1_rec.qty||'  '||c1_rec.total_price||'  '||c1_rec.pdate);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/ 

/*--------------------------------------------------------------------*/
/*start of procedure show_logs */
procedure show_logs(ref out ref_cursor) is
begin /*begin procedure*/
declare

cursor c1 is
select * from yupadhyay1.logs; 
c1_rec c1%rowtype;
begin /*begin cursor*/
open ref for select * from yupadhyay1.logs;
if(not c1%isopen) then
        open c1;
end if;
fetch c1 into c1_rec;
        dbms_output.put_line('who'||'  '||'time'||'  '||'what');
while c1%found loop
        dbms_output.put_line(c1_rec.who||'  '||c1_rec.time||'  '||c1_rec.what);
        fetch c1 into c1_rec;
end loop;
close c1;
end; /*end of cursor*/
end; /*end of procedue*/
end; /*end of package body*/
/
show errors

create or replace package show_details as
type ref_cursor is ref cursor;
procedure show_employees(ref out ref_cursor);
procedure show_products(ref out ref_cursor);
procedure show_product_discount(ref out ref_cursor);
procedure show_suppliers(ref out ref_cursor);
procedure show_customers(ref out ref_cursor);
procedure show_purchases(ref out ref_cursor);
procedure show_logs(ref out ref_cursor);
end;
/
show errors
```


2)	Procedures to generate monthly sales Reports. Based on the Information provided in terms of Product ID, procedure will generate sales report. In front end we have use
these procedure to generate sales report based on Product Id which provide product name, month, total quantity sold each month, total dollar amount sold each month, average sale price for each month.  

```sql
create or replace package sales_report as
type ref_cursor is ref cursor;
procedure report_monthly_sale(pr_id in products2.pid%type,ref out ref_cursor);
end;
/
show errors

/*Procedure to report monthly sale information for any given product*/
set serveroutput on
create or replace package body sales_report as/* begin of package body*/
procedure report_monthly_sale(pr_id in
products2.pid%type,ref out ref_cursor)is
 i number(10);
begin/*begin of procedure*/
i:=0;
declare/*declare block*/

pid_not_found exception;/*exception handling*/
pr_name products2.pname%type;pr_month char(10);pr_qty
purchases2.qty%type;pr_total purchases2.total_price%type;pr_avg number(10);
cursor c1 is /*cursor defined*/
select pname,substr(pdate,4,3) month,sum(qty) qty,sum(total_price) total,(sum(total_price)/sum(qty)) average into
pr_name,pr_month,pr_qty,pr_total,pr_avg from purchases2 pu,products2 p where p.pid=pu.pid and p.pid=pr_id group by pname,substr(pdate,4,3);
begin/*begin of cursor*/
open ref for
select pname,substr(pdate,4,3) month,sum(qty) qty,sum(total_price) total,(sum(total_price)/sum(qty)) average into
pr_name,pr_month,pr_qty,pr_total,pr_avg from purchases2 pu,products2 p where p.pid=pu.pid and p.pid=pr_id group by pname,substr(pdate,4,3);
for c1_record in c1 loop
i:=i+1;
 dbms_output.put_line('name:' || c1_record.pname ||','|| 'month:' || c1_record.month ||','|| 'qty' || c1_record.qty ||',' || 'totalprice:' || c1_record.total ||','||
'average' || c1_record.average );
 end loop;
 if(i=0) then raise pid_not_found;
end if;
exception/exception block if exception is raised*/
when pid_not_found then
raise_application_error(-20003,'product id not found');
 end;/* end of cursor*/

end;/*end of procedure*/
end;/*end of package body*/
/
show errors
```


3)	Procedure is implemented to make entry in the tables (Employee and Purchase). Procedure is implemented in such a way that it automatically generate unique ID for corresponding tables (which is implemented using sequences). Also based on basic information provided procedure will calculate total price of the sale. Additionally along with each entry in employee table corresponding entry will be made in login table with default user name as employee ID and Initial password as name (Which can be changed through front end by selecting change password option). For error handling procedure will check compliance with pid, cid, Quantity in hand and QOH_Threshold, If any of the constraint is violated  appropriate message will be displayed to the user.

```sql
create or replace package add_tuple as
procedure add_employee(ename in employees2.ename%type,city in employees2.city%type,telephone# in employees2.telephone#%type,position in employees2.position%type);
procedure add_purchase(eid in purchases2.eid%type,pid in purchases2.pid%type,cid in purchases2.cid%type,qty in purchases2.qty%type);
end;
/
show errors

              create or replace package body add_tuple as
/*------------------------------------------------------*/
function calculate_total_price(temp_pid in purchases2.pid%type,qty in purchases2.qty%type) return purchases2.total_price%type is
temp_disc_rate product_discount2.disc_rate%type;
temp_orig_price products2.orig_price%type;
temp_total_price purchases2.total_price%type;
begin
select p1.disc_rate,p2.orig_price into temp_disc_rate,temp_orig_price
from product_discount2 p1,products2 p2
where p1.disc_category = p2.disc_category and p2.pid=temp_pid;
temp_total_price := to_number(qty*(temp_orig_price*(1-temp_disc_rate)));
return temp_total_price;
end;
/*------------------------------------------------------*/
procedure add_employee(ename in employees2.ename%type,city in employees2.city%type,telephone# in employees2.telephone#%type,position in employees2.position%type) is
empid employees2.eid%type;
begin
insert into employees2 values(emp.nextval,ename,city,telephone#,position);
end;

/*-------------------------------------------------------*/
procedure add_purchase(eid in purchases2.eid%type,pid in purchases2.pid%type,cid in purchases2.cid%type,qty in purchases2.qty%type) is
total_price purchases2.total_price%type;
begin
total_price:=calculate_total_price(pid,qty);
insert into purchases2 values(pur.nextval,eid,pid,cid,qty,total_price,sysdate);
end;

end; /*end of package*/
/
show errors
```
 

# Object: Trigger

1)	A trigger is made to make entry in the log table automatically  as an when an entry is made in the purchase table and also when a discount category is updated in products table with who (User Name of Database), what (Changes made), When (time) attribute.

```sql
/* Trigger to add tuple in log table when purchases is made*/
set serveroutput on
create or replace trigger in_pur
after insert or update on purchases2
for each row
begin/*Begin of Trigger*/
insert into logs values(user,sysdate,'A new purchase with pur#'|| :new.pur# ||'is added to purchase2 table.');
end;/*end of Trigger*/
/
show errors


/*Triiger to add tuple in log table when discount category of product table is changed*/
create or replace trigger upd_pro
after update of disc_category on products2
for each row
begin/*Begin of Trigger*/
insert into logs values(user,sysdate,'The discount Category of Product' || :old.pid || 'is changed from' || :old.disc_category || 'to' || :new.disc_category);
end;/*end of Trigger*/
/
```

2)	Trigger to check if  quantity to be purchased  from purchase table is equal to or smaller than the quantity on hand in products table. Or else an error will be shown Insufficient quantity in stock and purchase will be aborted.

```sql
/*Trigger to check if qoh is less than purchase qty*/
create or replace trigger insufficient_quantity
before insert or update on purchases2
for each row
declare
out_of_quantity exception;
temp_qoh products2.qoh%type;
begin /*Begin of trigger*/
select qoh into temp_qoh
from products2 p1
where p1.pid=:new.pid;
if(:new.qty>=temp_qoh) then raise out_of_quantity;
end if;
exception /*Exception block if condition is not met*/
when out_of_quantity then
raise_application_error(-20001,'Insufficient quantity in stock');
end;/*end of trigger*/
/
show errors
```

3)	Trigger to check if qoh is less then qoh_threshold after adding an tuple in to the purchase table i.e after a tuple is added in purchase table the qoh column in products table should be modified accordingly. If the purchase causes the qoh of the product to be below qoh_threshold  appropriate  message will be displayed.

```sql
 /* Trigger to modify qoh in product table when tuple is added in purchases table*/
set serveroutput on
create or replace trigger prod_qoh_on_order
after insert or update on purchases2
for each row
declare/*Declare block*/
tempqoh products2.qoh%type;
temp_qoh_threshold products2.qoh_threshold%type;
begin/*Begin of trigger*/
   select qoh,qoh_threshold into tempqoh,temp_qoh_threshold from products2 where pid=:new.pid;
     if(tempqoh-:new.qty < temp_qoh_threshold) then
     dbms_output.put_line('current quantity on hand' ||(tempqoh-(:new.qty))||' a  new order of the product needs to be placed');
     end if;
     update products2 set qoh=qoh-:new.qty where pid=:new.pid;
end;/*end of trigger*/
/
show error
```

4)	 Trigger to increase visit made of the customer if purchase by a customer is made on two different date.

```sql
/* Trigger to increase visit made of customer when purchase is made*/
set serveroutput on
create or replace trigger visitincrease
after insert or update on purchases2
for each row
begin/*Begin of trigger to add tuple in temp_purchases2 table when purchases is made*/
declare/* Declare Block*/
temp  purchases2.pdate%type;
i integer;
cursor c1 is select * from temp_purchases2 where cid=:new.cid;/* Cursor Block*/
begin/*Begin of Cursor*/
i:=0;
for c1_record in c1 loop
i:=i+1;
end loop;
dbms_output.put_line('value of i' || i);
if(i=1) then
update customers2 set visits_made=visits_made+1 where cid=:new.cid;
else
select pdate into temp from (select * from (select * from temp_purchases2 where cid=:new.cid order by pdate desc) where rownum<=2 order by pdate desc) where rownum=1;
if(to_char(:new.pdate,'dd-mon-yy')>temp) then
dbms_output.put_line('sysdate' ||sysdate || 'temp' || temp );
update customers2 set visits_made=visits_made+1 where cid=:new.cid;
end if;
end if;
end;/*end of Cursor*/
end;/*end of Trigger*/
/ show errors```


> Relationship between triggers and Procedure:

Once the purchases is made using procedure the trigger will automatically  get fired  on the purchase table and add tuple in log table also it will reduce qoh on product table with qty from purchase table and also it will give appropriate message if qoh is < than  qoh_threshold in product table. Also the trigger will cause visit made of the customer to increase by one if customer has purchases on two different date . Trigger will also cause the purchases to be aborted if qty in purchases table is > than qoh in product table.
Thus if trigger is defined for particular table then it will automatically get activated when the appropriate event occurs. Thus if procedure is used for particular table either for insertion, deletion or update and if trigger is defined for that particular table then with the execution of procedure trigger will automatically get fired if when appropriate event occur. 

 



