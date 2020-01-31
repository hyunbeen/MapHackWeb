<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String sess = "";
    if(session.getAttribute("id")==null){
    	sess = null;
    }else{
    	sess =(String) session.getAttribute("id");
    }

	
	%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
  <head>
    <!-- Site Title-->
    <title>MapHack</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="/MapHack/resource/main/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="/MapHack/resource/main/css/bootstrap.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/style.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/mdi.css">
    <link rel="stylesheet" href="/MapHack/resource/main/css/fl-bigmug-line.css">
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.0.46/css/materialdesignicons.min.css">
    
  </head>
  <body>
  
    <!-- Page-->
    <div class="page">
   
      <header class="section page-header breadcrumbs-custom-wrap bg-gradient bg-secondary-2">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap rd-navbar-default">
          <nav class="rd-navbar" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fullwidth" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-md-stick-up-offset="2px" data-lg-stick-up-offset="2px" data-stick-up="true" data-sm-stick-up="true" data-md-stick-up="true" data-lg-stick-up="true">
            <div class="rd-navbar-inner">
              <!-- RD Navbar Panel-->
              <div class="rd-navbar-panel">
                <!-- RD Navbar Toggle-->
                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                <!-- RD Navbar Brand-->
                <div class="rd-navbar-brand"><a class="brand-name" href="main.mh"><img class="logo-default" src="/MapHack/resource/main/images/mainCustom/logoM.png" alt="" width="128" height="52"/><img class="logo-inverse" src="/MapHack/resource/main/images/mainCustom/logoM.png" alt="" width="128" height="52"/></a></div>
              </div>
              <div class="rd-navbar-aside-right">
                <div class="rd-navbar-nav-wrap">
                  <!-- RD Navbar Nav-->
                  <ul class="rd-navbar-nav">
                    <li><a href="main.mh">메인으로</a> </li>
                       <li><a href="makeMap.mh">지도정보검색</a></li>
                    <li><a href="infoList.mh">정보제공</a></li>
                    <li><a href="afterBoardList.mh">커뮤니티</a>
             			<ul class="rd-navbar-dropdown">
                            <li><a href="afterBoardList.mh">여행정보공유</a></li>
                            <li><a href="freeBoardList.mh">자유게시판</a></li>
                    	</ul> 
                    </li>
                    <li><a href="myPageMain.mh?tab=1">마이페이지</a>
                      <ul class="rd-navbar-dropdown">
                           <li><a href="myPageMain.mh?tab=1">즐겨찾기</a></li>
                            <li><a href="myPageMain.mh?tab=2">여행짜기 목록</a></li>
                            <li><a href="myPageMain.mh?tab=3">여행후기 목록</a></li>
                            <li><a href="myPageMain.mh?tab=4">친구관리</a></li>
                            <li><a href="myPageMain.mh?tab=5">회원정보수정</a></li>
                      </ul>
                    </li>

                    <li><a href="notice.mh">공지사항</a> </li>
                    <li><a href="join.mh">회원가입</a></li>
                    <% if(sess == null){ %>
                     <li><a href="/MapHack/login.mh" id="login">로그인</a> </li>
                     <%} else{%>
                     <li><a href="/MapHack/logout.mh" id="logout">로그아웃</a></li>
					<%} %>
                  </ul>
                </div>
                <div class="rd-navbar-collapse-toggle" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
              </div>
            </div>
          </nav>
        </div>
          </header>
   
        <!-- Breadcrumbs-->
        <section class="breadcrumbs-custom breadcrumbs-custom-lg breadcrumbs-custom-svg" style="background-color:rgb(41, 41, 58); padding-top: 180px;">
          <div class="shell">
            <h5 class="fadeIn" style="color:white">Welcome to MAP HACK</h5>
            <h3 class="typed-text-wrap" style="color:white">맵핵은&nbsp;<span class="typed-text"></span>&nbsp;사이트 입니다</h3>
            <div class="group-md button-group"><a class="button button-secondary button-nina" href="#demos" data-custom-scroll-to="#demos"> 로그인 </a>
            <a class="button button-default-outline button-nina" href="http://ld-wp2.template-help.com/novi-builder/brave/" target="_blank">회원가입</a></div>
          </div>
          <div class="parallax-scene-js parallax-scene" data-scalar-x="5" data-scalar-y="10">
            <div class="layer-01">
              <div class="layer" data-depth="0.25"><img src="/MapHack/resource/main/images/parallax-scene-01-132x133.png" alt="" width="132" height="133"/>
              </div>
            </div>
            <div class="layer-02">
              <div class="layer" data-depth=".55"><img src="/MapHack/resource/main/images/parallax-scene-02-186x208.png" alt="" width="186" height="208"/>
              </div>
            </div>
            <div class="layer-03">
              <div class="layer" data-depth="0.1"><img src="/MapHack/resource/main/images/parallax-scene-03-108x120.png" alt="" width="108" height="120"/>
              </div>
            </div>
            <div class="layer-04">
              <div class="layer" data-depth="0.25"><img src="/MapHack/resource/main/images/parallax-scene-04-124x145.png" alt="" width="124" height="145"/>
              </div>
            </div>
            <div class="layer-05">
              <div class="layer" data-depth="0.15"><img src="/MapHack/resource/main/images/parallax-scene-05-100x101.png" alt="" width="100" height="101"/>
              </div>
            </div>
            <div class="layer-06">
              <div class="layer" data-depth="0.65"><img src="/MapHack/resource/main/images/parallax-scene-06-240x243.png" alt="" width="240" height="243"/>
              </div>
            </div>
          </div>
        </section>
              <section class="section section-variant-2 bg-white text-center" style="background-color: rgb(41, 41, 58); padding-top: 0px;">
        </section>
    

      <!-- Template layouts-->
      <section class="section section-variant-2 bg-white text-center" id="demos" style="padding-top: 80px;">
        <!-- Section wave-->
        <div class="section-wave">
          <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
        </div>
        <div class="shell-wide">
          <h3>Preview</h3>
          <div class="divider divider-default"></div>
          <div class="range range-90 offset-custom-2">
            <div class="cell-xs-6 cell-sm-4 cell-md-3 fadeInUpSmall" data-wow-delay=".1s" data-wow-duration=".9s">
              <!-- Thumbnail modern-->
              <div class="thumbnail-modern"><a class="thumbnail-modern-image-wrap" href="landing-default.html"><img class="thumbnail-modern-image" src="/MapHack/resource/main/images/mainCustom/11111.png" alt="" width="360" height="460"/></a>
                <div class="thumbnail-modern-caption">
                  <h5><a href="landing-default.html">지도 정보 검색</a></h5>
                </div>
              </div>
            </div>
            <div class="cell-xs-6 cell-sm-4 cell-md-3 fadeInUpSmall" data-wow-delay=".2s" data-wow-duration=".9s">
              <!-- Thumbnail modern-->
              <div class="thumbnail-modern"><a class="thumbnail-modern-image-wrap" href="landing-it-company.html"><img class="thumbnail-modern-image" src="/MapHack/resource/main/images/mainCustom/44444.png" alt="" width="360" height="460"/></a>
                <div class="thumbnail-modern-caption">
                  <h5><a href="landing-it-company.html">정보 제공</a></h5>
                </div>
              </div>
            </div>
            <div class="cell-xs-6 cell-sm-4 cell-md-3 fadeInUpSmall" data-wow-delay=".3s" data-wow-duration=".9s">
              <!-- Thumbnail modern-->
              <div class="thumbnail-modern"><a class="thumbnail-modern-image-wrap" href="landing-trucking.html"><img class="thumbnail-modern-image" src="/MapHack/resource/main/images/mainCustom/333333.png" alt="" width="360" height="460"/></a>
                <div class="thumbnail-modern-caption">
                  <h5><a href="landing-trucking.html">커뮤니티</a></h5>
                </div>
              </div>
            </div>
            <div class="cell-xs-6 cell-sm-4 cell-md-3 fadeInUpSmall" data-wow-delay=".4s" data-wow-duration=".9s">
              <!-- Thumbnail modern-->
              <div class="thumbnail-modern"><a class="thumbnail-modern-image-wrap" href="landing-environmental.html"><img class="thumbnail-modern-image" src="/MapHack/resource/main/images/mainCustom/22222.png" alt="" width="360" height="460"/></a>
                <div class="thumbnail-modern-caption">
                  <h5><a href="landing-environmental.html">마이페이지</a></h5>
                </div>
              </div>
       		</div>
          </div>
        </div>
      </section>

      <!-- What you get with Brave theme-->
   <section class="section  section-lg bg-white">
        <div class="shell-wide">
              <div class="range text-center">
            <div class="cell-xs-12">
                    <h3>MapHack</h3>
                    <div class="divider divider-default"></div>
                    <!-- Bootstrap collapse-->
                    <div class="panel-group panel-group-custom panel-group-corporate" id="accordion1" role="tablist" aria-multiselectable="false">
                      <!-- Bootstrap panel-->
                      <div class="panel panel-custom panel-corporate">
                        <div class="panel-heading" id="accordion1Heading2" role="tab">
                          <div class="panel-title"><a class="collapsed" role="button" data-toggle="collapse" 
                          data-parent="#accordion1" href="#accordion1Collapse2" aria-controls="accordion1Collapse2">MapHack이 제공하는 다양한 서비스 ▽
                              <div class="panel-arrow"></div></a>
                          </div>
                        </div>
                        <div class="panel-collapse collapse" id="accordion1Collapse2" role="tabpanel" aria-labelledby="accordion1Heading2">
                          <div class="panel-body" style="padding-right: 100px;">
                             <div class="range range-50 range-xl-90 offset-custom-2">
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInLeftSmall" data-wow-delay=".1s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-bulletin-board"></div>
                  <h6 class="box-minimal-title">100+ pages</h6>
                </div>
                <div class="box-minimal-text">Brave Theme is unique in many ways, especially in number of pages and elements that it can offer you. More than 100 pages are included with this template for you to select the best.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInLeftSmall" data-wow-delay=".2s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon">
                    <svg version="1.1" x="0px" y="0px" width="34px" height="37px" viewbox="0 0 34 37">
                      <g>
                        <path d="M30.535,1.721h-9.043c-1.29-0.029-2.358,0.994-2.387,2.283c-0.014,0.65,0.243,1.276,0.71,1.729l10.121,10.121c0.898,0.926,2.376,0.95,3.302,0.052c0.467-0.453,0.724-1.079,0.71-1.729V5.135C33.949,3.249,32.421,1.721,30.535,1.721z"></path>
                        <path d="M7.659,2.559C7.115,2.026,6.384,1.725,5.622,1.721H3.407c-1.885,0-3.414,1.528-3.414,3.414v27.129c0,1.885,1.528,3.414,3.414,3.414h27.129c1.885,0,3.414-1.528,3.414-3.414v-2.216c0.011-0.783-0.291-1.537-0.838-2.096L7.659,2.559z"></path>
                      </g>
                    </svg>
                  </div>
                  <h6 class="box-minimal-title">visual page builder</h6>
                </div>
                <div class="box-minimal-text">Novi Builder, our new visual page builder, is included with this template. It allows you to easily customize any page of the template without unnecessary coding.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInLeftSmall" data-wow-delay=".3s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-cellphone-link"></div>
                  <h6 class="box-minimal-title">responsive design</h6>
                </div>
                <div class="box-minimal-text">If you want your future website to be displayed perfectly on any device, then Brave Theme is certainly your #1 choice! With its full responsiveness, even smartphones can load it.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInLeftSmall" data-wow-delay=".4s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-apps"></div>
                  <h6 class="box-minimal-title">300+ Components</h6>
                </div>
                <div class="box-minimal-text">Our designers and developers did everything possible to enable you with a mindblowing set of components, which includes forms, galleries, accordions, tabs, popups, and more.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInRightSmall" data-wow-delay=".1s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-cash-multiple"></div>
                  <h6 class="box-minimal-title">save your money</h6>
                </div>
                <div class="box-minimal-text">Brave Theme allows everyone to save an immense amount of money on buying various templates. When you buy Brave, you get a great multipurpose template at an affordable price.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInRightSmall" data-wow-delay=".2s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-share-variant"></div>
                  <h6 class="box-minimal-title">social widgets</h6>
                </div>
                <div class="box-minimal-text">It is important to maintain feedback with your clients and subscribers in various social networks. It can be done easily with our social widgets included in our template.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInRightSmall" data-wow-delay=".3s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-headset"></div>
                  <h6 class="box-minimal-title">24/7 support</h6>
                </div>
                <div class="box-minimal-text">Our qualified and friendly support team is always ready to help you, 24 hours a day, 7 days a week. If you have a question about Brave, don’t hesitate to contact them immediately.</div>
              </article>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-lg-3 fadeInRightSmall" data-wow-delay=".4s">
              <article class="box-minimal">
                <div class="box-minimal-header">
                  <div class="box-minimal-icon box-minimal-icon-md mdi mdi-palette"></div>
                  <h6 class="box-minimal-title">Color schemes</h6>
                </div>
                <div class="box-minimal-text">Our every template comes with a certain colour scheme and Brave has several alternative ones to offer. With their help, you can customize the look of your website.</div>
              </article>
            </div>
          </div>
                          </div>
                        </div>
                      </div>
                    
                    </div>
                  </div>
                 
                </div>
              </div>
            </section>

      
	<!-- 12월 best 여행후기-->
      <section class="section section-lg bg-gray-lighter text-center">
        <!-- section wave-->
        <div class="section-wave">
          <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
        </div>
        <div class="shell-wide">
          <div class="range">
            <div class="cell-xs-12">
              <h3>12월 3주차 여행후기 top3</h3>
              <div class="divider divider-default"></div>
              <!-- Owl Carousel-->
              <div class="owl-carousel owl-carousel-team owl-carousel-inset" data-items="1" data-sm-items="2" data-lg-items="3" data-xl-items="4" data-stage-padding="15" data-loop="true" data-margin="30" data-mouse-drag="false" data-dots="true">
                  <article class="post-blog"><a class="post-blog-image" href="image-post.html"><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="420" height="305"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="image-post.html">Tips & Tricks</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="image-post.html">Solar Experiment: Let Your Neighbors Trade Energy Among Themselves</a></h5>
                    </div>
                    <div class="post-blog-caption-footer">
                      <time datetime="2017">Feb 27, 2017 at 6:53 pm</time><a class="post-comment" href="image-post.html"><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-image" href="image-post.html"><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="420" height="305"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="image-post.html">Tips & Tricks</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="image-post.html">Solar Experiment: Let Your Neighbors Trade Energy Among Themselves</a></h5>
                    </div>
                    <div class="post-blog-caption-footer">
                      <time datetime="2017">Feb 27, 2017 at 6:53 pm</time><a class="post-comment" href="image-post.html"><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-video" href="video-post.html">
                    <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="420" height="305"/>
                    </figure><span class="icon mdi mdi-play-circle-outline"></span></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="video-post.html">business</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>by</span>&nbsp;<a href="about-me.html">닉네임</a></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="video-post.html">Storing Solar Energy: Top 7 Environmental Tips for an American Homeowner</a></h5>
                    </div>
                    <div class="post-blog-caption-footer">
                      <time datetime="2017">Feb 27, 2017 at 6:53 pm</time><a class="post-comment" href="video-post.html"><span class="icon icon-md-middle icon-gray-1 mdi mdi-comment"></span><span>3</span></a>
                    </div>
                  </div>
                </article>
           
              </div>
            </div>
          </div>
        </div>
      </section>
      
      
      
      <!-- titled Grid gallery-->
      <section class="section section-lg text-center bg-white">
        <div class="shell-wide">
          <h3>추천! 이런 게시글 어때요? </h3>
           <div class="divider divider-default"></div>
          <div class="isotope-wrap range range-0">
            <!-- Isotope Filters-->
            <div class="cell-lg-12">
              <ul class="isotope-filters isotope-filters-horizontal">
                <li class="block-top-level">
                  <p class="big">Choose your category:</p>
                  <!-- Isotope Filters-->
                  <button class="isotope-filters-toggle button button-xs button-primary" data-custom-toggle=".isotope-filters-list" data-custom-toggle-hide-on-blur="true">Filter<span class="caret"></span></button>
                  <ul class="isotope-filters-list">
                    <li><a class="active" data-isotope-filter="*" data-isotope-group="gallery-01" href="#">전체</a></li>
                    <li><a data-isotope-filter="type 1" data-isotope-group="gallery-01" href="#">가족과 함께</a></li>
                    <li><a data-isotope-filter="type 2" data-isotope-group="gallery-01" href="#">나 홀로 떠나기</a></li>
                    <li><a data-isotope-filter="type 3" data-isotope-group="gallery-03" href="#">연인과 데이트</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- Isotope Content-->
            <div class="cell-lg-12">
              <div class="isotope isotope-titled-gallery" data-isotope-layout="fitRows" data-isotope-group="gallery-01" data-lightgallery="group">
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 1">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목1</a>
                          <p class="title-inside-gallery-text">디테일 설명 1</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 1">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목2</a>
                          <p class="title-inside-gallery-text">디테일 설명 2</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 1">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목3</a>
                          <p class="title-inside-gallery-text">디테일 설명 3</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 2">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목4</a>
                          <p class="title-inside-gallery-text">디테일 설명 4</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 2">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목5</a>
                          <p class="title-inside-gallery-text">디테일 설명 4</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4 isotope-item" data-filter="type 2">
                    <div class="gallery-item title-inside-gallery-item">
                      <div class="gallery-item-image">
                        <figure><img src="/MapHack/resource/main/images/mainCustom/no_detail_img.gif" alt="" width="570" height="380"/>
                        </figure>
                        <div class="title-inside-gallery-caption"><a class="title-inside-gallery-title" href="single-project.html">제목6</a>
                          <p class="title-inside-gallery-text">디테일 설명 5</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      
      

      <!-- Build Your Site In-Browser with NOVI Builder-->
      <section class="section section-lg bg-gray-lighter text-center">
          <!-- section wave-->
        <div class="section-wave">
          <svg x="0px" y="0px" width="1920px" height="45px" viewbox="0 0 1920 45" preserveAspectRatio="none">
            <path d="M1920,0c-82.8,0-108.8,44.4-192,44.4c-78.8,0-116.5-43.7-192-43.7 c-77.1,0-115.9,44.4-192,44.4c-78.2,0-114.6-44.4-192-44.4c-78.4,0-115.3,44.4-192,44.4C883.1,45,841,0.6,768,0.6 C691,0.6,652.8,45,576,45C502.4,45,461.9,0.6,385,0.6C306.5,0.6,267.9,45,191,45C115.1,45,78,0.6,0,0.6V45h1920V0z"></path>
          </svg>
        </div>
        <div class="shell shell-wide">
          <div class="range range-50 range-sm-center range-lg-right range-xl-right">
            <div class="cell-sm-9 cell-md-8 cell-lg-6 cell-xl-5">
              <div class="box-range-content box-range-content-1">
                <h4>Build Your Site In-Browser with</h4>
                <h3>NOVI Builder</h3>
                <div class="divider divider-default"></div>
                <p class="heading-5">Quickly build custom HTML websites of any kind, and use our VIDE technology to accelerate your development and reduce QA time.</p>
                <p class="text-spacing-sm">With Novi Builder, the development and support of your website gets a lot easier! You can speed up your project development in 2 or even 3 times using our Visual Integrated Development Environment called VIDE. Our approach is based on concept of creating reusable elements, so each of your following projects will be launched faster than the previous one. The main idea of Novi Builder is to create a product by people for the people. We believe that only our clients know what they need most.</p><a class="button button-secondary button-nina" href="http://ld-wp2.template-help.com/novi-builder/brave/" target="_blank">Try Builder</a>
              </div>
            </div>
            <div class="cell-sm-9 cell-md-8 cell-lg-6 jp-video-init">
              <div class="build-video">
                <div class="build-video-inner"><img class="image-wrap" src="/MapHack/resource/main/images/block-video-870x500.png" alt="" width="870" height="500"></div>
                <div class="build-video-element image-video bg-image" style="background-image: url(images/video-poster-builder-demo.jpg);"><a class="link-video" href="https://www.youtube.com/watch?v=I5FlP07kdvM" data-lightbox="iframe"></a></div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="section section-xs text-center bg-gradient-1">
        <div class="shell-wide">
          <div class="box-cta-thin">
            <p class="big"><span class="label-cta label-cta-primary">Fight KOREA!</span><strong>2018 평창 동계올림픽</strong><span>&nbsp;성공적인 개최를 응원합니다&nbsp;</span><a class="link-bold" href="https://www.templatemonster.com/website-templates/62466.html" target="_blank">MapHack</a></p>
          </div>
        </div>
      </section>
      
      
      
      
        <!-- Counters-->
      <section class="section section-md bg-gray-darker text-center" style="padding-bottom: 10px;">
        <div class="shell shell-wide">
          <div class="range range-50 range-xs-center">
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-projector"></span>
                <div class="heading-3"><span class="counter" data-step="3000">132</span></div>
                <p>총 게시물수</p>
              </div>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-account-multiple-outline"></span>
                <div class="heading-3"><span class="counter" data-step="3000">246000</span></div>
                <p>누적 조회수</p>
              </div>
            </div>
            <div class="cell-xs-10 cell-sm-6 cell-md-3">
              <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-star"></span>
                <div class="heading-3"><span class="counter" data-step="3000">5</span></div>
                <p>회원수</p>
              </div>
            </div>
<!--             <div class="cell-xs-10 cell-sm-6 cell-md-3"> -->
<!--               <div class="counter-wrap"><span class="icon icon-secondary mdi mdi-spellcheck"></span> -->
<!--                 <div class="heading-3"><span class="counter" data-step="3000">459</span></div> -->
<!--                 <p></p> -->
<!--               </div> -->
<!--             </div> -->
          </div>
        </div>
      </section>
      

      <!-- Page Footer-->
    		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
    </div>
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
  
  <!-- Javascript-->
    <script src="/MapHack/resource/main/js/core.min.js"></script>
    <script src="/MapHack/resource/main/js/script.js"></script>
    <script src="/MapHack/resource/main/js/main.js"></script>
  </body>
</html>