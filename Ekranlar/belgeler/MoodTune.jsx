import { useState } from "react";

const G = `
  @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&display=swap');
  *{box-sizing:border-box;margin:0;padding:0}
  body,#root{font-family:'Nunito',sans-serif;background:#d8e4f0;min-height:100vh;display:flex;align-items:center;justify-content:center}
  .phone{width:390px;min-height:780px;background:linear-gradient(160deg,#edf2f9 0%,#dce8f5 50%,#cfdcee 100%);border-radius:44px;overflow:hidden;position:relative;display:flex;flex-direction:column;box-shadow:0 32px 80px rgba(80,120,180,0.22),0 0 0 1px rgba(255,255,255,0.5)}
  .screen{display:flex;flex-direction:column;min-height:780px;animation:fadeUp .35s ease}
  @keyframes fadeUp{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:translateY(0)}}
  @keyframes slideIn{from{opacity:0;transform:translateX(28px)}to{opacity:1;transform:translateX(0)}}
  .slide{animation:slideIn .3s ease}
  .welcome{align-items:center;justify-content:space-between;padding:70px 30px 44px}
  .logo-ring{width:160px;height:160px;background:rgba(255,255,255,0.4);border-radius:50%;display:flex;align-items:center;justify-content:center;box-shadow:0 8px 32px rgba(100,140,200,0.18),inset 0 1px 0 rgba(255,255,255,0.7);backdrop-filter:blur(8px)}
  .w-title{font-size:34px;font-weight:900;color:#1a2a3a;letter-spacing:-0.5px;margin-top:20px}
  .w-sub{font-size:15px;color:#6a8aaa;font-weight:600;margin-top:6px}
  .w-btns{width:100%;display:flex;flex-direction:column;gap:14px}
  .btn-grad{width:100%;padding:18px;background:linear-gradient(135deg,#a78bfa,#60b8f0);border:none;border-radius:50px;color:#fff;font-size:17px;font-weight:800;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;transition:transform .15s,box-shadow .15s;box-shadow:0 6px 20px rgba(130,100,240,0.3);font-family:'Nunito',sans-serif}
  .btn-grad:hover{transform:translateY(-2px);box-shadow:0 10px 28px rgba(130,100,240,0.4)}
  .btn-grad:active{transform:scale(0.98)}
  .btn-grad:disabled{opacity:0.7;transform:none}
  .btn-white{width:100%;padding:18px;background:rgba(255,255,255,0.6);border:none;border-radius:50px;color:#1a2a3a;font-size:17px;font-weight:800;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;transition:transform .15s,background .15s;font-family:'Nunito',sans-serif;backdrop-filter:blur(4px)}
  .btn-white:hover{background:rgba(255,255,255,0.8);transform:translateY(-2px)}
  .terms{font-size:12px;color:#8aaac8;text-align:center}
  .auth-screen{padding:50px 28px 40px}
  .back-btn{width:46px;height:46px;background:rgba(255,255,255,0.65);border:none;border-radius:50%;cursor:pointer;font-size:18px;color:#1a2a3a;display:flex;align-items:center;justify-content:center;backdrop-filter:blur(6px);transition:background .15s;align-self:flex-start;font-family:'Nunito',sans-serif}
  .back-btn:hover{background:rgba(255,255,255,0.9)}
  .auth-title{font-size:32px;font-weight:900;color:#1a2a3a;margin-top:28px;line-height:1.2}
  .auth-sub{font-size:15px;color:#6a8aaa;font-weight:600;margin-top:10px;line-height:1.5}
  .form{display:flex;flex-direction:column;gap:14px;margin-top:30px;flex:1}
  .inp-wrap{position:relative;background:rgba(255,255,255,0.6);border-radius:16px;border:1.5px solid transparent;transition:border-color .2s,background .2s;backdrop-filter:blur(4px)}
  .inp-wrap:focus-within{border-color:rgba(130,100,240,0.45);background:rgba(255,255,255,0.82)}
  .inp-wrap.err{border-color:rgba(220,80,80,0.5)!important}
  .inp-wrap input{width:100%;padding:18px 48px 18px 18px;background:transparent;border:none;outline:none;font-size:15px;font-family:'Nunito',sans-serif;color:#1a2a3a;font-weight:600}
  .inp-wrap input::placeholder{color:#9ab4cc;font-weight:600}
  .inp-icon{position:absolute;right:16px;top:50%;transform:translateY(-50%);color:#9ab4cc;cursor:pointer;font-size:18px;background:none;border:none;display:flex;align-items:center}
  .err-msg{font-size:12px;color:#e05555;font-weight:700;margin-top:-8px;margin-left:4px}
  .rem-row{display:flex;align-items:center;justify-content:space-between;font-size:14px;color:#6a8aaa;font-weight:700}
  .rem-row label{display:flex;align-items:center;gap:8px;cursor:pointer}
  .rem-row input[type=checkbox]{width:18px;height:18px;accent-color:#a78bfa;cursor:pointer}
  .forgot{color:#1a2a3a;cursor:pointer}
  .forgot:hover{text-decoration:underline}
  .auth-foot{margin-top:auto;text-align:center;font-size:14px;color:#6a8aaa;font-weight:600;padding-top:20px}
  .auth-link{color:#1a2a3a;font-weight:800;cursor:pointer;margin-left:4px}
  .auth-link:hover{text-decoration:underline}
  .navbar{display:flex;align-items:center;padding:12px 16px 20px;background:rgba(255,255,255,0.6);backdrop-filter:blur(12px);border-top:1px solid rgba(255,255,255,0.6);gap:4px}
  .nav-item{flex:1;display:flex;flex-direction:column;align-items:center;gap:3px;padding:8px 4px;border-radius:16px;cursor:pointer;transition:background .15s;border:none;background:transparent;font-family:'Nunito',sans-serif}
  .nav-item.active{background:rgba(255,255,255,0.75)}
  .nav-icon{font-size:20px}
  .nav-label{font-size:11px;font-weight:800;color:#9ab4cc}
  .nav-item.active .nav-label{color:#1a2a3a}
  .home-body{flex:1;overflow-y:auto;padding:52px 22px 12px}
  .home-body::-webkit-scrollbar{display:none}
  .home-hdr{display:flex;align-items:flex-start;justify-content:space-between;margin-bottom:24px}
  .greet-sub{font-size:13px;color:#8aaac8;font-weight:700}
  .greet-name{font-size:26px;font-weight:900;color:#1a2a3a;line-height:1.1}
  .avatar{width:46px;height:46px;background:linear-gradient(135deg,#f4a261,#e76f51);border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:20px;cursor:pointer;box-shadow:0 4px 12px rgba(231,111,81,0.3)}
  .scan-card{background:rgba(255,255,255,0.65);border-radius:24px;padding:28px 22px;display:flex;flex-direction:column;align-items:center;gap:12px;backdrop-filter:blur(8px);box-shadow:0 4px 20px rgba(100,140,200,0.1);margin-bottom:28px;border:1px solid rgba(255,255,255,0.7)}
  .scan-icon{width:60px;height:60px;background:rgba(255,255,255,0.8);border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:26px;box-shadow:0 2px 10px rgba(0,0,0,0.06)}
  .scan-card-title{font-size:20px;font-weight:900;color:#1a2a3a}
  .scan-card-sub{font-size:13px;color:#8aaac8;font-weight:600;text-align:center}
  .btn-scan{background:rgba(255,255,255,0.85);border:none;border-radius:50px;padding:14px 40px;font-size:16px;font-weight:800;color:#1a2a3a;cursor:pointer;transition:transform .15s,background .15s;font-family:'Nunito',sans-serif;display:flex;align-items:center;gap:8px}
  .btn-scan:hover{background:#fff;transform:translateY(-2px)}
  .sec-hdr{display:flex;align-items:center;justify-content:space-between;margin-bottom:14px}
  .sec-title{font-size:18px;font-weight:900;color:#1a2a3a}
  .sec-all{font-size:14px;font-weight:700;color:#8aaac8;cursor:pointer;transition:color .15s}
  .sec-all:hover{color:#1a2a3a}
  .recent-scroll{display:flex;gap:14px;overflow-x:auto;padding-bottom:4px;margin-bottom:28px}
  .recent-scroll::-webkit-scrollbar{display:none}
  .recent-card{min-width:130px;cursor:pointer;transition:transform .15s}
  .recent-card:hover{transform:translateY(-3px)}
  .recent-img{width:130px;height:130px;border-radius:18px;display:flex;align-items:center;justify-content:center;font-size:40px}
  .recent-name{font-size:14px;font-weight:800;color:#1a2a3a;margin-top:8px}
  .recent-tag{display:inline-flex;align-items:center;gap:4px;background:rgba(255,255,255,0.7);border-radius:20px;padding:3px 10px;font-size:11px;font-weight:800;color:#6a8aaa;margin-top:4px}
  .special-grid{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:24px}
  .special-card{border-radius:22px;overflow:hidden;height:160px;cursor:pointer;transition:transform .15s;position:relative}
  .special-card:hover{transform:scale(1.02)}
  .sp-bg{width:100%;height:100%;display:flex;align-items:flex-end;padding:14px}
  .sp-overlay{position:absolute;inset:0;background:linear-gradient(to top,rgba(0,0,0,0.55) 0%,transparent 55%)}
  .sp-info{position:relative;z-index:1}
  .sp-name{font-size:15px;font-weight:900;color:#fff}
  .sp-mood{font-size:11px;font-weight:700;color:rgba(255,255,255,0.8)}
  .scan-screen{padding:50px 24px 36px}
  .scan-top{display:flex;align-items:center;gap:16px;margin-bottom:30px}
  .scan-screen-title{font-size:20px;font-weight:900;color:#1a2a3a}
  .cam-box{border-radius:24px;overflow:hidden;position:relative;background:#6b7280;margin-bottom:16px;height:360px;display:flex;align-items:center;justify-content:center}
  .cam-live{position:absolute;top:14px;right:14px;background:#ef4444;border-radius:50px;padding:6px 14px;display:flex;align-items:center;gap:6px;font-size:13px;font-weight:800;color:#fff}
  .live-dot{width:8px;height:8px;background:#fff;border-radius:50%;animation:pulse 1.2s infinite}
  @keyframes pulse{0%,100%{opacity:1}50%{opacity:0.3}}
  .face-oval{position:absolute;top:50%;left:50%;transform:translate(-50%,-54%);width:200px;height:240px;border:2.5px dashed rgba(255,255,255,0.7);border-radius:50%}
  .cam-hint{position:absolute;bottom:20px;left:50%;transform:translateX(-50%);background:rgba(20,20,40,0.72);border-radius:50px;padding:10px 24px;font-size:14px;font-weight:700;color:#fff;white-space:nowrap;backdrop-filter:blur(4px)}
  .scan-tip{background:rgba(255,255,255,0.55);border-radius:16px;padding:14px 18px;display:flex;align-items:center;gap:10px;font-size:14px;font-weight:700;color:#6a8aaa;margin-bottom:24px;backdrop-filter:blur(4px)}
  .result-body{flex:1;overflow-y:auto;padding:50px 24px 12px}
  .result-body::-webkit-scrollbar{display:none}
  .result-top{display:flex;align-items:center;gap:16px;margin-bottom:24px}
  .result-center{text-align:center;margin-bottom:28px}
  .result-title{font-size:36px;font-weight:900;color:#1a2a3a}
  .result-sub{font-size:15px;color:#8aaac8;font-weight:600;margin-top:6px}
  .result-badge{display:inline-block;background:#fff;border-radius:50px;padding:12px 32px;font-size:18px;font-weight:900;color:#1a2a3a;margin-top:14px;box-shadow:0 4px 16px rgba(0,0,0,0.08)}
  .pl-list{display:flex;flex-direction:column;gap:12px}
  .pl-card{background:rgba(255,255,255,0.65);border-radius:20px;padding:14px;display:flex;align-items:center;gap:14px;cursor:pointer;transition:transform .15s,background .15s;backdrop-filter:blur(4px)}
  .pl-card:hover{transform:translateX(4px);background:rgba(255,255,255,0.85)}
  .pl-img{width:64px;height:64px;border-radius:14px;flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:26px}
  .pl-name{font-size:16px;font-weight:900;color:#1a2a3a}
  .pl-meta{display:flex;align-items:center;gap:8px;margin-top:4px}
  .pl-tag{border-radius:20px;padding:3px 10px;font-size:11px;font-weight:800}
  .tag-e{background:#fef3c7;color:#d97706}
  .tag-n{background:#fce7f3;color:#be185d}
  .tag-s{background:#d1fae5;color:#065f46}
  .pl-count{font-size:12px;color:#8aaac8;font-weight:700}
  .play-btn{width:36px;height:36px;background:linear-gradient(135deg,#a78bfa,#7c6adc);border-radius:50%;display:flex;align-items:center;justify-content:center;color:#fff;font-size:13px;flex-shrink:0}
  .last-body{flex:1;overflow-y:auto;padding:50px 22px 12px;display:flex;flex-direction:column}
  .last-body::-webkit-scrollbar{display:none}
  .last-top{display:flex;align-items:center;gap:16px;margin-bottom:20px}
  .last-title{font-size:20px;font-weight:900;color:#1a2a3a}
  .filter-row{display:flex;gap:10px;margin-bottom:20px;flex-wrap:wrap}
  .filter-btn{padding:10px 18px;border-radius:50px;border:none;cursor:pointer;font-size:14px;font-weight:800;transition:all .15s;font-family:'Nunito',sans-serif}
  .filter-btn.on{background:linear-gradient(135deg,#a78bfa,#7c6adc);color:#fff;box-shadow:0 4px 12px rgba(130,100,240,0.3)}
  .filter-btn:not(.on){background:rgba(255,255,255,0.6);color:#6a8aaa}
  .filter-btn:not(.on):hover{background:rgba(255,255,255,0.85)}
  .lp-list{display:flex;flex-direction:column;gap:12px;flex:1}
  .lp-card{background:rgba(255,255,255,0.65);border-radius:20px;padding:14px;display:flex;align-items:center;gap:14px;cursor:pointer;transition:transform .15s,background .15s;backdrop-filter:blur(4px)}
  .lp-card:hover{transform:translateX(4px);background:rgba(255,255,255,0.85)}
  .lp-img{width:68px;height:68px;border-radius:14px;flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:26px}
  .lp-name{font-size:16px;font-weight:900;color:#1a2a3a}
  .lp-tag{display:inline-flex;align-items:center;gap:4px;border-radius:20px;padding:3px 10px;font-size:11px;font-weight:800;margin-top:4px}
  .lp-count{font-size:13px;color:#8aaac8;font-weight:700}
`;

