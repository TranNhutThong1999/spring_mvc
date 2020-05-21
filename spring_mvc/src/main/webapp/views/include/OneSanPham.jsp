<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file ="Taglib.jsp" %>

					<c:forEach var="sanPham" items="${danhSachSanPham}" varStatus="loop">
							<c:if test="${loop.index!=8 && loop.index!=9 }">
							<div class="col-md-3 animate__animated  animate__zoomIn " > <!-- wow flipInY -->
								<a href="<c:url value="/ChiTiet/${sanPham.getIdSanPham()}" />">
									<div class="card" style="width: 18rem;">
										<c:if test="${sanPham.getHinhSanPham().size()!=0}">
											<img class="card-img-top"
												src='<c:url value="/resources/Images/${sanPham.getHinhSanPham().get(0).getLocation()}" />'
												alt="Card image cap">
										</c:if>
										<div class="card-body">
											<p class="card-text"> <fmt:formatNumber value="${sanPham.getGiaTien()}" type="currency" maxFractionDigits="0" /> </p>
											<c:forEach var="image" items="${sanPham.getHinhSanPham()}"  end="4" >
												<img class="card-img-top item-image mr-1"
													src='<c:url value="/resources/Images/${image.getLocation()}" />'
													alt="Card image cap">
											</c:forEach>
										</div>
									</div>
								</a>
							</div>
							</c:if>
							<c:if test="${loop.index==8 || loop.index==9 }">
								<div class="col-md-6 animate__animated  animate__zoomIn " style="margin-bottom:18px;" > <!-- wow flipInY -->
									<a href="<c:url value="/ChiTiet/${sanPham.getIdSanPham()}" />">
										<div class="card" style="width: 18rem;">
											<c:if test="${sanPham.getHinhSanPham().size()!=0}">
												<img class="card-img-top"
													src='<c:url value="/resources/Images/${sanPham.getHinhSanPham().get(0).getLocation()}" />'
													alt="Card image cap">
											</c:if>
											<div class="card-body">
												<p class="card-text"> <fmt:formatNumber value="${sanPham.getGiaTien()}" type="currency" maxFractionDigits="0" /> </p>
												<c:forEach var="image" items="${sanPham.getHinhSanPham()}"  end="4" >
													<img class="card-img-top item-image mr-1"
														src='<c:url value="/resources/Images/${image.getLocation()}" />'
														alt="Card image cap">
												</c:forEach>
											</div>
										</div>
									</a>
								</div>
							</c:if>
					</c:forEach>