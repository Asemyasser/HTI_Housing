import{r as p,u as v,j as e,a as _}from"./index-CHJJpzJa.js";const b="_dashboard_nc7up_1",C="_header_nc7up_25",N="_total_nc7up_33",f="_statusCard_nc7up_45",y="_title_nc7up_83",$="_number_nc7up_99",A="_bar_nc7up_113",k="_gradientAll_nc7up_133",D="_gradientPending_nc7up_143",E="_gradientApproved_nc7up_153",F="_gradientRejected_nc7up_163",s={dashboard:b,header:C,total:N,statusCard:f,title:y,number:$,bar:A,gradientAll:k,gradientPending:D,gradientApproved:E,gradientRejected:F},R="_card_10zvx_1",P="_circle_10zvx_63",w="_innerCircle_10zvx_91",q="_title_10zvx_121",o={card:R,circle:P,innerCircle:w,title:q},g=({percentage:t,title:u,bgColor:d,path:a})=>{const[n,r]=p.useState(typeof t=="string"?100:0),i=v();function h(){i(a)}return p.useEffect(()=>{if(typeof t=="string"){r(100);return}let c=0;const l=setInterval(()=>{c<t?(c++,r(c)):clearInterval(l)},15);return()=>clearInterval(l)},[t]),e.jsxs("div",{onClick:h,className:o.card,style:{background:d},children:[e.jsx("span",{className:o.circle,style:{background:`conic-gradient(white ${n}%, #FFFFFF38 0%)`},children:e.jsx("div",{className:o.innerCircle,style:{background:d},children:e.jsxs("span",{children:[typeof t=="string"?t:`${n}%`," "]})})}),e.jsx("p",{className:o.title,children:u})]})},I=()=>{const[t,u]=p.useState({total:0,pending:0,approved:0,rejected:0});p.useEffect(()=>{const a=async()=>{try{const r={token:`${localStorage.getItem("authToken")}`,"Content-Type":"application/json"},[i,h,c]=await Promise.all([_.get("https://htihousing-eel315fa.b4a.run/user/students",{headers:r}),_.get("https://htihousing-eel315fa.b4a.run/user/students/approved",{headers:r}),_.get("https://htihousing-eel315fa.b4a.run/user/students/rejected",{headers:r})]),l=i.data.users.length,m=h.data.users.length,j=c.data.users.length,x=l+m+j;console.log(x),u({total:x,pending:l,approved:m,rejected:j}),console.log(t),console.log(i)}catch(n){console.error("Error fetching request data:",n)}};console.log(t.total),a()},[]);const d=[{title:"جميع الطلبات",number:t.total,gradientClass:"gradientAll"},{title:"الطلبات قيد الانتظار",number:t.pending,gradientClass:"gradientPending"},{title:"الطلبات الموافق عليها",number:t.approved,gradientClass:"gradientApproved"},{title:"الطلبات المرفوضة",number:t.rejected,gradientClass:"gradientRejected"}];return e.jsx("div",{className:"container ",children:e.jsxs("div",{className:`${s.dashboard}`,children:[e.jsx("div",{className:"row my-2 pe-5",children:e.jsxs("div",{className:"col-12",children:[e.jsx("h2",{className:`${s.header} mb-3`,children:"الطلاب (%)"}),e.jsx("h3",{className:"text-secondary h5 mb-2",children:"إجمالى عدد الطلاب"}),e.jsxs("p",{className:s.total,children:[t.total," طالب"]})]})}),e.jsxs("div",{className:"row",children:[e.jsx("div",{className:"col-lg-3 col-md-6 col-sm-12 mb-4",children:d.map((a,n)=>e.jsxs("div",{className:s.statusCard,children:[e.jsx("div",{className:`${s.bar} ${s[a.gradientClass]}`}),e.jsxs("div",{children:[e.jsx("h6",{className:s.title,children:a.title}),e.jsxs("p",{className:s.number,children:[a.number," طالب"]})]})]},n))}),e.jsxs("div",{className:"col-lg-9 col-md-6 col-sm-12 ps-5 pe-md-0 pe-5",children:[e.jsxs("div",{className:"row mb-4 justify-content-end gap-4",children:[e.jsx(g,{percentage:t.total.toString(),title:"جميع الطلبات",bgColor:"linear-gradient(227.32deg, #AC39D5 -5.2%, #D539C5 73.99%)",path:"/requests"}),e.jsx(g,{percentage:t.pending?t.pending/t.total*100:0,title:"طلبات قيد الانتظار",bgColor:"linear-gradient(198.93deg, #461EE7 12.77%, #1EB6E7 94.68%)",path:"/requests"})]}),e.jsxs("div",{className:"row justify-content-end gap-4",children:[e.jsx(g,{percentage:t.approved?t.approved/t.total*100:0,title:"الطلبات الموافق عليها",bgColor:"linear-gradient(204.11deg, #40D5A8 15.46%, #40BAD5 95.79%)",path:"/requests/accepted"}),e.jsx(g,{percentage:t.rejected?t.rejected/t.total*100:0,title:"الطلبات المرفوضة",bgColor:"linear-gradient(221.17deg, #F33D3D 5.91%, #F56565 97.67%)",path:"/requests/rejected"})]})]})]})]})})};export{I as default};