const Logo = () => (
  <svg width="90" height="90" viewBox="0 0 100 100" fill="none">
    <path d="M35 75 C35 75 25 60 28 45 C31 30 45 22 50 22" stroke="url(#g1)" strokeWidth="3.5" strokeLinecap="round"/>
    <path d="M35 75 C38 72 42 68 45 62 C48 56 46 48 50 44 C54 40 58 42 60 48 C62 54 60 62 62 68" stroke="url(#g1)" strokeWidth="3.5" strokeLinecap="round"/>
    <path d="M50 22 C55 18 65 20 68 28 C71 36 68 46 62 52" stroke="url(#g1)" strokeWidth="3.5" strokeLinecap="round"/>
    <circle cx="62" cy="68" r="5" fill="url(#g1)"/>
    <defs>
      <linearGradient id="g1" x1="25" y1="20" x2="70" y2="80" gradientUnits="userSpaceOnUse">
        <stop offset="0%" stopColor="#c4b0ff"/><stop offset="100%" stopColor="#70c8f8"/>
      </linearGradient>
    </defs>
  </svg>
);

const isValidEmail = e => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e);

function NavBar({ active, onChange }) {
  return (
    <div className="navbar">
      {[["home","🏠","Anasayfa"],["discover","🧭","Keşfet"],["playlist","🎵","Listeler"],["profile","👤","Profil"]].map(([id,icon,label]) => (
        <button key={id} className={`nav-item ${active===id?"active":""}`} onClick={()=>onChange(id)}>
          <span className="nav-icon">{icon}</span>
          <span className="nav-label">{label}</span>
        </button>
      ))}
    </div>
  );
}

