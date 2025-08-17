import { useEffect, useState } from "react";
import FinalScreen from "./FinalScreen";
import IQTest from "./IQTest";
import StartScreen from "./StartScreen";
import {
  loadProgress,
  resetProgress,
  saveProgress,
} from "./utils/localStorage";

export default function App() {
  const [gameState, setGameState] = useState('start'); // 'start', 'test', 'final'
  const [progress, setProgress] = useState(loadProgress());

  const handleStartTest = () => {
    setGameState('test');
  };

  const handleIQComplete = (iqScore, timeBonus, accuracy) => {
    const finalScore = iqScore + timeBonus;
    const finalProgress = {
      ...progress,
      playerScore: finalScore,
      accuracy: accuracy,
      completed: true,
      completedAt: new Date().toISOString()
    };
    setProgress(finalProgress);
    saveProgress(finalProgress);
    setGameState('final');
  };

  const handleRestart = () => {
    resetProgress();
    setGameState('start');
    setProgress({
      playerScore: 0,
      accuracy: 0,
      completed: false
    });
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#0f0f23] via-[#1a1a2e] to-[#16213e] text-white" dir="rtl">
      {gameState === 'start' && (
        <StartScreen onStart={handleStartTest} />
      )}

      {gameState === 'test' && (
        <IQTest onComplete={handleIQComplete} />
      )}

      {gameState === 'final' && (
        <FinalScreen
          score={progress.playerScore}
          accuracy={progress.accuracy}
          onRestart={handleRestart}
        />
      )}
    </div>
  );
}
