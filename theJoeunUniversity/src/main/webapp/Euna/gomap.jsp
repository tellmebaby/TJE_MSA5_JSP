<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더조은대학교 주변 위치</title>

<jsp:include page="/layout/link.jsp" />
<jsp:include page="/layout/maplink.jsp" />
<jsp:include page="/layout/mainLink.jsp" />
</head>
<body>
	<style>
/* 커스텀 오버레이 */
.my-place {
	padding: 12px 24px;
	background-color: cornflowerblue;
	border-radius: 10px;
	color: white;
	font-size: 20px;
}

.con {
	width: 1000px;
	margin-top: 30px;
	margin-left: 20px;
}

</style>
</head>
<body>
	<header>
		<!-- 헤더 -->
		<jsp:include page="/layout/header.jsp" />
	</header>
	<div class="container" id="container2">

		<ul class="mainTitle">
			<li class="Line"></li>
			<li class="title">편의 시설</li>
			<li class="Line"></li>
		</ul>
		
		<div class="euna123">
		
		<div class="con">
			<div id="map" style="width: 950px; height: 730px;"></div>
			<p id="position"></p>
		</div>

		<div class="map_wrap">
			<div id="map"
				style="  overflow: hidden;"></div>
			<ul id="category">
				<li id="BK9" data-order="0"><img
					src="<%=request.getContextPath()%>/static/img/bank.png"><br>
					은행</li>
				<li id="MT1" data-order="1"><img
					src="<%=request.getContextPath()%>/static/img/supermarket.png"><br>
					마트</li>
				<li id="PM9" data-order="2"><img
					src="<%=request.getContextPath()%>/static/img/pharmacy.png"><br>
					약국</li>
				<li id="OL7" data-order="3"><img
					src="<%=request.getContextPath()%>/static/img/gas.png"><br>
					주유소</li>
				<li id="CE7" data-order="4"><img
					src="<%=request.getContextPath()%>/static/img/coffee.png"><br>
					카페</li>
				<li id="CS2" data-order="5"><img
					src="<%=request.getContextPath()%>/static/img/dd.png"><br>
					편의점</li>
			</ul>
		</div>
	</div>	



		<!-- ✅ 라이브러리 포함 : &libraries=services -->
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abaf959f0308dd8f0e1b462dc9e26639&libraries=services">
			
		</script>

		      <script>
         // 위도 : 37.49100953576117, 경도 : 126.72047625631083
         let lat = 37.49100953576117 // 위도
         let lon = 126.72047625631083 // 경도
         
         
         
         // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
         var placeOverlay = new kakao.maps.CustomOverlay({
            zIndex : 1
         }), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
         markers = [], // 마커를 담을 배열입니다
         currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new kakao.maps.LatLng(37.49108, 126.7206), // 지도의 중심좌표
            level : 1
         // 지도의 확대 레벨
         };

         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption);
         
         
         // 지도에 마커를 생성하고 표시한다
         var marker = new kakao.maps.Marker({
             position: new kakao.maps.LatLng(lat, lon), // 마커의 좌표
             map: map                                    // 마커를 표시할 지도 객체
         });
         

         // 커스텀 오버레이를 생성하고 지도에 표시한다
         var customOverlay = new kakao.maps.CustomOverlay({
            map : map,
            content : '<div class="my-place">더조은 대학교</div>',
            position : new kakao.maps.LatLng(lat, lon), // 커스텀 오버레이를 표시할 좌표
            xAnchor : 0.5, // 컨텐츠의 x 위치
            yAnchor : 0
         // 컨텐츠의 y 위치
         });

         // 장소 검색 객체를 생성합니다
         var ps = new kakao.maps.services.Places(map);

			// 지도에 idle 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', searchPlaces);

			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown',
					kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart',
					kakao.maps.event.preventMap);

			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);

			// 각 카테고리에 클릭 이벤트를 등록합니다
			addCategoryClickEvent();

			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
				if (target.addEventListener) {
					target.addEventListener(type, callback);
				} else {
					target.attachEvent('on' + type, callback);
				}
			}

			// 카테고리 검색을 요청하는 함수입니다
			function searchPlaces() {
				if (!currCategory) {
					return;
				}

				// 커스텀 오버레이를 숨깁니다 
				placeOverlay.setMap(null);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				ps.categorySearch(currCategory, placesSearchCB, {
					useMapBounds : true
				});
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
					displayPlaces(data);
				} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
					// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

				} else if (status === kakao.maps.services.Status.ERROR) {
					// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

				}
			}

			// 지도에 마커를 표출하는 함수입니다
			function displayPlaces(places) {

				// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
				// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
				var order = document.getElementById(currCategory).getAttribute(
						'data-order');

				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = addMarker(new kakao.maps.LatLng(places[i].y,
							places[i].x), order);

					// 마커와 검색결과 항목을 클릭 했을 때
					// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
					(function(marker, place) {
						kakao.maps.event.addListener(marker, 'click',
								function() {
									displayPlaceInfo(place);
								});
					})(marker, places[i]);
				}
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, order) {
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new kakao.maps.Point(11, 28)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize, imgOptions), marker = new kakao.maps.Marker(
						{
							position : position, // 마커의 위치
							image : markerImage
						});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
			function displayPlaceInfo(place) {
				var content = '<div class="placeinfo">'
						+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
						+ place.place_name + '</a>';

				if (place.road_address_name) {
					content += '    <span title="' + place.road_address_name + '">'
							+ place.road_address_name
							+ '</span>'
							+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
							+ place.address_name + ')</span>';
				} else {
					content += '    <span title="' + place.address_name + '">'
							+ place.address_name + '</span>';
				}

				content += '    <span class="tel">' + place.phone + '</span>'
						+ '</div>' + '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay
						.setPosition(new kakao.maps.LatLng(place.y, place.x));
				placeOverlay.setMap(map);
			}

			// 각 카테고리에 클릭 이벤트를 등록합니다
			function addCategoryClickEvent() {
				var category = document.getElementById('category'), children = category.children;

				for (var i = 0; i < children.length; i++) {
					children[i].onclick = onClickCategory;
				}
			}

			// 카테고리를 클릭했을 때 호출되는 함수입니다
			function onClickCategory() {
				var id = this.id, className = this.className;

				placeOverlay.setMap(null);

				if (className === 'on') {
					currCategory = '';
					changeCategoryClass();
					removeMarker();
				} else {
					currCategory = id;
					changeCategoryClass(this);
					searchPlaces();
				}
			}

			// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
			function changeCategoryClass(el) {
				var category = document.getElementById('category'), children = category.children, i;

				for (i = 0; i < children.length; i++) {
					children[i].className = '';
				}

				if (el) {
					el.className = 'on';
				}
			}
		</script>
	</div>

	<footer>
		<!-- 푸터 -->
		<jsp:include page="/layout/footer.jsp" />
	</footer>
</body>
</html>









