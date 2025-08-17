import { useEffect, useState } from "react";

export default function ZoneModal({ zone, question, onClose, onCorrect }) {
  const [selected, setSelected] = useState("");
  const [isCorrect, setIsCorrect] = useState(false);

  const handleSubmit = () => {
    if (selected === question.correct) {
      setIsCorrect(true);
      setTimeout(() => {
        const audio = new Audio("/correct-sound.mp3");
        audio.play().catch(() => {});
        onCorrect();
      }, 500);
    } else {
      alert("الإجابة خاطئة! حاول مرة أخرى.");
    }
  };

  useEffect(() => {
    const handleEsc = (e) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", handleEsc);
    return () => window.removeEventListener("keydown", handleEsc);
  }, [onClose]);

  return (
    <div className="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50 p-4" dir="rtl">
      <div className="bg-[#16213e] border border-gray-600 rounded-2xl p-6 max-w-lg w-full shadow-2xl text-right">
        <h3 className="text-2xl font-bold text-white mb-4">المنطقة: {zone}</h3>
        <p className="text-gray-200 mb-6 text-lg">{question.question}</p>

        <div className="space-y-3 mb-6">
          {question.options.map((opt) => (
            <label
              key={opt}
              className={`block p-3 rounded-lg border-2 cursor-pointer transition
                ${selected === opt[0] ? "border-[#e94560] bg-[#2a2a4a]" : "border-gray-600 hover:border-gray-500"}`}
            >
              <input
                type="radio"
                name="answer"
                value={opt[0]}
                checked={selected === opt[0]}
                onChange={() => setSelected(opt[0])}
                className="sr-only"
              />
              <span className="text-lg">{opt}</span>
            </label>
          ))}
        </div>

        <div className="flex justify-between">
          <button
            onClick={onClose}
            className="px-5 py-2 bg-gray-600 hover:bg-gray-700 text-white rounded-lg"
          >
            إلغاء
          </button>
          <button
            onClick={handleSubmit}
            disabled={!selected}
            className="px-6 py-2 bg-[#e94560] hover:bg-[#ff5c7c] disabled:opacity-50 disabled:cursor-not-allowed text-white font-bold rounded-lg transition"
          >
            إرسال
          </button>
        </div>
      </div>
    </div>
  );
}
