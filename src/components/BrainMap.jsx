export default function BrainMap({ className }) {
  return (
    <div className={`relative ${className}`}>
      <svg
        viewBox="0 0 800 400"
        className="w-full h-auto"
        xmlns="http://www.w3.org/2000/svg"
      >
        {/* Background gradient */}
        <defs>
          <linearGradient id="brainGradient" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stopColor="#1e3a8a" stopOpacity="0.3" />
            <stop offset="50%" stopColor="#7c3aed" stopOpacity="0.2" />
            <stop offset="100%" stopColor="#ec4899" stopOpacity="0.3" />
          </linearGradient>
          
          <filter id="glow">
            <feGaussianBlur stdDeviation="3" result="coloredBlur"/>
            <feMerge> 
              <feMergeNode in="coloredBlur"/>
              <feMergeNode in="SourceGraphic"/>
            </feMerge>
          </filter>
        </defs>

        {/* Brain outline */}
        <path
          d="M150 200 C150 120, 220 80, 300 100 C350 70, 420 80, 480 120 C550 100, 620 140, 650 200 C650 260, 600 300, 550 320 C500 340, 450 330, 400 320 C350 340, 300 330, 250 320 C200 300, 150 260, 150 200 Z"
          fill="url(#brainGradient)"
          stroke="#3b82f6"
          strokeWidth="2"
          filter="url(#glow)"
          className="animate-pulse-slow"
        />

        {/* Neural network connections */}
        <g stroke="#6366f1" strokeWidth="1" opacity="0.6">
          <line x1="200" y1="180" x2="300" y2="160" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2s" repeatCount="indefinite" />
          </line>
          <line x1="300" y1="160" x2="400" y2="140" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2.5s" repeatCount="indefinite" />
          </line>
          <line x1="400" y1="140" x2="500" y2="160" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="3s" repeatCount="indefinite" />
          </line>
          <line x1="500" y1="160" x2="600" y2="180" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2.2s" repeatCount="indefinite" />
          </line>
          
          <line x1="250" y1="220" x2="350" y2="200" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2.8s" repeatCount="indefinite" />
          </line>
          <line x1="350" y1="200" x2="450" y2="220" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2.3s" repeatCount="indefinite" />
          </line>
          <line x1="450" y1="220" x2="550" y2="240" className="animate-pulse">
            <animate attributeName="opacity" values="0.3;0.8;0.3" dur="2.7s" repeatCount="indefinite" />
          </line>
        </g>

        {/* Brain regions/nodes */}
        <g>
          {/* Logic Center */}
          <circle cx="250" cy="160" r="15" fill="#3b82f6" className="animate-pulse">
            <animate attributeName="r" values="12;18;12" dur="3s" repeatCount="indefinite" />
          </circle>
          <text x="250" y="140" textAnchor="middle" fill="#93c5fd" fontSize="12" fontWeight="bold">
            المنطق
          </text>

          {/* Memory Center */}
          <circle cx="400" cy="140" r="15" fill="#8b5cf6" className="animate-pulse">
            <animate attributeName="r" values="12;18;12" dur="2.5s" repeatCount="indefinite" />
          </circle>
          <text x="400" y="120" textAnchor="middle" fill="#c4b5fd" fontSize="12" fontWeight="bold">
            الذاكرة
          </text>

          {/* Creativity Center */}
          <circle cx="550" cy="180" r="15" fill="#ec4899" className="animate-pulse">
            <animate attributeName="r" values="12;18;12" dur="2.8s" repeatCount="indefinite" />
          </circle>
          <text x="550" y="160" textAnchor="middle" fill="#f9a8d4" fontSize="12" fontWeight="bold">
            الإبداع
          </text>

          {/* Analysis Center */}
          <circle cx="350" cy="220" r="15" fill="#10b981" className="animate-pulse">
            <animate attributeName="r" values="12;18;12" dur="3.2s" repeatCount="indefinite" />
          </circle>
          <text x="350" y="250" textAnchor="middle" fill="#6ee7b7" fontSize="12" fontWeight="bold">
            التحليل
          </text>

          {/* Speed Center */}
          <circle cx="500" cy="240" r="15" fill="#f59e0b" className="animate-pulse">
            <animate attributeName="r" values="12;18;12" dur="2.1s" repeatCount="indefinite" />
          </circle>
          <text x="500" y="270" textAnchor="middle" fill="#fcd34d" fontSize="12" fontWeight="bold">
            السرعة
          </text>
        </g>

        {/* Floating particles */}
        <g>
          <circle cx="180" cy="120" r="2" fill="#3b82f6" opacity="0.7">
            <animateTransform
              attributeName="transform"
              type="translate"
              values="0,0; 10,-5; 0,0"
              dur="4s"
              repeatCount="indefinite"
            />
          </circle>
          <circle cx="620" cy="280" r="2" fill="#ec4899" opacity="0.7">
            <animateTransform
              attributeName="transform"
              type="translate"
              values="0,0; -8,8; 0,0"
              dur="3.5s"
              repeatCount="indefinite"
            />
          </circle>
          <circle cx="300" cy="300" r="2" fill="#8b5cf6" opacity="0.7">
            <animateTransform
              attributeName="transform"
              type="translate"
              values="0,0; 5,10; 0,0"
              dur="4.2s"
              repeatCount="indefinite"
            />
          </circle>
        </g>

        {/* Central brain icon */}
        <text x="400" y="210" textAnchor="middle" fontSize="40" className="animate-bounce">
          🧠
        </text>
      </svg>
      
      {/* Overlay text */}
      <div className="absolute inset-0 flex items-center justify-center">
        <div className="text-center">
          <h3 className="text-2xl font-bold text-white mb-2 text-shadow">
            خريطة العقل
          </h3>
          <p className="text-gray-300 text-sm">
            استعد لاختبار قدراتك العقلية
          </p>
        </div>
      </div>
    </div>
  );
}