function WelcomeScreen({ onLogin, onRegister }) {
  return (
    <div className="screen welcome">
      <div style={{display:"flex",flexDirection:"column",alignItems:"center"}}>
        <div className="logo-ring"><Logo /></div>
        <div className="w-title">MoodTune</div>
        <div className="w-sub">İçindeki Sesi Keşfet</div>
      </div>
      <div className="w-btns">
        <button className="btn-grad" onClick={onLogin}>→ Giriş Yap</button>
        <button className="btn-white" onClick={onRegister}>✦ Kayıt Ol</button>
        <p className="terms">Devam ederek Kullanım Şartlarımızı kabul etmiş olursunuz.</p>
      </div>
    </div>
  );
}

function LoginScreen({ onBack, onRegister, onSuccess }) {
  const [email,setEmail]=useState(""); const [pass,setPass]=useState("");
  const [sp,setSp]=useState(false); const [rem,setRem]=useState(false);
  const [errs,setErrs]=useState({}); const [loading,setLoading]=useState(false);
  const submit=()=>{
    const e={};
    if(!isValidEmail(email)) e.email="Geçerli bir e-posta girin.";
    if(pass.length<8) e.pass="Şifre en az 8 karakter olmalı.";
    setErrs(e); if(Object.keys(e).length) return;
    setLoading(true); setTimeout(()=>{setLoading(false);onSuccess(email);},900);
  };
  return (
    <div className="screen auth-screen slide">
      <button className="back-btn" onClick={onBack}>←</button>
      <div className="auth-title">Yeniden Merhaba</div>
      <div className="auth-sub">Müziğin seni bekliyor, sadece bir bakış yeter.</div>
      <div className="form">
        <div className={`inp-wrap ${errs.email?"err":""}`}>
          <input type="email" placeholder="E-posta" value={email} onChange={e=>setEmail(e.target.value)}/>
          <span className="inp-icon">✉</span>
        </div>
        {errs.email&&<p className="err-msg">{errs.email}</p>}
        <div className={`inp-wrap ${errs.pass?"err":""}`}>
          <input type={sp?"text":"password"} placeholder="Şifre" value={pass} onChange={e=>setPass(e.target.value)}/>
          <button className="inp-icon" onClick={()=>setSp(!sp)} style={{border:"none",background:"none",cursor:"pointer"}}>{sp?"🙈":"👁"}</button>
        </div>
        {errs.pass&&<p className="err-msg">{errs.pass}</p>}
        <div className="rem-row">
          <label><input type="checkbox" checked={rem} onChange={e=>setRem(e.target.checked)}/>Beni Hatırla</label>
          <span className="forgot">Şifremi Unuttum?</span>
        </div>
        <button className="btn-grad" onClick={submit} disabled={loading}>{loading?"Giriş yapılıyor...":"Giriş Yap"}</button>
      </div>
      <div className="auth-foot">Hesabın yok mu?<span className="auth-link" onClick={onRegister}>Kayıt Ol</span></div>
    </div>
  );
}

