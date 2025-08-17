export default function FinalScreen({ score, accuracy, onRestart }) {
  const maxScore = 15;
  const percentage = Math.round((score / maxScore) * 100);

  const getIQLevel = (percentage) => {
    if (percentage >= 90) return { level: "عبقري", color: "text-purple-400", emoji: "🧠✨" };
    if (percentage >= 80) return { level: "ممتاز جداً", color: "text-blue-400", emoji: "🌟" };
    if (percentage >= 70) return { level: "ممتاز", color: "text-green-400", emoji: "🏆" };
    if (percentage >= 60) return { level: "جيد جداً", color: "text-yellow-400", emoji: "👍" };
    if (percentage >= 50) return { level: "جيد", color: "text-orange-400", emoji: "👌" };
    return { level: "يحتاج تحسين", color: "text-red-400", emoji: "💪" };
  };

  const iqLevel = getIQLevel(percentage);
  const shareText = `لقد أكملت اختبار الذكاء المتقدم بدرجة ${score}/${maxScore} (${percentage}%)! 🧠 مستواي: ${iqLevel.level} ${iqLevel.emoji}`;
  const whatsappUrl = `https://wa.me/?text=${encodeURIComponent(shareText)}`;
  const twitterUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(shareText)}`;

  return (
    <div className="min-h-screen flex items-center justify-center p-6" dir="rtl">
      <div className="max-w-2xl w-full">
        {/* Celebration Animation */}
        <div className="text-center mb-8">
          <div className="text-8xl mb-4 animate-bounce">{iqLevel.emoji}</div>
          <h1 className="text-5xl font-bold bg-gradient-to-r from-yellow-400 via-pink-500 to-purple-500 bg-clip-text text-transparent mb-4">
            تهانينا!
          </h1>
          <p className="text-xl text-gray-300">
            لقد أكملت اختبار الذكاء المتقدم بنجاح
          </p>
        </div>

        {/* Results Card */}
        <div className="bg-gradient-to-br from-gray-800/50 to-gray-900/50 backdrop-blur-sm border border-gray-600 rounded-3xl p-8 shadow-2xl mb-8">
          {/* Score Display */}
          <div className="text-center mb-8">
            <div className="text-6xl font-bold text-white mb-2">
              {score}<span className="text-3xl text-gray-400">/{maxScore}</span>
            </div>
            <div className="text-2xl font-bold mb-4">
              <span className={iqLevel.color}>{percentage}%</span>
            </div>
            <div className={`text-xl font-bold ${iqLevel.color}`}>
              مستوى الذكاء: {iqLevel.level}
            </div>
          </div>

          {/* Progress Circle */}
          <div className="flex justify-center mb-8">
            <div className="relative w-32 h-32">
              <svg className="w-32 h-32 transform -rotate-90" viewBox="0 0 100 100">
                <circle
                  cx="50"
                  cy="50"
                  r="40"
                  stroke="currentColor"
                  strokeWidth="8"
                  fill="transparent"
                  className="text-gray-700"
                />
                <circle
                  cx="50"
                  cy="50"
                  r="40"
                  stroke="currentColor"
                  strokeWidth="8"
                  fill="transparent"
                  strokeDasharray={`${percentage * 2.51} 251`}
                  className={iqLevel.color}
                  strokeLinecap="round"
                />
              </svg>
              <div className="absolute inset-0 flex items-center justify-center">
                <span className="text-2xl font-bold text-white">{percentage}%</span>
              </div>
            </div>
          </div>

          {/* Detailed Stats */}
          <div className="grid md:grid-cols-3 gap-6 mb-8">
            <div className="text-center p-4 bg-blue-600/20 rounded-2xl border border-blue-500/30">
              <div className="text-2xl font-bold text-blue-300">{score}</div>
              <div className="text-sm text-gray-400">إجابات صحيحة</div>
            </div>

            <div className="text-center p-4 bg-green-600/20 rounded-2xl border border-green-500/30">
              <div className="text-2xl font-bold text-green-300">{accuracy || percentage}%</div>
              <div className="text-sm text-gray-400">دقة الإجابات</div>
            </div>

            <div className="text-center p-4 bg-purple-600/20 rounded-2xl border border-purple-500/30">
              <div className="text-2xl font-bold text-purple-300">{maxScore - score}</div>
              <div className="text-sm text-gray-400">إجابات خاطئة</div>
            </div>
          </div>

          {/* Performance Analysis */}
          <div className="bg-gray-700/30 rounded-2xl p-6 mb-8">
            <h3 className="text-lg font-bold text-white mb-4 text-center">تحليل الأداء</h3>
            <div className="space-y-3 text-sm">
              {percentage >= 80 && (
                <p className="text-green-300">🎯 أداء ممتاز! لديك قدرات تحليلية قوية</p>
              )}
              {percentage >= 60 && percentage < 80 && (
                <p className="text-yellow-300">👍 أداء جيد! يمكنك تحسين سرعة التفكير</p>
              )}
              {percentage < 60 && (
                <p className="text-orange-300">💪 استمر في التدريب لتحسين قدراتك المنطقية</p>
              )}
              <p className="text-gray-300">
                💡 نصيحة: حل المزيد من الألغاز والمسائل المنطقية يومياً لتطوير ذكائك
              </p>
            </div>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <a
              href={whatsappUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 py-4 bg-green-600 hover:bg-green-700 text-white rounded-2xl font-semibold transition-all transform hover:scale-105"
            >
              <span>📲</span> مشاركة عبر واتساب
            </a>
            <a
              href={twitterUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 py-4 bg-blue-500 hover:bg-blue-600 text-white rounded-2xl font-semibold transition-all transform hover:scale-105"
            >
              <span>🐦</span> مشاركة عبر تويتر
            </a>
          </div>

          <button
            onClick={onRestart}
            className="w-full py-4 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white font-bold text-lg rounded-2xl transition-all transform hover:scale-105 shadow-xl"
          >
            🔄 إعادة الاختبار
          </button>
        </div>
      </div>
    </div>
  );
}