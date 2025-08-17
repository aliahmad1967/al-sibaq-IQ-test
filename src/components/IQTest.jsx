import { useState, useEffect } from "react";

export default function IQTest({ onComplete }) {
  const [currentQ, setCurrentQ] = useState(0);
  const [score, setScore] = useState(0);
  const [timeLeft, setTimeLeft] = useState(60);
  const [startTime, setStartTime] = useState(Date.now());
  const [answers, setAnswers] = useState([]);
  const [showResult, setShowResult] = useState(false);

  const questions = [
    {
      q: "إذا كانت الساعة تشير إلى 3:15، فكم درجة بين عقرب الساعات والدقائق؟",
      opts: ["أ) 7.5 درجة", "ب) 15 درجة", "ج) 0 درجة", "د) 30 درجة"],
      ans: "أ",
      category: "رياضيات",
      difficulty: "متوسط"
    },
    {
      q: "ما العدد التالي في المتتالية: 1، 1، 2، 3، 5، 8، ...؟",
      opts: ["أ) 10", "ب) 11", "ج) 13", "د) 15"],
      ans: "ج",
      category: "منطق",
      difficulty: "سهل"
    },
    {
      q: "أي من الكلمات التالية لا تنتمي للمجموعة؟",
      opts: ["أ) قلم", "ب) كتاب", "ج) مسطرة", "د) تفاحة"],
      ans: "د",
      category: "تصنيف",
      difficulty: "سهل"
    },
    {
      q: "إذا كان A = 1، B = 2، C = 3... فما قيمة كلمة 'CAB'؟",
      opts: ["أ) 6", "ب) 8", "ج) 9", "د) 12"],
      ans: "أ",
      category: "رموز",
      difficulty: "متوسط"
    },
    {
      q: "ما العدد المفقود: 2، 6، 12، 20، 30، ؟",
      opts: ["أ) 40", "ب) 42", "ج) 44", "د) 48"],
      ans: "ب",
      category: "أنماط",
      difficulty: "صعب"
    },
    {
      q: "أكمل النمط: △ ○ □ △ ○ ؟",
      opts: ["أ) △", "ب) ○", "ج) □", "د) ◇"],
      ans: "ج",
      category: "أشكال",
      difficulty: "سهل"
    },
    {
      q: "إذا كان 'كتاب' يُكتب '12345'، فكيف يُكتب 'باك'؟",
      opts: ["أ) 321", "ب) 341", "ج) 431", "د) 413"],
      ans: "ج",
      category: "رموز",
      difficulty: "متوسط"
    },
    {
      q: "ما العدد التالي: 1، 4، 9، 16، 25، ؟",
      opts: ["أ) 30", "ب) 35", "ج) 36", "د) 49"],
      ans: "ج",
      category: "رياضيات",
      difficulty: "متوسط"
    },
    {
      q: "أي من هذه الكلمات يمكن قراءتها بنفس الطريقة من اليمين واليسار؟",
      opts: ["أ) رادار", "ب) كتاب", "ج) قلم", "د) بيت"],
      ans: "أ",
      category: "لغة",
      difficulty: "سهل"
    },
    {
      q: "إذا كان اليوم الثلاثاء، فما اليوم بعد 100 يوم؟",
      opts: ["أ) الاثنين", "ب) الثلاثاء", "ج) الأربعاء", "د) الخميس"],
      ans: "ب",
      category: "منطق",
      difficulty: "صعب"
    },
    {
      q: "ما العدد الذي إذا ضُرب في نفسه أعطى 144؟",
      opts: ["أ) 11", "ب) 12", "ج) 13", "د) 14"],
      ans: "ب",
      category: "رياضيات",
      difficulty: "سهل"
    },
    {
      q: "أكمل المتتالية: Z، Y، X، W، ؟",
      opts: ["أ) V", "ب) U", "ج) T", "د) S"],
      ans: "أ",
      category: "حروف",
      difficulty: "سهل"
    },
    {
      q: "إذا كان 5 × 5 = 30، و 6 × 6 = 42، فما قيمة 7 × 7؟",
      opts: ["أ) 49", "ب) 54", "ج) 56", "د) 58"],
      ans: "ج",
      category: "أنماط",
      difficulty: "صعب"
    },
    {
      q: "ما الكلمة التي لا تنتمي للمجموعة؟",
      opts: ["أ) أحمر", "ب) أزرق", "ج) أخضر", "د) مربع"],
      ans: "د",
      category: "تصنيف",
      difficulty: "سهل"
    },
    {
      q: "إذا كان عمر أحمد ضعف عمر سارة، وعمر سارة 15 سنة، فكم عمر أحمد بعد 5 سنوات؟",
      opts: ["أ) 30", "ب) 35", "ج) 40", "د) 45"],
      ans: "ب",
      category: "مسائل",
      difficulty: "متوسط"
    }
  ];

  useEffect(() => {
    if (timeLeft > 0) {
      const timer = setTimeout(() => setTimeLeft(timeLeft - 1), 1000);
      return () => clearTimeout(timer);
    } else {
      handleTimeUp();
    }
  }, [timeLeft]);

  const handleAnswer = (ans) => {
    const isCorrect = ans === questions[currentQ].ans;
    const timeTaken = 60 - timeLeft;
    const timeBonus = Math.max(0, Math.floor((60 - timeTaken) / 10));

    const answerData = {
      question: currentQ,
      answer: ans,
      correct: isCorrect,
      timeTaken: timeTaken,
      timeBonus: isCorrect ? timeBonus : 0
    };

    setAnswers([...answers, answerData]);

    if (isCorrect) {
      setScore(score + 1 + timeBonus);
    }

    if (currentQ < questions.length - 1) {
      setCurrentQ(currentQ + 1);
      setTimeLeft(60);
    } else {
      finishTest();
    }
  };

  const handleTimeUp = () => {
    const answerData = {
      question: currentQ,
      answer: null,
      correct: false,
      timeTaken: 60,
      timeBonus: 0
    };

    setAnswers([...answers, answerData]);

    if (currentQ < questions.length - 1) {
      setCurrentQ(currentQ + 1);
      setTimeLeft(60);
    } else {
      finishTest();
    }
  };

  const finishTest = () => {
    const totalTime = Date.now() - startTime;
    const accuracy = Math.round((score / questions.length) * 100);
    const timeBonus = Math.max(0, Math.floor((300000 - totalTime) / 60000)); // Bonus for finishing under 5 minutes

    onComplete(score, timeBonus, accuracy);
  };

  const currentQuestion = questions[currentQ];
  const progress = ((currentQ + 1) / questions.length) * 100;

  return (
    <div className="min-h-screen flex items-center justify-center p-4" dir="rtl">
      <div className="max-w-4xl w-full">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold bg-gradient-to-r from-blue-400 to-purple-500 bg-clip-text text-transparent mb-4">
            🧠 اختبار الذكاء المتقدم
          </h1>
          <div className="flex justify-center items-center gap-8 text-lg">
            <div className="flex items-center gap-2">
              <span className="text-blue-400">📊</span>
              <span>السؤال {currentQ + 1} من {questions.length}</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-green-400">⏱️</span>
              <span className={timeLeft <= 10 ? "text-red-400 animate-pulse" : "text-white"}>
                {timeLeft}s
              </span>
            </div>
            <div className="flex items-center gap-2">
              <span className="text-yellow-400">🏆</span>
              <span>النقاط: {score}</span>
            </div>
          </div>
        </div>

        {/* Progress Bar */}
        <div className="mb-8">
          <div className="w-full bg-gray-700 rounded-full h-3 overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-blue-500 to-purple-500 transition-all duration-500 ease-out"
              style={{ width: `${progress}%` }}
            ></div>
          </div>
        </div>

        {/* Question Card */}
        <div className="bg-gradient-to-br from-gray-800/50 to-gray-900/50 backdrop-blur-sm border border-gray-600 rounded-3xl p-8 shadow-2xl">
          {/* Question Category & Difficulty */}
          <div className="flex justify-between items-center mb-6">
            <span className="px-4 py-2 bg-blue-600/20 text-blue-300 rounded-full text-sm border border-blue-500/30">
              {currentQuestion.category}
            </span>
            <span className={`px-4 py-2 rounded-full text-sm border ${
              currentQuestion.difficulty === 'سهل' ? 'bg-green-600/20 text-green-300 border-green-500/30' :
              currentQuestion.difficulty === 'متوسط' ? 'bg-yellow-600/20 text-yellow-300 border-yellow-500/30' :
              'bg-red-600/20 text-red-300 border-red-500/30'
            }`}>
              {currentQuestion.difficulty}
            </span>
          </div>

          {/* Question Text */}
          <h2 className="text-2xl font-bold text-white mb-8 leading-relaxed text-center">
            {currentQuestion.q}
          </h2>

          {/* Answer Options */}
          <div className="grid gap-4">
            {currentQuestion.opts.map((opt, index) => (
              <button
                key={opt}
                onClick={() => handleAnswer(opt[0])}
                className="group p-6 text-right rounded-2xl bg-gradient-to-r from-gray-700/50 to-gray-800/50 hover:from-blue-600/30 hover:to-purple-600/30 border border-gray-600 hover:border-blue-500/50 transition-all duration-300 transform hover:scale-[1.02] hover:shadow-xl"
              >
                <div className="flex items-center justify-between">
                  <span className="text-lg text-white group-hover:text-blue-200 transition-colors">
                    {opt}
                  </span>
                  <div className="w-8 h-8 rounded-full border-2 border-gray-500 group-hover:border-blue-400 transition-colors flex items-center justify-center">
                    <span className="text-sm font-bold text-gray-400 group-hover:text-blue-300">
                      {String.fromCharCode(65 + index)}
                    </span>
                  </div>
                </div>
              </button>
            ))}
          </div>

          {/* Timer Warning */}
          {timeLeft <= 10 && (
            <div className="mt-6 text-center">
              <p className="text-red-400 animate-pulse font-bold">
                ⚠️ الوقت ينفد! {timeLeft} ثانية متبقية
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}