function RegisterScreen({ onBack, onLogin, onSuccess }) {
  const [form,setForm]=useState({ad:"",soyad:"",tel:"",email:"",pass:"",pass2:""});
  const [sp,setSp]=useState(false); const [sp2,setSp2]=useState(false);
  const [errs,setErrs]=useState({}); const [loading,setLoading]=useState(false);
  const s=k=>e=>setForm(f=>({...f,[k]:e.target.value}));
  const submit=()=>{
    const e={};
    if(!form.ad.trim()) e.ad="Ad zorunludur.";
    if(!form.soyad.trim()) e.soyad="Soyad zorunludur.";
    if(!isValidEmail(form.email)) e.email="Geçerli bir e-posta girin.";
    if(form.pass.length<8) e.pass="En az 8 karakter olmalı.";
    if(form.pass!==form.pass2) e.pass2="Şifreler uyuşmuyor.";
    setErrs(e); if(Object.keys(e).length) return;
    setLoading(true); setTimeout(()=>{setLoading(false);onSuccess(form.email);},1100);
  };
  return (
    <div className="screen auth-screen slide">
      <button className="back-btn" onClick={onBack}>←</button>
      <div className="auth-title">Müziğine Kavuş</div>
      <div className="auth-sub">Bir hesap oluştur, duygularına özel playlist seni beklesin.</div>
      <div className="form">
        {[["ad","Ad"],["soyad","Soyad"],["tel","Telefon (opsiyonel)"],["email","E-posta"]].map(([k,ph])=>(
          <div key={k}>
            <div className={`inp-wrap ${errs[k]?"err":""}`}>
              <input type={k==="email"?"email":"text"} placeholder={ph} value={form[k]} onChange={s(k)}/>
            </div>
            {errs[k]&&<p className="err-msg">{errs[k]}</p>}
          </div>
        ))}
        <div className={`inp-wrap ${errs.pass?"err":""}`}>
          <input type={sp?"text":"password"} placeholder="Şifre" value={form.pass} onChange={s("pass")}/>
          <button className="inp-icon" onClick={()=>setSp(!sp)} style={{border:"none",background:"none",cursor:"pointer"}}>{sp?"🙈":"👁"}</button>
        </div>
        {errs.pass&&<p className="err-msg">{errs.pass}</p>}
        <div className={`inp-wrap ${errs.pass2?"err":""}`}>
          <input type={sp2?"text":"password"} placeholder="Şifre Tekrar" value={form.pass2} onChange={s("pass2")}/>
          <button className="inp-icon" onClick={()=>setSp2(!sp2)} style={{border:"none",background:"none",cursor:"pointer"}}>{sp2?"🙈":"👁"}</button>
        </div>
        {errs.pass2&&<p className="err-msg">{errs.pass2}</p>}
        <button className="btn-grad" onClick={submit} disabled={loading}>{loading?"Kayıt yapılıyor...":"Kayıt Ol"}</button>
      </div>
      <div className="auth-foot">Zaten hesabın var mı?<span className="auth-link" onClick={onLogin}>Giriş Yap</span></div>
    </div>
  );
}

