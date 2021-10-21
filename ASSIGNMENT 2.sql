select * from emp 
select * from DEPT
select* from jobhist

/*1*/
select deptno from DEPT
where DEPTNO not in (select DEPTNO from emp)

/*2*/
select ename from emp
where mgr  is null

/*3*/
SELECT E.ENAME,E.JOB,D.DNAME,e.DEPTNO
FROM EMP E inner JOIN DEPT D
ON(E.DEPTNO = D.DEPTNO)
WHERE loc='NEW YORK' and comm >1000


select ename,job, deptno from emp
where DEPTNO =(select deptno from DEPT where loc='NEW YORK') and  COMM > 1000


/*4*/

select count(deptno) from emp
where DEPTNO=(select DEPTNO from DEPT where loc='CHICAGO')

/*5*/

select ename   from emp
where DEPTNO=(select DEPTNO from DEPT where loc='CHICAGO')

/*6*/

SELECT E.ENAME,E.JOB,d.LOC
FROM EMP E inner JOIN DEPT D
ON(E.DEPTNO = D.DEPTNO)
order by loc

/*7*/

select count(distinct(ename)),count(distinct(deptno)) from emp 


/*8*/

SELECT *
FROM EMP W, EMP M
WHERE (W.MGR = M.EMPNO AND W.HIREDATE < M.HIREDATE);


/*9*/
select count(job) from emp
 where job='MANAGER'


/*10*/
select ename,job from emp
where mgr  is null

/*11*/

select ename,deptno from emp
where ename='SMITH'

/*12*/

select ename   from emp
where DEPTNO != (select DEPTNO from DEPT where loc='BOSTON') and  job='SALESMAN'

/*13*/
SELECT E.ENAME,E.JOB,d.LOC
FROM EMP E inner JOIN DEPT D
ON(E.DEPTNO = D.DEPTNO)
order by loc

/*14*/

select ename   from emp
where sal < (select sal from emp where ENAME='MILLER') and  job='SALESMAN'


/*15*/

select *   from emp
where DEPTNO=(select DEPTNO from DEPT where loc='CHICAGO')


/*16*/

select ename,sal from emp
where sal>(select min(sal) from emp where job='MANAGER' )


/*17*/

select ename,job from emp
where  DEPTNO = (select DEPTNO from DEPT where DNAME='ACCOUNTING' )



/*18*/

select * from emp
 where job='MANAGER'

 /*19*/

 select dname,
     case
	 when dname !='sales'then 'NOTSALES'
	 else 'SALES'
	 end 
	from DEPT

 /*20*/

 select sal,
    case 
	   when sal >1000 then sal
	   else 1000
	end
  from emp

 /*21*/

 select sal,
   case 
   when sal >2500 then 'high'
   when sal < 1000 then 'low'
   when sal between 1000 and 2500 then 'medium'
  end  as salaryrange
  from emp;

 


