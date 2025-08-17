export default function LoadingSpinner({ message = "جاري التحميل..." }) {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="text-center">
        {/* Animated Brain */}
        <div className="relative mb-8">
          <div className="text-8xl animate-bounce">🧠</div>
          <div className="absolute inset-0 flex items-center justify-center">
            <div className="w-24 h-24 border-4 border-blue-500/30 border-t-blue-500 rounded-full animate-spin"></div>
          </div>
        </div>
        
        {/* Loading Text */}
        <h2 className="text-2xl font-bold text-white mb-4 animate-pulse">
          {message}
        </h2>
        
        {/* Progress Dots */}
        <div className="flex justify-center space-x-2">
          <div className="w-3 h-3 bg-blue-500 rounded-full animate-bounce" style={{ animationDelay: '0ms' }}></div>
          <div className="w-3 h-3 bg-purple-500 rounded-full animate-bounce" style={{ animationDelay: '150ms' }}></div>
          <div className="w-3 h-3 bg-pink-500 rounded-full animate-bounce" style={{ animationDelay: '300ms' }}></div>
        </div>
      </div>
    </div>
  );
}