const RECENT=[
  {name:"Sabah Neşesi",tag:"Mutlu 😊",bg:"#f0e6d8",em:"🎨"},
  {name:"Akşamüstü Kahvesi",tag:"Sakin ☕",bg:"#d8cbb8",em:"☕"},
  {name:"Derin Odak",tag:"Üretken 💡",bg:"#c8d4c0",em:"💡"},
];
const SPECIAL=[
  {name:"Doğa Sesleri",mood:"Rahatlama",bg:"linear-gradient(135deg,#3d6b4a,#5a9668)"},
  {name:"Gece Sürüşü",mood:"Melankolik",bg:"linear-gradient(135deg,#1e2d4e,#3a4f7a)"},
  {name:"Haftasonu",mood:"Parti",bg:"linear-gradient(135deg,#e8d0b8,#c4956a)"},
  {name:"Yoga Akışı",mood:"Wellness",bg:"linear-gradient(135deg,#c8e0c4,#90bc88)"},
];

function HomeScreen({ email, onScan, onLastPlaylist, nav, setNav }) {
  const name=email.split("@")[0].split(".")[0];
  const nameC=name.charAt(0).toUpperCase()+name.slice(1);
  return (
    <div className="screen" style={{display:"flex",flexDirection:"column"}}>
      <div className="home-body">
        <div className="home-hdr">
          <div>
            <div className="greet-sub">Hoşgeldin,</div>
            <div className="greet-name">Merhaba, {nameC}</div>
          </div>
          <div className="avatar">🧑</div>
        </div>
        <div className="scan-card">
          <div className="scan-icon">📷</div>
          <div className="scan-card-title">Duygunu Tara</div>
          <div className="scan-card-sub">Bugünkü modunu keşfetmek için yüzünü tarat</div>
          <button className="btn-scan" onClick={onScan}>Tara →</button>
        </div>
        <div className="sec-hdr">
          <div className="sec-title">Son Çalınanlar</div>
          <div className="sec-all" onClick={onLastPlaylist}>Tümü</div>
        </div>
        <div className="recent-scroll">
          {RECENT.map((r,i)=>(
            <div className="recent-card" key={i}>
              <div className="recent-img" style={{background:r.bg}}>{r.em}</div>
              <div className="recent-name">{r.name}</div>
              <div className="recent-tag">{r.tag}</div>
            </div>
          ))}
        </div>
        <div className="sec-hdr"><div className="sec-title">Sana Özel</div></div>
        <div className="special-grid">
          {SPECIAL.map((s,i)=>(
            <div className="special-card" key={i}>
              <div className="sp-bg" style={{background:s.bg}}>
                <div className="sp-overlay"/>
                <div className="sp-info"><div className="sp-name">{s.name}</div><div className="sp-mood">{s.mood}</div></div>
              </div>
            </div>
          ))}
        </div>
      </div>
      <NavBar active={nav} onChange={setNav}/>
    </div>
  );
}

