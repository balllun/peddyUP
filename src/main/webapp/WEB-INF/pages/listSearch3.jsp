<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%int i = 1;%>
<c:forEach items="${pedigreeList}" var="pedigree">
	<tr>
		<td class="text-center"><%=i++%></td>
		<td class="text-center">${pedigree.CName}</td>
		<td class="text-center">${pedigree.privateNo}</td>
		<td class="text-center">
		<a href="chacked" target="_blank"><button
					class="btn btn-info">
					<i class="fa fa-search"></i>&nbsp;ตรวจสอบ
				</button></a></td>
		
			<%-- 	<td class="text-center">${pedigree.ownerName}</td>
		<td class="text-center">${pedigree.band}</td>
		<td class="text-center">${pedigree.sex}</td>
		<td class="text-center"><a href="Printing=${pedigree.id}"><button
					class="btn btn-info">
					<i class="fa fa-search"></i>View
				</button></a></td> --%>
		<td class="text-center"><a href="Print=${pedigree.id}" target="_blank"><button 
					class="btn btn-success">
					<i class="fa fa-check"></i>&nbsp;yes
				</button></a>
				
				<button class="btn btn-danger" value="add" name="action"
						onclick="search()" >
					<i class="fa fa-close"></i>&nbsp; no
				</button></td>
				
	<%-- 	<td class="text-center"><button class="btn btn-danger"
				value="${pedigree.id}" onclick="deleteSearch(this)">
				<i class="fa fa-times"></i>
			</button></td> --%>
	</tr>
	
	<script type="text/javascript">
function search(){
	$("#listSearch3").load('lsearch3',{ id : $("#sel").val(), value : $("#search").val() });
}
function deleteSearch(id){
		 $.getJSON( "cancelsearch", { id: id.value } )
		 .done(function(data){
			 $("#listSearch").load('listSearch');
			 swal("Success" , "ลบข้อมูลสำเร็จ" , "success")
		 }).fail(function(d){
			swal("ไม่สามารถลบข้อมูลโคได้" , "" , "error") 
		 });
	} 
	
</script>
	
</c:forEach>