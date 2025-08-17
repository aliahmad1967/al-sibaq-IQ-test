import { useState, useEffect } from "react";
import BrainMap from "./BrainMap";

export default function StartScreen({ onStart }) {
  const [showInstructions, setShowInstructions] = useState(false);
  const [animatedText, setAnimatedText] = useState("");
  const fullText = "اختبار الذكاء المتقدم";

  useEffect(() => {
    let index = 0;
    const timer = setInterval(() => {
      setAnimatedText(fullText.slice(0, index + 1));
      index++;
      if (index >= fullText.length) {
        clearInterval(timer);
      }
    }, 100);
    return () => clearInterval(timer);
  }, []);

  return (
    <div className="min-h-screen flex items-center justify-center p-6 relative overflow-hidden">
      {/* Animated Background */}
      <div className="absolute inset-0 opacity-10">
        <div className="absolute top-20 left-20 w-32 h-32 bg-blue-500 rounded-full animate-pulse"></div>
        <div className="absolute top-40 right-32 w-24 h-24 bg-purple-500 rounded-full animate-bounce"></div>
        <div className="absolute bottom-32 left-40 w-20 h-20 bg-pink-500 rounded-full animate-ping"></div>
        <div className="absolute bottom-20 right-20 w-28 h-28 bg-green-500 rounded-full animate-pulse"></div>
      </div>

      <div className="max-w-2xl w-full text-center relative z-10">
        {/* Main Title */}
        <div className="mb-8">
          <div className="text-6xl mb-4 animate-bounce">🧠</div>
          <h1 className="text-5xl font-bold bg-gradient-to-r from-blue-400 via-purple-500 to-pink-500 bg-clip-text text-transparent mb-4">
            {animatedText}
            <span className="animate-pulse">|</span>
          </h1>
          <p className="text-xl text-gray-300 leading-relaxed">
            اختبر قدراتك العقلية مع مجموعة متنوعة من الأسئلة المصممة لقياس ذكائك
          </p>
        </div>

        {/* Brain Map */}
        <div className="mb-12">
          <BrainMap className="max-w-2xl mx-auto" />
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-3 gap-6 mb-8">
          <div className="bg-gradient-to-br from-blue-600/20 to-blue-800/20 p-6 rounded-2xl border border-blue-500/30 backdrop-blur-sm">
            <div className="text-3xl mb-3">⚡</div>
            <h3 className="text-lg font-bold text-blue-300 mb-2">سرعة التفكير</h3>
            <p className="text-sm text-gray-400">اختبارات مؤقتة لقياس سرعة استجابتك</p>
          </div>
          
          <div className="bg-gradient-to-br from-purple-600/20 to-purple-800/20 p-6 rounded-2xl border border-purple-500/30 backdrop-blur-sm">
            <div className="text-3xl mb-3">🎯</div>
            <h3 className="text-lg font-bold text-purple-300 mb-2">دقة الحلول</h3>
            <p className="text-sm text-gray-400">أسئلة منطقية ورياضية متدرجة الصعوبة</p>
          </div>
          
          <div className="bg-gradient-to-br from-pink-600/20 to-pink-800/20 p-6 rounded-2xl border border-pink-500/30 backdrop-blur-sm">
            <div className="text-3xl mb-3">📊</div>
            <h3 className="text-lg font-bold text-pink-300 mb-2">تقييم شامل</h3>
            <p className="text-sm text-gray-400">نتائج مفصلة مع مقارنة بالمعايير العالمية</p>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="space-y-4">
          <button
            onClick={onStart}
            className="w-full md:w-auto px-12 py-4 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white font-bold text-xl rounded-2xl shadow-2xl transform hover:scale-105 transition-all duration-300 border border-blue-400/50"
          >
            🚀 ابدأ الاختبار الآن
          </button>
          
          <div className="flex justify-center">
            <button
              onClick={() => setShowInstructions(!showInstructions)}
              className="text-gray-400 hover:text-white transition-colors underline"
            >
              {showInstructions ? "إخفاء التعليمات" : "عرض التعليمات"}
            </button>
          </div>
        </div>

        {/* Instructions Modal */}
        {showInstructions && (
          <div className="fixed inset-0 bg-black/80 flex items-center justify-center p-4 z-50">
            <div className="bg-gradient-to-br from-gray-800 to-gray-900 p-8 rounded-3xl max-w-lg w-full border border-gray-600">
              <h3 className="text-2xl font-bold text-center mb-6 text-yellow-400">📋 تعليمات الاختبار</h3>
              
              <div className="space-y-4 text-right">
                <div className="flex items-start gap-3">
                  <span className="text-blue-400 font-bold">1.</span>
                  <p className="text-gray-300">يحتوي الاختبار على 15 سؤالاً متنوعاً</p>
                </div>
                
                <div className="flex items-start gap-3">
                  <span className="text-blue-400 font-bold">2.</span>
                  <p className="text-gray-300">لديك وقت محدد لكل سؤال</p>
                </div>
                
                <div className="flex items-start gap-3">
                  <span className="text-blue-400 font-bold">3.</span>
                  <p className="text-gray-300">الإجابة السريعة والصحيحة تحصل على نقاط إضافية</p>
                </div>
                
                <div className="flex items-start gap-3">
                  <span className="text-blue-400 font-bold">4.</span>
                  <p className="text-gray-300">لا يمكن العودة للسؤال السابق</p>
                </div>
                
                <div className="flex items-start gap-3">
                  <span className="text-blue-400 font-bold">5.</span>
                  <p className="text-gray-300">ستحصل على تقييم مفصل في النهاية</p>
                </div>
              </div>
              
              <div className="flex gap-4 mt-8">
                <button
                  onClick={() => setShowInstructions(false)}
                  className="flex-1 py-3 bg-gray-600 hover:bg-gray-700 text-white rounded-xl transition-colors"
                >
                  إغلاق
                </button>
                <button
                  onClick={() => {
                    setShowInstructions(false);
                    onStart();
                  }}
                  className="flex-1 py-3 bg-gradient-to-r from-green-600 to-blue-600 hover:from-green-700 hover:to-blue-700 text-white rounded-xl transition-all"
                >
                  ابدأ الآن
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