function ScanScreen({ onBack, onScan }) {
  const [scanning,setScanning]=useState(false);
  const doScan=()=>{setScanning(true);setTimeout(()=>{setScanning(false);onScan();},1800);};
  return (
    <div className="screen scan-screen slide">
      <div className="scan-top">
        <button className="back-btn" onClick={onBack}>←</button>
        <div className="scan-screen-title">Duygunu Tara</div>
      </div>
      <div className="cam-box">
        <div style={{width:"100%",height:"100%",background:"linear-gradient(160deg,#8a9bb8,#6b7d96)",display:"flex",alignItems:"center",justifyContent:"center",fontSize:90}}>🧑</div>
        <div className="cam-live"><div className="live-dot"/>CANLI</div>
        <div className="face-oval"/>
        <div className="cam-hint">Yüzünü çerçeveye hizala</div>
      </div>
      <div className="scan-tip"><span>🔆</span>İyi ışıklı bir ortamda olduğundan emin ol</div>
      <button className="btn-grad" onClick={doScan} disabled={scanning}>{scanning?"⏳ Taranıyor...":"Tara →"}</button>
    </div>
  );
}

const RES_PL=[
  {name:"Sabah Enerjisi ☀️",tag:"Enerjik",tc:"tag-e",count:14,bg:"linear-gradient(135deg,#7ec8e3,#4a90d9)",em:"🌊"},
  {name:"Pozitif Titreşimler ✨",tag:"Neşeli",tc:"tag-n",count:20,bg:"linear-gradient(135deg,#f8b0d8,#f06090)",em:"✨"},
  {name:"Akşam Yürüyüşü 🎧",tag:"Sakin",tc:"tag-s",count:18,bg:"linear-gradient(135deg,#f4a261,#e07040)",em:"🌆"},
];

