// Mock implementation since @google/generative-ai is not installed
// import { GoogleGenerativeAI } from "@google/generative-ai";

// const API_KEY = import.meta.env.VITE_GEMINI_API_KEY;
// const genAI = new GoogleGenerativeAI(API_KEY);

const prompt = `
قم بإنشاء 5 أسئلة متعددة الخيارات باللغة العربية، واحدة لكل مجال: العلوم، التاريخ، الرياضة، الفنون، الألغاز.
كل سؤال يجب أن يكون له 4 خيارات، مع تحديد الخيار الصحيح.
التنسيق:
السؤال: [السؤال]
أ) [خيار]
ب) [خيار]
ج) [خيار]
د) [خيار]
الإجابة الصحيحة: [الحرف]

لا تُضف أي نصوص إضافية.
`;

export async function fetchDailyQuestions() {
  const today = new Date().toDateString();
  const cached = localStorage.getItem("gemini_questions");
  if (cached) {
    const { date, questions } = JSON.parse(cached);
    if (date === today) return questions;
  }

  try {
    // For now, return default questions since Gemini API is not set up
    console.log("Using default questions - Gemini API not configured");
    const questions = getDefaultQuestions();
    localStorage.setItem("gemini_questions", JSON.stringify({ date: today, questions }));
    return questions;
    
    // Uncomment below when Gemini API is properly configured
    /*
    const model = genAI.getGenerativeModel({ model: "gemini-pro" });
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();

    const questions = parseGeminiResponse(text);
    localStorage.setItem("gemini_questions", JSON.stringify({ date: today, questions }));
    return questions;
    */
  } catch (error) {
    console.error("فشل في جلب الأسئلة من Gemini:", error);
    // أسئلة احتياطية
    return getDefaultQuestions();
  }
}

function parseGeminiResponse(text) {
  const questions = [];
  const blocks = text.split(/\n\s*\n/).filter(b => b.trim());
  
  for (let block of blocks) {
    const lines = block.trim().split("\n");
    const questionMatch = lines[0].match(/السؤال: (.+)/);
    if (!questionMatch) continue;

    const question = questionMatch[1];
    const options = lines.slice(1, 5).map(line => line.trim());
    const answerLine = lines.find(l => l.includes("الإجابة الصحيحة"));
    const correctMatch = answerLine?.match(/الإجابة الصحيحة: ([أ-د])/);
    const correct = correctMatch ? correctMatch[1] : "أ";

    questions.push({ question, options, correct });
  }
  return questions.slice(0, 5);
}

function getDefaultQuestions() {
  return [
    {
      question: "ما العنصر الكيميائي رمزه O؟",
      options: ["أ) أكسجين", "ب) هيدروجين", "ج) كربون", "د) نيتروجين"],
      correct: "أ"
    },
    {
      question: "في أي عام تم فتح القسطنطينية؟",
      options: ["أ) 1453", "ب) 1492", "ج) 1517", "د) 1571"],
      correct: "أ"
    },
    {
      question: "كم عدد اللاعبين في فريق كرة القدم؟",
      options: ["أ) 10", "ب) 11", "ج) 12", "د) 9"],
      correct: "ب"
    },
    {
      question: "من رسم لوحة الموناليزا؟",
      options: ["أ) ليوناردو دا فينشي", "ب) مايكل أنجلو", "ج) بيكاسو", "د) فان جوخ"],
      correct: "أ"
    },
    {
      question: "ما الرقم التالي في السلسلة: 2، 4، 8، 16، ؟",
      options: ["أ) 24", "ب) 32", "ج) 20", "د) 28"],
      correct: "ب"
    }
  ];
}