function ScanResultScreen({ onBack, nav, setNav }) {
  return (
    <div className="screen" style={{display:"flex",flexDirection:"column"}}>
      <div className="result-body">
        <div className="result-top">
          <button className="back-btn" onClick={onBack}>←</button>
          <div style={{fontSize:16,fontWeight:900,color:"#1a2a3a"}}>MoodTune</div>
        </div>
        <div className="result-center">
          <div className="result-title">Duygun Tarandı!</div>
          <div className="result-sub">Müziğin seninle aynı frekansta.</div>
          <div className="result-badge">Mutlu</div>
        </div>
        <div className="sec-title" style={{marginBottom:16}}>Sana Özel Playlist'ler</div>
        <div className="pl-list">
          {RES_PL.map((p,i)=>(
            <div className="pl-card" key={i}>
              <div className="pl-img" style={{background:p.bg}}>{p.em}</div>
              <div style={{flex:1}}>
                <div className="pl-name">{p.name}</div>
                <div className="pl-meta">
                  <span className={`pl-tag ${p.tc}`}>{p.tag}</span>
                  <span className="pl-count">• {p.count} Şarkı</span>
                </div>
              </div>
              <div className="play-btn">▶</div>
            </div>
          ))}
        </div>
      </div>
      <NavBar active={nav} onChange={setNav}/>
    </div>
  );
}

const LP=[
  {name:"Enerjik Sabahlar",tag:"Enerjik ⚡",tb:"#fef3c7",tc:"#d97706",count:24,bg:"linear-gradient(135deg,#f4a261,#d97706)",em:"🌅"},
  {name:"Sakin Yürüyüşler",tag:"Sakin 🌿",tb:"#d1fae5",tc:"#065f46",count:18,bg:"linear-gradient(135deg,#6aab7a,#4a7c59)",em:"🌲"},
  {name:"Yaz Neşesi",tag:"Mutlu 😊",tb:"#fce7f3",tc:"#be185d",count:42,bg:"linear-gradient(135deg,#c4b5fd,#a78bfa)",em:"☀️"},
  {name:"Yağmurlu Günler",tag:"Hüzünlü 🌧",tb:"#e0e7ff",tc:"#3730a3",count:15,bg:"linear-gradient(135deg,#374151,#111827)",em:"🌧"},
  {name:"Derin Odaklanma",tag:"Odak 🧠",tb:"#e0f2fe",tc:"#0369a1",count:30,bg:"linear-gradient(135deg,#7c6a50,#3d2f1a)",em:"☕"},
];

function LastPlaylistScreen({ onBack, nav, setNav }) {
  const [filter,setFilter]=useState("Tümü");
  return (
    <div className="screen" style={{display:"flex",flexDirection:"column"}}>
      <div className="last-body">
        <div className="last-top">
          <button className="back-btn" onClick={onBack}>←</button>
          <div className="last-title">Son Çalınanlar</div>
        </div>
        <div className="filter-row">
          {["Tümü","Bugün","Bu Hafta","Bu Ay"].map(f=>(
            <button key={f} className={`filter-btn ${filter===f?"on":""}`} onClick={()=>setFilter(f)}>{f}</button>
          ))}
        </div>
        <div className="lp-list">
          {LP.map((p,i)=>(
            <div className="lp-card" key={i}>
              <div className="lp-img" style={{background:p.bg}}>{p.em}</div>
              <div style={{flex:1}}>
                <div className="lp-name">{p.name}</div>
                <span className="lp-tag" style={{background:p.tb,color:p.tc}}>{p.tag}</span>
              </div>
              <div style={{display:"flex",flexDirection:"column",alignItems:"flex-end",gap:4}}>
                <span className="lp-count">{p.count} Şarkı</span>
                <span style={{fontSize:18,color:"#8aaac8"}}>›</span>
              </div>
            </div>
          ))}
        </div>
      </div>
      <NavBar active={nav} onChange={setNav}/>
    </div>
  );
}

export default function App() {
  const [screen,setScreen]=useState("welcome");
  const [user,setUser]=useState(null);
  const [nav,setNav]=useState("home");

  return (
    <>
      <style>{G}</style>
      <div className="phone">
        {screen==="welcome" && <WelcomeScreen onLogin={()=>setScreen("login")} onRegister={()=>setScreen("register")}/>}
        {screen==="login" && <LoginScreen onBack={()=>setScreen("welcome")} onRegister={()=>setScreen("register")} onSuccess={e=>{setUser(e);setScreen("home");}}/>}
        {screen==="register" && <RegisterScreen onBack={()=>setScreen("welcome")} onLogin={()=>setScreen("login")} onSuccess={e=>{setUser(e);setScreen("home");}}/>}
        {screen==="home" && <HomeScreen email={user} onScan={()=>setScreen("scan")} onLastPlaylist={()=>setScreen("last")} nav={nav} setNav={setNav}/>}
        {screen==="scan" && <ScanScreen onBack={()=>setScreen("home")} onScan={()=>setScreen("result")}/>}
        {screen==="result" && <ScanResultScreen onBack={()=>setScreen("home")} nav={nav} setNav={setNav}/>}
        {screen==="last" && <LastPlaylistScreen onBack={()=>setScreen("home")} nav={nav} setNav={setNav}/>}
      </div>
    </>
  );
}
